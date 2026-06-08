/* Cogitator Editorius — front-end logic (vanilla JS module, no build step).
 * The read-only datasheet preview is rendered by the Cogitator Bellicum
 * presentation module (editor/public/datasheet-presentation), so the editor
 * shows exactly the same layout/rules; the left column is the edit form. */
import {
  renderDatasheet, renderWeaponTable,
} from './datasheet-presentation/index.js';

// ---- tiny DOM helpers ------------------------------------------------------
const $ = (sel, root = document) => root.querySelector(sel);
const $$ = (sel, root = document) => [...root.querySelectorAll(sel)];
function el(tag, attrs = {}, children = []) {
  const n = document.createElement(tag);
  for (const [k, v] of Object.entries(attrs)) {
    if (k === 'class') n.className = v;
    else if (k === 'html') n.innerHTML = v;
    else if (k.startsWith('on') && typeof v === 'function') n.addEventListener(k.slice(2), v);
    else if (v != null) n.setAttribute(k, v);
  }
  for (const c of [].concat(children)) {
    if (c == null) continue;
    n.appendChild(typeof c === 'string' ? document.createTextNode(c) : c);
  }
  return n;
}

// ---- api -------------------------------------------------------------------
async function api(path, opts) {
  const res = await fetch('/api' + path, opts);
  const txt = await res.text();
  let data;
  try { data = txt ? JSON.parse(txt) : null; } catch { data = txt; }
  if (!res.ok) throw new Error((data && data.error) || res.statusText);
  return data;
}
const apiGet = (p) => api(p);
const apiPost = (p, body) => api(p, { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(body) });

// ---- state -----------------------------------------------------------------
const state = {
  factions: [],
  file: null,
  contents: null,
  tab: 'units',
  selected: null, // {kind,id}
  categories: null,
  lang: 'fr',
  livePreview: null, // () => rebuild the preview pane from current form values
  filters: { units: {}, weapons: {}, detachments: {} },
};

// ---- adapters: API JSON -> presentation module `unit` shape ----------------
const SL = ['M', 'T', 'SV', 'W', 'LD', 'OC'];
const CAT_KEYS = ['Character', 'Battleline', 'Vehicle', 'Monster', 'Mounted', 'Beast', 'Transport', 'Aircraft', 'Fortification', 'Infantry'];

function statsArray(chars) { return SL.map((k) => (chars && chars[k] != null ? chars[k] : '')); }

function pickCat(keywordNames) {
  for (const key of CAT_KEYS) if (keywordNames.includes(key)) return key;
  return undefined;
}

const MELEE_PROFILE = '8a40-4aaa-c780-9046';
function weaponsToShape(weapons) {
  const out = [];
  for (const w of weapons || []) {
    for (const p of w.profiles || []) {
      const c = p.chars || {};
      // badge per profile so combi-weapons (ranged + melee in one entry) are
      // each tagged correctly; fall back to the weapon's overall kind.
      const t = p.typeId ? (p.typeId === MELEE_PROFILE ? 'M' : 'R') : (w.kind === 'melee' ? 'M' : 'R');
      out.push({
        n: p.name || w.name, t,
        rng: c.Range, a: c.A, sk: c.BS != null ? c.BS : c.WS,
        s: c.S, ap: c.AP, d: c.D, kw: c.Keywords, count: 1,
      });
    }
  }
  return out;
}

function unitToShape(u) {
  const keywordNames = (u.keywords || []).map((k) => k.name);
  const pts = (u.costs || []).find((c) => c.name === 'pts');
  const shape = {
    name: u.name,
    cat: pickCat(keywordNames),
    pts: pts ? Number(pts.value) : undefined,
    keywords: keywordNames,
    weapons: weaponsToShape(u.weapons),
    abilities: (u.abilities || []).map((a) => [a.name || '', (a.chars && a.chars.Description) || a.description || '']),
    isChar: keywordNames.includes('Character'),
    isEpic: keywordNames.includes('Epic Hero'),
    isLegend: /\[legends?\]/i.test(u.name || '') || keywordNames.some((k) => /legend/i.test(k)),
  };
  const sp = u.statProfiles || [];
  if (sp.length > 1) shape.statLines = sp.map((p) => [p.name, statsArray(p.chars)]);
  else if (sp.length === 1) shape.stats = statsArray(sp[0].chars);
  Object.assign(shape, compToShape(u.composition));
  shape.opts = optsToShape(u.options);
  return shape;
}

function compToShape(composition) {
  if (!composition) return {};
  const num = (x) => Number(x || 0);
  const comp = (composition.groups || []).map((g) => {
    const min = g.models.reduce((s, m) => s + num(m.min), 0);
    const max = g.models.reduce((s, m) => s + num(m.max || m.min), 0);
    if (g.name === '_fixed') return ['_fixed', min, max, g.models.map((m) => [m.name, num(m.max) || 1]), []];
    return [g.name, min, max, g.models.map((m) => [m.name, num(m.max)])];
  });
  const tiers = (composition.tiers || []).filter((t) => t.atModels != null).map((t) => [num(t.atModels), num(t.pts)]);
  // recompute totals from the (possibly edited) model counts so the header is live
  const minM = comp.reduce((s, g) => s + num(g[1]), 0) || composition.minM;
  const maxM = comp.reduce((s, g) => s + num(g[2]), 0) || composition.maxM;
  return { comp, minM, maxM, tiers };
}

function optsToShape(options) {
  const seen = new Set();
  const out = [];
  for (const o of options || []) {
    if (seen.has(o.name)) continue;
    seen.add(o.name);
    out.push([o.name, o.choices.map((ch) => [ch.name, Number(ch.pts) || 0])]);
    if (out.length >= 12) break;
  }
  return out;
}

function weaponToShape(w) {
  // present a lone weapon as a one-row datasheet-style weapon table input
  return { name: w.name, weapons: weaponsToShape([w]) };
}

// ---- boot ------------------------------------------------------------------
init().catch((e) => toast(e.message, 'err'));

async function init() {
  state.factions = await apiGet('/factions');
  const sel = $('#faction-select');
  sel.innerHTML = '';
  // catalogues first, game system last
  for (const f of state.factions) {
    sel.appendChild(el('option', { value: f.file }, `${f.name}`));
  }
  sel.addEventListener('change', () => selectFaction(sel.value));

  $$('#tabs .tab').forEach((t) =>
    t.addEventListener('click', () => {
      $$('#tabs .tab').forEach((x) => x.classList.toggle('active', x === t));
      state.tab = t.dataset.tab;
      renderFacets();
      renderList();
    })
  );
  $('#filter').addEventListener('input', renderList);
  $('#btn-new').addEventListener('click', onNew);
  $('#btn-save').addEventListener('click', onSave);
  $('#btn-commit').addEventListener('click', onCommit);
  $('#btn-validate').addEventListener('click', () => onValidate(false));
  $('#btn-lang').addEventListener('click', () => {
    state.lang = state.lang === 'fr' ? 'en' : 'fr';
    $('#btn-lang').textContent = state.lang.toUpperCase();
    if (state.livePreview) state.livePreview();
  });

  await refreshStatus();
  // default to a meaty catalogue if present
  const def = state.factions.find((f) => /Imperium - Space Marines\.cat$/.test(f.file)) || state.factions[0];
  if (def) { sel.value = def.file; await selectFaction(def.file); }
}

async function selectFaction(file) {
  state.file = file;
  state.contents = await apiGet('/faction?file=' + encodeURIComponent(file));
  state.selected = null;
  state.filters = { units: {}, weapons: {}, detachments: {} };
  $('#filter').value = '';
  renderFacets();
  renderList();
  $('#detail').innerHTML = '<div class="empty-state"><p>Choisis une entrée à gauche.</p></div>';
}

