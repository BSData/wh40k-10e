// /tmp/apply.js <factionKey> <file1[,file2,...]> [apply]   (default = dry-run)
const { Catalog } = require('/home/user/wh40k-11e/editor/lib/catalog');
const xml = require('/home/user/wh40k-11e/editor/lib/xml');
const MFM = require('/tmp/mfm.json');
const COST_PTS = '51b2-306e-1021-d207';
const ENH_CAT = '6226-9b9b-107a-9ada';

const key = process.argv[2], fileArg = process.argv[3], DO = process.argv[4] === 'apply';
const files = fileArg.split(',').map(s => s.trim());
const fac = MFM[key];
if (!fac) { console.error('no faction', key); process.exit(1); }
const c = new Catalog('/home/user/wh40k-11e').load();
const norm = s => (s || '').toUpperCase().replace(/\[[^\]]*\]/g, '').replace(/[’'`]/g, "'").replace(/\s+/g, ' ').trim();
const normEnh = s => norm(s).replace(/\([^)]*\)/g, '').replace(/-/g, ' ').replace(/\bUPGRADE\b/g, '').replace(/\bAURA\b/g, '').replace(/\s+/g, ' ').trim();
const normOpt = s => norm(s).replace(/'/g, '').replace(/\s+/g, '');
const ptsOf = n => { const co = (xml.child(n, 'costs') || { children: [] }).children.find(x => x.tag === 'cost' && xml.getAttr(x, 'typeId') === COST_PTS); return co ? xml.getAttr(co, 'value') : null; };
const setPts = (n, v) => { n.selfClose = false; const costs = xml.ensureChild(n, 'costs'); costs.selfClose = false; let co = costs.children.find(x => x.tag === 'cost' && xml.getAttr(x, 'typeId') === COST_PTS); if (!co) { co = xml.elem('cost', { name: 'pts', typeId: COST_PTS, value: '0' }); costs.children.push(co); } xml.setAttr(co, 'value', String(v)); };
const curTiers = node => { const o = []; xml.walk(node, n => { if (n.tag === 'modifier' && xml.getAttr(n, 'field') === COST_PTS && xml.getAttr(n, 'type') === 'set') o.push({ pts: xml.getAttr(n, 'value') }); }); return o; };
function hasRepeatCostMod(m) { let f = false; xml.walk(m, x => { if (x.tag === 'comment' && /repeat-cost/.test(xml.getText(x))) f = true; }); return f; }
function addRepeatCost(node, threshold, delta, unitId) {
  let mods = xml.child(node, 'modifiers');
  if (mods) mods.children = mods.children.filter(m => !(m.tag === 'modifier' && hasRepeatCostMod(m)));
  if (!mods) { mods = xml.elem('modifiers', {}, []); mods.selfClose = false; const ci = node.children.findIndex(ch => ch.tag === 'costs'); if (ci >= 0) node.children.splice(ci, 0, mods); else node.children.push(mods); }
  const cmt = xml.elem('comment', {}); xml.setText(cmt, `repeat-cost: threshold=${threshold} delta=${delta} (surcout par exemplaire au-dela du Neme uniquement; voir editor/REPEAT_COST_APP_PROMPT.md)`);
  const cond = xml.elem('condition', { type: 'atLeast', value: String(threshold + 1), field: 'selections', scope: 'roster', childId: unitId, shared: 'true', includeChildSelections: 'true', includeChildForces: 'true' });
  const mod = xml.elem('modifier', { type: 'increment', field: COST_PTS, value: String(delta) }, [cmt, xml.elem('conditions', {}, [cond])]);
  mods.children.push(mod);
}

const log = [], flag = [], touched = new Set();
const byName = new Map();
for (const f of files) for (const d of c.datasheetsForTargeting(f)) { if (/\[/.test(d.name)) continue; const k = norm(d.name); if (!byName.has(k)) byName.set(k, d); }
// fallback: standalone (depth-0) type=model entries are datasheet-like (shared-library
// chassis like Leman Russ variants, Soul Grinders). Only add when the name isn't already
// claimed by a type=unit datasheet, so we never shadow a real unit.
for (const f of files) { const doc = c.docs.get(f); if (!doc) continue; xml.walk(doc.root, (n, p, anc) => { if (n.tag !== 'selectionEntry' || xml.getAttr(n, 'type') !== 'model') return; if (anc.some(a => a.tag === 'selectionEntry' || a.tag === 'selectionEntryGroup')) return; const nm = xml.getAttrDecoded(n, 'name') || ''; if (/\[/.test(nm)) return; const k = norm(nm); if (!byName.has(k)) byName.set(k, { id: xml.getAttr(n, 'id'), name: nm }); }); }
const findUnit = mn => byName.get(norm(mn)) || byName.get(norm(mn).replace(/S$/, '')) || byName.get(norm(mn) + 'S') || null;
const splitExists = mn => { const d = findUnit(mn); if (!d) return false; const nm = norm(d.name) + ' (ADDITIONAL)'; for (const f of files) if (c.datasheetsForTargeting(f).some(x => norm(x.name) === nm)) return true; return false; };

for (const [mn, mu] of Object.entries(fac.units)) {
  if (/\[IMPERIUM\]$/.test(mn)) { flag.push(`SKIP dual-price ${mn}`); continue; }
  const d = findUnit(mn);
  if (!d) { flag.push(`NOMATCH unit ${mn}`); continue; }
  const ref = c.byId.get(d.id), node = ref.node, u = c.getUnit(null, d.id);
  const base = (u.costs.find(x => x.name === 'pts') || {}).value;
  const mfmBase = mu.tiers[0] ? String(mu.tiers[0].pts) : null;
  const ct = curTiers(node), up = mu.tiers.slice(1);
  const patch = {}; let unhandled = false; const acts = [];
  const perModel = (base == null || base === '0') && ct.length === 0 && mu.tiers.length > 1;
  if (perModel) {
    const m0 = mu.tiers[0].models, p0 = mu.tiers[0].pts, per = p0 / m0;
    const linear = Number.isInteger(per) && mu.tiers.every(t => t.pts === per * t.models);
    const mnodes = []; xml.walk(node, e => { if (e.tag === 'selectionEntry' && e !== node && xml.getAttr(e, 'type') === 'model' && ptsOf(e) != null) mnodes.push(e); });
    if (mu.options.length) { unhandled = true; flag.push(`PER-MODEL ${mn} (has-options) mfm=${mu.tiers.map(t => t.models + '=' + t.pts).join(',')}`); }
    else if (linear) {
      const toset = mnodes.filter(e => String(ptsOf(e)) !== String(per));
      if (toset.length) { acts.push(() => toset.forEach(e => setPts(e, per))); log.push(`per-model ${d.name}: ${per}/model x${toset.length}`); }
    } else { // non-linear: move cost to the unit + create size-tier set modifiers (Gretchin pattern)
      acts.push(() => {
        mnodes.forEach(e => setPts(e, 0));
        setPts(node, mu.tiers[0].pts);
        let mods = xml.child(node, 'modifiers');
        if (!mods) { mods = xml.elem('modifiers', {}, []); mods.selfClose = false; const ci = node.children.findIndex(ch => ch.tag === 'costs'); if (ci >= 0) node.children.splice(ci + 1, 0, mods); else node.children.push(mods); }
        mods.children = mods.children.filter(m => { if (m.tag !== 'modifier') return true; let f = false; xml.walk(m, x => { if (x.tag === 'comment' && /mfm-size/.test(xml.getText(x))) f = true; }); return !f; });
        for (let i = 1; i < mu.tiers.length; i++) {
          const cmt = xml.elem('comment', {}); xml.setText(cmt, 'mfm-size');
          const cond = xml.elem('condition', { type: 'greaterThan', value: String(mu.tiers[i - 1].models), field: 'selections', scope: d.id, childId: 'model', shared: 'true' });
          mods.children.push(xml.elem('modifier', { type: 'set', value: String(mu.tiers[i].pts), field: COST_PTS }, [cmt, xml.elem('conditions', {}, [cond])]));
        }
      });
      log.push(`per-model->unit-tiers ${d.name}: base=${mu.tiers[0].pts} +${mu.tiers.length - 1} tier(s)`);
    }
  } else {
    if (mfmBase != null && String(base) !== mfmBase) patch.costs = [{ typeId: COST_PTS, value: mfmBase }];
    const tp = [];
    if (up.length) { if (ct.length !== up.length) { flag.push(`TIERCOUNT ${mn} cur${ct.length} mfm${up.length}`); unhandled = true; } else up.forEach((t, i) => { if (String(ct[i].pts) !== String(t.pts)) tp.push({ idx: i, pts: t.pts }); }); }
    if (tp.length) patch.tiers = tp;
  }
  const op = [];
  if (!unhandled) for (const o of mu.options) {
    let ids = [];
    for (const g of u.options) for (const ch of g.choices) if (normOpt(ch.name) === normOpt(o.name) || normEnh(ch.name) === normEnh(o.name) || normOpt(ch.name).startsWith(normOpt(o.name))) ids.push(ch.id);
    if (!ids.length) { const want = normOpt(o.name); xml.walk(node, e => { if (e.tag !== 'selectionEntry' || e === node) return; const en = normOpt(xml.getAttrDecoded(e, 'name')); if (en === want || en.startsWith(want) || en.includes('W/' + want) || en.includes('WITH' + want)) ids.push(xml.getAttr(e, 'id')); }); }
    if (!ids.length) { flag.push(`OPT no-match ${mn} "${o.name}"`); continue; }
    for (const id of [...new Set(ids)]) { const r = c.byId.get(id); if (r && String(ptsOf(r.node)) !== String(o.pts)) op.push({ id, pts: o.pts }); }
  }
  if (Object.keys(patch).length || op.length || acts.length) {
    if (Object.keys(patch).length) log.push(`unit ${d.name}: ${JSON.stringify(patch)}${op.length ? ' opts=' + JSON.stringify(op) : ''}`);
    if (DO) { for (const a of acts) a(); if (Object.keys(patch).length) c.editUnit(ref.file, d.id, patch); for (const o of op) { const r = c.byId.get(o.id); if (r) setPts(r.node, o.pts); } touched.add(ref.file); }
  }
  if (mu.threshold != null && !unhandled) {
    const deltas = mu.extraTiers.map((t, i) => Number(t.pts) - Number((mu.tiers[i] || mu.tiers[0]).pts));
    const delta = deltas[0];
    if (!deltas.every(x => x === delta)) flag.push(`DELTA-VARY ${mn}: [${deltas.join(',')}]`);
    log.push(`repeat-cost ${d.name}: threshold=${mu.threshold} delta=+${delta}`);
    if (DO) { if (splitExists(mn)) flag.push(`STILL-SPLIT ${mn}`); else { addRepeatCost(node, mu.threshold, delta, d.id); touched.add(ref.file); } }
  }
}

// ---- enhancements: exact -> prefer enh-context -> det-scope -> fuzzy(ed<=2) -> set-all(same value) ----
function ed(a, b) { const m = a.length, n = b.length; const d = Array.from({ length: m + 1 }, (_, i) => { const r = new Array(n + 1).fill(0); r[0] = i; return r; }); for (let j = 0; j <= n; j++) d[0][j] = j; for (let i = 1; i <= m; i++) for (let j = 1; j <= n; j++) d[i][j] = Math.min(d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + (a[i - 1] === b[j - 1] ? 0 : 1)); return d[m][n]; }
const allEnh = [];
for (const f of files) { const doc = c.docs.get(f); if (!doc) continue; xml.walk(doc.root, (n, p, anc) => { if (n.tag !== 'selectionEntry') return; const t = xml.getAttr(n, 'type'); if (t === 'model' || t === 'unit') return; const g = anc.slice().reverse().find(a => a.tag === 'selectionEntryGroup'); const gn = g ? (xml.getAttrDecoded(g, 'name') || '') : ''; const cl = xml.child(n, 'categoryLinks'); const isEnh = /enhancement/i.test(gn) || (cl && cl.children.some(x => xml.getAttr(x, 'targetId') === ENH_CAT)); let det = / Enhancements$/.test(gn) ? gn.replace(/ Enhancements$/, '') : null; if (!det) { const dse = anc.slice().reverse().find(a => a.tag === 'selectionEntry'); if (dse) det = xml.getAttrDecoded(dse, 'name'); } allEnh.push({ node: n, file: f, name: xml.getAttrDecoded(n, 'name'), det, isEnh: !!isEnh }); }); }
const mfmVals = new Map();
for (const es of Object.values(fac.enhancements)) for (const [en, pts] of Object.entries(es)) { const k = normEnh(en); if (!mfmVals.has(k)) mfmVals.set(k, new Set()); mfmVals.get(k).add(String(pts)); }
let enhChg = 0;
for (const [dn, enhs] of Object.entries(fac.enhancements)) {
  for (const [en, pts] of Object.entries(enhs)) {
    const k = normEnh(en);
    let cand = allEnh.filter(e => normEnh(e.name) === k), fuzzy = false;
    if (cand.some(e => e.isEnh)) cand = cand.filter(e => e.isEnh);
    if (!cand.length) { fuzzy = true; const fz = allEnh.filter(e => e.isEnh && ed(normEnh(e.name), k) <= 2); const sc = fz.filter(e => norm(e.det) === norm(dn)); cand = sc.length ? sc : fz; }
    if (cand.length > 1) { const s = cand.filter(e => norm(e.det) === norm(dn)); if (s.length) cand = s; else { const orph = cand.filter(e => !e.det); if (orph.length === 1) cand = orph; } }
    if (!cand.length) { flag.push(`NOMATCH enh ${dn} / ${en}`); continue; }
    if (cand.length > 1 && !(!fuzzy && mfmVals.get(k).size === 1)) { flag.push(`AMBIG enh ${dn} / ${en}`); continue; }
    let did = false; for (const e of cand) { if (String(ptsOf(e.node)) !== String(pts)) { if (DO) { setPts(e.node, pts); touched.add(e.file); } did = true; } }
    if (did) { enhChg++; log.push(`enh [${dn}] ${en} -> ${pts} (x${cand.length})`); }
  }
}

console.log(`=== ${key} ${DO ? 'APPLY' : 'DRY'} === changes:${log.length} (enh:${enhChg}) flags:${flag.length}`);
if (process.env.V) console.log(log.join('\n'));
if (flag.length) console.log('--- FLAGS ---\n' + flag.join('\n'));
if (DO) { for (const f of touched) c.markDirty(f); c.save(); console.log('SAVED ' + [...touched].join(', ')); }
