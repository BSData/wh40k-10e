'use strict';
/*
 * Catalogue model layer for the wh40k editor.
 *
 * Loads every BattleScribe .cat / .gst file in the repository, indexes the
 * datasheets (units), weapons and detachments they define, and exposes the
 * editing operations the UI needs - including the shared-weapon impact
 * analysis and the "change for all / change for some" split.
 */

const fs = require('fs');
const path = require('path');
const xml = require('./xml');

// --- BattleScribe schema ids (from "Warhammer 40,000.gst") --------------
const PROFILE_UNIT = 'c547-1836-d8a-ff4f';
const PROFILE_RANGED = 'f77d-b953-8fa4-b762';
const PROFILE_MELEE = '8a40-4aaa-c780-9046';
const PROFILE_ABILITIES = '9cc3-6d83-4dd3-9b64';
const COST_PTS = '51b2-306e-1021-d207';

// characteristicType ids (from the game system) so created entries are valid
const UNIT_CHAR_TYPES = {
  M: 'e703-ecb6-5ce7-aec1', T: 'd29d-cf75-fc2d-34a4', SV: '450-a17e-9d5e-29da',
  W: '750a-a2ec-90d3-21fe', LD: '58d2-b879-49c7-43bc', OC: 'bef7-942a-1a23-59f8',
};
const RANGED_CHAR_TYPES = {
  Range: '9896-9419-16a1-92fc', A: '3bb-c35f-f54-fb08', BS: '94d-8a98-cf90-183e',
  S: '2229-f494-25db-c5d3', AP: '9ead-8a10-520-de15', D: 'a354-c1c8-a745-f9e3',
  Keywords: '7f1b-8591-2fcf-d01c',
};
const MELEE_CHAR_TYPES = {
  Range: '914c-b413-91e3-a132', A: '2337-daa1-6682-b110', WS: '95d1-95f-45b4-11d6',
  S: 'ab33-d393-96ce-ccba', AP: '41a0-1301-112a-e2f2', D: '3254-9fe6-d824-513e',
  Keywords: '893f-9000-ccf7-648e',
};
const ABILITY_DESC_TYPE = '9b8f-694b-e5e-b573';

// Element tags that reference another entry by `targetId` (for ref validation).
const LINK_TAGS = new Set(['entryLink', 'infoLink', 'categoryLink', 'catalogueLink']);

class Catalog {
  constructor(rootDir) {
    this.rootDir = rootDir;
    this.docs = new Map(); // filename -> { decl, root, dirty }
    this.byId = new Map(); // id -> { node, file }
    this.linksByTarget = new Map(); // targetId -> [ { node, file, ownerUnit, ownerName } ]
  }

  // ---- loading & indexing ----------------------------------------------
  load() {
    const files = fs
      .readdirSync(this.rootDir)
      .filter((f) => f.endsWith('.cat') || f.endsWith('.gst'));
    for (const f of files) {
      const text = fs.readFileSync(path.join(this.rootDir, f), 'utf8');
      const doc = xml.parse(text);
      doc.dirty = false;
      this.docs.set(f, doc);
    }
    this.buildIndex();
    this.captureBaseline();
    return this;
  }

  // ---- validation -------------------------------------------------------
  // Scan every loaded document for the id space, duplicate ids and dangling
  // link targets. (The pristine data legitimately contains ~900 reused ids
  // and zero dangling refs, so validation is done RELATIVE to a baseline
  // captured at load: only NEW problems introduced by edits are reported.)
  scan() {
    const idCount = new Map();
    const allIds = new Set();
    for (const [, doc] of this.docs) {
      xml.walk(doc.root, (n) => {
        const id = xml.getAttr(n, 'id');
        if (id) { idCount.set(id, (idCount.get(id) || 0) + 1); allIds.add(id); }
      });
    }
    const dupIds = new Set([...idCount].filter(([, c]) => c > 1).map(([id]) => id));
    const danglingTargets = new Set();
    for (const [, doc] of this.docs) {
      xml.walk(doc.root, (n) => {
        if (!LINK_TAGS.has(n.tag)) return;
        const tid = xml.getAttr(n, 'targetId');
        if (tid && !allIds.has(tid)) danglingTargets.add(tid);
      });
    }
    return { allIds, dupIds, danglingTargets };
  }

  captureBaseline() {
    const s = this.scan();
    this.baseline = { dupIds: s.dupIds, danglingTargets: s.danglingTargets };
  }

  validate({ dirtyOnly = true } = {}) {
    const cur = this.scan();
    const baseDup = (this.baseline && this.baseline.dupIds) || new Set();
    const baseDang = (this.baseline && this.baseline.danglingTargets) || new Set();
    const files = [...this.docs.keys()].filter((f) => !dirtyOnly || this.docs.get(f).dirty);
    const results = [];
    for (const file of files) {
      const doc = this.docs.get(file);
      const r = { file, dirty: !!doc.dirty, errors: [], warnings: [] };
      // 1. well-formedness: serialized output must re-parse
      try { xml.parse(xml.serialize(doc)); } catch (e) { r.errors.push('XML invalide: ' + e.message); results.push(r); continue; }
      // 2. NEW dangling refs / NEW duplicate-id definitions in this file
      const newDang = [];
      const newDup = new Set();
      xml.walk(doc.root, (n) => {
        if (LINK_TAGS.has(n.tag)) {
          const tid = xml.getAttr(n, 'targetId');
          if (tid && !cur.allIds.has(tid) && !baseDang.has(tid)) {
            newDang.push((xml.getAttrDecoded(n, 'name') || n.tag) + ' → ' + tid);
          }
        }
        const id = xml.getAttr(n, 'id');
        if (id && cur.dupIds.has(id) && !baseDup.has(id)) newDup.add(id);
      });
      for (const d of newDang.slice(0, 20)) r.errors.push('Référence orpheline : ' + d);
      if (newDang.length > 20) r.errors.push(`… +${newDang.length - 20} autres références orphelines`);
      for (const id of newDup) r.errors.push('ID dupliqué (introduit) : ' + id);
      results.push(r);
    }
    return { ok: results.every((r) => !r.errors.length), checked: files.length, results };
  }

  buildIndex() {
    this.byId.clear();
    this.linksByTarget.clear();
    for (const [file, doc] of this.docs) {
      xml.walk(doc.root, (node, parent, ancestors) => {
        const id = xml.getAttr(node, 'id');
        if (id) this.byId.set(id, { node, file });

        const targetId = xml.getAttr(node, 'targetId');
        if (targetId && node.tag === 'entryLink') {
          let arr = this.linksByTarget.get(targetId);
          if (!arr) this.linksByTarget.set(targetId, (arr = []));
          const ownerUnit = ownerDatasheet(ancestors);
          arr.push({
            node,
            file,
            ownerUnit: ownerUnit || null,
            ownerName: ownerUnit
              ? xml.getAttrDecoded(ownerUnit, 'name')
              : xml.getAttrDecoded(node, 'name'),
          });
        }
      });
    }
  }

