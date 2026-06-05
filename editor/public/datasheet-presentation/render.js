// ─────────────────────────────────────────────────────────────────────────
// Framework-agnostic datasheet renderer.
//
// Every function takes a plain data object and returns an HTML STRING built
// from the `ds-` classes in datasheet.css. No React, no DOM — drop the output
// into innerHTML, a template, an SSR response, etc. This is the portable twin
// of App.jsx's StatBar / StatLines / WeaponTable / LeaderBox / UnitDetail JSX.
//
// The UNIT shape it expects (all fields optional unless noted):
//   name        string                       unit name
//   cat         string                       category key (see CAT_LABEL)
//   pts         number                       points cost
//   stats       [M,T,SV,W,LD,OC]             single statline (strings/numbers)
//   statLines   [[modelName, [..6 stats]]]   multi-profile statlines (overrides `stats`)
//   keywords    string[]                     keyword chips
//   weapons     [{n,t,rng,a,sk,s,ap,d,kw,count}]
//                 n=name  t="R"|"M" (ranged/melee)  rng a sk s ap d = profile
//                 sk = the to-hit (BS for ranged, WS for melee)  kw=keywords  count=qty
//   abilities   [[name, desc]]               desc "" → a "core" chip; non-empty → described
//   comp        composition groups (see renderComposition)
//   opts        option groups   (see renderOptions)
//   minM,maxM   number                       model count range (composition header)
//   pts,tiers   number / [[atModels, pts]]   cost tiers
//   isEpic,isChar,isAllied,isCrusade,isLegend  bool  → header chips
//   isWarlord, inArmy  bool                  → header chips
//
// Invulnerable save, Feel No Pain and the "Can lead" list are DERIVED from the
// ability text by datasheet-rules.js — callers do not supply them.
// ─────────────────────────────────────────────────────────────────────────

import { escapeHtml, renderMarkupToHtml } from "./markup.js";
import { parseInvuln, parseLeader } from "./datasheet-rules.js";
import { selectStatLines, resolveEquippedWeapons } from "./loadout.js";
import {
  SL, UNIT_STAT_ABBR, UNIT_STAT_FULL, WPN_STAT, CAT_LABEL, UI,
  normalizeLang, tr,
} from "./labels.js";

const v = (x) => (x == null || x === "" ? "-" : x); // statline blank → en-dash

// ─── One M/T/SV/W/LD/OC bar ─────────────────────────────────────────────────
export function renderStatBar(stats, { invuln = 0, lang = "fr" } = {}) {
  lang = normalizeLang(lang);
  const lab = UNIT_STAT_ABBR[lang], full = UNIT_STAT_FULL[lang];
  const cells = SL.map((key, i) => {
    const val = escapeHtml(String(v((stats || [])[i])));
    // The Save cell carries the invulnerable save as a "/4+" gold suffix.
    const suffix = key === "SV" && invuln > 0 ? `<span class="ds-invuln">/${invuln}+</span>` : "";
    return `<div class="ds-sx" title="${escapeHtml(full[i])}">`
      + `<div class="ds-sx-l">${escapeHtml(lab[i])}</div>`
      + `<div class="ds-sx-v">${val}${suffix}</div></div>`;
  }).join("");
  return `<div class="ds-sb">${cells}</div>`;
}

// ─── The unit's statline(s): one primary bar, or one captioned bar per model
//     profile when the datasheet fields several distinct statlines. ──────────
export function renderStatLines(unit, { lang = "fr" } = {}) {
  const invuln = parseInvuln(unit.abilities || []);
  // selectStatLines() encodes the "which stats to show" rule (per-model
  // profiles when present, else a single bar, else nothing).
  return selectStatLines(unit).map(({ caption, stats }) =>
    `<div class="ds-statline">`
    + (caption ? `<div class="ds-statline-cap">${escapeHtml(caption)}</div>` : "")
    + renderStatBar(stats, { invuln, lang })
    + `</div>`).join("");
}