// ---- sidebar list + faceted filters ----------------------------------------
function currentItems() {
  if (!state.contents) return [];
  return state.contents[state.tab] || [];
}
function activeFilters() {
  return state.filters[state.tab] || (state.filters[state.tab] = {});
}

const WEAPON_KW_BASE = (kw) => kw.replace(/\s+\d+\+?$/, '').trim(); // "Rapid Fire 2"->"Rapid Fire"
function distinct(arr) { return [...new Set(arr)].sort((a, b) => a.localeCompare(b)); }

function applyFilters(items) {
  const q = $('#filter').value.trim().toLowerCase();
  const f = activeFilters();
  return items.filter((it) => {
    if (q && !(it.name || '').toLowerCase().includes(q)) return false;
    if (state.tab === 'units') {
      if (f.role && f.role !== '*' && it.role !== f.role) return false;
      if (f.kw && f.kw !== '*' && !(it.keywords || []).includes(f.kw)) return false;
      if (f.ptsMin !== undefined && f.ptsMin !== '' && (it.pts == null || it.pts < Number(f.ptsMin))) return false;
      if (f.ptsMax !== undefined && f.ptsMax !== '' && (it.pts == null || it.pts > Number(f.ptsMax))) return false;
      if (f.tMin !== undefined && f.tMin !== '' && !(Number(it.t) >= Number(f.tMin))) return false;
      if (f.hideLegend && it.legend) return false;
      if (f.epic && !it.epic) return false;
    } else if (state.tab === 'weapons') {
      if (f.kind && f.kind !== '*' && it.kind !== f.kind) return false;
      if (f.kw && f.kw !== '*' && !(it.keywords || []).some((k) => WEAPON_KW_BASE(k) === f.kw)) return false;
      if (f.sMin !== undefined && f.sMin !== '' && !(Number(it.s) >= Number(f.sMin))) return false;
      if (f.shared && !it.shared) return false;
    } else if (state.tab === 'detachments') {
      if (f.hasEnh && !(it.enh > 0)) return false;
    }
    return true;
  });
}

function renderList() {
  const ul = $('#entity-list');
  ul.innerHTML = '';
  const items = applyFilters(currentItems());
  for (const it of items) {
    const meta = state.tab === 'units' ? (it.pts != null ? it.pts + ' pts' : '')
      : state.tab === 'weapons' ? it.kind
      : (it.enh ? it.enh + ' enh.' : '');
    const li = el('li', { onclick: () => openEntity(state.tab, it.id) }, [
      el('span', {}, it.name || '(sans nom)'),
      meta ? el('span', { class: 'tag' }, meta) : null,
    ]);
    if (state.selected && state.selected.id === it.id) li.classList.add('active');
    ul.appendChild(li);
  }
  if (!items.length) ul.appendChild(el('li', { class: 'muted' }, 'Aucune entrée.'));
  $('#list-count').textContent = `${items.length} / ${currentItems().length}`;
}

// Build the filter controls for the active tab from the current data.
function renderFacets() {
  const host = $('#facets');
  host.innerHTML = '';
  if (!state.contents) return;
  const items = currentItems();
  const f = activeFilters();
  const onChange = () => renderList();

  const selectRow = (label, key, options) => {
    const sel = el('select', { onchange: (e) => { f[key] = e.target.value; onChange(); } },
      options.map((o) => el('option', { value: o.v }, o.t)));
    sel.value = f[key] || '*';
    return el('div', { class: 'frow' }, [el('label', {}, label), sel]);
  };
  const numRow = (label, ...inputs) => el('div', { class: 'frow' }, [el('label', {}, label), ...inputs]);
  const numInput = (key, ph) => {
    const i = el('input', { class: 'fnum', type: 'number', placeholder: ph, value: f[key] != null ? f[key] : '' });
    i.addEventListener('input', () => { f[key] = i.value; onChange(); });
    return i;
  };
  const check = (label, key) => {
    const c = el('input', { type: 'checkbox' }); c.checked = !!f[key];
    c.addEventListener('change', () => { f[key] = c.checked; onChange(); });
    return el('label', {}, [c, label]);
  };

  if (state.tab === 'units') {
    const roles = distinct(items.map((i) => i.role));
    const names = new Set(items.map((i) => i.name));
    const kws = distinct(items.flatMap((i) => i.keywords || [])
      .filter((k) => k && !k.startsWith('Faction:') && !names.has(k)));
    host.appendChild(selectRow('Rôle', 'role', [{ v: '*', t: 'Tous' }, ...roles.map((r) => ({ v: r, t: r }))]));
    host.appendChild(selectRow('Mot-clé', 'kw', [{ v: '*', t: 'Tous' }, ...kws.map((k) => ({ v: k, t: k }))]));
    host.appendChild(numRow('Points', numInput('ptsMin', 'min'), numInput('ptsMax', 'max')));
    host.appendChild(numRow('Endur. ≥', numInput('tMin', 'T')));
    host.appendChild(el('div', { class: 'fchecks' }, [check('Masquer Legends', 'hideLegend'), check('Epic Hero', 'epic')]));
  } else if (state.tab === 'weapons') {
    const kws = distinct(items.flatMap((i) => (i.keywords || []).map(WEAPON_KW_BASE)).filter(Boolean));
    host.appendChild(selectRow('Type', 'kind', [{ v: '*', t: 'Tous' }, { v: 'ranged', t: 'À distance' }, { v: 'melee', t: 'Mêlée' }]));
    host.appendChild(selectRow('Mot-clé', 'kw', [{ v: '*', t: 'Tous' }, ...kws.map((k) => ({ v: k, t: k }))]));
    host.appendChild(numRow('Force ≥', numInput('sMin', 'S')));
    host.appendChild(el('div', { class: 'fchecks' }, [check('Partagée uniquement', 'shared')]));
  } else if (state.tab === 'detachments') {
    host.appendChild(el('div', { class: 'fchecks' }, [check('Avec enhancements', 'hasEnh')]));
  }

  const reset = el('button', { class: 'btn btn-small freset' }, 'Réinitialiser les filtres');
  reset.addEventListener('click', () => { state.filters[state.tab] = {}; $('#filter').value = ''; renderFacets(); renderList(); });
  host.appendChild(reset);
}

// ---- open entity -----------------------------------------------------------
async function openEntity(tab, id) {
  state.selected = { kind: tab, id };
  renderList();
  try {
    if (tab === 'units') renderUnit(await apiGet(`/unit?file=${enc(state.file)}&id=${enc(id)}`));
    else if (tab === 'weapons') renderWeapon(await apiGet(`/weapon?file=${enc(state.file)}&id=${enc(id)}`));
    else renderDetachment(await apiGet(`/detachment?file=${enc(state.file)}&id=${enc(id)}`));
  } catch (e) { toast(e.message, 'err'); }
}
const enc = encodeURIComponent;