  // ---- listing ----------------------------------------------------------
  listFactions() {
    const out = [];
    for (const [file, doc] of this.docs) {
      out.push({
        file,
        name: xml.getAttrDecoded(doc.root, 'name') || file,
        type: doc.root.tag, // catalogue | gameSystem
      });
    }
    return out.sort((a, b) => a.name.localeCompare(b.name));
  }

  listFactionContents(file) {
    const doc = this.docs.get(file);
    if (!doc) return null;
    const units = [];
    const weapons = [];
    const detachments = [];
    // map "<Detachment>" -> enhancement count, collected in the same pass
    const enhCounts = new Map();
    xml.walk(doc.root, (node) => {
      if (node.tag === 'selectionEntryGroup') {
        const gname = xml.getAttrDecoded(node, 'name') || '';
        if (gname.endsWith(' Enhancements')) {
          const se = xml.child(node, 'selectionEntries');
          enhCounts.set(gname.slice(0, -' Enhancements'.length), se ? se.children.filter((c) => c.tag === 'selectionEntry').length : 0);
        }
      }
    });
    xml.walk(doc.root, (node, parent, ancestors) => {
      if (node.tag !== 'selectionEntry') return;
      const id = xml.getAttr(node, 'id');
      const name = xml.getAttrDecoded(node, 'name');
      if (isDatasheet(node, ancestors)) {
        units.push(unitMeta(node, id, name));
      } else if (isWeaponNode(node)) {
        weapons.push(weaponMeta(node, id, name, this));
      }
      if (isDetachmentNode(node, ancestors)) {
        detachments.push({ id, name, enh: enhCounts.get(name) || 0, rules: readRules(node).length });
      }
    });
    const sort = (a, b) => (a.name || '').localeCompare(b.name || '');
    return {
      file,
      name: xml.getAttrDecoded(doc.root, 'name') || file,
      units: dedupById(units).sort(sort),
      weapons: dedupById(weapons).sort(sort),
      detachments: dedupById(detachments).sort(sort),
    };
  }

  // Distinct categories available for keyword editing, gathered from every
  // categoryEntry definition and categoryLink across all loaded files.
  listCategories() {
    const map = new Map();
    for (const [, doc] of this.docs) {
      xml.walk(doc.root, (node) => {
        if (node.tag === 'categoryEntry') {
          const id = xml.getAttr(node, 'id');
          if (id) map.set(id, xml.getAttrDecoded(node, 'name'));
        } else if (node.tag === 'categoryLink') {
          const tid = xml.getAttr(node, 'targetId');
          if (tid && !map.has(tid)) map.set(tid, xml.getAttrDecoded(node, 'name'));
        }
      });
    }
    return [...map.entries()]
      .map(([targetId, name]) => ({ targetId, name }))
      .sort((a, b) => (a.name || '').localeCompare(b.name || ''));
  }

  // ---- reading entities -------------------------------------------------
  getUnit(file, id) {
    const ref = this.byId.get(id);
    if (!ref) return null;
    const node = ref.node;
    return {
      file: ref.file,
      id,
      name: xml.getAttrDecoded(node, 'name'),
      type: xml.getAttr(node, 'type'),
      costs: readCosts(node),
      pointsModifiers: hasPointsModifier(node),
      keywords: readCategoryLinks(node),
      statProfiles: readProfilesDeep(node, PROFILE_UNIT),
      abilities: readProfilesDeep(node, PROFILE_ABILITIES),
      ruleLinks: readInfoLinks(node, 'rule'),
      weapons: this.readUnitWeapons(node).map((w) => ({ ...w, weaponFile: w.weaponFile || ref.file })),
      composition: readComposition(node),
      options: readOptions(node),
    };
  }

  readUnitWeapons(unitNode) {
    const out = [];
    const seen = new Set();
    // (1) weapons defined inline inside the datasheet (common for characters,
    //     e.g. Abaddon's Talon of Horus / Drach'nyen) - direct weapon entries.
    xml.walk(unitNode, (node, parent, ancestors) => {
      if (node.tag !== 'selectionEntry' || node === unitNode) return;
      if (!isWeaponNode(node)) return;
      const id = xml.getAttr(node, 'id');
      const ctx = weaponContext(ancestors, node);
      const key = id + '|' + (ctx.group || '') + '|' + (ctx.model || '');
      if (seen.has(key)) return;
      seen.add(key);
      out.push({
        targetId: id,
        name: xml.getAttrDecoded(node, 'name'),
        kind: weaponKind(node),
        embedded: true,
        ...ctx,
        profiles: [...readProfiles(node, PROFILE_RANGED), ...readProfiles(node, PROFILE_MELEE)],
      });
    });
    // (2) weapons referenced by entryLink (shared weapon entries).
    xml.walk(unitNode, (node, parent, ancestors) => {
      if (node.tag !== 'entryLink') return;
      const targetId = xml.getAttr(node, 'targetId');
      const ref = targetId && this.byId.get(targetId);
      if (!ref || !isWeaponNode(ref.node)) return;
      const ctx = weaponContext(ancestors, node);
      const key = targetId + '|' + (ctx.group || '') + '|' + (ctx.model || '');
      if (seen.has(key)) return;
      seen.add(key);
      out.push({
        targetId,
        name: xml.getAttrDecoded(node, 'name') || xml.getAttrDecoded(ref.node, 'name'),
        kind: weaponKind(ref.node),
        weaponFile: ref.file,
        ...ctx,
        profiles: [
          ...readProfiles(ref.node, PROFILE_RANGED),
          ...readProfiles(ref.node, PROFILE_MELEE),
        ],
      });
    });
    // default weapons first, then options; stable by name within each
    return out.sort((a, b) => (a.optional - b.optional) || (a.model || '').localeCompare(b.model || '') || (a.name || '').localeCompare(b.name || ''));
  }

  getWeapon(file, id) {
    const ref = this.byId.get(id);
    if (!ref) return null;
    const node = ref.node;
    return {
      file: ref.file,
      id,
      name: xml.getAttrDecoded(node, 'name'),
      kind: weaponKind(node),
      costs: readCosts(node),
      keywords: readCategoryLinks(node),
      profiles: [
        ...readProfiles(node, PROFILE_RANGED),
        ...readProfiles(node, PROFILE_MELEE),
      ],
      ruleLinks: readInfoLinks(node, 'rule'),
      usedBy: this.weaponUsage(id),
    };
  }

  // Datasheets that reference this weapon, deduplicated, grouped by owner.
  weaponUsage(weaponId) {
    const links = this.linksByTarget.get(weaponId) || [];
    const map = new Map();
    for (const l of links) {
      const owner = l.ownerUnit;
      const key = owner ? xml.getAttr(owner, 'id') : `link:${l.file}:${xml.getAttr(l.node, 'id')}`;
      if (!map.has(key)) {
        map.set(key, {
          ownerId: owner ? xml.getAttr(owner, 'id') : null,
          ownerName: l.ownerName,
          file: l.file,
          isDatasheet: !!owner,
          linkCount: 0,
        });
      }
      map.get(key).linkCount++;
    }
    return [...map.values()].sort((a, b) => (a.ownerName || '').localeCompare(b.ownerName || ''));
  }