// The live equipped-weapons table for a unit with NO model composition:
// integrated weapons + the profiles granted by the currently selected option
// choices, with counts (see loadout.resolveEquippedWeapons). Pass `wpnDict`
// (the faction-wide weapon dictionary) so fuzzy choice→profile lookups resolve.
export function renderEquippedWeapons(item, { lang = "fr", wpnDict = {} } = {}) {
  const weapons = resolveEquippedWeapons(item, { wpnDict });
  return renderWeaponTable(weapons, { lang });
}

// ─── Keyword chips ──────────────────────────────────────────────────────────
export function renderKeywords(keywords) {
  if (!keywords || !keywords.length) return "";
  return `<div class="ds-kw-row">`
    + keywords.map((k) => `<span class="ds-kw">${escapeHtml(k)}</span>`).join("")
    + `</div>`;
}

// ─── Weapon profile table ───────────────────────────────────────────────────
export function renderWeaponTable(weapons, { lang = "fr", count = 0, noHeader = false } = {}) {
  if (!weapons || !weapons.length) return "";
  lang = normalizeLang(lang);
  const ws = WPN_STAT[lang];
  const cols = `<colgroup><col class="ds-wc0"/><col class="ds-wcq"/><col class="ds-wc1"/>`
    + `<col class="ds-wc2"/><col class="ds-wc3"/><col class="ds-wc4"/>`
    + `<col class="ds-wc5"/><col class="ds-wc6"/><col class="ds-wc7"/></colgroup>`;
  const weaponHdr = ws.weapon.charAt(0) + ws.weapon.slice(1).toLowerCase();
  const head = noHeader ? "" :
    `<thead><tr><th></th><th>#</th><th>${escapeHtml(weaponHdr)}</th>`
    + `<th>${escapeHtml(ws.range)}</th><th>${escapeHtml(ws.a)}</th><th>${escapeHtml(ws.bsws)}</th>`
    + `<th>${escapeHtml(ws.s)}</th><th>${escapeHtml(ws.ap)}</th><th>${escapeHtml(ws.d)}</th></tr></thead>`;
  const rows = weapons.map((w) => {
    // Per-weapon count wins over the table-wide count, so one table can mix
    // profiles equipped in different quantities (2 bolters, 1 hull, …).
    const c = (w.count != null && w.count > 0) ? w.count : (count > 0 ? count : 1);
    const tag = w.t === "R" ? ws.rngTag : ws.melTag;
    const badge = `<span class="ds-wb ds-wb-${w.t === "R" ? "R" : "M"}">${escapeHtml(tag)}</span>`;
    const kw = w.kw && w.kw !== "-" ? `<div class="ds-wt-kw">[${escapeHtml(w.kw)}]</div>` : "";
    return `<tr><td>${badge}</td>`
      + `<td class="ds-wt-q${c > 1 ? " ds-many" : ""}">${escapeHtml(String(c))}</td>`
      + `<td class="ds-wt-name">${escapeHtml(w.n)}${kw}</td>`
      + `<td>${escapeHtml(v(w.rng))}</td><td>${escapeHtml(v(w.a))}</td><td>${escapeHtml(v(w.sk))}</td>`
      + `<td>${escapeHtml(v(w.s))}</td><td>${escapeHtml(v(w.ap))}</td><td>${escapeHtml(v(w.d))}</td></tr>`;
  }).join("");
  return `<table class="ds-wt">${cols}${head}<tbody>${rows}</tbody></table>`;
}