// ---- render: UNIT ----------------------------------------------------------
function renderUnit(u) {
  const pts = u.costs.find((c) => c.name === 'pts');
  const nameInput = el('input', { value: u.name, class: 'grow' });

  // stat profiles
  const statSection = el('div', { class: 'section' }, [
    el('h3', {}, 'Caractéristiques'),
    el('div', { class: 'section-body' },
      u.statProfiles.length
        ? u.statProfiles.map((p) => statProfileBlock(p))
        : [el('p', { class: 'muted' }, 'Aucun profil de caractéristiques.')]
    ),
  ]);

  // weapons — editable inline; each weapon saves through the shared-impact flow.
  // Split into always-equipped (default) and option/choice weapons.
  const weaponEditors = [];
  const mkWeapon = (w) => { const ed = unitWeaponEditor(w); weaponEditors.push(ed); return ed.node; };
  const defWeapons = u.weapons.filter((w) => !w.optional);
  const optWeapons = u.weapons.filter((w) => w.optional);
  const wbody = [];
  if (defWeapons.length) { wbody.push(el('div', { class: 'wsub' }, 'Armes par défaut (toujours équipées)')); defWeapons.forEach((w) => wbody.push(mkWeapon(w))); }
  if (optWeapons.length) { wbody.push(el('div', { class: 'wsub' }, 'Options / choix d\'armes')); optWeapons.forEach((w) => wbody.push(mkWeapon(w))); }
  if (!wbody.length) wbody.push(el('p', { class: 'muted' }, 'Aucune arme.'));
  const weaponsSection = el('div', { class: 'section' }, [el('h3', {}, 'Armes'), el('div', { class: 'section-body' }, wbody)]);

  // abilities
  const abilityBlocks = u.abilities.map((a) => abilityBlock(a));
  const abilitiesSection = el('div', { class: 'section' }, [
    el('h3', {}, 'Capacités'),
    el('div', { class: 'section-body' },
      abilityBlocks.length ? abilityBlocks : [el('p', { class: 'muted' }, 'Aucune capacité (profil).')]
    ),
  ]);
  if (u.ruleLinks && u.ruleLinks.length) {
    abilitiesSection.querySelector('.section-body').appendChild(
      el('p', { class: 'muted' }, 'Règles liées : ' + u.ruleLinks.map((r) => r.name).join(', '))
    );
  }

  // composition (model min/max + cost tiers) and wargear options
  const comp = compositionSection(u);
  const optionsBlock = optionsSection(u);

  // keywords
  const kwSection = keywordSection(u.keywords);

  // points
  const ptsInput = el('input', { type: 'text', value: pts ? pts.value : '0', style: 'width:80px' });
  const ptsBlock = el('div', { class: 'section' }, [
    el('h3', {}, 'Points'),
    el('div', { class: 'section-body' }, [
      el('div', { class: 'row' }, [el('label', {}, 'Coût (pts)'), ptsInput]),
      u.pointsModifiers ? el('p', { class: 'warn-note' }, '⚠ Cette unité a des modificateurs de points (selon la taille). Le champ ci-dessus édite le coût de base ; les paliers se modifient dans le fichier.') : null,
    ]),
  ]);

  const saveBtn = el('button', { class: 'btn btn-primary' }, 'Enregistrer l\'unité');
  saveBtn.addEventListener('click', async () => {
    const patch = {
      name: nameInput.value,
      costs: pts ? [{ typeId: pts.typeId, value: ptsInput.value }] : [],
      statProfiles: u.statProfiles.map((p) => ({ id: p.id, chars: collectStatChars(p) })),
      abilities: u.abilities.map((a) => ({ id: a.id, name: abEditName(a.id), description: abEditDesc(a.id) })),
      removeKeywords: kwState.removed,
      addKeywords: kwState.added,
      composition: comp.collect(),
      tiers: comp.collectTiers(),
      options: optionsBlock.collect(),
    };
    try {
      await apiPost('/unit/edit', { file: state.file, id: u.id, patch });
      toast('Unité enregistrée (en mémoire). Pense à « Enregistrer fichiers ».', 'ok');
      await refreshStatus();
      openEntity('units', u.id);
    } catch (e) { toast(e.message, 'err'); }
  });

  const buildPreview = () => unitToShape({
    name: nameInput.value,
    costs: pts ? [{ name: 'pts', typeId: pts.typeId, value: ptsInput.value }] : [],
    keywords: currentKeywords(),
    statProfiles: u.statProfiles.map((p) => ({ id: p.id, name: p.name, chars: collectStatChars(p) })),
    abilities: u.abilities.map((a) => ({ name: abEditName(a.id), chars: { Description: abEditDesc(a.id) } })),
    weapons: weaponEditors.length ? weaponEditors.map((e) => e.get()) : u.weapons,
    composition: comp.live(),
    options: optionsBlock.live(),
  });

  mountSheet(u.name, `unité · ${u.file}`, nameInput, [
    ptsBlock, statSection, weaponsSection, comp.node, optionsBlock.node, abilitiesSection, kwSection,
  ], [saveBtn], buildPreview, 'unit');
}

// current keyword objects from the live editing state ({name,...})
function currentKeywords() {
  const live = (kwState.current || []).filter((k) => !kwState.removed.includes(k.id));
  return live.concat(kwState.added || []);
}

// ---- inline weapon editor (inside a unit) ----------------------------------
function unitWeaponEditor(w) {
  const profEditors = (w.profiles || []).map((p) => weaponProfileEditor(p, w.kind));
  const badge = el('span', { class: 'wbadge ' + (w.optional ? 'w-option' : 'w-default') }, w.optional ? 'OPTION' : 'DÉFAUT');
  const meta = [badge];
  if (w.optional && w.group) meta.push(el('span', { class: 'wmeta' }, w.group));
  if (w.model) meta.push(el('span', { class: 'wmeta' }, '· ' + w.model));
  meta.push(el('span', { class: 'wt-kind' }, (w.kind || '') + (w.embedded ? ' · intégrée' : ' · partagée')));
  const saveB = el('button', { class: 'btn btn-small' }, 'Enregistrer cette arme');
  saveB.addEventListener('click', () => saveUnitWeapon(w, profEditors));
  const node = el('div', { class: 'section', style: 'border:none; padding:0; margin-bottom:10px' }, [
    el('div', { class: 'row', style: 'justify-content:space-between' }, [
      el('div', {}, [el('strong', {}, w.name || '(arme)'), ' ', ...meta]),
      saveB,
    ]),
    ...(profEditors.length ? profEditors.map((b) => b.node) : [el('p', { class: 'muted' }, 'Aucun profil.')]),
  ]);
  return {
    node,
    get: () => ({
      name: w.name, kind: w.kind,
      profiles: profEditors.map((pe, i) => { const g = pe.get(); return { name: g.name, typeId: (w.profiles[i] || {}).typeId, chars: g.chars }; }),
    }),
  };
}

async function saveUnitWeapon(w, profEditors) {
  const patch = { profiles: profEditors.map((pe) => pe.get()) };
  try {
    const wd = await apiGet(`/weapon?file=${enc(w.weaponFile)}&id=${enc(w.targetId)}`);
    commitWeapon({
      file: w.weaponFile, id: w.targetId, name: w.name, patch,
      usage: wd.usedBy, reopen: () => openEntity('units', state.selected.id),
    });
  } catch (e) { toast(e.message, 'err'); }
}

