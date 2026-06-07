# Datasheet presentation module

A **self-contained, framework-agnostic** bundle that renders Warhammer 40k 10th-
edition datasheets cleanly, with all the formatting and display rules extracted
from Cogitator Bellicum. No React, no build step, no runtime dependencies — the
renderers return **HTML strings** you drop into `innerHTML`, a template, or an
SSR response, and one CSS file paints them.

```
datasheet-presentation/
├── index.js            ← barrel: import everything from here
├── theme.js            ← colour tokens (C) + CSS-variable map
├── labels.js           ← stat/weapon/category labels (FR + EN) + translator
├── markup.js           ← BSData **bold** / ^^caps^^ → HTML or plain text
├── datasheet-rules.js  ← invuln / Feel No Pain / "Leader" derivation rules
├── loadout.js          ← display-DECISION rules: which stats / which weapons to show
├── render.js           ← HTML-string renderers (the actual layout)
├── datasheet.css       ← standalone stylesheet (scoped under .ds-sheet)
├── example.unit.json   ← a sample unit
├── EXAMPLES.md         ← worked cases: Gretchin, Plague Marines, Cadian Shock Troops
├── preview.html        ← open in a browser to see EN + FR side by side
└── README.md
```

> **Intended use — the preview layer of a datasheet editor.** This module is the
> *rendering / display-rules* half of a datasheet editor for the BSData fork. It
> turns a parsed `unit` object into a faithful datasheet preview. An editor adds
> two more pieces around it: a **parser** (BSData XML → the `unit` shape — see
> `scripts/bsdata-parser.mjs` in the Cogitator repo) on the way in, and a
> **write-back** (edited `unit` → BSData XML) on the way out. Render a live
> preview from the in-progress `unit` after every edit.

## Quick start

```js
import { renderDatasheet } from "./datasheet-presentation/index.js";
// In a bundler that handles CSS imports:
import "./datasheet-presentation/datasheet.css";
// …or in plain HTML: <link rel="stylesheet" href="datasheet-presentation/datasheet.css">

const html = renderDatasheet(unit, { lang: "en" });   // "fr" | "en"
document.querySelector("#out").innerHTML = html;
```

Open **`preview.html`** in any browser for a live EN/FR sample (no server needed).

The renderers are pure string functions — they run identically in the browser,
in Node (SSR / static export), or a worker. The only thing the CSS needs from
the network is the Google Fonts `@import` at the top of `datasheet.css`; delete
that line if your host app already loads Cinzel / Crimson Text / JetBrains Mono.

## The `unit` shape

All fields are optional; a renderer skips the section whose data is missing.

| field        | type                                   | notes |
|--------------|----------------------------------------|-------|
| `name`       | string                                 | unit name (header) |
| `cat`        | string                                 | category key, see `CAT_LABEL` (`Character`, `Vehicle`, …) |
| `pts`        | number                                 | points cost (header + composition) |
| `stats`      | `[M,T,SV,W,LD,OC]`                      | one statline; values are strings or numbers |
| `statLines`  | `[[modelName,[…6 stats]], …]`          | multiple profiles — **overrides** `stats`, one captioned bar each |
| `keywords`   | `string[]`                             | keyword chips |
| `weapons`    | `[{n,t,rng,a,sk,s,ap,d,kw,count}]`     | see below |
| `abilities`  | `[[name, desc], …]`                    | `desc:""` → "core" chip; non-empty → described block |
| `comp`       | composition groups                     | see *Composition* |
| `opts`       | option groups                          | see *Options* |
| `minM,maxM`  | number                                 | model-count range (composition header) |
| `tiers`      | `[[atModels, pts], …]`                 | cost tiers shown in the composition header |
| `isEpic` `isChar` `isAllied` `isCrusade` `isLegend` `inArmy` | bool | header chips |

A **weapon** `w`:

- `n` — name
- `t` — `"R"` (ranged) or `"M"` (melee); drives the row's coloured badge
- `rng a sk s ap d` — the profile. `sk` is the to-hit value (BS for ranged, WS for
  melee) and renders under the localised **BS/WS** column
- `kw` — keyword string (e.g. `"Rapid Fire 2"`); `"-"` or empty hides the sub-line
- `count` — quantity; `> 1` is highlighted gold. Per-weapon `count` wins over a
  table-wide `count` option, so one table can mix differently-equipped profiles.