// ─── Abilities: bare-name ones become "core" chips; described ones get a block
//     with the rule prose (markup → styled HTML). The invulnerable-save and
//     Leader abilities are hidden here because they surface elsewhere (the Sv
//     badge and the "Can lead" panel). ───────────────────────────────────────
export function renderAbilities(abilities, { hide = [] } = {}) {
  if (!abilities || !abilities.length) return "";
  const hidden = new Set(hide.map((h) => h.toLowerCase()));
  const shown = abilities.filter((a) => !hidden.has(String(a[0] || "").trim().toLowerCase()));
  const core = shown.filter((a) => !(a[1] && String(a[1]).trim()));
  const desc = shown.filter((a) => a[1] && String(a[1]).trim());
  let out = "";
  if (core.length) {
    out += `<div class="ds-core-row">`
      + core.map((a) => `<span class="ds-core-ab">${escapeHtml(a[0])}</span>`).join("")
      + `</div>`;
  }
  if (desc.length) {
    out += `<div class="ds-ab-block">`
      + desc.map((a) =>
        `<div class="ds-ab-row"><span class="ds-ab-name">${escapeHtml(a[0])}</span>`
        + `<span class="ds-ab-desc">${renderMarkupToHtml(a[1])}</span></div>`).join("")
      + `</div>`;
  }
  return out;
}

// ─── "Can lead" panel (the units a Character can attach to + caveats). ───────
export function renderLeaderBox(leads, { lang = "fr" } = {}) {
  if (!leads) return "";
  const t = UI[normalizeLang(lang)];
  const units = leads.units.length
    ? `<div class="ds-leader-units">`
      + leads.units.map((u) => `<span class="ds-kw">${escapeHtml(u)}</span>`).join("")
      + `</div>` : "";
  const notes = leads.notes
    ? `<div class="ds-leader-notes">${renderMarkupToHtml(leads.notes)}</div>` : "";
  return `<div class="ds-leader"><div class="ds-leader-h">${escapeHtml(t.canLead)}</div>${units}${notes}</div>`;
}

// ─── Composition. Each group `g` is:
//       g[0] groupName | "_fixed"   g[1],g[2] min,max   g[3] [[modelName,max]]
//       g[4] (fixed only) sub-options [[label, [choices]]]
//     plus unit.minM/maxM and optional cost tiers unit.tiers = [[atModels, pts]].
export function renderComposition(unit, { lang = "fr" } = {}) {
  const comp = unit.comp;
  if (!comp || !comp.length) return "";
  const t = UI[normalizeLang(lang)];
  const cost = (unit.tiers && unit.tiers.length)
    ? `<span class="ds-comp-cost">${escapeHtml(t.cost)}${escapeHtml(String(unit.pts))}pts`
      + unit.tiers.map((tt) => ` → ${escapeHtml(String(tt[1]))}pts (≥${escapeHtml(String(tt[0]))})`).join("")
      + `</span>` : "";
  const header = `<div class="ds-comp-h">${escapeHtml(t.composition)} `
    + `(${escapeHtml(String(unit.minM))}-${escapeHtml(String(unit.maxM))} ${escapeHtml(t.models)})${cost}</div>`;
  const groups = comp.map((g) => {
    if (g[0] === "_fixed") {
      const lines = (g[3] || []).map((m) => {
        const subs = (g[4] || []).map((so) =>
          `<div class="ds-comp-sub">↳ ${escapeHtml(so[0])}: ${escapeHtml((so[1] || []).join(" / "))}</div>`).join("");
        return `<div><div class="ds-comp-fixed">■ ${escapeHtml(m[0])} (${escapeHtml(t.fixed)})</div>${subs}</div>`;
      }).join("");
      return `<div class="ds-comp-g">${lines}</div>`;
    }
    const label = `<div class="ds-comp-glabel">${escapeHtml(g[0])} `
      + `(${escapeHtml(String(g[1]))}-${escapeHtml(String(g[2]))} ${escapeHtml(t.models)})</div>`;
    const models = (g[3] || []).map((m) =>
      `<div class="ds-comp-m">· ${escapeHtml(m[0])} <span class="ds-comp-max">max ${escapeHtml(String(m[1]))}</span></div>`).join("");
    return `<div class="ds-comp-g">${label}${models}</div>`;
  }).join("");
  return `<div class="ds-comp">${header}${groups}</div>`;
}

