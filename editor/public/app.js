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
  return shape;
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
      renderList();
    })
  );
  $('#filter').addEventListener('input', renderList);
  $('#btn-new').addEventListener('click', onNew);
  $('#btn-save').addEventListener('click', onSave);
  $('#btn-commit').addEventListener('click', onCommit);
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
  renderList();
  $('#detail').innerHTML = '<div class="empty-state"><p>Choisis une entrée à gauche.</p></div>';
}

// ---- sidebar list ----------------------------------------------------------
function currentItems() {
  if (!state.contents) return [];
  return state.contents[state.tab] || [];
}
function renderList() {
  const ul = $('#entity-list');
  ul.innerHTML = '';
  const q = $('#filter').value.trim().toLowerCase();
  const items = currentItems().filter((i) => !q || (i.name || '').toLowerCase().includes(q));
  for (const it of items) {
    const li = el('li', {
      onclick: () => openEntity(state.tab, it.id),
    }, [
      el('span', {}, it.name || '(sans nom)'),
      it.kind ? el('span', { class: 'tag' }, it.kind) : null,
    ]);
    if (state.selected && state.selected.id === it.id) li.classList.add('active');
    ul.appendChild(li);
  }
  if (!items.length) ul.appendChild(el('li', { class: 'muted' }, 'Aucune entrée.'));
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

  // weapons (links) — read-only stats here; edit via the Weapons tab
  const weaponsSection = el('div', { class: 'section' }, [
    el('h3', {}, 'Armes'),
    el('div', { class: 'section-body' }, [
      u.weapons.length ? weaponTable(u.weapons) : el('p', { class: 'muted' }, 'Aucune arme liée.'),
      el('p', { class: 'muted' }, 'Astuce : pour modifier les stats d\'une arme, ouvre-la dans l\'onglet « Armes » (impact partagé géré).'),
    ]),
  ]);

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
    weapons: u.weapons,
  });

  mountSheet(u.name, `unité · ${u.file}`, nameInput, [
    ptsBlock, statSection, weaponsSection, abilitiesSection, kwSection,
  ], [saveBtn], buildPreview, 'unit');
}

