// /tmp/capcheck.js <currentFile> <baselineFilePath> — compare per-unit max
// occurrence constraints (selections, scope roster/force) current vs baseline.
const { Catalog } = require('/home/user/wh40k-11e/editor/lib/catalog');
const xml = require('/home/user/wh40k-11e/editor/lib/xml');
const fs = require('fs');
const curFile = process.argv[2], basePath = process.argv[3];
const norm = s => (s || '').toUpperCase().replace(/\[[^\]]*\]/g, '').replace(/[’'`]/g, "'").replace(/\s+/g, ' ').trim();
function maxCaps(node) {
  const cons = xml.child(node, 'constraints'); if (!cons) return '';
  return cons.children.filter(k => k.tag === 'constraint' && xml.getAttr(k, 'type') === 'max' && xml.getAttr(k, 'field') === 'selections' && ['roster', 'force'].includes(xml.getAttr(k, 'scope')))
    .map(k => xml.getAttr(k, 'scope') + '=' + xml.getAttr(k, 'value')).sort().join(',');
}
const c = new Catalog('/home/user/wh40k-11e').load();
const cur = new Map();
for (const d of c.datasheetsForTargeting(curFile)) cur.set(norm(d.name), maxCaps(c.byId.get(d.id).node));
const baseRoot = xml.parse(fs.readFileSync(basePath, 'utf8')).root;
const base = new Map();
xml.walk(baseRoot, (n, p, anc) => { if (n.tag === 'selectionEntry' && ['unit', 'model'].includes(xml.getAttr(n, 'type')) && !anc.some(a => a.tag === 'selectionEntry')) base.set(norm(xml.getAttrDecoded(n, 'name')), maxCaps(n)); });
let diffs = 0;
for (const [nm, b] of base) {
  if (/\(ADDITIONAL\)/.test(nm)) continue;
  const cc = cur.get(nm);
  if (cc === undefined) continue;
  if (cc !== b) { diffs++; console.log(`  CAP DIFF ${nm}: baseline[${b || '-'}] current[${cc || '-'}]`); }
}
console.log(`${curFile}: ${diffs} cap differences`);