// ---- composition section (model min/max + cost tiers) ----------------------
function compositionSection(u) {
  const comp = u.composition || { groups: [], tiers: [] };
  const rows = [];
  const groupNodes = [];
  for (const g of comp.groups) {
    const modelRows = g.models.map((m) => {
      if (!m.editable) return el('div', { class: 'row' }, [el('span', { class: 'muted' }, '■ ' + m.name + ' (figurine unique)')]);
      const minI = el('input', { value: m.min != null ? m.min : '', style: 'width:56px', 'data-comp': m.entryId, 'data-cf': 'min' });
      const maxI = el('input', { value: m.max != null ? m.max : '', style: 'width:56px', 'data-comp': m.entryId, 'data-cf': 'max' });
      rows.push({ entryId: m.entryId, minI, maxI });
      return el('div', { class: 'row' }, [el('span', { style: 'min-width:160px' }, m.name), el('label', {}, 'min'), minI, el('label', {}, 'max'), maxI]);
    });
    groupNodes.push(el('div', {}, [g.name !== '_fixed' ? el('div', { class: 'muted', style: 'margin-top:4px' }, g.name) : null, ...modelRows]));
  }
  // tiers
  const tierRows = [];
  const tierNodes = (comp.tiers || []).map((t) => {
    const atI = el('input', { value: t.atModels != null ? t.atModels : '', style: 'width:56px' });
    const ptI = el('input', { value: t.pts != null ? t.pts : '', style: 'width:70px' });
    tierRows.push({ idx: t.idx, atI, ptI });
    return el('div', { class: 'row' }, [el('span', {}, 'À partir de'), atI, el('label', {}, 'figurines →'), ptI, el('label', {}, 'pts')]);
  });

  const body = [];
  if (groupNodes.length) body.push(...groupNodes);
  if (tierNodes.length) body.push(el('div', { class: 'muted', style: 'margin-top:6px' }, 'Paliers de coût :'), ...tierNodes);
  if (!body.length) body.push(el('p', { class: 'muted' }, 'Aucune composition éditable.'));

  const node = el('div', { class: 'section' }, [
    el('h3', {}, `Composition (${comp.minM ?? '?'}–${comp.maxM ?? '?'} figurines)`),
    el('div', { class: 'section-body' }, body),
  ]);

  return {
    node,
    collect: () => rows.map((r) => ({ entryId: r.entryId, min: r.minI.value, max: r.maxI.value })),
    collectTiers: () => tierRows.map((t) => ({ idx: t.idx, atModels: t.atI.value, pts: t.ptI.value })),
    // live composition object (api-unit shape) for the preview
    live: () => ({
      minM: comp.minM, maxM: comp.maxM,
      tiers: tierRows.map((t) => ({ idx: t.idx, atModels: t.atI.value, pts: t.ptI.value })),
      groups: comp.groups.map((g) => ({
        name: g.name,
        models: g.models.map((m) => {
          const r = rows.find((x) => x.entryId === m.entryId);
          return r ? { ...m, min: r.minI.value, max: r.maxI.value } : m;
        }),
      })),
    }),
  };
}

// ---- options section (wargear / weapon choices; edit pts, add/remove) -------
function optionsSection(u) {
  const options = u.options || [];
  const rows = [];
  const groupNodes = options.map((o) => {
    const choiceNodes = o.choices.map((ch) => {
      const ptI = el('input', { value: ch.pts != null ? ch.pts : '0', style: 'width:54px' });
      rows.push({ id: ch.id, ptI });
      const rm = el('span', { class: 'x', title: 'retirer ce choix', onclick: () => removeOption(u, ch.id) }, '×');
      return el('div', { class: 'row', style: 'gap:6px' }, [
        el('span', { style: 'min-width:180px' }, ch.name + (ch.kind === 'entry' ? ' ·inline' : '')),
        el('label', {}, 'pts'), ptI, rm,
      ]);
    });
    const addBtn = el('button', { class: 'btn btn-small' }, '+ Choix d\'arme');
    addBtn.addEventListener('click', () => addOption(u, o.groupId));
    return el('div', { style: 'margin-bottom:8px' }, [
      el('div', { class: 'muted', style: 'margin-top:4px' }, o.name + (o.ownerName ? ` · ${o.ownerName}` : '')),
      ...choiceNodes, el('div', { class: 'row' }, [addBtn]),
    ]);
  });
  const node = el('div', { class: 'section' }, [
    el('h3', {}, 'Options / équipement'),
    el('div', { class: 'section-body' }, groupNodes.length ? groupNodes : [el('p', { class: 'muted' }, 'Aucune option.')]),
  ]);
  return {
    node,
    collect: () => rows.map((r) => ({ id: r.id, pts: r.ptI.value })),
    live: () => options.map((o) => ({
      groupId: o.groupId, name: o.name,
      choices: o.choices.map((ch) => { const r = rows.find((x) => x.id === ch.id); return { ...ch, pts: r ? r.ptI.value : ch.pts }; }),
    })),
  };
}

async function addOption(u, groupId) {
  pickWeapon(async (w) => {
    try {
      await apiPost('/unit/option/add', { file: u.file, unitId: u.id, groupId, weaponId: w.id, weaponName: w.name });
      toast('Choix ajouté.', 'ok'); await refreshStatus(); openEntity('units', u.id);
    } catch (e) { toast(e.message, 'err'); }
  });
}

async function removeOption(u, choiceId) {
  try {
    await apiPost('/unit/option/remove', { file: u.file, unitId: u.id, choiceId });
    toast('Choix retiré.', 'ok'); await refreshStatus(); openEntity('units', u.id);
  } catch (e) { toast(e.message, 'err'); }
}

// weapon picker (from the current faction's weapons)
function pickWeapon(cb) {
  const weapons = (state.contents && state.contents.weapons) || [];
  const search = el('input', { type: 'search', placeholder: 'Chercher une arme…', class: 'grow' });
  const listEl = el('div', { class: 'usedby' });
  const render = () => {
    const q = search.value.trim().toLowerCase();
    listEl.innerHTML = '';
    weapons.filter((w) => !q || (w.name || '').toLowerCase().includes(q)).slice(0, 80)
      .forEach((w) => listEl.appendChild(el('label', { onclick: () => { closeModal(); cb(w); } }, [w.name + ' [' + w.kind + ']'])));
  };
  search.addEventListener('input', render); render();
  showModal('Ajouter un choix d\'arme', [search, listEl], [el('button', { class: 'btn', onclick: closeModal }, 'Annuler')]);
}

function statProfileBlock(p) {
  const order = ['M', 'T', 'SV', 'W', 'LD', 'OC'];
  const keys = order.filter((k) => k in p.chars).concat(Object.keys(p.chars).filter((k) => !order.includes(k)));
  const line = el('div', { class: 'statline' }, keys.map((k) =>
    el('div', { class: 'stat' }, [
      el('span', { class: 'k' }, k),
      el('span', { class: 'v' }, [el('input', { value: p.chars[k], 'data-pid': p.id, 'data-char': k })]),
    ])
  ));
  return el('div', {}, [el('div', { class: 'muted', style: 'margin-bottom:4px' }, p.name), line]);
}
function collectStatChars(p) {
  const chars = {};
  $$(`[data-pid="${cssEsc(p.id)}"]`).forEach((inp) => { chars[inp.dataset.char] = inp.value; });
  return chars;
}

function abilityBlock(a) {
  const name = el('input', { value: a.name || '', 'data-abname': a.id, class: 'grow' });
  const desc = el('textarea', { 'data-abdesc': a.id }, a.chars && a.chars.Description ? a.chars.Description : (a.description || ''));
  return el('div', { class: 'section', style: 'border:none' }, [
    el('div', { class: 'row' }, [el('label', {}, 'Nom'), name]),
    desc,
  ]);
}
const abEditName = (id) => { const n = $(`[data-abname="${cssEsc(id)}"]`); return n ? n.value : undefined; };
const abEditDesc = (id) => { const n = $(`[data-abdesc="${cssEsc(id)}"]`); return n ? n.value : undefined; };