// current keyword objects from the live editing state ({name,...})
function currentKeywords() {
  const live = (kwState.current || []).filter((k) => !kwState.removed.includes(k.id));
  return live.concat(kwState.added || []);
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

async function saveWeapon(w, nameInput, profBlocks, usage) {
  const patch = {
    name: nameInput.value,
    profiles: profBlocks.map((b) => b.get()),
    removeKeywords: kwState.removed,
    addKeywords: kwState.added,
  };
  // shared? ask scope.
  if (usage.length > 1) {
    chooseImpact(w, usage, patch);
    return;
  }
  try {
    await apiPost('/weapon/edit', { file: state.file, id: w.id, patch, scope: 'all' });
    toast('Arme enregistrée (en mémoire).', 'ok');
    await refreshStatus();
    openEntity('weapons', w.id);
  } catch (e) { toast(e.message, 'err'); }
}

// ---- shared weapon impact dialog ------------------------------------------
function chooseImpact(w, usage, patch) {
  const intro = el('p', {}, [
    `L'arme `, el('strong', {}, w.name), ` est partagée par `, el('strong', {}, String(usage.length)),
    ` unités. Que veux-tu faire ?`,
  ]);

  const checks = el('div', { class: 'usedby' }, usage.map((u) =>
    el('label', {}, [
      el('input', { type: 'checkbox', value: u.ownerId, 'data-file': u.file }),
      el('span', {}, u.ownerName),
      el('span', { class: 'file' }, u.file === state.file ? '' : ('· ' + u.file)),
    ])
  ));
  checks.hidden = true;

  const btnAll = el('button', { class: 'btn btn-primary' }, 'Changer pour TOUTES');
  const btnSome = el('button', { class: 'btn' }, 'Changer pour certaines…');
  const btnApplySome = el('button', { class: 'btn btn-primary' }, 'Créer la variante & relier');
  btnApplySome.hidden = true;

  btnAll.addEventListener('click', async () => {
    try {
      await apiPost('/weapon/edit', { file: state.file, id: w.id, patch, scope: 'all' });
      closeModal(); toast('Modifié pour toutes les unités.', 'ok');
      await refreshStatus(); openEntity('weapons', w.id);
    } catch (e) { toast(e.message, 'err'); }
  });
  btnSome.addEventListener('click', () => {
    checks.hidden = false; btnApplySome.hidden = false; btnSome.hidden = true;
  });
  btnApplySome.addEventListener('click', async () => {
    const ids = $$('input[type=checkbox]:checked', checks).map((c) => c.value);
    if (!ids.length) { toast('Sélectionne au moins une unité.', 'err'); return; }
    try {
      const r = await apiPost('/weapon/edit', { file: state.file, id: w.id, patch, scope: 'some', selectedOwnerIds: ids });
      closeModal();
      toast(`Variante créée et reliée à ${r.repointed.length} unité(s).`, 'ok');
      await refreshStatus();
      // refresh contents so the new weapon appears
      await selectFaction(state.file);
      openEntity('weapons', r.newWeaponId);
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
  const rules = el('div', { class: 'section' }, [
    el('h3', {}, 'Règles de détachement'),
    el('div', { class: 'section-body' },
      d.rules.length ? d.rules.map((r) => el('div', {}, [el('div', { class: 'muted' }, r.name), el('div', { class: 'muted', style: 'white-space:pre-wrap;color:var(--ink)' }, r.description)]))
        : [el('p', { class: 'muted' }, 'Aucune règle (lecture). L\'édition fine des règles se fait dans le fichier.')]),
  ]);
  mountSheet(d.name, `détachement · ${d.file}`, nameInput, [rules, keywordSection(d.keywords)], []);
  resetKwState();
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
  const name = el('input', { class: 'grow', placeholder: 'Nom de l\'unité' });
  const pts = el('input', { value: '0', style: 'width:80px' });
  const statNames = ['M', 'T', 'SV', 'W', 'LD', 'OC'];
  const inputs = {};
  const head = el('tr', {}, statNames.map((n) => el('th', {}, n)));
  const row = el('tr', {}, statNames.map((n) => { const i = el('input', { value: '' }); inputs[n] = i; return el('td', {}, [i]); }));
  const create = el('button', { class: 'btn btn-primary' }, 'Créer l\'unité');
  create.addEventListener('click', async () => {
    if (!name.value.trim()) { toast('Nom requis.', 'err'); return; }
    const stats = Object.fromEntries(statNames.map((n) => [n, inputs[n].value]));
    try {
      const u = await apiPost('/unit/create', { file: state.file, data: { name: name.value.trim(), points: pts.value, stats } });
      closeModal(); toast('Unité créée.', 'ok');
      await selectFaction(state.file); $('#tabs .tab[data-tab=units]').click(); openEntity('units', u.id);
    } catch (e) { toast(e.message, 'err'); }
  });
  showModal('Nouvelle unité', [
    row2('Nom', name), row2('Points', pts),
    el('div', { class: 'muted' }, 'Caractéristiques :'),
    el('table', { class: 'wt' }, [el('tbody', {}, [head, row])]),
    el('p', { class: 'muted' }, 'L\'unité est créée comme entrée partagée (sharedSelectionEntries). Lie-la ensuite à l\'organisation de l\'armée / aux armes dans le fichier.'),
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

async function onCommit() {
  const msg = el('input', { class: 'grow', placeholder: 'Message de commit' });
  const push = el('input', { type: 'checkbox' });
  const doIt = el('button', { class: 'btn btn-primary' }, 'Commit');
  doIt.addEventListener('click', async () => {
    if (!msg.value.trim()) { toast('Message requis.', 'err'); return; }
    try {
      const r = await apiPost('/commit', { message: msg.value.trim(), push: push.checked });
      closeModal(); toast('Commit effectué.' + (r.pushed ? ' Poussé.' : ''), 'ok');
      await refreshStatus();
    } catch (e) { toast(e.message, 'err'); }
  });
  showModal('Commit git', [
    row2('Message', msg),
    el('label', { class: 'row' }, [push, el('span', {}, 'Pousser vers origin après le commit')]),
  ], [doIt, cancelBtn()]);
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
