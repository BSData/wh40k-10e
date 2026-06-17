// Unified leader/support attachment links for ALL factions, parsed from the
// authoritative datasheet "Leader"-ability prose ("This model can be attached to
// the following units: **A**, **B** …"). Replaces the marine MFM-caption version.
// Encoding: one hidden, max=0 "Can Lead (MFM)" group on the leader datasheet,
// entryLinks to the bodyguards resolved within the file's import closure.
// Usage: node /tmp/prose_links.js [apply]
const { Catalog } = require('/home/user/wh40k-11e/editor/lib/catalog');
const xml = require('/home/user/wh40k-11e/editor/lib/xml');
const DO = process.argv[2] === 'apply';
const c = new Catalog('/home/user/wh40k-11e').load();
const norm = s => (s || '').toUpperCase().replace(/[’'`]/g, "'").replace(/\s+/g, ' ').trim();
const files = [...c.docs.keys()];

// catalogue id -> file, and per-file direct catalogueLink targetIds -> closure
const rootId2file = new Map(), directImp = new Map();
for (const f of files) { const doc = c.docs.get(f); const rid = xml.getAttr(doc.root, 'id'); if (rid) rootId2file.set(rid, f);
  const set = new Set(); xml.walk(doc.root, n => { if (n.tag === 'catalogueLink') { const t = xml.getAttr(n, 'targetId'); if (t) set.add(t); } }); directImp.set(f, set); }
const closure = f => { const seen = new Set([f]); const q = [f]; while (q.length) { const cur = q.shift(); for (const tid of (directImp.get(cur) || [])) { const tf = rootId2file.get(tid); if (tf && !seen.has(tf)) { seen.add(tf); q.push(tf); } } } return seen; };

// name -> [{id,file,type}]  (datasheets only: unit/model)
const nameMap = new Map();
for (const f of files) { const doc = c.docs.get(f);
  xml.walk(doc.root, (n, p, anc) => { if (n.tag !== 'selectionEntry') return; const ty = xml.getAttr(n, 'type'); if (ty !== 'unit' && ty !== 'model') return;
    if (anc.some(a => a.tag === 'selectionEntry')) return; // top-level datasheet only
    const k = norm(xml.getAttrDecoded(n, 'name')); if (!k) return; if (!nameMap.has(k)) nameMap.set(k, []); nameMap.get(k).push({ id: xml.getAttr(n, 'id'), file: f, type: ty }); }); }
const tryR = (k, scope) => { const cand = nameMap.get(k); if (!cand) return null; for (const f of scope) { const h = cand.find(x => x.file === f); if (h) return h; } return null; };
const resolve = (name, scope) => { const k = norm(name); return tryR(k, scope) || (k.endsWith('S') ? tryR(k.slice(0, -1), scope) : tryR(k + 'S', scope)); };

// 1) cleanup: drop any prior Can Lead / Can Be Led By (MFM) groups everywhere
const touched = new Set();
if (DO) for (const f of files) { const doc = c.docs.get(f); let changed = false;
  xml.walk(doc.root, n => { if (n.tag === 'selectionEntryGroups') { const before = n.children.length;
    n.children = n.children.filter(x => !(x.tag === 'selectionEntryGroup' && /^Can (Lead|Be Led By) \(MFM\)$/.test(xml.getAttrDecoded(x, 'name') || ''))); if (n.children.length !== before) changed = true; } });
  if (changed) touched.add(f); }

// 2) parse prose -> per-datasheet partner set
const leaders = new Map(); // dsId -> {node, file, name, partners:Set}
const unresolved = new Map();
for (const f of files) { const doc = c.docs.get(f); const scope = [f, ...[...closure(f)].filter(x => x !== f)];
  xml.walk(doc.root, (n, p, anc) => { if (n.tag !== 'characteristic' || xml.getAttr(n, 'name') !== 'Description') return;
    const t = xml.getText(n) || ''; if (!/attached to the following units/i.test(t)) return;
    const ds = anc.find(a => a.tag === 'selectionEntry'); if (!ds) return; const ty = xml.getAttr(ds, 'type'); if (ty !== 'unit' && ty !== 'model') return; // skip enhancements
    const tail = t.split(/following units:/i)[1] || '';
    let names = [...tail.matchAll(/\*\*([^*]+?)\*\*/g)].map(m => m[1]);
    if (!names.length) names = tail.split(/[■•▪\n;,]|\.\s+/); // period-space is a separator, not a truncator
    names = names.flatMap(s => s.split(/[;,]|\.\s+/)) // secondary split (bolded whole-lists)
                 .map(s => s.replace(/\^\^|\*\*/g, '').replace(/^[\s\-–—•■▪]+/, '').replace(/[\s.;,]+$/, '').replace(/\s+/g, ' ').trim())
                 .filter(s => s && s.length < 60 && !/^(you can attach|if |this |add |the bearer|excluding|instead|even if|and that|with their|the leader|when |during |at the|in addition|each time|once per|while |note:|design)/i.test(s));
    const dsId = xml.getAttr(ds, 'id'); if (!leaders.has(dsId)) leaders.set(dsId, { node: ds, file: f, name: xml.getAttrDecoded(ds, 'name'), partners: new Set() });
    const L = leaders.get(dsId);
    for (let nm of names) { nm = nm.replace(/\^\^/g, '').replace(/\s+/g, ' ').trim(); if (!nm) continue;
      const B = resolve(nm, scope); if (!B) { unresolved.set(f + ' :: ' + nm, (unresolved.get(f + ' :: ' + nm) || 0) + 1); continue; }
      if (B.id !== dsId) L.partners.add(B.id); } }); }

const used = new Set();
const genId = () => { const h = () => Math.floor(Math.random() * 0x10000).toString(16).padStart(4, '0'); let id; do { id = [h(), h(), h(), h()].join('-'); } while (c.byId.has(id) || used.has(id)); used.add(id); return id; };

let groups = 0, links = 0; const perFile = new Map();
for (const L of leaders.values()) { if (!L.partners.size) continue; groups++; links += L.partners.size; perFile.set(L.file, (perFile.get(L.file) || 0) + 1);
  if (!DO) continue;
  const anchor = L.node; let segs = anchor.children.find(ch => ch.tag === 'selectionEntryGroups');
  if (!segs) { segs = xml.elem('selectionEntryGroups', {}, []); anchor.children.push(segs); } segs.selfClose = false;
  const elinks = xml.elem('entryLinks', {}, [...L.partners].map(pid => xml.elem('entryLink', { import: 'true', name: '', hidden: 'true', id: genId(), type: 'selectionEntry', targetId: pid }))); elinks.selfClose = false;
  const cons = xml.elem('constraints', {}, [xml.elem('constraint', { type: 'max', value: '0', field: 'selections', scope: 'parent', shared: 'true', id: genId() })]); cons.selfClose = false;
  const grp = xml.elem('selectionEntryGroup', { name: 'Can Lead (MFM)', hidden: 'true', id: genId() }, [xml.elem('comment', {}, []), cons, elinks]);
  xml.setText(grp.children[0], 'leader-link: unites menables par ce chef (source: prose datasheet "Leader"; declaratif hidden+max0; voir editor/LEADER_LINKS_APP_PROMPT.md)');
  grp.selfClose = false; segs.children.push(grp); touched.add(L.file); }

console.log((DO ? 'APPLY' : 'DRY') + ': leader-groups=' + groups + ' links=' + links + ' unresolved-names=' + unresolved.size);
console.log('groups per file:'); for (const [f, n] of [...perFile.entries()].sort((a, b) => b[1] - a[1])) console.log('  ' + n + '  ' + f.replace(/^(Imperium|Chaos|Aeldari) - /, ''));
if (unresolved.size) { console.log('top unresolved bodyguard names:'); for (const [k, v] of [...unresolved.entries()].slice(0, 18)) console.log('   ' + k); }
if (DO) { for (const f of touched) c.markDirty(f); c.save(); console.log('SAVED ' + touched.size + ' files'); }