  getDetachment(file, id) {
    const ref = this.byId.get(id);
    if (!ref) return null;
    const node = ref.node;
    const name = xml.getAttrDecoded(node, 'name');
    const group = this.findEnhancementsGroup(ref.file, name);
    return {
      file: ref.file,
      id,
      name,
      rules: readRules(node),
      keywords: readCategoryLinks(node),
      enhancements: group ? readEnhancements(group) : [],
      hasEnhancementsGroup: !!group,
    };
  }

  findEnhancementsGroup(file, detName) {
    const doc = this.docs.get(file);
    if (!doc) return null;
    let g = null;
    xml.walk(doc.root, (n) => {
      if (!g && n.tag === 'selectionEntryGroup' && xml.getAttrDecoded(n, 'name') === detName + ' Enhancements') g = n;
    });
    return g;
  }

  // ---- editing: detachments ---------------------------------------------
  editDetachment(file, id, patch) {
    const ref = this.byId.get(id);
    if (!ref) throw new Error('Detachment not found: ' + id);
    const node = ref.node;
    if (patch.name != null) xml.setAttr(node, 'name', patch.name);
    if (Array.isArray(patch.rules)) {
      for (const r of patch.rules) {
        const rule = r.id && findById(node, r.id);
        if (!rule) continue;
        if (r.name != null) xml.setAttr(rule, 'name', r.name);
        if (r.description != null) {
          const desc = xml.child(rule, 'description') || (() => { const d = xml.elem('description', {}); rule.children.push(d); rule.selfClose = false; return d; })();
          xml.setText(desc, r.description);
        }
      }
    }
    if (Array.isArray(patch.enhancements)) {
      const group = this.findEnhancementsGroup(ref.file, xml.getAttrDecoded(node, 'name'));
      for (const en of patch.enhancements) {
        const e = en.id && group && findById(group, en.id);
        if (!e) continue;
        if (en.name != null) xml.setAttr(e, 'name', en.name);
        if (en.pts != null) {
          const costs = xml.ensureChild(e, 'costs');
          let c = costs.children.find((x) => x.tag === 'cost' && xml.getAttr(x, 'typeId') === COST_PTS);
          if (!c) { c = xml.elem('cost', { name: 'pts', typeId: COST_PTS, value: '0' }); costs.children.push(c); }
          xml.setAttr(c, 'value', String(en.pts));
        }
        if (en.description != null) {
          const prof = profilesOfType(e, PROFILE_ABILITIES)[0];
          if (prof) {
            const cc = xml.child(prof, 'characteristics');
            const desc = cc && cc.children.find((c) => c.tag === 'characteristic' && xml.getAttrDecoded(c, 'name') === 'Description');
            if (desc) xml.setText(desc, en.description);
          }
        }
      }
    }
    this.markDirty(ref.file);
    this.buildIndex();
    return this.getDetachment(ref.file, id);
  }

  addRule(file, detId, data) {
    const ref = this.byId.get(detId);
    if (!ref) throw new Error('Detachment not found');
    const rules = xml.ensureChild(ref.node, 'rules');
    const rule = xml.elem('rule', { name: data.name || 'New rule', id: this.newId(), hidden: 'false' });
    rule.children.push(textElem('description', data.text || ''));
    rule.selfClose = false;
    rules.children.push(rule);
    this.markDirty(ref.file);
    this.buildIndex();
    return this.getDetachment(ref.file, detId);
  }

  removeRule(file, detId, ruleId) {
    const ref = this.byId.get(detId);
    if (!ref) throw new Error('Detachment not found');
    const rules = xml.child(ref.node, 'rules');
    if (rules) rules.children = rules.children.filter((r) => xml.getAttr(r, 'id') !== ruleId);
    this.markDirty(ref.file);
    this.buildIndex();
    return this.getDetachment(ref.file, detId);
  }

  addEnhancement(file, detId, data) {
    const ref = this.byId.get(detId);
    if (!ref) throw new Error('Detachment not found');
    const detName = xml.getAttrDecoded(ref.node, 'name');
    let group = this.findEnhancementsGroup(ref.file, detName);
    if (!group) {
      // create an enhancements group nested under the detachment entry
      group = xml.elem('selectionEntryGroup', { name: detName + ' Enhancements', hidden: 'false', id: this.newId() }, [xml.elem('selectionEntries', {}, [])]);
      ref.node.children.push(group);
    }
    const entries = xml.child(group, 'selectionEntries') || (() => { const e = xml.elem('selectionEntries', {}, []); group.children.push(e); return e; })();
    const enh = xml.elem('selectionEntry', { type: 'upgrade', import: 'true', name: data.name || 'New Enhancement', hidden: 'false', id: this.newId() }, [
      xml.elem('constraints', {}, [
        xml.elem('constraint', { type: 'max', value: '1', field: 'selections', scope: 'roster', shared: 'true', id: this.newId(), includeChildSelections: 'true', includeChildForces: 'true' }),
      ]),
      xml.elem('profiles', {}, [
        xml.elem('profile', { name: data.name || 'New Enhancement', typeId: PROFILE_ABILITIES, typeName: 'Abilities', hidden: 'false', id: this.newId() }, [
          xml.elem('characteristics', {}, [charElem('Description', data.text || '', ABILITY_DESC_TYPE)]),
        ]),
      ]),
      xml.elem('costs', {}, [xml.elem('cost', { name: 'pts', typeId: COST_PTS, value: String(data.pts != null ? data.pts : 0) })]),
    ]);
    entries.children.push(enh);
    this.markDirty(ref.file);
    this.buildIndex();
    return this.getDetachment(ref.file, detId);
  }

  removeEnhancement(file, detId, enhId) {
    const ref = this.byId.get(detId);
    if (!ref) throw new Error('Detachment not found');
    const group = this.findEnhancementsGroup(ref.file, xml.getAttrDecoded(ref.node, 'name'));
    if (group) {
      const parent = this.findParentInNode(group, enhId) || xml.child(group, 'selectionEntries');
      if (parent) parent.children = parent.children.filter((c) => xml.getAttr(c, 'id') !== enhId);
    }
    this.markDirty(ref.file);
    this.buildIndex();
    return this.getDetachment(ref.file, detId);
  }

  // ---- editing: units ---------------------------------------------------
  editUnit(file, id, patch) {
    const ref = this.byId.get(id);
    if (!ref) throw new Error('Unit not found: ' + id);
    const node = ref.node;
    if (patch.name != null) xml.setAttr(node, 'name', patch.name);
    if (Array.isArray(patch.costs)) applyCosts(node, patch.costs);
    if (Array.isArray(patch.statProfiles)) applyProfileChars(node, patch.statProfiles);
    if (Array.isArray(patch.abilities)) applyAbilities(node, patch.abilities);
    if (Array.isArray(patch.addKeywords)) {
      for (const kw of patch.addKeywords) addCategoryLink(node, kw, this.newId());
    }
    if (Array.isArray(patch.removeKeywords)) {
      for (const cid of patch.removeKeywords) removeCategoryLink(node, cid);
    }
    if (Array.isArray(patch.composition)) applyComposition(node, patch.composition);
    if (Array.isArray(patch.tiers)) applyTiers(node, patch.tiers);
    if (Array.isArray(patch.options)) applyOptions(node, patch.options);
    this.markDirty(ref.file);
    this.buildIndex();
    return this.getUnit(ref.file, id);
  }

