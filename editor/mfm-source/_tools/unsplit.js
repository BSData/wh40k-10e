// /tmp/unsplit.js <key> <file> — remove ALL repeat-tier twins for a faction.
const { Catalog } = require('/home/user/wh40k-11e/editor/lib/catalog');
const MFM = require('/tmp/mfm.json');
const key = process.argv[2], file = process.argv[3];
const c = new Catalog('/home/user/wh40k-11e').load();
const norm = s => (s || '').toUpperCase().replace(/\[[^\]]*\]/g, '').replace(/[’'`]/g, "'").replace(/\s+/g, ' ').trim();
let removed = 0; const fails = [];
for (const [mn, mu] of Object.entries(MFM[key].units)) {
  if (mu.threshold == null) continue;
  const dss = c.datasheetsForTargeting(file);                 // re-fetch each time (index changes)
  const d = dss.find(x => norm(x.name) === norm(mn));
  if (!d) { fails.push(`no origin ${mn}`); continue; }
  try { c.removeRepeatTier(d.id); removed++; } catch (e) { fails.push(`${mn}: ${e.message}`); }
}
c.save();
console.log('removed=' + removed, 'fails=' + fails.length, fails.join(' | '));
