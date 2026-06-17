// Per-chapter price overrides on shared SM.cat entries, via primary-catalogue
// set-modifiers. Verifies every (chapter x size x copy) combo against MFM before
// saving. Usage: node /tmp/override.js [apply]
const { Catalog } = require('/home/user/wh40k-11e/editor/lib/catalog');
const xml = require('/home/user/wh40k-11e/editor/lib/xml');
const MFM = require('/tmp/mfm.json');
const COST = '51b2-306e-1021-d207';
const DO = process.argv[2] === 'apply';
const c = new Catalog('/home/user/wh40k-11e').load();
const SMF = 'Imperium - Space Marines.cat';

const CAT = { BA: '4ef9-15ce-e3e6-36de', DA: '470a-6daa-9014-12df', DW: 'f89b-84e0-6e3b-f1e2', SW: '94bb-3284-ee14-57a1', BT: '36d3-36bc-68dd-40ac', SM: 'e0af-67df-9d63-8fb7' };
const KEY = { BA: 'blood-angels', DA: 'dark-angels', DW: 'deathwatch', SW: 'space-wolves' };

// unit id -> MFM name + which chapters override it
const UNITS = [
  { id: 'a10b-fbfe-b1fa-6f0c', mfm: 'ASSAULT INTERCESSOR SQUAD', chapters: ['BA'] },
  { id: 'cdd9-efda-95-e7b2', mfm: 'ASSAULT INTERCESSORS WITH JUMP PACKS', chapters: ['BA'] },
  { id: '7044-bf1-f949-c32d', mfm: 'BLADEGUARD VETERAN SQUAD', chapters: ['BA'] },
  { id: '1319-45d-bb95-dfd4', mfm: 'CAPTAIN WITH JUMP PACK', chapters: ['BA'] },
  { id: '23f1-2df2-7085-cf41', mfm: 'CHAPLAIN WITH JUMP PACK', chapters: ['BA'] },
  { id: 'b5e8-c34b-566b-8bda', mfm: 'OUTRIDER SQUAD', chapters: ['BA'] },
  { id: '9259-f166-15f2-7f79', mfm: 'REPULSOR EXECUTIONER', chapters: ['BA', 'DA', 'DW', 'SW'] },
  { id: '9e9c-bf4d-2d40-be82', mfm: 'VANGUARD VETERAN SQUAD WITH JUMP PACKS', chapters: ['BA'] },
];

const ptsOf = n => { const co = (xml.child(n, 'costs') || { children: [] }).children.find(x => x.tag === 'cost' && xml.getAttr(x, 'typeId') === COST); return co ? Number(xml.getAttr(co, 'value')) : null; };
function costMods(node) { const m = xml.child(node, 'modifiers'); return m ? m.children.filter(x => x.tag === 'modifier' && xml.getAttr(x, 'field') === COST) : []; }
function conds(mod) { const out = []; xml.walk(mod, x => { if (x.tag === 'condition') out.push(x); }); return out; }
function isRepeat(mod) { let f = false; xml.walk(mod, x => { if (x.tag === 'comment' && /repeat-cost/.test(xml.getText(x))) f = true; }); return f; }

// --- simulator: evaluate a unit's pts for (primaryCatId, large?, copyIndex) ---
function classify(cond, unitId) {
  const sc = xml.getAttr(cond, 'scope'), cid = xml.getAttr(cond, 'childId');
  if (sc === 'primary-catalogue') return { kind: 'primary', cid };
  if (sc === 'roster' && cid === unitId) return { kind: 'repeat', val: Number(xml.getAttr(cond, 'value')) };
  if (sc === unitId && cid && cid !== unitId) return { kind: 'size' };
  return { kind: 'unknown' };
}
function simulate(node, unitId, primaryCatId, large, copyIndex) {
  let cost = ptsOf(node);
  for (const mod of costMods(node)) {
    const ok = conds(mod).every(cond => {
      const k = classify(cond, unitId);
      if (k.kind === 'primary') return primaryCatId === k.cid;
      if (k.kind === 'repeat') return copyIndex >= k.val;
      if (k.kind === 'size') return large;
      throw new Error('unknown condition in ' + unitId + ': ' + JSON.stringify(cond.attrs));
    });
    if (ok) { const t = xml.getAttr(mod, 'type'), v = Number(xml.getAttr(mod, 'value')); if (t === 'set') cost = v; else if (t === 'increment') cost += v; else if (t === 'decrement') cost -= v; }
  }
  return cost;
}