// ─── Wargear / options. Each group `o`: o[0] label, o[1] choices [[name, pts]].
export function renderOptions(unit) {
  const opts = unit.opts;
  if (!opts || !opts.length) return "";
  return `<div>` + opts.map((o) => {
    const chips = (o[1] || []).map((ch) =>
      `<span class="ds-opt-chip">${escapeHtml(ch[0])}${ch[1] > 0 ? " +" + escapeHtml(String(ch[1])) + "pts" : ""}</span>`).join("");
    return `<div class="ds-opt"><div class="ds-opt-l">${escapeHtml(o[0])}</div>`
      + `<div class="ds-opt-chips">${chips}</div></div>`;
  }).join("") + `</div>`;
}

// ─── Card header: category chip · name · special chips · points. ────────────
export function renderHeader(unit, { lang = "fr" } = {}) {
  lang = normalizeLang(lang);
  const catLabel = (CAT_LABEL[lang] || {})[unit.cat] || unit.cat || CAT_LABEL[lang].Other;
  const chips = [];
  if (unit.isEpic) chips.push(`<span class="ds-kw ds-kw-e">${escapeHtml(tr(lang, "Héros Épique", "Epic Hero"))}</span>`);
  if (unit.isChar && !unit.isEpic) chips.push(`<span class="ds-kw ds-kw-c">${escapeHtml(tr(lang, "Personnage", "Character"))}</span>`);
  if (unit.isAllied) chips.push(`<span class="ds-kw ds-kw-a">${escapeHtml(tr(lang, "Allié", "Allied"))}</span>`);
  if (unit.isCrusade) chips.push(`<span class="ds-kw ds-kw-x">${escapeHtml(tr(lang, "Croisade", "Crusade"))}</span>`);
  if (unit.isLegend) chips.push(`<span class="ds-kw ds-kw-l">${escapeHtml(tr(lang, "Légendes", "Legends"))}</span>`);
  if (unit.inArmy) chips.push(`<span class="ds-kw ds-kw-ok">✓</span>`);
  const chipRow = chips.length ? `<div class="ds-uc-kw">${chips.join("")}</div>` : "";
  return `<div class="ds-uc"><div class="ds-uc-r">`
    + `<span class="ds-uc-ct">${escapeHtml(catLabel)}</span>`
    + `<span class="ds-uc-n${unit.isLegend ? " ds-leg" : ""}">${escapeHtml(unit.name)}</span>`
    + (unit.pts != null ? `<span class="ds-uc-p">${escapeHtml(String(unit.pts))}</span>` : "")
    + `</div>${chipRow}</div>`;
}

// ─── The detail body (everything below the header). ─────────────────────────
export function renderDetail(unit, { lang = "fr" } = {}) {
  const invuln = parseInvuln(unit.abilities || []);
  const leads = parseLeader(unit.abilities || []);
  // Hide abilities re-surfaced elsewhere: the invuln save (Sv badge) and the
  // "Leader" ability (the "Can lead" panel).
  const hide = [];
  if (invuln > 0) hide.push("invulnerable save");
  if (leads) hide.push("leader");
  return `<div class="ds-ud">`
    + renderStatLines(unit, { lang })
    + renderKeywords(unit.keywords)
    + renderWeaponTable(unit.weapons, { lang })
    + renderAbilities(unit.abilities, { hide })
    + renderLeaderBox(leads, { lang })
    + renderComposition(unit, { lang })
    + renderOptions(unit)
    + `</div>`;
}

// ─── Top-level: the full datasheet (header + detail), wrapped in the `.ds-sheet`
//     theme scope so the CSS variables and fonts apply. ──────────────────────
export function renderDatasheet(unit, { lang = "fr", header = true } = {}) {
  return `<div class="ds-sheet">`
    + (header ? renderHeader(unit, { lang }) : "")
    + renderDetail(unit, { lang })
    + `</div>`;
}