`abilities` is a list of `[name, desc]` pairs (BSData's shape). The
invulnerable-save and `Leader` abilities are **not** passed as extra fields —
they are derived from this text (see below) and hidden from the generic list so
they don't echo.

## Formatting & display rules

These are the rules the module encodes — the reason it exists rather than being a
plain template.

### Statlines
- Fixed order **M · T · SV · W · LD · OC** (`SL` in `labels.js`); never reorder.
- Labels and full tooltip names are localised (`UNIT_STAT_ABBR` / `UNIT_STAT_FULL`);
  the underlying values are rendered verbatim.
- A blank value shows as an en-dash `-`.
- When a datasheet fields several model profiles (Boyz + Boss Nob, Gretchin +
  Runtherd), pass `statLines`; each renders as its own bar captioned with the
  model that carries it.

### Invulnerable save
- Derived from ability text by `parseInvuln(abilities)` and shown as a gold
  **`/4+`** suffix on the **SV** cell — never as its own row.
- Only a model's **own** ability literally named *"Invulnerable Save"* counts. A
  save handed out by some *other* ability (Orks' Waaagh!, Kustom Force Field,
  psychic auras) is situational and must **not** paint a permanent stat.
- Within that ability, the **first unconditional** value wins over a later
  conditional clause (Wyches read 6+, not the 4+-against-melee).

### Feel No Pain
- `parseFnp(abilities)` returns the FnP value with the same conditional logic.
  It is exposed for callers that want to badge it; the default card does not.

### "Can lead" panel
- `parseLeader(abilities)` reads a Character's `Leader` ability into
  `{ units: […names], notes: "caveats" }`, handling bullet lists, inline
  comma/"and" lists, and keeping eligibility prose as a note. The raw `Leader`
  ability is dropped from the generic list to avoid echo; the panel shows the
  attachable units as chips plus any trailing caveats.

### Weapon table
- Nine fixed columns: badge · `#` · Weapon · Rng · A · BS/WS · S · AP · D, all
  localised. Ranged rows get a blue badge, melee rows a red one.
- `table-layout: fixed` + per-column widths keep the grid stable; long tokens
  (keywords, big numbers) are force-broken and clipped so nothing crashes into
  the next cell. A mobile breakpoint re-tunes the widths so the whole table fits
  a phone and the weapon name keeps real room.

### Abilities
- An ability with an **empty description** is a flag/keyword → rendered as a gold
  "core" chip.
- An ability **with** prose → a block with the name in display font and the rule
  text below.

### Inline markup (`markup.js`)
BSData bakes emphasis into the prose with two markers, in **any order/nesting**:

| source                | meaning            | output |
|-----------------------|--------------------|--------|
| `**bold**`            | bold               | `<strong>bold</strong>` |
| `^^caps^^`            | uppercase          | `<span class="ds-caps">caps</span>` |
| `**^^both^^**` (any order) | bold + uppercase | `<strong>BOTH</strong>` |

- Stray / unpaired markers are malformed data and are **stripped** so a lone `**`
  or `^^` never reaches the screen (a single `*`, e.g. the `5+*` footnote, is
  kept).
- All literal text is HTML-escaped, so `renderMarkupToHtml` output is safe for
  `innerHTML`.
- `cleanBsdataMarkup` gives the bare string (no styling) for tooltips / search.
- `sanitizeStratHtml` renders the safe `<b>/<i>/<em>/<strong>/<br>` subset of
  Wahapedia stratagem HTML and drops everything else (anchors collapse to text).

### Composition & options
- **Composition** groups list the unit's models with min/max counts; a `_fixed`
  group is the always-present core (its sub-options, e.g. a champion's weapon
  choices, render indented). The header shows the model-count range and any cost
  tiers.
- **Options** groups list wargear choices as chips with their points deltas.

### Display-decision rules (`loadout.js`) — *what* to show
These pure functions decide the content the renderers draw; see **EXAMPLES.md**
for the Gretchin / Plague Marines / Cadian Shock Troops walk-throughs.

- **Which statline(s)** — `selectStatLines(unit)`: per-model profiles when
  `statLines` is present (Gretchin + Runtherd), else a single bar, else nothing.
- **The weapon pool** — `buildAllWeapons(item)` folds every model's profiles into
  `item.weapons`, deduped (ignoring `➤`/`➜` sub-profile sigils).
- **Default vs variant weapons** — `computeDefaultWeapons` drops weapons keyed to
  a `"<model> w/ <weapon>"` variant and `" - "` sub-profiles, leaving the
  always-on loadout.
- **Choice → profile resolution** — `createWeaponResolver({allWeapons, wpnDict})`
  returns `getChoiceWeapons` (a 7-step fuzzy resolver: exact → combo split →
  prefix strip → singular → last-2-words → dict contains → pool contains), always
  preferring the unit's own profile over faction-wide homonyms.
- **Real choices** — `isRealChoice(o)` filters out "take-everything" groups;
  `effectiveGMax(o)` is the displayable max; `classifyOptions(...)` buckets groups
  into unit-level / model-level / counter groups.
- **Live equipped weapons** — `resolveEquippedWeapons(item, {wpnDict})` returns
  what's *actually equipped right now* for a no-composition unit: integrated
  weapons plus the profiles granted by the **selected** option choices, with
  counts. Switching a wargear pick swaps the weapon in the result.
- **Model counts** — `unitModelTotals(item)` → `{compCount, totalM, minM, maxM,
  totalInvalid}` for the composition header / validity flag.

## Theming

Colours live as CSS custom properties on `.ds-sheet` (mirrored by the `C` object
in `theme.js`). To re-skin, override the `--ds-*` variables on or above the
`.ds-sheet` element — no JS change:

```css
.ds-sheet { --ds-g: #b08d57; --ds-bg: #101014; }
```

Or inject them programmatically with `cssVars()` from `theme.js`.

Every class is `ds-`-prefixed and every rule is scoped under `.ds-sheet`, so the
stylesheet cannot collide with the host app.

## API

```js
// Top level
renderDatasheet(unit, { lang = "fr", header = true })   // full card
renderHeader(unit, { lang })                            // header strip only
renderDetail(unit, { lang })                            // body only

// Sections (compose your own layout)
renderStatBar(stats, { invuln, lang })
renderStatLines(unit, { lang })
renderKeywords(keywords)
renderWeaponTable(weapons, { lang, count, noHeader })
renderEquippedWeapons(item, { lang, wpnDict })   // live "what's equipped now" table
renderAbilities(abilities, { hide })
renderLeaderBox(leads, { lang })
renderComposition(unit, { lang })
renderOptions(unit)

// Display-decision rules (pure, no rendering) — see EXAMPLES.md
selectStatLines(unit) → [{ caption, stats }]
buildAllWeapons(item) → weapons[]
variantWeaponKeys(comp) → Set
computeDefaultWeapons(allWeapons, comp) → weapons[]
createWeaponResolver({ allWeapons, wpnDict }) → { getChoiceWeapons, matchWeapons, getWeaponCount, resolveOne, lookupWeapons, choiceWeapons }
isRealChoice(o) → bool   ·   effectiveGMax(o) → number
classifyOptions({ opts, comp, showCrusade }) → { multiGroups, modelOpts, singleGroups, getModelOpts }
resolveEquippedWeapons(item, { wpnDict }) → weapons[]   // with counts
unitModelTotals(item) → { compCount, multiCount, totalM, minM, maxM, totalInvalid }

// Derivation rules (pure, no rendering)
parseInvuln(abilities) → number   // 0 = none
parseFnp(abilities)    → number
parseLeader(abilities) → { units, notes } | null

// Markup
renderMarkupToHtml(text) → html string
cleanBsdataMarkup(text)  → plain string
sanitizeStratHtml(html)  → safe-subset html
escapeHtml(text)         → escaped string

// Data
SL, UNIT_STAT_ABBR, UNIT_STAT_FULL, WPN_STAT, CAT_LABEL, UI, tr, normalizeLang, LANGS
C, cssVars
```

## React (or any framework) host

The output is a string, so wrapping it is trivial:

```jsx
function Datasheet({ unit, lang }) {
  return <div dangerouslySetInnerHTML={{ __html: renderDatasheet(unit, { lang }) }} />;
}
```

`renderMarkupToHtml` escapes all literal text, so this is safe for the
BSData-sourced content the module targets. If you feed it untrusted HTML from
elsewhere, run it through your own sanitiser first.

## Provenance

Extracted from Cogitator Bellicum:
- derivation rules ← `src/sim/datasheet.js` (copied verbatim)
- labels ← `src/i18n-data.js`
- colours ← `src/theme.js`
- markup + layout ← the `renderMarkup`, `StatBar`, `StatLines`, `WeaponTable`,
  `LeaderBox`, `UnitDetail` components and the CSS block in `src/App.jsx`,
  rewritten from React/JSX to framework-agnostic HTML strings.
- display-decision rules ← the `UnitBuilder` component in `src/App.jsx`
  (`allWeapons`, `defaultWeapons`, `getChoiceWeapons`, `matchWeapons`,
  `isRealChoice`, the no-composition equipped-weapons summary), de-closured into
  the pure functions in `loadout.js`.
