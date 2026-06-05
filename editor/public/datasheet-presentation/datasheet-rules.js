// Heuristic extraction of an Invulnerable save and Feel No Pain value from a
// 10e datasheet's ability text. Neither is a structured characteristic in
// BSData — both live in free-form rule prose — so we scan the abilities.
//
// Design notes / why it's not a one-liner:
//  - Phrasing varies: "has a 4+ invulnerable save", "invulnerable save of 4+",
//    an ability literally named "Invulnerable Save" with body "4+" (so the
//    number is separated from the word by " : " when we join name+desc), etc.
//  - CONDITIONAL / AURA saves must NOT be read as the model's own blanket save:
//      "4+ invulnerable save against ranged attacks"        (conditional, after)
//      "While this model is leading a unit, models in that
//       unit have a 4+ invulnerable save"                   (aura, marker before)
//      "… against mortal wounds"                            (conditional)
//    We therefore inspect the text BOTH before and after each match. We prefer
//    the FIRST UNCONDITIONAL value (a datasheet states the model's own save
//    first; auras and profile variants come later); only if none is
//    unconditional do we fall back to the first conditional one. The UI lets the
//    user override either way.

// Flatten [name, desc] tuples into one searchable blob, ONE ability per line.
// Internal newlines/bullets inside a description are collapsed to spaces so a
// gated ability stays a single line (e.g. Trajann's "Moment Shackle … ■ This
// model has a 2+ invulnerable save" must read as one gated clause, not split
// the bare "2+ …" bullet onto its own ungated line).
function abilityBlob(abilities) {
  return (abilities || [])
    .map(([n, d]) => (String(n || "") + " : " + String(d || "")).replace(/[\r\n■•]+/g, " "))
    .join("\n");
}

// Some saves are unconditional on their own clause but sit inside an ability
// that is globally gated (e.g. Trajann's "Moment Shackle: Once per battle … you
// can select … ■ This model has a 2+ invulnerable save"). Treat the whole
// ability as conditional when its text opens with such a gate.
const ABILITY_GATE = /\b(once per (battle|turn|round)|at the start of|you can select|in your (command|movement|shooting|charge|fight) phase|until the (start|end) of)\b/i;

// Markers that, in the text AFTER a save value, make it conditional.
const COND_AFTER = /\b(against|while|if|unless|each time|in your|in the|when|toward|versus|vs\b|on a roll|for attacks|to attacks|made (with|by)|from (ranged|melee)|mortal wound|devastating wound)/i;
// Markers in the text BEFORE a save value: an aura grants it to the led unit
// ("models in that unit have …"), or a plain conditional clause opens it.
const COND_BEFORE = /(models in that unit|that unit have|while this model is leading|while .* leading|^.*\bif\b[^.]*$|against)/i;

const clampSave = (v) => (v >= 2 && v <= 6 ? v : 0);

// Slice the sentence-ish context around a match for conditional testing.
function context(text, start, end) {
  const before = text.slice(Math.max(0, start - 48), start);
  let after = text.slice(end);
  const stop = after.search(/[.;\n]/);
  if (stop >= 0) after = after.slice(0, stop);
  return { before, after };
}

// Find which ability line a match index falls in, and whether that whole
// ability is gated (so a value inside it is conditional regardless of its own
// local clause). `lines` are the per-ability strings; `starts` their offsets.
function abilityGated(lines, starts, idx) {
  for (let i = lines.length - 1; i >= 0; i--) {
    if (idx >= starts[i]) return ABILITY_GATE.test(lines[i]);
  }
  return false;
}

// Shared scanner: collect {val, conditional} for every match of `patterns`,
// then return first unconditional, else first conditional, else 0.
function scan(text, patterns) {
  if (!text) return 0;
  // Per-ability line offsets, to test the enclosing ability's gate.
  const lines = text.split("\n");
  const starts = [];
  { let off = 0; for (const l of lines) { starts.push(off); off += l.length + 1; } }
  let firstUncond = 0, firstCond = 0;
  for (const { re, valGroup, ctxGroup } of patterns) {
    let m;
    re.lastIndex = 0;
    while ((m = re.exec(text))) {
      const val = clampSave(parseInt(m[valGroup], 10));
      if (!val) continue;
      // Context: text before the whole match + the matched tail group (if any)
      // + the sentence remainder after the match + the enclosing ability's gate.
      const { before, after } = context(text, m.index, m.index + m[0].length);
      const tail = ctxGroup != null ? m[ctxGroup] || "" : "";
      const conditional =
        COND_AFTER.test(tail) || COND_AFTER.test(after) || COND_BEFORE.test(before) ||
        abilityGated(lines, starts, m.index);
      if (conditional) { if (!firstCond) firstCond = val; }
      else { if (!firstUncond) firstUncond = val; }
    }
  }
  return firstUncond || firstCond || 0;
}

// A model's invulnerable save reaches the Sv badge ONLY through its own ability
// named "Invulnerable Save". A save handed out by some OTHER ability is
// situational and must NOT read as a permanent stat — most visibly the Orks'
// Waaagh! ("models in Ork units have a 5+ invulnerable save" only while a
// Waaagh! is called), which alone was painting a 5+ onto every Ork datasheet;
// likewise Kustom Force Field / Defence Line / psychic auras. Scanning only the
// invuln ability drops those cross-ability false positives, while the
// first-unconditional logic still keeps the model's base save over a
// conditional clause within that ability (Wyches 6+, not the 4+-against-melee).
// The name test allows the value-in-name and per-model suffixes ("Invulnerable
// Save (4+)", "Invulnerable Save (Prince Yriel)") and tolerates the one misspelt
// source entry ("Invunerable Save" on the Deredeo Dreadnought).
const INVULN_ABILITY = /^invul?nerable\s*save\b/i;