  // ---- editing: option choices (add / remove) ---------------------------
  addOptionChoice(file, unitId, groupId, weaponId, weaponName) {
    const ref = this.byId.get(unitId);
    if (!ref) throw new Error('Unit not found: ' + unitId);
    const group = findById(ref.node, groupId);
    if (!group || group.tag !== 'selectionEntryGroup') throw new Error('Option group not found');
    const wref = this.byId.get(weaponId);
    const name = weaponName || (wref ? xml.getAttrDecoded(wref.node, 'name') : 'Weapon');
    const links = xml.ensureChild(group, 'entryLinks');
    const link = xml.elem('entryLink', {
      import: 'true', name, hidden: 'false', id: this.newId(), type: 'selectionEntry', targetId: weaponId,
    });
    // mirror the "pick up to one" constraint that sibling choices carry
    link.children.push(xml.elem('constraints', {}, [
      xml.elem('constraint', { type: 'max', value: '1', field: 'selections', scope: 'parent', shared: 'true', id: this.newId(), includeChildSelections: 'false' }),
    ]));
    link.selfClose = false;
    links.children.push(link);
    this.markDirty(ref.file);
    this.buildIndex();
    return this.getUnit(ref.file, unitId);
  }

  removeOptionChoice(file, unitId, choiceId) {
    const ref = this.byId.get(unitId);
    if (!ref) throw new Error('Unit not found: ' + unitId);
    const parent = this.findParentInNode(ref.node, choiceId);
    if (!parent) throw new Error('Choice not found');
    parent.children = parent.children.filter((c) => xml.getAttr(c, 'id') !== choiceId);
    this.markDirty(ref.file);
    this.buildIndex();
    return this.getUnit(ref.file, unitId);
  }

  findParentInNode(root, childId) {
    let found = null;
    xml.walk(root, (node) => {
      if (found || !node.children) return;
      if (node.children.some((c) => xml.getAttr(c, 'id') === childId)) found = node;
    });
    return found;
  }

  // ---- editing: weapons (with shared impact) ----------------------------
  /*
   * scope:
   *   undefined  -> if shared by >1 datasheet, returns { needsChoice, usedBy }
   *   'all'      -> edit the weapon in place (affects every unit using it)
   *   'some'     -> clone the weapon, apply edits to the clone, and repoint
   *                 the entryLinks of `selectedOwnerIds` to the new weapon.
   */
  editWeapon(file, id, patch, scope, selectedOwnerIds) {
    const ref = this.byId.get(id);
    if (!ref) throw new Error('Weapon not found: ' + id);
    const usedBy = this.weaponUsage(id);
    const datasheetUsers = usedBy.filter((u) => u.isDatasheet);

    if (!scope && datasheetUsers.length > 1) {
      return { needsChoice: true, usedBy, weapon: this.getWeapon(file, id) };
    }

    if (scope === 'some') {
      return this.splitWeapon(ref, patch, selectedOwnerIds || []);
    }

    // default / 'all': edit in place
    applyWeaponPatch(ref.node, patch);
    this.markDirty(ref.file);
    this.buildIndex();
    return { applied: 'all', weapon: this.getWeapon(ref.file, id) };
  }

  splitWeapon(ref, patch, selectedOwnerIds) {
    const original = ref.node;
    const parent = this.findParent(ref.file, original);
    if (!parent) throw new Error('Cannot locate parent of weapon to split');

    // Deep clone with fresh ids, then apply the edits to the clone.
    const clone = this.cloneWithNewIds(original);
    const newId = xml.getAttr(clone, 'id');
    if (patch.name == null) {
      // ensure a distinct name so the variant is recognisable
      xml.setAttr(clone, 'name', (xml.getAttrDecoded(original, 'name') || 'Weapon') + ' (variant)');
    }
    applyWeaponPatch(clone, patch);

    // Insert the clone right after the original in its parent container.
    const idx = parent.children.indexOf(original);
    parent.children.splice(idx + 1, 0, clone);
    this.markDirty(ref.file);

    // Repoint selected datasheets' entryLinks from old id -> new id.
    const oldId = xml.getAttr(original, 'id');
    const repointed = [];
    const selected = new Set(selectedOwnerIds);
    const links = this.linksByTarget.get(oldId) || [];
    for (const l of links) {
      const ownerId = l.ownerUnit ? xml.getAttr(l.ownerUnit, 'id') : null;
      if (ownerId && selected.has(ownerId)) {
        xml.setAttr(l.node, 'targetId', newId);
        this.markDirty(l.file);
        repointed.push({ ownerId, ownerName: l.ownerName, file: l.file });
      }
    }

    this.buildIndex();
    return {
      applied: 'some',
      newWeaponId: newId,
      newWeaponFile: ref.file,
      repointed,
      weapon: this.getWeapon(ref.file, newId),
    };
  }

  // ---- creation ---------------------------------------------------------
  createWeapon(file, data) {
    const doc = this.docs.get(file);
    if (!doc) throw new Error('Unknown file: ' + file);
    const container = this.ensureSharedSelectionEntries(doc);
    const id = this.newId();
    const profileTypeId = data.kind === 'melee' ? PROFILE_MELEE : PROFILE_RANGED;
    const typeName = data.kind === 'melee' ? 'Melee Weapons' : 'Ranged Weapons';

    const profile = xml.elem(
      'profile',
      { id: this.newId(), name: data.name, hidden: 'false', typeId: profileTypeId, typeName },
      buildCharacteristics(data.kind, data.chars || {})
    );
    const node = xml.elem(
      'selectionEntry',
      { type: 'upgrade', import: 'true', name: data.name, hidden: 'false', id },
      [xml.elem('profiles', {}, [profile])]
    );
    if (data.keywords && data.keywords.length) {
      const cl = xml.elem('categoryLinks', {}, data.keywords.map((kw) =>
        catLinkElem(kw, this.newId())
      ));
      node.children.push(cl);
    }
    container.children.push(node);
    this.markDirty(file);
    this.buildIndex();
    return this.getWeapon(file, id);
  }

