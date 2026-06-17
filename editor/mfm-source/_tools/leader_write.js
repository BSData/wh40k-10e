// Leader<->bodyguard links (Space Marines + chapters) as hidden, max=0 declarative
// entryLink groups. Pair declared in the file that sees both endpoints; on the leader
// ("Can Lead (MFM)") when local, else on the bodyguard ("Can Be Led By (MFM)").
// Usage: node /tmp/leader_write.js [apply]
const { Catalog } = require('/home/user/wh40k-11e/editor/lib/catalog');
const xml = require('/home/user/wh40k-11e/editor/lib/xml');
const fs = require('fs');
const DO = process.argv[2] === 'apply';
const c = new Catalog('/home/user/wh40k-11e').load();
const SM = 'Imperium - Space Marines.cat';
const FF = ['Imperium - Imperial Fists.cat', 'Imperium - Iron Hands.cat', 'Imperium - Raven Guard.cat', 'Imperium - Salamanders.cat', 'Imperium - Ultramarines.cat', 'Imperium - White Scars.cat'];
const SRC = {
  'space-marines': [SM, ...FF],
  'black-templars': ['Imperium - Black Templars.cat', SM],
  'blood-angels': ['Imperium - Blood Angels.cat', SM],
  'dark-angels': ['Imperium - Dark Angels.cat', SM],
  'deathwatch': ['Imperium - Deathwatch.cat', SM],
  'space-wolves': ['Imperium - Space Wolves.cat', SM],
};
const norm = s => (s || '').toUpperCase().replace(/[’'`]/g, "'").replace(/\s+/g, ' ').trim();
const allFiles = [SM, ...FF, 'Imperium - Black Templars.cat', 'Imperium - Blood Angels.cat', 'Imperium - Dark Angels.cat', 'Imperium - Deathwatch.cat', 'Imperium - Space Wolves.cat'];
const nameMap = new Map();
for (const f of allFiles) { const doc = c.docs.get(f); if (!doc) continue;
  for (const d of c.datasheetsForTargeting(f)) { const k = norm(d.name); if (!nameMap.has(k)) nameMap.set(k, []); if (!nameMap.get(k).some(x => x.file === f)) nameMap.get(k).push({ id: d.id, file: f }); }
  xml.walk(doc.root, (n, p, anc) => { if (n.tag === 'selectionEntry' && xml.getAttr(n, 'type') === 'model' && !anc.some(a => a.tag === 'selectionEntry' || a.tag === 'selectionEntryGroup')) { const k = norm(xml.getAttrDecoded(n, 'name')); if (!k) return; if (!nameMap.has(k)) nameMap.set(k, []); if (!nameMap.get(k).some(x => x.file === f)) nameMap.get(k).push({ id: xml.getAttr(n, 'id'), file: f }); } });
}
const resolve = (name, scope) => { const cand = nameMap.get(norm(name)); if (!cand) return null; for (const f of scope) { const h = cand.find(x => x.file === f); if (h) return h; } return null; };

// collect pairs -> grouping key (anchorId|dir|file) -> Set(partnerId)
const groups = new Map();   // key -> {file, anchorId, dir, partners:Set}
const miss = new Set();
for (const [src, scope] of Object.entries(SRC)) {
  for (const line of fs.readFileSync('/home/user/wh40k-11e/editor/mfm-source/' + src + '.txt', 'utf8').split(/\r?\n/)) {
    const m = line.match(/^(.+?) -> (.+)$/); if (!m) continue;
    if (/\(support\)/i.test(m[1])) continue;                 // skip SUPPORT-tagged (we encode "leads")
    const L = resolve(m[1], scope); if (!L) { miss.add(src + ':L:' + m[1]); continue; }
    for (const bn of m[2].split(',').map(s => s.trim()).filter(Boolean)) {
      const B = resolve(bn, scope); if (!B) { miss.add(src + ':B:' + bn); continue; }
      let D, anchor, partner, dir;
      if (L.file !== SM && B.file === SM) { D = L.file; anchor = L; partner = B; dir = 'lead'; }
      else if (L.file === SM && B.file !== SM) { D = B.file; anchor = B; partner = L; dir = 'ledby'; }
      else if (L.file === B.file) { D = L.file; anchor = L; partner = B; dir = 'lead'; }
      else if (L.file === SM && B.file === SM) { D = SM; anchor = L; partner = B; dir = 'lead'; }
      else { miss.add('ORPHAN ' + m[1] + '->' + bn); continue; }
      // visibility invariant: partner must be local to D or in SM (imported by D)
      if (!(partner.file === D || partner.file === SM)) { miss.add('UNVISIBLE ' + m[1] + '->' + bn); continue; }
      const key = anchor.id + '|' + dir + '|' + D;
      if (!groups.has(key)) groups.set(key, { file: D, anchorId: anchor.id, dir, partners: new Set() });
      groups.get(key).partners.add(partner.id);
    }
  }
}

// id generator (avoids existing + intra-run)
const used = new Set();
const genId = () => { const h = () => Math.floor(Math.random() * 0x10000).toString(16).padStart(4, '0'); let id; do { id = [h(), h(), h(), h()].join('-'); } while (c.byId.has(id) || used.has(id)); used.add(id); return id; };

const perFile = new Map(); let totalLinks = 0;
const touched = new Set();
for (const g of groups.values()) {
  perFile.set(g.file, (perFile.get(g.file) || 0) + 1);
  totalLinks += g.partners.size;
  if (!DO) continue;
  const anchor = c.byId.get(g.anchorId).node;
  const gname = g.dir === 'lead' ? 'Can Lead (MFM)' : 'Can Be Led By (MFM)';
  // remove pre-existing same-named group (idempotent)
  let host = anchor; // group goes directly under the datasheet selectionEntry
  let segs = anchor.children.find(ch => ch.tag === 'selectionEntryGroups');
  if (!segs) { segs = xml.elem('selectionEntryGroups', {}, []); segs.selfClose = false; anchor.children.push(segs); }
  segs.selfClose = false;
  segs.children = segs.children.filter(x => !(x.tag === 'selectionEntryGroup' && xml.getAttrDecoded(x, 'name') === gname));
  const links = [...g.partners].map(pid => xml.elem('entryLink', { import: 'true', name: '', hidden: 'true', id: genId(), type: 'selectionEntry', targetId: pid }));
  const elinks = xml.elem('entryLinks', {}, links); elinks.selfClose = false;
  const cons = xml.elem('constraints', {}, [xml.elem('constraint', { type: 'max', value: '0', field: 'selections', scope: 'parent', shared: 'true', id: genId() })]); cons.selfClose = false;
  const grp = xml.elem('selectionEntryGroup', { name: gname, hidden: 'true', id: genId() }, [
    xml.elem('comment', {}, []), cons, elinks,
  ]);
  xml.setText(grp.children[0], 'leader-link: ' + (g.dir === 'lead' ? 'unites menables par ce chef' : 'chefs pouvant mener cette unite') + ' (declaratif, hidden+max0; voir editor/LEADER_LINKS_APP_PROMPT.md)');
  grp.selfClose = false;
  segs.children.push(grp);
  touched.add(g.file);
}

console.log((DO ? 'APPLY' : 'DRY') + ': groups=' + groups.size + ' links=' + totalLinks + ' miss/excluded=' + miss.size);
console.log('groups per file:'); for (const [f, n] of [...perFile.entries()].sort((a, b) => b[1] - a[1])) console.log('  ' + f.replace('Imperium - ', '') + ': ' + n);
if (miss.size) console.log('excluded (covered elsewhere / support): ' + [...miss].slice(0, 6).join(' | ') + (miss.size > 6 ? ' …' : ''));
if (DO) { for (const f of touched) c.markDirty(f); c.save(); console.log('SAVED: ' + [...touched].map(f => f.replace('Imperium - ', '')).join(', ')); }