// ---- keyword section + state ----------------------------------------------
let kwState = { removed: [], added: [], current: [] };
function resetKwState() { /* kwState set in keywordSection */ }
function keywordSection(keywords) {
  kwState = { removed: [], added: [], current: keywords.slice() };
  const chips = el('div', { class: 'chips' });
  const render = () => {
    chips.innerHTML = '';
    kwState.current.forEach((k) => {
      if (kwState.removed.includes(k.id)) return;
      chips.appendChild(el('span', { class: 'chip' + (k.primary === 'true' ? ' primary' : '') }, [
        k.name,
        el('span', { class: 'x', title: 'retirer', onclick: () => { if (k.id) { kwState.removed.push(k.id); render(); } } }, '×'),
      ]));
    });
    kwState.added.forEach((k, i) => {
      chips.appendChild(el('span', { class: 'chip primary' }, [
        '＋ ' + k.name,
        el('span', { class: 'x', onclick: () => { kwState.added.splice(i, 1); render(); } }, '×'),
      ]));
    });
  };
  render();
  const addBtn = el('button', { class: 'btn btn-small' }, '+ Mot-clé');
  addBtn.addEventListener('click', () => pickCategory((cat) => { kwState.added.push(cat); render(); }));
  return el('div', { class: 'section' }, [
    el('h3', {}, 'Mots-clés'),
    el('div', { class: 'section-body' }, [chips, el('div', { class: 'row' }, [addBtn])]),
  ]);
}

async function pickCategory(cb) {
  if (!state.categories) state.categories = await apiGet('/categories');
  const search = el('input', { type: 'search', placeholder: 'Chercher un mot-clé…', class: 'grow' });
  const listEl = el('div', { class: 'usedby' });
  const renderOpts = () => {
    const q = search.value.trim().toLowerCase();
    listEl.innerHTML = '';
    state.categories.filter((c) => !q || (c.name || '').toLowerCase().includes(q)).slice(0, 80)
      .forEach((c) => listEl.appendChild(el('label', { onclick: () => { closeModal(); cb({ targetId: c.targetId, name: c.name }); } }, [c.name])));
  };
  search.addEventListener('input', renderOpts);
  renderOpts();
  showModal('Ajouter un mot-clé', [search, listEl], [el('button', { class: 'btn', onclick: closeModal }, 'Annuler')]);
}

// ---- render: WEAPON --------------------------------------------------------
function renderWeapon(w) {
  const nameInput = el('input', { value: w.name, class: 'grow' });
  const profBlocks = w.profiles.map((p) => weaponProfileEditor(p, w.kind));
  const usage = w.usedBy.filter((u) => u.isDatasheet);

  const usageSection = el('div', { class: 'section' }, [
    el('h3', {}, `Utilisée par (${usage.length} datasheet${usage.length > 1 ? 's' : ''})`),
    el('div', { class: 'section-body' }, [
      usage.length
        ? el('div', { class: 'muted' }, usage.slice(0, 30).map((u) => u.ownerName).join(' · ') + (usage.length > 30 ? ' …' : ''))
        : el('p', { class: 'muted' }, 'Aucune unité ne référence cette arme.'),
    ]),
  ]);

  const saveBtn = el('button', { class: 'btn btn-primary' }, 'Enregistrer l\'arme');
  saveBtn.addEventListener('click', () => saveWeapon(w, nameInput, profBlocks, usage));

  const buildPreview = () => ({
    weapons: profBlocks.map((b) => {
      const g = b.get();
      const c = g.chars || {};
      return {
        n: g.name || nameInput.value, t: w.kind === 'melee' ? 'M' : 'R',
        rng: c.Range, a: c.A, sk: c.BS != null ? c.BS : c.WS, s: c.S, ap: c.AP, d: c.D, kw: c.Keywords, count: 1,
      };
    }),
  });

  mountSheet(w.name, `arme · ${w.kind} · ${w.file}`, nameInput,
    [el('div', { class: 'section' }, [el('h3', {}, 'Profil(s) d\'arme'), el('div', { class: 'section-body' }, profBlocks.length ? profBlocks.map((b) => b.node) : [el('p', { class: 'muted' }, 'Aucun profil.')])]),
     keywordSection(w.keywords),
     usageSection],
    [saveBtn], buildPreview, 'weapon');
}

function weaponProfileEditor(p, kind) {
  const order = kind === 'melee' ? ['Range', 'A', 'WS', 'S', 'AP', 'D', 'Keywords'] : ['Range', 'A', 'BS', 'S', 'AP', 'D', 'Keywords'];
  const keys = order.filter((k) => k in p.chars).concat(Object.keys(p.chars).filter((k) => !order.includes(k)));
  const inputs = {};
  const head = el('tr', {}, [el('th', {}, 'Nom'), ...keys.map((k) => el('th', {}, k))]);
  const nameI = el('input', { class: 'name', value: p.name || '' });
  const row = el('tr', {}, [
    el('td', { class: 'name' }, [nameI]),
    ...keys.map((k) => { const i = el('input', { value: p.chars[k] }); inputs[k] = i; return el('td', {}, [i]); }),
  ]);
  const node = el('table', { class: 'wt' }, [el('tbody', {}, [head, row])]);
  return { node, profileId: p.id, get: () => ({ id: p.id, name: nameI.value, chars: Object.fromEntries(keys.map((k) => [k, inputs[k].value])) }) };
}

function saveWeapon(w, nameInput, profBlocks, usage) {
  const patch = {
    name: nameInput.value,
    profiles: profBlocks.map((b) => b.get()),
    removeKeywords: kwState.removed,
    addKeywords: kwState.added,
  };
  commitWeapon({
    file: state.file, id: w.id, name: nameInput.value, patch, usage,
    reopen: (r) => openEntity('weapons', (r && r.newWeaponId) || w.id),
  });
}

// Apply a weapon edit, routing through the shared-impact dialog when the weapon
// is used by more than one datasheet. `reopen(result)` refreshes the view.
function commitWeapon({ file, id, name, patch, usage, reopen }) {
  const datasheetUsers = (usage || []).filter((u) => u.isDatasheet);
  if (datasheetUsers.length > 1) {
    chooseImpact({ file, id, name, patch, usage: datasheetUsers, reopen });
    return;
  }
  apiPost('/weapon/edit', { file, id, patch, scope: 'all' })
    .then(async (r) => { toast('Arme enregistrée (en mémoire).', 'ok'); await refreshStatus(); if (reopen) reopen(r); })
    .catch((e) => toast(e.message, 'err'));
}

