// /tmp/parse_mfm.js — parse online-MFM faction dumps (/tmp/mfm_raw/*.txt) into
// an intermediate JSON table. Run: node /tmp/parse_mfm.js
const fs = require('fs');
const RAW = '/tmp/mfm_raw';
const num = s => Number(String(s).replace(/[,\s]/g, ''));
const ordVal = t => ({ '1ST':1,'2ND':2,'3RD':3,'4TH':4,'5TH':5,'6TH':6 }[t.toUpperCase()] || null);

const isCostHeader = l => /^YOUR\b.*\b(UNIT COSTS|UNITS COST)$/i.test(l);
const priceOf = l => { const m = l.match(/(\d[\d,]*)\s*pts?\s*$/i); return m ? num(m[1]) : null; };
const modelsOf = l => { const m = l.match(/(\d[\d,]*)\s*models?\b/i); return m ? num(m[1]) : null; };
const isSection = l => /^(UNITS|SPACE MARINES|HARLEQUINS|YNNARI|LEGIONS? OF EXCESS|PLAGUE LEGIONS?|IMPERIAL FISTS|IRON HANDS|SALAMANDERS|RAVEN GUARD|ULTRAMARINES|WHITE SCARS|EVERY MODEL HAS THE IMPERIUM KEYWORD)$/i.test(l);
const stripPts = l => l.replace(/(\d[\d,]*)\s*pts?\s*$/i, '').replace(/^per\s+/i, '').replace(/^\+\s*\d*\s*/, '').trim();

function parseFaction(text) {
  const all = text.split(/\r?\n/).map(l => l.trim()).filter(Boolean);
  const di = all.findIndex(l => /^DETACHMENTS$/i.test(l));
  const U = di >= 0 ? all.slice(0, di) : all;
  const D = di >= 0 ? all.slice(di + 1) : [];
  const out = { units: {}, enhancements: {}, _warnings: [] };

  // ---- UNITS ----
  const units = [];
  let cur = null, bucket = 'base', wargear = false, variant = '';
  for (let i = 0; i < U.length; i++) {
    const l = U[i];
    if (/^EVERY MODEL HAS THE IMPERIUM KEYWORD$/i.test(l)) { variant = ' [IMPERIUM]'; wargear = false; continue; }
    if (isSection(l)) { wargear = false; continue; }
    if (/^WARGEAR OPTIONS$/i.test(l)) { wargear = true; continue; }
    if (isCostHeader(l)) {
      wargear = false;
      const ords = (l.toUpperCase().match(/\d(?:ST|ND|RD|TH)/g) || []).map(ordVal);
      const isExtra = /\+/.test(l) && ords.length === 1;
      const prev = U[i - 1] || '';
      const continues = priceOf(prev) !== null || isCostHeader(prev) || /^WARGEAR OPTIONS$/i.test(prev) || /^(\+|per)\b/i.test(prev);
      if (!isExtra) {
        if (!continues) { cur = { name: prev + variant, base: [], extra: [], threshold: null, options: [] }; units.push(cur); }
        if (ords.length) cur.threshold = Math.max(...ords);
        bucket = 'base';
      } else { bucket = 'extra'; if (cur && cur.threshold == null) cur.threshold = ords[0] - 1; }
      continue;
    }
    // option lines (wargear block, or inline "per X" / "+ N X")
    if ((wargear || /^(\+\s|per\s)/i.test(l)) && priceOf(l) !== null) {
      if (cur) cur.options.push({ name: stripPts(l), pts: priceOf(l) });
      continue;
    }
    // size-tier price line
    const p = priceOf(l);
    if (p !== null && cur) {
      let m = modelsOf(l);
      if (m == null) { const rest = l.replace(/(\d[\d,]*)\s*pts?\s*$/i, ''); const ns = (rest.match(/\d[\d,]*/g) || []).map(num); m = ns.length ? ns.reduce((a, b) => a + b, 0) : 1; }
      (bucket === 'extra' ? cur.extra : cur.base).push({ models: m, pts: p });
      continue;
    }
  }
  for (const u of units) {
    if (out.units[u.name]) out._warnings.push('dup unit ' + u.name);
    out.units[u.name] = { tiers: u.base, extraTiers: u.extra, threshold: u.extra.length ? u.threshold : null, options: u.options };
  }

  // ---- DETACHMENTS ----
  let det = null, last = null, enh = false;
  for (const l of D) {
    if (/^(\d+)\s*DP$/i.test(l)) { det = last; out.enhancements[det] = out.enhancements[det] || {}; enh = false; last = null; continue; }
    if (/^ENHANCEMENTS$/i.test(l)) { enh = true; continue; }
    if (/^(UNIQUE|LEADER|SUPPORT)\s*:/i.test(l)) continue;
    const p = priceOf(l);
    if (enh && p !== null && last && det) { out.enhancements[det][last] = p; last = null; continue; }
    if (p === null) last = l; // candidate det-name or enh-name (or disposition, harmlessly overwritten)
  }
  return out;
}

const result = {};
for (const f of fs.readdirSync(RAW).filter(f => f.endsWith('.txt')).sort()) {
  const key = f.replace(/\.txt$/, '');
  result[key] = parseFaction(fs.readFileSync(`${RAW}/${f}`, 'utf8'));
}
fs.writeFileSync('/tmp/mfm.json', JSON.stringify(result, null, 2));

// summary
for (const [k, v] of Object.entries(result)) {
  const nU = Object.keys(v.units).length;
  const nE = Object.values(v.enhancements).reduce((a, e) => a + Object.keys(e).length, 0);
  const split = Object.entries(v.units).filter(([, u]) => u.threshold != null).length;
  const opt = Object.entries(v.units).filter(([, u]) => u.options.length).length;
  console.log(`${k.padEnd(22)} units:${String(nU).padStart(3)}  split-tier:${String(split).padStart(3)}  w/opts:${String(opt).padStart(2)}  dets:${String(Object.keys(v.enhancements).length).padStart(2)}  enh:${String(nE).padStart(3)}  ${v._warnings.length ? 'WARN:' + v._warnings.join('|') : ''}`);
}
