// ─────────────────────────────────────────────────────────────────────────
// Inline-markup formatting rules for BSData rule / ability / enhancement text.
//
// BSData ships emphasis baked into the prose with two markers:
//   **bold**     → bold
//   ^^caps^^     → UPPERCASE (used for faction tags, keywords)
//   **^^both^^** → bold UPPERCASE (a faction name wrapped in both)
//
// BSData is INCONSISTENT about marker order / nesting — **^^X^^**, ^^**X**^^
// and the crossed forms ^^**X^^** / **^^X**^^ all occur — so the combined case
// accepts the two markers in any order on each side. Stray / unpaired markers
// are malformed data and are stripped so a lone ** or ^^ never reaches screen
// (a single "*", e.g. the "5+*" invuln footnote, is left intact).
//
// This is the framework-agnostic twin of App.jsx's `renderMarkup` (which built
// React nodes); here we build an HTML string. All literal text is HTML-escaped,
// so the output is safe to drop into innerHTML.
// ─────────────────────────────────────────────────────────────────────────

export function escapeHtml(s) {
  return String(s == null ? "" : s).replace(/[&<>"']/g, (c) => (
    { "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]
  ));
}

// Plain-text de-markup: drop every marker, keep the words. Use when you need a
// bare string (CTRL+F target, tooltip, alt text) rather than styled output.
//   "^^**Grey Knights**^^"  →  "Grey Knights"
export function cleanBsdataMarkup(s) {
  if (typeof s !== "string") return "";
  return s
    .replace(/\^\^\*\*([^*]+?)\*\*\^\^/g, "$1")
    .replace(/\*\*\^\^([^*]+?)\^\^\*\*/g, "$1")
    .replace(/\^\^/g, "")
    .replace(/\*\*/g, "");
}

// Styled de-markup → HTML string.
//   **^^X^^** / ^^**X**^^  → <strong>X-UPPERCASED</strong>
//   **X**                  → <strong>X</strong>
//   ^^X^^                  → <span class="ds-caps">X</span>   (CSS: text-transform:uppercase)
// Returns the (escaped) original string when there is no markup.
export function renderMarkupToHtml(text) {
  if (typeof text !== "string" || !text) return escapeHtml(text == null ? "" : text);
  const re = /(?:\*\*\^\^|\^\^\*\*)([^*^]+?)(?:\*\*\^\^|\^\^\*\*)|\*\*([^*]+?)\*\*|\^\^([^^]+?)\^\^/g;
  // Any leftover markers in the un-styled spans are stray/unpaired; drop them.
  const strip = (s) => s.replace(/\*\*|\^\^/g, "");
  let out = "", last = 0, m;
  while ((m = re.exec(text))) {
    if (m.index > last) out += escapeHtml(strip(text.slice(last, m.index)));
    if (m[1] != null) out += "<strong>" + escapeHtml(m[1].toUpperCase()) + "</strong>";
    else if (m[2] != null) out += "<strong>" + escapeHtml(m[2]) + "</strong>";
    else out += '<span class="ds-caps">' + escapeHtml(m[3]) + "</span>";
    last = re.lastIndex;
  }
  if (last === 0) return escapeHtml(strip(text));
  if (last < text.length) out += escapeHtml(strip(text.slice(last)));
  return out;
}

// Wahapedia stratagem descriptions arrive as a snippet of HTML — labels like
// "<b>WHEN:</b>", "<br>" line breaks, occasional <a> wiki links. Render the
// safe subset (<b>/<i>/<em>/<strong>/<br>) verbatim and strip everything else;
// anchors collapse to their inner text. Anything off the allowlist is dropped,
// which keeps the result safe from script/style/event-handler injection.
export function sanitizeStratHtml(s) {
  if (typeof s !== "string") return "";
  return s
    .replace(/<a\b[^>]*>([\s\S]*?)<\/a>/gi, "$1")
    .replace(/<(?!\/?(?:b|i|em|strong|br)\b)[^>]*>/gi, "")
    .replace(/<br\s*\/?>/gi, "<br/>");
}