  createUnit(file, data) {
    const doc = this.docs.get(file);
    if (!doc) throw new Error('Unknown file: ' + file);
    const container = this.ensureSharedSelectionEntries(doc);
    const id = this.newId();

    const costsEl = xml.elem('costs', {}, [
      xml.elem('cost', { name: 'pts', typeId: COST_PTS, value: String(data.points != null ? data.points : 0) }),
    ]);
    const children = [costsEl];
    if (data.keywords && data.keywords.length) {
      children.push(
        xml.elem('categoryLinks', {}, data.keywords.map((kw) => catLinkElem(kw, this.newId())))
      );
    }

    if (Array.isArray(data.models) && data.models.length) {
      // multi-model unit: a composition group with one model entry per type
      const modelEntries = data.models.map((m) => this.buildModelEntry(m));
      children.push(
        xml.elem('selectionEntryGroups', {}, [
          xml.elem('selectionEntryGroup', { name: data.name, hidden: 'false', id: this.newId() }, [
            xml.elem('selectionEntries', {}, modelEntries),
          ]),
        ])
      );
    } else {
      // single-profile datasheet
      children.push(
        xml.elem('profiles', {}, [
          xml.elem(
            'profile',
            { id: this.newId(), name: data.name, hidden: 'false', typeId: PROFILE_UNIT, typeName: 'Unit' },
            [
              xml.elem('characteristics', {}, ['M', 'T', 'SV', 'W', 'LD', 'OC'].map((c) =>
                charElem(c, (data.stats && data.stats[c]) || '', UNIT_CHAR_TYPES[c]))),
            ]
          ),
        ])
      );
    }
    const node = xml.elem(
      'selectionEntry',
      { type: 'unit', import: 'true', name: data.name, hidden: 'false', id },
      children
    );
    container.children.push(node);

    // Optionally expose the datasheet to army building via a root entryLink,
    // the same mechanism every existing datasheet uses.
    if (data.attach) {
      const links = xml.child(doc.root, 'entryLinks') || (() => {
        const e = xml.elem('entryLinks', {}, []);
        doc.root.children.push(e);
        return e;
      })();
      links.children.push(
        xml.elem('entryLink', { import: 'true', name: data.name, hidden: 'false', type: 'selectionEntry', id: this.newId(), targetId: id })
      );
    }

    this.markDirty(file);
    this.buildIndex();
    return this.getUnit(file, id);
  }

  // Build a model selectionEntry (stat profile + min/max count) for composition.
  buildModelEntry(m) {
    return xml.elem(
      'selectionEntry',
      { type: 'model', import: 'true', name: m.name, hidden: 'false', id: this.newId() },
      [
        xml.elem('constraints', {}, [
          xml.elem('constraint', { type: 'min', value: String(m.min != null ? m.min : 1), field: 'selections', scope: 'parent', shared: 'true', id: this.newId() }),
          xml.elem('constraint', { type: 'max', value: String(m.max != null ? m.max : (m.min != null ? m.min : 1)), field: 'selections', scope: 'parent', shared: 'true', id: this.newId() }),
        ]),
        xml.elem('profiles', {}, [
          xml.elem('profile', { id: this.newId(), name: m.name, hidden: 'false', typeId: PROFILE_UNIT, typeName: 'Unit' }, [
            xml.elem('characteristics', {}, ['M', 'T', 'SV', 'W', 'LD', 'OC'].map((c) =>
              charElem(c, (m.stats && m.stats[c]) || '', UNIT_CHAR_TYPES[c]))),
          ]),
        ]),
      ]
    );
  }

  createDetachment(file, data) {
    const doc = this.docs.get(file);
    if (!doc) throw new Error('Unknown file: ' + file);
    // Find an existing "Detachment" selectionEntryGroup to append to.
    let group = null;
    xml.walk(doc.root, (node) => {
      if (
        !group &&
        node.tag === 'selectionEntryGroup' &&
        xml.getAttrDecoded(node, 'name') === 'Detachment'
      ) {
        group = node;
      }
    });
    if (!group) throw new Error('No "Detachment" group found in ' + file);

    const id = this.newId();
    const ruleChildren = [];
    if (data.ruleName || data.ruleText) {
      ruleChildren.push(
        xml.elem('rules', {}, [
          (() => {
            const r = xml.elem('rule', { name: data.ruleName || data.name, id: this.newId(), hidden: 'false' });
            r.children.push(textElem('description', data.ruleText || ''));
            r.selfClose = false;
            return r;
          })(),
        ])
      );
    }
    const node = xml.elem(
      'selectionEntry',
      { type: 'upgrade', import: 'true', name: data.name, hidden: 'false', id },
      ruleChildren
    );
    const entries = xml.child(group, 'selectionEntries') || (() => {
      const e = xml.elem('selectionEntries', {}, []);
      group.children.push(e);
      return e;
    })();
    entries.children.push(node);
    this.markDirty(file);
    this.buildIndex();
    return this.getDetachment(file, id);
  }

  // ---- persistence ------------------------------------------------------
  dirtyFiles() {
    return [...this.docs.entries()].filter(([, d]) => d.dirty).map(([f]) => f);
  }

  save() {
    const written = [];
    for (const [file, doc] of this.docs) {
      if (!doc.dirty) continue;
      const text = xml.serialize(doc);
      fs.writeFileSync(path.join(this.rootDir, file), text, 'utf8');
      doc.dirty = false;
      written.push(file);
    }
    return written;
  }

  preview(file) {
    const doc = this.docs.get(file);
    if (!doc) return null;
    return xml.serialize(doc);
  }

  // ---- helpers ----------------------------------------------------------
  markDirty(file) {
    const doc = this.docs.get(file);
    if (doc) doc.dirty = true;
  }

  ensureSharedSelectionEntries(doc) {
    let c = xml.child(doc.root, 'sharedSelectionEntries');
    if (!c) {
      c = xml.elem('sharedSelectionEntries', {}, []);
      doc.root.children.push(c);
    }
    return c;
  }

  findParent(file, target) {
    const doc = this.docs.get(file);
    let found = null;
    xml.walk(doc.root, (node) => {
      if (found) return;
      if (node.children && node.children.includes(target)) found = node;
    });
    return found;
  }

  cloneWithNewIds(node) {
    const clone = deepClone(node);
    // strip pad so created nodes get standard indentation, and refresh ids
    xml.walk(clone, (n) => {
      n.pad = undefined;
      const a = n.attrs.find((x) => x.name === 'id');
      if (a) a.value = this.newId();
    });
    return clone;
  }

  newId() {
    let id;
    do {
      id = randomId();
    } while (this.byId.has(id));
    return id;
  }
}

// ===========================================================================
// node-level helpers (pure functions over xml nodes)
// ===========================================================================
function profilesOfType(node, typeId) {
  const profiles = xml.child(node, 'profiles');
  if (!profiles) return [];
  return profiles.children.filter((p) => p.tag === 'profile' && xml.getAttr(p, 'typeId') === typeId);
}

function hasUnitProfile(node) {
  return node.tag === 'selectionEntry' && profilesOfType(node, PROFILE_UNIT).length > 0;
}

// Known datasheet roles (a strong unit discriminant) in priority order.
const ROLE_KEYWORDS = ['Epic Hero', 'Character', 'Battleline', 'Dedicated Transport', 'Vehicle', 'Monster', 'Walker', 'Mounted', 'Beast', 'Aircraft', 'Fortification', 'Swarm', 'Infantry'];