// ---- shared weapon impact dialog ------------------------------------------
function chooseImpact({ file, id, name, patch, usage, reopen }) {
  const intro = el('p', {}, [
    `L'arme `, el('strong', {}, name), ` est partagée par `, el('strong', {}, String(usage.length)),
    ` unités. Que veux-tu faire ?`,
  ]);

  const checks = el('div', { class: 'usedby' }, usage.map((u) =>
    el('label', {}, [
      el('input', { type: 'checkbox', value: u.ownerId, 'data-file': u.file }),
      el('span', {}, u.ownerName),
      el('span', { class: 'file' }, u.file === file ? '' : ('· ' + u.file)),
    ])
  ));
  checks.hidden = true;

  const btnAll = el('button', { class: 'btn btn-primary' }, 'Changer pour TOUTES');
  const btnSome = el('button', { class: 'btn' }, 'Changer pour certaines…');
  const btnApplySome = el('button', { class: 'btn btn-primary' }, 'Créer la variante & relier');
  btnApplySome.hidden = true;

  btnAll.addEventListener('click', async () => {
    try {
      const r = await apiPost('/weapon/edit', { file, id, patch, scope: 'all' });
      closeModal(); toast('Modifié pour toutes les unités.', 'ok');
      await refreshStatus(); if (reopen) reopen(r);
    } catch (e) { toast(e.message, 'err'); }
  });
  btnSome.addEventListener('click', () => {
    checks.hidden = false; btnApplySome.hidden = false; btnSome.hidden = true;
  });
  btnApplySome.addEventListener('click', async () => {
    const ids = $$('input[type=checkbox]:checked', checks).map((c) => c.value);
    if (!ids.length) { toast('Sélectionne au moins une unité.', 'err'); return; }
    try {
      const r = await apiPost('/weapon/edit', { file, id, patch, scope: 'some', selectedOwnerIds: ids });
      closeModal();
      toast(`Variante créée et reliée à ${r.repointed.length} unité(s).`, 'ok');
      await refreshStatus();
      await selectFaction(state.file); // refresh lists so the variant appears
      if (reopen) reopen(r);
    } catch (e) { toast(e.message, 'err'); }
  });

  showModal('Arme partagée — impact', [
    intro,
    el('p', { class: 'muted' }, '« Changer pour certaines » crée une NOUVELLE arme (variante) et remplace le lien des unités sélectionnées vers cette variante. Les autres gardent l\'arme d\'origine inchangée.'),
    checks,
  ], [btnAll, btnSome, btnApplySome, el('button', { class: 'btn btn-ghost', onclick: closeModal }, 'Annuler')]);
}

// ---- render: DETACHMENT ----------------------------------------------------
function renderDetachment(d) {
  const nameInput = el('input', { value: d.name, class: 'grow' });

  // --- rules (editable + add/remove) ---
  const ruleRows = [];
  const rulesBody = el('div', { class: 'section-body' });
  const renderRules = () => {
    rulesBody.innerHTML = ''; ruleRows.length = 0;
    (d.rules || []).forEach((r) => {
      const nm = el('input', { value: r.name || '', class: 'grow' });
      const desc = el('textarea', {}, r.description || '');
      ruleRows.push({ id: r.id, nm, desc });
      rulesBody.appendChild(el('div', { class: 'section', style: 'border:none' }, [
        el('div', { class: 'row', style: 'justify-content:space-between' }, [
          el('div', { class: 'row' }, [el('label', {}, 'Règle'), nm]),
          el('button', { class: 'btn btn-small btn-danger', onclick: () => removeDetRule(d, r.id) }, 'Supprimer'),
        ]), desc,
      ]));
    });
    if (!d.rules || !d.rules.length) rulesBody.appendChild(el('p', { class: 'muted' }, 'Aucune règle.'));
    const add = el('button', { class: 'btn btn-small' }, '+ Règle');
    add.addEventListener('click', () => addDetRule(d));
    rulesBody.appendChild(el('div', { class: 'row' }, [add]));
  };
  renderRules();
  const rulesSection = el('div', { class: 'section' }, [el('h3', {}, 'Règles de détachement'), rulesBody]);

  // --- enhancements (editable + add/remove) ---
  const enhRows = [];
  const enhBody = el('div', { class: 'section-body' });
  const renderEnh = () => {
    enhBody.innerHTML = ''; enhRows.length = 0;
    (d.enhancements || []).forEach((e) => {
      const nm = el('input', { value: e.name || '', class: 'grow' });
      const pt = el('input', { value: e.pts != null ? e.pts : '0', style: 'width:64px' });
      const desc = el('textarea', {}, e.description || '');
      enhRows.push({ id: e.id, nm, pt, desc });
      enhBody.appendChild(el('div', { class: 'section', style: 'border:none' }, [
        el('div', { class: 'row', style: 'justify-content:space-between' }, [
          el('div', { class: 'row' }, [el('label', {}, 'Nom'), nm, el('label', {}, 'pts'), pt]),
          el('button', { class: 'btn btn-small btn-danger', onclick: () => removeDetEnh(d, e.id) }, 'Supprimer'),
        ]), desc,
      ]));
    });
    if (!d.enhancements || !d.enhancements.length) enhBody.appendChild(el('p', { class: 'muted' }, 'Aucun enhancement.'));
    const add = el('button', { class: 'btn btn-small' }, '+ Enhancement');
    add.addEventListener('click', () => addDetEnh(d));
    enhBody.appendChild(el('div', { class: 'row' }, [add]));
  };
  renderEnh();
  const enhSection = el('div', { class: 'section' }, [el('h3', {}, 'Enhancements'), enhBody]);

  const saveBtn = el('button', { class: 'btn btn-primary' }, 'Enregistrer le détachement');
  saveBtn.addEventListener('click', async () => {
    const patch = {
      name: nameInput.value,
      rules: ruleRows.map((r) => ({ id: r.id, name: r.nm.value, description: r.desc.value })),
      enhancements: enhRows.map((e) => ({ id: e.id, name: e.nm.value, pts: e.pt.value, description: e.desc.value })),
    };
    try {
      await apiPost('/detachment/edit', { file: d.file, id: d.id, patch });
      toast('Détachement enregistré (en mémoire).', 'ok'); await refreshStatus(); openEntity('detachments', d.id);
    } catch (e) { toast(e.message, 'err'); }
  });

  mountSheet(d.name, `détachement · ${d.file}`, nameInput, [rulesSection, enhSection, keywordSection(d.keywords)], [saveBtn]);
  resetKwState();
}

async function addDetRule(d) {
  try { await apiPost('/detachment/rule/add', { file: d.file, id: d.id, data: { name: 'Nouvelle règle', text: '' } }); toast('Règle ajoutée.', 'ok'); await refreshStatus(); openEntity('detachments', d.id); }
  catch (e) { toast(e.message, 'err'); }
}
async function removeDetRule(d, ruleId) {
  try { await apiPost('/detachment/rule/remove', { file: d.file, id: d.id, ruleId }); toast('Règle retirée.', 'ok'); await refreshStatus(); openEntity('detachments', d.id); }
  catch (e) { toast(e.message, 'err'); }
}
async function addDetEnh(d) {
  try { await apiPost('/detachment/enhancement/add', { file: d.file, id: d.id, data: { name: 'Nouvel enhancement', pts: '0', text: '' } }); toast('Enhancement ajouté.', 'ok'); await refreshStatus(); openEntity('detachments', d.id); }
  catch (e) { toast(e.message, 'err'); }
}
async function removeDetEnh(d, enhId) {
  try { await apiPost('/detachment/enhancement/remove', { file: d.file, id: d.id, enhId }); toast('Enhancement retiré.', 'ok'); await refreshStatus(); openEntity('detachments', d.id); }
  catch (e) { toast(e.message, 'err'); }
}

// ---- sheet mounting --------------------------------------------------------
// `buildPreview` (optional) returns the unit/weapon shape to feed the
// presentation renderer; the preview re-renders live on every form input.
function mountSheet(title, meta, nameInput, sections, actions, buildPreview, previewKind) {
  const head = el('div', { class: 'sheet-head' }, [
    el('div', {}, [el('h2', {}, title), el('div', { class: 'meta' }, meta)]),
  ]);
  const body = el('div', { class: 'sheet-body' }, [
    el('div', { class: 'section' }, [el('h3', {}, 'Nom'), el('div', { class: 'section-body' }, [nameInput])]),
    ...sections,
    el('div', { class: 'sheet-actions' }, actions),
  ]);
  const form = el('div', { class: 'ed-form' }, [el('div', { class: 'sheet' }, [head, body])]);

  const d = $('#detail');
  d.innerHTML = '';
  state.livePreview = null;

  if (buildPreview) {
    const previewHost = el('div', { id: 'live-preview' });
    const preview = el('div', { class: 'ed-preview' }, [
      el('div', { class: 'preview-cap' }, 'Aperçu datasheet'),
      previewHost,
    ]);
    const render = () => {
      try {
        const shape = buildPreview();
        previewHost.innerHTML = previewKind === 'weapon'
          ? `<div class="ds-sheet">${renderWeaponTable(shape.weapons, { lang: state.lang })}</div>`
          : renderDatasheet(shape, { lang: state.lang });
      } catch (e) { previewHost.innerHTML = '<p class="muted">Aperçu indisponible.</p>'; }
    };
    state.livePreview = render;
    form.addEventListener('input', render);
    d.appendChild(el('div', { class: 'ed-split' }, [form, preview]));
    render(); // after the form is in the document so DOM reads succeed
  } else {
    d.appendChild(form);
  }
}