// --- apply: add chapter set-modifiers (mirror size cond), inserted before repeat-cost ---
function pcCond(catId) { return xml.elem('condition', { type: 'instanceOf', value: '1', field: 'selections', scope: 'primary-catalogue', childId: catId, shared: 'true' }); }
function build() {
  for (const u of UNITS) {
    const node = c.byId.get(u.id).node;
    let mods = xml.child(node, 'modifiers');
    if (!mods) { mods = xml.elem('modifiers', {}, []); mods.selfClose = false; const ci = node.children.findIndex(ch => ch.tag === 'costs'); node.children.splice(ci >= 0 ? ci : node.children.length, 0, mods); }
    mods.selfClose = false;
    // remove any prior chapter-cost mods (idempotent)
    mods.children = mods.children.filter(m => { if (m.tag !== 'modifier') return true; let f = false; xml.walk(m, x => { if (x.tag === 'comment' && /chapter-cost/.test(xml.getText(x))) f = true; }); return !f; });
    // discover the generic size-tier mod (large): set <pts> IF atLeast K childId=Y scope=unit
    const sizeMod = costMods(node).find(m => conds(m).some(cd => classify(cd, u.id).kind === 'size') && !isRepeat(m));
    let sizeCond = null;
    if (sizeMod) { const cd = conds(sizeMod).find(x => classify(x, u.id).kind === 'size'); sizeCond = { value: xml.getAttr(cd, 'value'), childId: xml.getAttr(cd, 'childId') }; }
    const mfmCh = u.chapters[0]; // all override chapters share the same target price for these units
    const t = MFM[KEY[mfmCh]].units[u.mfm];
    const baseP = t.tiers[0].pts, largeP = t.tiers[1] ? t.tiers[1].pts : null;
    // build chapter mods (base first, then large), for each chapter
    const newMods = [];
    for (const ch of u.chapters) {
      const cmt = xml.elem('comment', {}); xml.setText(cmt, 'chapter-cost: ' + ch + ' (surcout/escompte par chapitre via primary-catalogue; voir editor/MARINE_CHAPTER_COST_APP_PROMPT.md)');
      newMods.push(xml.elem('modifier', { type: 'set', field: COST, value: String(baseP) }, [cmt, xml.elem('conditions', {}, [pcCond(CAT[ch])])]));
      if (largeP != null && sizeCond) {
        const cmt2 = xml.elem('comment', {}); xml.setText(cmt2, 'chapter-cost: ' + ch + ' (palier de taille)');
        const szc = xml.elem('condition', { type: 'atLeast', value: sizeCond.value, field: 'selections', scope: u.id, childId: sizeCond.childId, shared: 'true' });
        newMods.push(xml.elem('modifier', { type: 'set', field: COST, value: String(largeP) }, [cmt2, xml.elem('conditions', {}, [pcCond(CAT[ch]), szc])]));
      }
    }
    // insert before the repeat-cost modifier if present, else append
    const repIdx = mods.children.findIndex(m => m.tag === 'modifier' && isRepeat(m));
    if (repIdx >= 0) mods.children.splice(repIdx, 0, ...newMods); else mods.children.push(...newMods);
  }
}

build();

// --- verify every (chapter x size x copy) against MFM ---
const sm = MFM['space-marines'].units;
let fails = 0, checks = 0;
for (const u of UNITS) {
  const node = c.byId.get(u.id).node;
  const hasRepeat = costMods(node).some(isRepeat);
  const overr = new Set(u.chapters);
  // test catalogues: each override chapter + SM(vanilla) + BT(non-override here) as control
  const testCats = [['SM', sm], ['BT', sm]];
  for (const ch of u.chapters) testCats.push([ch, MFM[KEY[ch]].units]);
  for (const [ch, tbl] of testCats) {
    const t = tbl[u.mfm]; if (!t) continue;
    const sizes = t.tiers[1] ? [false, true] : [false];
    for (const large of sizes) {
      const expBase = (large ? t.tiers[1] : t.tiers[0]).pts;
      const got1 = simulate(node, u.id, CAT[ch], large, 1);
      checks++; if (got1 !== expBase) { fails++; console.log(`FAIL ${u.mfm} ${ch} ${large ? 'large' : 'small'} copy1: got ${got1} exp ${expBase}`); }
      if (hasRepeat && t.extraTiers && t.extraTiers.length) {
        const exTier = large ? (t.extraTiers[1] || t.extraTiers[0]) : t.extraTiers[0];
        const got3 = simulate(node, u.id, CAT[ch], large, 3);
        checks++; if (got3 !== exTier.pts) { fails++; console.log(`FAIL ${u.mfm} ${ch} ${large ? 'large' : 'small'} copy3: got ${got3} exp ${exTier.pts}`); }
      }
    }
  }
}
console.log(`\nsimulation: ${checks} checks, ${fails} failures`);
if (fails === 0 && DO) { c.markDirty(SMF); c.save(); console.log('SAVED ' + SMF); }
else if (fails === 0) console.log('DRY ok — re-run with "apply" to save');
else console.log('NOT saving (failures present)');