// Lightweight, list-level metadata used for client-side faceted filtering.
function unitMeta(node, id, name) {
  const keywords = readCategoryLinks(node).map((k) => k.name).filter(Boolean);
  const pts = (readCosts(node).find((c) => c.name === 'pts') || {}).value;
  const stat = readProfilesDeep(node, PROFILE_UNIT)[0];
  const role = ROLE_KEYWORDS.find((r) => keywords.includes(r)) || 'Other';
  return {
    id, name, keywords, role,
    pts: pts != null && pts !== '' ? Number(pts) : null,
    t: stat && stat.chars ? stat.chars.T : null,
    w: stat && stat.chars ? stat.chars.W : null,
    legend: /\[legend/i.test(name || ''),
    epic: keywords.includes('Epic Hero'),
  };
}

function weaponMeta(node, id, name, catalog) {
  const kind = weaponKind(node);
  const prof = (profilesOfType(node, PROFILE_RANGED)[0] || profilesOfType(node, PROFILE_MELEE)[0]);
  const chars = {};
  if (prof) {
    const cc = xml.child(prof, 'characteristics');
    if (cc) for (const c of cc.children) if (c.tag === 'characteristic') chars[xml.getAttrDecoded(c, 'name')] = xml.getText(c);
  }
  const kws = (chars.Keywords || '').split(',').map((s) => s.trim()).filter((s) => s && s !== '-');
  const users = catalog.weaponUsage(id).filter((u) => u.isDatasheet).length;
  return {
    id, name, kind,
    keywords: kws,
    s: chars.S || null, ap: chars.AP || null, d: chars.D || null, range: chars.Range || null,
    users, shared: users > 1,
  };
}

// A "datasheet" is a top-level playable entry: a squad (type=unit) or a
// single-model unit/character (type=model carrying its own Unit profile and
// not nested inside another unit/model entry).
function isDatasheet(node, ancestors) {
  if (node.tag !== 'selectionEntry') return false;
  const type = xml.getAttr(node, 'type');
  if (type === 'unit') return true;
  if (type === 'model' && hasUnitProfile(node)) {
    const nested = ancestors.some(
      (a) => a.tag === 'selectionEntry' && ['unit', 'model'].includes(xml.getAttr(a, 'type'))
    );
    return !nested;
  }
  return false;
}

// The owning datasheet for a (possibly deeply nested) entryLink: prefer the
// enclosing squad (type=unit); fall back to a single-model datasheet.
function ownerDatasheet(ancestors) {
  const rev = ancestors.slice().reverse();
  const squad = rev.find((a) => a.tag === 'selectionEntry' && xml.getAttr(a, 'type') === 'unit');
  if (squad) return squad;
  return rev.find(
    (a) => a.tag === 'selectionEntry' && xml.getAttr(a, 'type') === 'model' && hasUnitProfile(a)
  );
}

function isWeaponNode(node) {
  if (node.tag !== 'selectionEntry') return false;
  return profilesOfType(node, PROFILE_RANGED).length > 0 || profilesOfType(node, PROFILE_MELEE).length > 0;
}

function weaponKind(node) {
  if (profilesOfType(node, PROFILE_MELEE).length > 0 && profilesOfType(node, PROFILE_RANGED).length === 0) {
    return 'melee';
  }
  if (profilesOfType(node, PROFILE_RANGED).length > 0) return 'ranged';
  return 'unknown';
}

function isDetachmentNode(node, ancestors) {
  if (node.tag !== 'selectionEntry') return false;
  return ancestors.some(
    (a) => a.tag === 'selectionEntryGroup' && xml.getAttrDecoded(a, 'name') === 'Detachment'
  );
}

function readCosts(node) {
  const costs = xml.child(node, 'costs');
  if (!costs) return [];
  return costs.children
    .filter((c) => c.tag === 'cost')
    .map((c) => ({
      name: xml.getAttrDecoded(c, 'name'),
      typeId: xml.getAttr(c, 'typeId'),
      value: xml.getAttr(c, 'value'),
    }));
}

function hasPointsModifier(node) {
  let found = false;
  xml.walk(node, (n) => {
    if (n.tag === 'modifier' && xml.getAttr(n, 'field') === COST_PTS) found = true;
  });
  return found;
}

function readCategoryLinks(node) {
  const cl = xml.child(node, 'categoryLinks');
  if (!cl) return [];
  return cl.children
    .filter((c) => c.tag === 'categoryLink')
    .map((c) => ({
      id: xml.getAttr(c, 'id'),
      targetId: xml.getAttr(c, 'targetId'),
      name: xml.getAttrDecoded(c, 'name'),
      primary: xml.getAttr(c, 'primary'),
    }));
}

// Classify a weapon within a datasheet: is it a DEFAULT (always-equipped)
// weapon attached directly to a model/unit, or an OPTION inside a weapon-choice
// selectionEntryGroup? Also report the carrying model and the option group name.
function weaponContext(ancestors, node) {
  // nearest enclosing model / unit (the carrier)
  let ownerIdx = -1;
  let model = null;
  for (let i = ancestors.length - 1; i >= 0; i--) {
    const a = ancestors[i];
    if (a.tag === 'selectionEntry' && ['model', 'unit'].includes(xml.getAttr(a, 'type'))) {
      ownerIdx = i; model = xml.getAttrDecoded(a, 'name'); break;
    }
  }
  // a selectionEntryGroup sitting BETWEEN the carrier and this weapon = a choice
  let group = null;
  for (let i = ownerIdx + 1; i < ancestors.length; i++) {
    if (ancestors[i].tag === 'selectionEntryGroup') { group = xml.getAttrDecoded(ancestors[i], 'name'); break; }
  }
  return { optional: !!group, group, model };
}

// Collect profiles of a given type anywhere in a datasheet subtree (squad
// stats and abilities frequently live on the nested model entries).
function readProfilesDeep(node, typeId) {
  const out = [];
  const seen = new Set();
  xml.walk(node, (n) => {
    if (n.tag === 'profile' && xml.getAttr(n, 'typeId') === typeId) {
      const id = xml.getAttr(n, 'id');
      if (id && seen.has(id)) return;
      if (id) seen.add(id);
      out.push(readOneProfile(n, typeId));
    }
  });
  return out;
}

function readOneProfile(p, typeId) {
  const chars = {};
  const cc = xml.child(p, 'characteristics');
  if (cc) {
    for (const c of cc.children) {
      if (c.tag === 'characteristic') chars[xml.getAttrDecoded(c, 'name')] = xml.getText(c);
    }
  }
  return { id: xml.getAttr(p, 'id'), name: xml.getAttrDecoded(p, 'name'), typeId, chars };
}

function readProfiles(node, typeId) {
  return profilesOfType(node, typeId).map((p) => {
    const chars = {};
    const cc = xml.child(p, 'characteristics');
    if (cc) {
      for (const c of cc.children) {
        if (c.tag === 'characteristic') chars[xml.getAttrDecoded(c, 'name')] = xml.getText(c);
      }
    }
    return { id: xml.getAttr(p, 'id'), name: xml.getAttrDecoded(p, 'name'), typeId, chars };
  });
}

function readInfoLinks(node, type) {
  const il = xml.child(node, 'infoLinks');
  if (!il) return [];
  return il.children
    .filter((c) => c.tag === 'infoLink' && (!type || xml.getAttr(c, 'type') === type))
    .map((c) => ({
      id: xml.getAttr(c, 'id'),
      targetId: xml.getAttr(c, 'targetId'),
      name: xml.getAttrDecoded(c, 'name'),
      type: xml.getAttr(c, 'type'),
    }));
}

function readRules(node) {
  const r = xml.child(node, 'rules');
  if (!r) return [];
  return r.children
    .filter((c) => c.tag === 'rule')
    .map((c) => ({
      id: xml.getAttr(c, 'id'),
      name: xml.getAttrDecoded(c, 'name'),
      description: xml.getText(xml.child(c, 'description') || {}),
    }));
}

function readEnhancements(group) {
  const se = xml.child(group, 'selectionEntries');
  if (!se) return [];
  return se.children
    .filter((e) => e.tag === 'selectionEntry')
    .map((e) => {
      const prof = profilesOfType(e, PROFILE_ABILITIES)[0];
      let description = '';
      if (prof) {
        const cc = xml.child(prof, 'characteristics');
        const desc = cc && cc.children.find((c) => c.tag === 'characteristic' && xml.getAttrDecoded(c, 'name') === 'Description');
        if (desc) description = xml.getText(desc);
      }
      return {
        id: xml.getAttr(e, 'id'),
        name: xml.getAttrDecoded(e, 'name'),
        pts: (readCosts(e).find((c) => c.name === 'pts') || {}).value || '0',
        description,
      };
    });
}

// ---- composition / options / tiers (read) ---------------------------------
// Model selection entries of a datasheet: those directly under the unit, plus
// one level inside its selectionEntryGroups (squad model types).
function unitModelEntries(unitNode) {
  const res = [];
  const direct = xml.child(unitNode, 'selectionEntries');
  if (direct) {
    for (const e of direct.children) {
      if (e.tag === 'selectionEntry' && xml.getAttr(e, 'type') === 'model') res.push({ group: null, entry: e });
    }
  }
  const groups = xml.child(unitNode, 'selectionEntryGroups');
  if (groups) {
    for (const g of groups.children) {
      if (g.tag !== 'selectionEntryGroup') continue;
      const se = xml.child(g, 'selectionEntries');
      if (!se) continue;
      for (const e of se.children) {
        if (e.tag === 'selectionEntry' && xml.getAttr(e, 'type') === 'model') res.push({ group: g, entry: e });
      }
    }
  }
  return res;
}

// min/max model-count constraints (field=selections, scope=parent) of an entry.
function entryCount(entry) {
  const c = xml.child(entry, 'constraints');
  const r = { min: null, max: null };
  if (!c) return r;
  for (const k of c.children) {
    if (k.tag !== 'constraint') continue;
    if (xml.getAttr(k, 'field') !== 'selections' || xml.getAttr(k, 'scope') !== 'parent') continue;
    const t = xml.getAttr(k, 'type');
    if (t === 'min') r.min = xml.getAttr(k, 'value');
    if (t === 'max') r.max = xml.getAttr(k, 'value');
  }
  return r;
}

function readComposition(unitNode) {
  const models = unitModelEntries(unitNode);
  const tiers = readTiers(unitNode);
  if (models.length === 0) {
    // single-model datasheet (character / vehicle / monster)
    return {
      minM: 1, maxM: 1, tiers,
      groups: [{
        groupId: null, name: '_fixed', fixed: true,
        models: [{ entryId: xml.getAttr(unitNode, 'id'), name: xml.getAttrDecoded(unitNode, 'name'), min: '1', max: '1', editable: false }],
      }],
    };
  }
  const groupsMap = new Map();
  let minM = 0;
  let maxM = 0;
  for (const { group, entry } of models) {
    const mc = entryCount(entry);
    minM += Number(mc.min || 0);
    maxM += Number(mc.max || mc.min || 0);
    const key = group ? xml.getAttr(group, 'id') : '_loose';
    if (!groupsMap.has(key)) {
      groupsMap.set(key, {
        groupId: group ? xml.getAttr(group, 'id') : null,
        name: group ? xml.getAttrDecoded(group, 'name') : '_fixed',
        models: [],
      });
    }
    groupsMap.get(key).models.push({
      entryId: xml.getAttr(entry, 'id'), name: xml.getAttrDecoded(entry, 'name'),
      min: mc.min, max: mc.max, editable: true,
    });
  }
  return { minM, maxM, tiers, groups: [...groupsMap.values()] };
}

// Cost tiers expressed as pts "set" modifiers gated by a model-count condition.
function readTiers(unitNode) {
  const tiers = [];
  let idx = 0;
  xml.walk(unitNode, (n) => {
    if (n.tag !== 'modifier') return;
    if (xml.getAttr(n, 'field') !== COST_PTS || xml.getAttr(n, 'type') !== 'set') return;
    let at = null;
    xml.walk(n, (c) => {
      if (c.tag === 'condition' && xml.getAttr(c, 'field') === 'selections') at = xml.getAttr(c, 'value');
    });
    tiers.push({ idx: idx++, atModels: at, pts: xml.getAttr(n, 'value') });
  });
  return tiers;
}

// Wargear / weapon-option groups (one entry per group node, so choices can be
// added/removed against a specific group). Choices may be inline selectionEntries
// or entryLinks to shared weapons.
function readOptions(unitNode) {
  const groups = [];
  xml.walk(unitNode, (node, parent, ancestors) => {
    if (node.tag !== 'selectionEntryGroup') return;
    const name = xml.getAttrDecoded(node, 'name');
    if (!name || name === 'Detachment') return;
    const choiceNodes = [];
    const se = xml.child(node, 'selectionEntries');
    if (se) for (const e of se.children) if (e.tag === 'selectionEntry' && xml.getAttr(e, 'type') !== 'model') choiceNodes.push({ node: e, kind: 'entry' });
    const elk = xml.child(node, 'entryLinks');
    if (elk) for (const e of elk.children) if (e.tag === 'entryLink') choiceNodes.push({ node: e, kind: 'link' });
    if (!choiceNodes.length) return;
    const model = ancestors.slice().reverse().find((a) => a.tag === 'selectionEntry' && ['model', 'unit'].includes(xml.getAttr(a, 'type')));
    groups.push({
      groupId: xml.getAttr(node, 'id'),
      name,
      ownerName: model ? xml.getAttrDecoded(model, 'name') : null,
      choices: choiceNodes.map((c) => ({
        id: xml.getAttr(c.node, 'id'),
        name: xml.getAttrDecoded(c.node, 'name'),
        kind: c.kind,
        targetId: xml.getAttr(c.node, 'targetId'),
        pts: (readCosts(c.node).find((x) => x.name === 'pts') || {}).value || '0',
      })),
    });
  });
  return groups;
}

// ---- composition / options / tiers (write) --------------------------------
function applyComposition(unitNode, comp) {
  for (const m of comp) {
    const entry = findById(unitNode, m.entryId);
    if (!entry) continue;
    const c = xml.child(entry, 'constraints');
    if (!c) continue;
    for (const k of c.children) {
      if (k.tag !== 'constraint') continue;
      if (xml.getAttr(k, 'field') !== 'selections' || xml.getAttr(k, 'scope') !== 'parent') continue;
      const t = xml.getAttr(k, 'type');
      if (t === 'min' && m.min != null) xml.setAttr(k, 'value', String(m.min));
      if (t === 'max' && m.max != null) xml.setAttr(k, 'value', String(m.max));
    }
  }
}

function applyTiers(unitNode, tiers) {
  const mods = [];
  xml.walk(unitNode, (n) => {
    if (n.tag === 'modifier' && xml.getAttr(n, 'field') === COST_PTS && xml.getAttr(n, 'type') === 'set') mods.push(n);
  });
  for (const t of tiers) {
    const m = mods[t.idx];
    if (!m) continue;
    if (t.pts != null) xml.setAttr(m, 'value', String(t.pts));
    if (t.atModels != null) {
      xml.walk(m, (c) => {
        if (c.tag === 'condition' && xml.getAttr(c, 'field') === 'selections') xml.setAttr(c, 'value', String(t.atModels));
      });
    }
  }
}

function applyOptions(unitNode, options) {
  for (const o of options) {
    const ids = o.ids || o.entryIds || (o.id ? [o.id] : []);
    for (const id of ids) {
      const e = findById(unitNode, id);
      if (!e || o.pts == null) continue;
      const costs = xml.ensureChild(e, 'costs');
      let c = costs.children.find((x) => x.tag === 'cost' && xml.getAttr(x, 'typeId') === COST_PTS);
      if (!c) {
        c = xml.elem('cost', { name: 'pts', typeId: COST_PTS, value: '0' });
        costs.children.push(c);
      }
      xml.setAttr(c, 'value', String(o.pts));
    }
  }
}

// ---- mutation helpers ------------------------------------------------------
function applyCosts(node, costs) {
  const container = xml.child(node, 'costs');
  if (!container) return;
  for (const want of costs) {
    const c = container.children.find(
      (x) => x.tag === 'cost' && xml.getAttr(x, 'typeId') === want.typeId
    );
    if (c) xml.setAttr(c, 'value', String(want.value));
  }
}

function applyProfileChars(node, statProfiles) {
  for (const sp of statProfiles) {
    const ref = sp.id && findById(node, sp.id);
    if (!ref) continue;
    if (sp.name != null) xml.setAttr(ref, 'name', sp.name);
    const cc = xml.child(ref, 'characteristics');
    if (!cc || !sp.chars) continue;
    for (const c of cc.children) {
      if (c.tag !== 'characteristic') continue;
      const name = xml.getAttrDecoded(c, 'name');
      if (Object.prototype.hasOwnProperty.call(sp.chars, name)) xml.setText(c, sp.chars[name]);
    }
  }
}

function applyAbilities(node, abilities) {
  for (const ab of abilities) {
    const ref = ab.id && findById(node, ab.id);
    if (!ref) continue;
    if (ab.name != null) xml.setAttr(ref, 'name', ab.name);
    const cc = xml.child(ref, 'characteristics');
    if (cc && ab.description != null) {
      const desc = cc.children.find(
        (c) => c.tag === 'characteristic' && xml.getAttrDecoded(c, 'name') === 'Description'
      );
      if (desc) xml.setText(desc, ab.description);
    }
  }
}

function applyWeaponPatch(weaponNode, patch) {
  if (patch.name != null) {
    xml.setAttr(weaponNode, 'name', patch.name);
    // keep the (single) weapon profile name in sync when there is just one
    const ranged = profilesOfType(weaponNode, PROFILE_RANGED);
    const melee = profilesOfType(weaponNode, PROFILE_MELEE);
    const all = ranged.concat(melee);
    if (all.length === 1) xml.setAttr(all[0], 'name', patch.name);
  }
  if (Array.isArray(patch.profiles)) applyProfileChars(weaponNode, patch.profiles);
  if (Array.isArray(patch.costs)) applyCosts(weaponNode, patch.costs);
}

function addCategoryLink(node, kw, newIdValue) {
  const container = xml.ensureChild(node, 'categoryLinks');
  container.children.push(catLinkElem(kw, newIdValue));
}

function removeCategoryLink(node, categoryLinkId) {
  const container = xml.child(node, 'categoryLinks');
  if (!container) return;
  container.children = container.children.filter((c) => xml.getAttr(c, 'id') !== categoryLinkId);
}

// ---- element builders ------------------------------------------------------
function catLinkElem(kw, idValue) {
  return xml.elem('categoryLink', {
    id: idValue,
    name: kw.name,
    hidden: 'false',
    targetId: kw.targetId,
    primary: kw.primary != null ? String(kw.primary) : 'false',
  });
}

function charElem(name, value, typeId) {
  const e = xml.elem('characteristic', typeId ? { name, typeId } : { name });
  xml.setText(e, value);
  return e;
}

function textElem(tag, value) {
  const e = xml.elem(tag, {});
  xml.setText(e, value);
  return e;
}

const RANGED_CHARS = ['Range', 'A', 'BS', 'S', 'AP', 'D', 'Keywords'];
const MELEE_CHARS = ['Range', 'A', 'WS', 'S', 'AP', 'D', 'Keywords'];

function buildCharacteristics(kind, chars) {
  const names = kind === 'melee' ? MELEE_CHARS : RANGED_CHARS;
  const types = kind === 'melee' ? MELEE_CHAR_TYPES : RANGED_CHAR_TYPES;
  const list = names.map((name) => {
    let v = chars[name];
    if (v == null) v = name === 'Range' && kind === 'melee' ? 'Melee' : '';
    return charElem(name, v, types[name]);
  });
  return [xml.elem('characteristics', {}, list)];
}

// ---- generic utilities -----------------------------------------------------
function findById(root, id) {
  let found = null;
  xml.walk(root, (n) => {
    if (!found && xml.getAttr(n, 'id') === id) found = n;
  });
  return found;
}

function deepClone(node) {
  return {
    tag: node.tag,
    attrs: node.attrs.map((a) => ({ name: a.name, value: a.value })),
    children: (node.children || []).map(deepClone),
    text: node.text,
    selfClose: node.selfClose,
    pad: node.pad,
  };
}

function dedupById(arr) {
  const seen = new Set();
  return arr.filter((x) => {
    if (!x.id || seen.has(x.id)) return false;
    seen.add(x.id);
    return true;
  });
}

function dedupBy(arr, keyFn) {
  const seen = new Set();
  return arr.filter((x) => {
    const k = keyFn(x);
    if (seen.has(k)) return false;
    seen.add(k);
    return true;
  });
}

function randomId() {
  const g = () => Math.floor(Math.random() * 0x10000).toString(16).padStart(4, '0');
  return `${g()}-${g()}-${g()}-${g()}`;
}

module.exports = {
  Catalog,
  PROFILE_UNIT,
  PROFILE_RANGED,
  PROFILE_MELEE,
  PROFILE_ABILITIES,
  COST_PTS,
  RANGED_CHARS,
  MELEE_CHARS,
};
