// ─────────────────────────────────────────────────────────────────────────
// Theme tokens — the dark "cogitator" palette the datasheet UI is painted in.
//
// These are the single source of truth for the module's colours. They exist
// in two forms:
//   • the `C` object, for code that builds inline styles in JS;
//   • the CSS custom properties on `.ds-sheet` in datasheet.css, which carry
//     the SAME values (kept in sync with `cssVars()` below).
//
// To re-skin the datasheets in a host project, override the `--ds-*` CSS
// variables on (or above) the `.ds-sheet` element — no JS change needed.
// ─────────────────────────────────────────────────────────────────────────

export const C = {
  bg: "#07070a",   // page background (deepest)
  p:  "#0e0e13",   // panel background
  ph: "#161620",   // raised/highlight panel
  bd: "#252530",   // borders / dividers
  g:  "#c9a84c",   // gold — primary accent (points, invuln badge, CTAs)
  gb: "#e8cc5c",   // gold bright (gradients, big numbers)
  gd: "#6b5a2a",   // gold dim
  gbr:"#8b7536",   // gold border (dashed CTAs, epic-hero chip)
  t:  "#d4d0c8",   // text — default body
  td: "#7a7670",   // text dim (labels, secondary)
  tb: "#f0ece4",   // text bright (names, stat values)
  r:  "#c44040",   // red — errors / melee badge
  gr: "#4caf50",   // green — valid / in-army tick
  bl: "#4a90c4",   // blue — section captions / ranged badge
};

// The same palette as `--ds-*` CSS custom-property declarations, for callers
// that want to inject the theme programmatically instead of via datasheet.css.
export function cssVars() {
  return {
    "--ds-bg": C.bg, "--ds-p": C.p, "--ds-ph": C.ph, "--ds-bd": C.bd,
    "--ds-g": C.g, "--ds-gb": C.gb, "--ds-gd": C.gd, "--ds-gbr": C.gbr,
    "--ds-t": C.t, "--ds-td": C.td, "--ds-tb": C.tb,
    "--ds-r": C.r, "--ds-gr": C.gr, "--ds-bl": C.bl,
  };
}