export function parseInvuln(abilities) {
  const own = (abilities || []).filter(([n]) => INVULN_ABILITY.test(String(n || "").trim()));
  const text = abilityBlob(own);
  return scan(text, [
    // A: "<N>+ invulnerable save<tail>"
    { re: /(\d)\s*\+\s*invul\w*\s*sav\w*([^.;\n]*)/gi, valGroup: 1, ctxGroup: 2 },
    // B: "invulnerable save … <N>+<tail>" (name "Invulnerable Save" + body "4+",
    //    or "invulnerable save of 4+"). Allows non-digit separators incl. " : ".
    { re: /invul\w*\s*sav\w*[^0-9.;\n]{0,16}?(\d)\s*\+([^.;\n]*)/gi, valGroup: 1, ctxGroup: 2 },
  ]);
}

export function parseFnp(abilities) {
  const text = abilityBlob(abilities);
  return scan(text, [
    // "Feel No Pain <N>+<tail>". The bounded non-digit gap crosses the " : "
    // that sits between an ability NAMED "Feel No Pain" and its body "5+".
    { re: /feel\s*no\s*pain[^0-9.;\n]{0,8}?(\d)\s*\+([^.;\n]*)/gi, valGroup: 1, ctxGroup: 2 },
  ]);
}

// Strip the app's inline markup tokens (^^keyword^^, **bold**) and collapse
// whitespace, so a unit name extracted from rule prose reads plainly.
const stripMarkup = (s) => String(s || "").replace(/\^\^|\*\*/g, "").replace(/\s+/g, " ").trim();
// A bullet's text as a clean chip label (markup + trailing punctuation/footnote
// marker removed).
const cleanLeadName = (s) => stripMarkup(s).replace(/[.;]+$/, "").replace(/\s*\*+$/, "").trim();
// Clause words that mark the attachment text as prose / keyword-eligibility
// ("…Daemon units which share a keyword…", "this unit can join…") rather than a
// plain list of datasheet names — those stay a note instead of becoming chips.
const LEAD_PROSE = /\b(which|that|whose|excluding|shares?|select|cannot|unless|even if|instead|keywords?|start of|destroyed|battle-?shock|can join|from your army|within|friendly|enemy|one of the|this unit)\b/i;

// A Character's "Leader" ability lists the units it can be attached to (lead).
// Returns { units:[names…], notes:"trailing caveats" } or null when the unit
// isn't a leader. BSData authors phrase the list several ways, so we handle:
//   • "■" / "-" / "•" bullet lists, one unit per line (Space Marines, Chaos…);
//   • an inline list after the colon, separated by commas / semicolons / "and"
//     — including a single name ("Rubric Marines") and long lists (Inquisitors);
//   • neither — a keyword/eligibility clause ("Infantry Daemon units which…") or
//     a "this unit can join…" phrasing — which we keep verbatim as `notes`.
// The intro ("…attached to the following unit(s):") is dropped (the UI labels
// the section); footnotes after the list are kept as `notes`.
export function parseLeader(abilities) {
  const lead = (abilities || []).find((a) => /^leader\b/i.test(String(a[0] || "").trim()));
  if (!lead) return null;
  const desc = String(lead[1] || "").replace(/\r/g, "");
  const im = desc.match(/attached to the following units?:?/i);
  const body = im ? desc.slice(im.index + im[0].length) : desc;
  const lines = body.split("\n").map((l) => l.trim()).filter(Boolean);

  let units = [];
  const noteLines = [];
  const preLines = [];   // lines before any bullet (inline-list candidate / prose)
  let seenBullet = false;
  for (const l of lines) {
    const m = l.match(/^(?:[■•▪◦‣·]|-)\s+(.+)$/);
    if (m) { seenBullet = true; units.push(cleanLeadName(m[1])); }
    else if (seenBullet) noteLines.push(l);     // caveats listed after the bullets
    else preLines.push(l);
  }
  // No bullets → the first line is the candidate list, the rest are notes. Split
  // it on commas / semicolons / "and" (handles a single name and long lists),
  // unless it reads as prose / a keyword clause, or an item looks sentence-like.
  if (units.length === 0 && preLines.length) {
    const listClean = stripMarkup(preLines[0]).replace(/[.;]+\s*$/, "").trim();
    const parts = listClean
      .split(/\s*[,;&]\s*|\s+and\s+/i)
      .map((s) => s.replace(/^and\s+/i, "").replace(/\s*\*+$/, "").trim())
      .filter(Boolean);
    const listLike = parts.length > 0 && parts.every((p) => p.split(/\s+/).length <= 6);
    if (!LEAD_PROSE.test(listClean) && listLike) {
      units = parts;
      for (let i = 1; i < preLines.length; i++) noteLines.push(preLines[i]);
    } else {
      for (const l of preLines) noteLines.push(l);
    }
  }
  const notes = noteLines.map(stripMarkup).filter(Boolean).join(" ").trim();
  if (units.length === 0 && !notes) return null;
  return { units, notes };
}
