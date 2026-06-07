// ─────────────────────────────────────────────────────────────────────────
// Datasheet presentation module — public surface.
//
// Framework-agnostic. Import what you need:
//
//   import { renderDatasheet } from "./datasheet-presentation/index.js";
//   import "./datasheet-presentation/datasheet.css";
//
//   document.querySelector("#out").innerHTML = renderDatasheet(unit, { lang: "en" });
//
// See README.md for the full unit shape and the formatting/display rules.
// ─────────────────────────────────────────────────────────────────────────

// Theme tokens (colours) — JS object + CSS-variable map.
export { C, cssVars } from "./theme.js";

// Display labels (stat abbreviations, weapon headers, categories, translator).
export {
  LANGS, normalizeLang, tr, SL,
  UNIT_STAT_ABBR, UNIT_STAT_FULL, UNIT_STAT_FULL_BY_KEY,
  WPN_STAT, CAT_LABEL, UI,
} from "./labels.js";

// Inline-markup formatting (BSData **bold** / ^^caps^^ → HTML or plain text).
export {
  escapeHtml, cleanBsdataMarkup, renderMarkupToHtml, sanitizeStratHtml,
} from "./markup.js";

// Derivation rules read out of free-form ability text.
export { parseInvuln, parseFnp, parseLeader } from "./datasheet-rules.js";

// Loadout / display-decision rules ("WHAT to show"): which statlines, the
// weapon pool, default vs option weapons, the live equipped-weapons summary.
export {
  selectStatLines, buildAllWeapons, variantWeaponKeys, computeDefaultWeapons,
  createWeaponResolver, isRealChoice, effectiveGMax, classifyOptions,
  unitModelTotals, resolveEquippedWeapons,
} from "./loadout.js";

// HTML-string renderers.
export {
  renderDatasheet, renderHeader, renderDetail,
  renderStatBar, renderStatLines, renderKeywords,
  renderWeaponTable, renderEquippedWeapons, renderAbilities, renderLeaderBox,
  renderComposition, renderOptions,
} from "./render.js";