function weaponTable(weapons) {
  const wrap = el('div', {});
  for (const w of weapons) {
    for (const p of w.profiles) {
      const kind = w.kind === 'melee' ? 'melee' : 'ranged';
      const order = kind === 'melee' ? ['Range', 'A', 'WS', 'S', 'AP', 'D', 'Keywords'] : ['Range', 'A', 'BS', 'S', 'AP', 'D', 'Keywords'];
      const keys = order.filter((k) => k in p.chars);
      const head = el('tr', {}, [el('th', {}, 'Arme'), ...keys.map((k) => el('th', {}, k))]);
      const row = el('tr', {}, [el('td', { class: 'name' }, p.name), ...keys.map((k) => el('td', {}, p.chars[k]))]);
      wrap.appendChild(el('table', { class: 'wt', style: 'margin-bottom:8px' }, [el('tbody', {}, [head, row])]));
    }
  }
  return wrap;
}

// ---- create flows ----------------------------------------------------------
function onNew() {
  if (!state.file) { toast('Choisis d\'abord une faction.', 'err'); return; }
  if (state.tab === 'weapons') newWeapon();
  else if (state.tab === 'units') newUnit();
  else newDetachment();
}

function newWeapon() {
  const name = el('input', { class: 'grow', placeholder: 'Nom de l\'arme' });
  const kind = el('select', {}, [el('option', { value: 'ranged' }, 'À distance'), el('option', { value: 'melee' }, 'Mêlée')]);
  const charsWrap = el('div', {});
  const inputs = {};
  const buildChars = () => {
    const k = kind.value;
    const names = k === 'melee' ? ['Range', 'A', 'WS', 'S', 'AP', 'D', 'Keywords'] : ['Range', 'A', 'BS', 'S', 'AP', 'D', 'Keywords'];
    charsWrap.innerHTML = '';
    Object.keys(inputs).forEach((kk) => delete inputs[kk]);
    const head = el('tr', {}, names.map((n) => el('th', {}, n)));
    const row = el('tr', {}, names.map((n) => {
      const i = el('input', { value: n === 'Range' && k === 'melee' ? 'Melee' : '' });
      inputs[n] = i;
      return el('td', {}, [i]);
    }));
    charsWrap.appendChild(el('table', { class: 'wt' }, [el('tbody', {}, [head, row])]));
  };
  kind.addEventListener('change', buildChars);
  buildChars();

  const create = el('button', { class: 'btn btn-primary' }, 'Créer l\'arme');
  create.addEventListener('click', async () => {
    if (!name.value.trim()) { toast('Nom requis.', 'err'); return; }
    const chars = Object.fromEntries(Object.entries(inputs).map(([k, i]) => [k, i.value]));
    try {
      const w = await apiPost('/weapon/create', { file: state.file, data: { name: name.value.trim(), kind: kind.value, chars } });
      closeModal(); toast('Arme créée.', 'ok');
      await selectFaction(state.file); $('#tabs .tab[data-tab=weapons]').click(); openEntity('weapons', w.id);
    } catch (e) { toast(e.message, 'err'); }
  });

  showModal('Nouvelle arme', [
    row2('Nom', name), row2('Type', kind), el('div', { class: 'muted' }, 'Caractéristiques :'), charsWrap,
  ], [create, cancelBtn()]);
}

function newUnit() {
  const STAT = ['M', 'T', 'SV', 'W', 'LD', 'OC'];
  const name = el('input', { class: 'grow', placeholder: 'Nom de l\'unité' });
  const pts = el('input', { value: '0', style: 'width:80px' });
  const attach = el('input', { type: 'checkbox' }); attach.checked = true;
  const kind = el('select', {}, [
    el('option', { value: 'single' }, 'Figurine unique (personnage)'),
    el('option', { value: 'squad' }, 'Escouade (plusieurs figurines)'),
  ]);

  // single-profile stats row
  const singleInputs = {};
  const singleTable = el('table', { class: 'wt' }, [el('tbody', {}, [
    el('tr', {}, STAT.map((n) => el('th', {}, n))),
    el('tr', {}, STAT.map((n) => { const i = el('input', {}); singleInputs[n] = i; return el('td', {}, [i]); })),
  ])]);

  // squad model rows
  const modelRows = [];
  const modelsBody = el('div', {});
  const addModelRow = (def = {}) => {
    const mi = { name: el('input', { value: def.name || '', placeholder: 'Type de figurine', style: 'min-width:140px' }),
      min: el('input', { value: def.min || '1', style: 'width:48px' }), max: el('input', { value: def.max || '1', style: 'width:48px' }), stats: {} };
    const statCells = STAT.map((n) => { const i = el('input', { value: '', style: 'width:46px' }); mi.stats[n] = i; return el('td', {}, [i]); });
    const rm = el('span', { class: 'x', onclick: () => { const idx = modelRows.indexOf(mi); if (idx >= 0) { modelRows.splice(idx, 1); row.remove(); } } }, '×');
    const row = el('div', { class: 'row', style: 'gap:4px; margin-bottom:4px; flex-wrap:nowrap; overflow-x:auto' }, [
      mi.name, el('label', {}, 'min'), mi.min, el('label', {}, 'max'), mi.max,
      el('table', { class: 'wt', style: 'width:auto' }, [el('tbody', {}, [el('tr', {}, STAT.map((n) => el('th', {}, n))), el('tr', {}, statCells)])]), rm,
    ]);
    modelRows.push(mi); modelsBody.appendChild(row);
  };
  const addModelBtn = el('button', { class: 'btn btn-small' }, '+ Type de figurine');
  addModelBtn.addEventListener('click', () => addModelRow());
  addModelRow({ name: 'Sergeant', min: '1', max: '1' });
  addModelRow({ name: 'Trooper', min: '4', max: '9' });
  const squadBlock = el('div', {}, [el('div', { class: 'muted' }, 'Figurines :'), modelsBody, el('div', { class: 'row' }, [addModelBtn])]);

  const swap = () => { const sq = kind.value === 'squad'; squadBlock.style.display = sq ? '' : 'none'; singleTable.style.display = sq ? 'none' : ''; };
  kind.addEventListener('change', swap); swap();

  const create = el('button', { class: 'btn btn-primary' }, 'Créer l\'unité');
  create.addEventListener('click', async () => {
    if (!name.value.trim()) { toast('Nom requis.', 'err'); return; }
    const data = { name: name.value.trim(), points: pts.value, attach: attach.checked };
    if (kind.value === 'squad') {
      data.models = modelRows.map((m) => ({ name: m.name.value.trim() || 'Model', min: m.min.value, max: m.max.value, stats: Object.fromEntries(STAT.map((n) => [n, m.stats[n].value])) }));
    } else {
      data.stats = Object.fromEntries(STAT.map((n) => [n, singleInputs[n].value]));
    }
    try {
      const u = await apiPost('/unit/create', { file: state.file, data });
      closeModal(); toast('Unité créée.', 'ok');
      await selectFaction(state.file); $('#tabs .tab[data-tab=units]').click(); openEntity('units', u.id);
    } catch (e) { toast(e.message, 'err'); }
  });

  showModal('Nouvelle unité', [
    row2('Nom', name), row2('Points', pts), row2('Type', kind),
    singleTable, squadBlock,
    el('label', { class: 'row' }, [attach, el('span', {}, 'Rattacher à l\'organisation d\'armée (entryLink racine, rend l\'unité sélectionnable)')]),
  ], [create, cancelBtn()]);
}

