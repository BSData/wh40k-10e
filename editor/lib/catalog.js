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
    return this;
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
    xml.walk(doc.root, (node, parent, ancestors) => {
      if (node.tag !== 'selectionEntry') return;
      const id = xml.getAttr(node, 'id');
      const name = xml.getAttrDecoded(node, 'name');
      if (isDatasheet(node, ancestors)) {
        units.push({ id, name });
      } else if (isWeaponNode(node)) {
        weapons.push({ id, name, kind: weaponKind(node) });
      }
      if (isDetachmentNode(node, ancestors)) {
        detachments.push({ id, name });
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
      weapons: this.readUnitWeapons(node),
    };
  }

  readUnitWeapons(unitNode) {
    const out = [];
    xml.walk(unitNode, (node) => {
      if (node.tag !== 'entryLink') return;
      const targetId = xml.getAttr(node, 'targetId');
      const ref = targetId && this.byId.get(targetId);
      if (!ref || !isWeaponNode(ref.node)) return;
      out.push({
        targetId,
        name: xml.getAttrDecoded(node, 'name') || xml.getAttrDecoded(ref.node, 'name'),
        kind: weaponKind(ref.node),
        weaponFile: ref.file,
        profiles: [
          ...readProfiles(ref.node, PROFILE_RANGED),
          ...readProfiles(ref.node, PROFILE_MELEE),
        ],
      });
    });
    return dedupBy(out, (w) => w.targetId);
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
    return {
      file: ref.file,
      id,
      name: xml.getAttrDecoded(node, 'name'),
      rules: readRules(node),
      keywords: readCategoryLinks(node),
    };
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
    this.markDirty(ref.file);
    this.buildIndex();
    return this.getUnit(ref.file, id);
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

    const statProfile = xml.elem(
      'profile',
      { id: this.newId(), name: data.name, hidden: 'false', typeId: PROFILE_UNIT, typeName: 'Unit' },
      [
        xml.elem(
          'characteristics',
          {},
          ['M', 'T', 'SV', 'W', 'LD', 'OC'].map((c) =>
            charElem(c, (data.stats && data.stats[c]) || '', UNIT_CHAR_TYPES[c])
          )
        ),
      ]
    );
    const children = [
      xml.elem('profiles', {}, [statProfile]),
      xml.elem('costs', {}, [
        xml.elem('cost', { name: 'pts', typeId: COST_PTS, value: String(data.points != null ? data.points : 0) }),
      ]),
    ];
    if (data.keywords && data.keywords.length) {
      children.push(
        xml.elem('categoryLinks', {}, data.keywords.map((kw) => catLinkElem(kw, this.newId())))
      );
    }
    const node = xml.elem(
      'selectionEntry',
      { type: 'unit', import: 'true', name: data.name, hidden: 'false', id },
      children
    );
    container.children.push(node);
    this.markDirty(file);
    this.buildIndex();
    return this.getUnit(file, id);
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