function newDetachment() {
  const name = el('input', { class: 'grow', placeholder: 'Nom du détachement' });
  const ruleName = el('input', { class: 'grow', placeholder: 'Nom de la règle (optionnel)' });
  const ruleText = el('textarea', { placeholder: 'Texte de la règle de détachement (optionnel)' });
  const create = el('button', { class: 'btn btn-primary' }, 'Créer le détachement');
  create.addEventListener('click', async () => {
    if (!name.value.trim()) { toast('Nom requis.', 'err'); return; }
    try {
      const d = await apiPost('/detachment/create', { file: state.file, data: { name: name.value.trim(), ruleName: ruleName.value, ruleText: ruleText.value } });
      closeModal(); toast('Détachement créé.', 'ok');
      await selectFaction(state.file); $('#tabs .tab[data-tab=detachments]').click(); openEntity('detachments', d.id);
    } catch (e) { toast(e.message, 'err'); }
  });
  showModal('Nouveau détachement', [row2('Nom', name), row2('Règle', ruleName), ruleText], [create, cancelBtn()]);
}

function row2(label, input) { return el('div', { class: 'row' }, [el('label', { style: 'min-width:70px' }, label), input]); }
function cancelBtn() { return el('button', { class: 'btn btn-ghost', onclick: closeModal }, 'Annuler'); }

// ---- save / commit / status ------------------------------------------------
async function onSave() {
  try {
    const r = await apiPost('/save', {});
    toast(r.written.length ? `Enregistré : ${r.written.length} fichier(s).` : 'Rien à enregistrer.', 'ok');
    await refreshStatus();
  } catch (e) { toast(e.message, 'err'); }
}

// ---- validation ------------------------------------------------------------
function renderValidationBody(v) {
  const body = [];
  const dirty = v.results.filter((r) => r.dirty);
  const shown = dirty.length ? dirty : v.results;
  if (!shown.length) { body.push(el('p', { class: 'muted' }, 'Aucun fichier à vérifier.')); return body; }
  body.push(el('p', { class: v.ok ? 'ok-note' : 'warn-note' },
    v.ok ? `✓ ${shown.length} fichier(s) vérifié(s) — aucun problème introduit.`
         : `✗ Des problèmes ont été détectés dans les fichiers modifiés.`));
  for (const r of shown) {
    const status = r.errors.length ? '✗' : '✓';
    const rows = [el('div', { class: r.errors.length ? 'warn-note' : 'ok-note', style: 'font-weight:600' }, `${status} ${r.file}`)];
    r.errors.forEach((e) => rows.push(el('div', { class: 'muted', style: 'color:#e89090;margin-left:14px' }, '• ' + e)));
    r.warnings.forEach((w) => rows.push(el('div', { class: 'muted', style: 'margin-left:14px' }, '⚠ ' + w)));
    body.push(el('div', { style: 'margin-bottom:6px' }, rows));
  }
  return body;
}

async function onValidate(all) {
  try {
    toast('Validation en cours…');
    const v = await apiGet('/validate' + (all ? '?all=1' : ''));
    const toggle = el('button', { class: 'btn' }, all ? 'Vérifier seulement les modifiés' : 'Vérifier TOUS les fichiers');
    toggle.addEventListener('click', () => { closeModal(); onValidate(!all); });
    showModal('Test / Validation', renderValidationBody(v), [toggle, el('button', { class: 'btn btn-primary', onclick: closeModal }, 'OK')]);
    return v;
  } catch (e) { toast(e.message, 'err'); }
}

async function onCommit() {
  const msg = el('input', { class: 'grow', placeholder: 'Message de commit' });
  const push = el('input', { type: 'checkbox' });
  const doIt = el('button', { class: 'btn btn-primary' }, 'Valider & Commit');
  doIt.addEventListener('click', async () => {
    if (!msg.value.trim()) { toast('Message requis.', 'err'); return; }
    try {
      toast('Validation & commit en cours…');
      const r = await apiPost('/commit', { message: msg.value.trim(), push: push.checked });
      if (r.blocked) { closeModal(); showCommitBlocked(r.validation, msg.value.trim(), push.checked); return; }
      closeModal(); toast('Commit effectué.' + (r.pushed ? ' Poussé.' : ''), 'ok');
      await refreshStatus();
    } catch (e) { toast(e.message, 'err'); }
  });
  showModal('Commit git', [
    row2('Message', msg),
    el('label', { class: 'row' }, [push, el('span', {}, 'Pousser vers origin après le commit')]),
    el('p', { class: 'muted' }, 'Les fichiers modifiés sont validés automatiquement avant le commit.'),
  ], [doIt, cancelBtn()]);
}

// Commit was refused because validation found introduced problems.
function showCommitBlocked(v, message, push) {
  const force = el('button', { class: 'btn btn-danger' }, 'Forcer le commit malgré tout');
  force.addEventListener('click', async () => {
    try {
      const r = await apiPost('/commit', { message, push, force: true });
      closeModal(); toast('Commit forcé.' + (r.pushed ? ' Poussé.' : ''), 'ok'); await refreshStatus();
    } catch (e) { toast(e.message, 'err'); }
  });
  showModal('Commit bloqué — validation échouée', [
    el('p', { class: 'warn-note' }, 'Le commit a été bloqué : des problèmes ont été introduits. Corrige-les, ou force le commit.'),
    ...renderValidationBody(v),
  ], [force, el('button', { class: 'btn btn-primary', onclick: closeModal }, 'Annuler')]);
}

async function refreshStatus() {
  try {
    const s = await apiGet('/status');
    $('#branch').textContent = s.branch ? '⎇ ' + s.branch : '';
    const d = $('#dirty');
    if (s.dirtyInMemory.length) { d.hidden = false; d.textContent = `${s.dirtyInMemory.length} non enregistré(s)`; }
    else d.hidden = true;
  } catch { /* ignore */ }
}

// ---- modal / toast ---------------------------------------------------------
function showModal(title, bodyChildren, actions) {
  const m = $('#modal');
  m.innerHTML = '';
  m.appendChild(el('h3', {}, title));
  m.appendChild(el('div', { class: 'modal-body' }, [...bodyChildren, el('div', { class: 'modal-actions' }, actions)]));
  $('#modal-root').hidden = false;
}
function closeModal() { $('#modal-root').hidden = true; }
$('#modal-root') && $('.modal-backdrop', $('#modal-root'));
document.addEventListener('click', (e) => { if (e.target.classList && e.target.classList.contains('modal-backdrop')) closeModal(); });

let toastTimer;
function toast(msg, kind) {
  const t = $('#toast');
  t.textContent = msg;
  t.className = 'toast' + (kind ? ' ' + kind : '');
  t.hidden = false;
  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => { t.hidden = true; }, 4000);
}

function cssEsc(s) { return String(s).replace(/["\\]/g, '\\$&'); }
