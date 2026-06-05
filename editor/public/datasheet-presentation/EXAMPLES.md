# Worked examples — the tricky display-decision cases

The three units below are the ones that exercise every awkward branch of the
loadout / display-decision rules in `loadout.js`. Each section maps the unit to
the exact functions that decide **what to show**.

---

## 1. Gretchin — *when to show which statline*

**The case.** A Gretchin Mob datasheet fields **two different model profiles** in
one unit: the Gretchin (T2, Sv 7+) and the Runtherd (T3, Sv 6+) who babysits
them. They cannot share a single stat bar.

**The rule.** `selectStatLines(unit)` looks at `unit.statLines` first:

```js
unit.statLines = [
  ["Gretchin", ["6\"", "2", "7+", "1", "7", "1"]],
  ["Runtherd", ["6\"", "3", "6+", "1", "6", "1"]],
];
selectStatLines(unit);
// → [{caption:"Gretchin", stats:[…]}, {caption:"Runtherd", stats:[…]}]
```

- When `statLines` is present and non-empty → **one captioned bar per profile**.
- Otherwise, when `unit.stats` exists → **one un-captioned bar**.
- Otherwise → **nothing** (`[]`).

`renderStatLines` consumes exactly this, so a single-profile Space Marine shows
one bar while the Gretchin Mob shows two, each labelled with the model that
carries it. This is the whole "when to show unit stats" decision — there is no
special-casing per faction, only the `statLines`-vs-`stats`-vs-nothing ladder.

---

## 2. Plague Marines — *default weapons, variants, and a shared cap*

**The case.** A Plague Marine squad is one composition group with several model
*variants* and a shared limit:

- a `_fixed` **Plague Champion** (always exactly 1);
- plain **Plague Marines**, each carrying default weapons (boltgun, plague knife,
  blight grenades);
- variant models like **"Plague Marine w/ heavy plague weapon"** and
  **"Plague Marine w/ plague spewer"** — the *special weapons*;
- a rule: **max 2 special weapons** in the unit, shared across those variants.

**The shapes.** The composition group tuple is
`[name, min, max, models, modelOpts, subCaps]`, and each model is
`[name, modelMax, weapons, defaultAmount, modelMin, abilities]`:

```js
comp = [[
  "Plague Marines", 5, 10,
  [
    ["Plague Champion", 1, [/* champion weapons */], 1, 1, []],
    ["Plague Marine", 9, [["Boltgun","R","24\"","2","3+","4","0","1","Rapid Fire 1"], …], 0, 0, []],
    ["Plague Marine w/ heavy plague weapon", 2, [/* heavy plague weapon profile */], 0, 0, []],
  ],
  [],
  // subCaps: [name, max, memberModelNames, bsId, modifiers, maxConstraintId]
  [["Special weapons", 2, ["Plague Marine w/ heavy plague weapon", "Plague Marine w/ plague spewer"], "sw-id", [], ""]],
]];
```

**The rules in play.**

1. **The weapon pool** — `buildAllWeapons(item)` folds every model's `m[2]`
   profiles into `item.weapons` (deduped, ignoring the `➤`/`➜` sub-profile
   sigils), so the Champion's plasma and the squad's boltgun all live in one
   pool.

2. **Default vs variant weapons** — `variantWeaponKeys(comp)` reads the
   `"<model> w/ <weapon>"` model names and collects `heavy plague weapon`,
   `plague spewer`, … `computeDefaultWeapons(allWeapons, comp)` then returns the
   profiles **shared by every model** (boltgun, plague knife) by dropping those
   variant-keyed weapons and the `" - "` sub-profiles. That is precisely "which
   weapons are the default loadout to show, vs which belong to a variant".

3. **Per-model display** — for each model row the renderer shows `m[2]`
   (`hasExplicitWpns = m.length > 2 && Array.isArray(m[2])`); an **explicit empty
   `m[2]`** means "this model's weapons come from its option group, show none",
   which is different from a legacy model with no per-model data (fall back to
   `allWeapons`). The Champion's plasma swap is applied by filtering out the
   default profile when an option in his group replaces it.

4. **The shared cap** — the `subCaps` entry (`g[5]`) is the "max 2 special
   weapons" pool. The host app sums the member models' counts and flags the group
   red past 2 (the renderer in `src/App.jsx` shows it as a `↳ Special weapons
   (shared) 1/2` sub-header). `loadout.js` surfaces the data; the count/validity
   math lives with the host because it ties into the points/modifier engine.

---

## 3. Cadian Shock Troops — *a squad-layout choice that drives weapon counts*

**The case.** A Cadian Shock Troops squad has **no per-model composition** in the
usual sense; instead its "Unit Composition" is an **option group** whose choices
encode the whole squad layout in their *display name*:

- "1 Sergeant and 9 Shock Troopers" (a 10-model squad), or
- "2 Sergeants and 18 Shock Troopers" (the 20-model squad),

and each choice carries a **nested composition** (`ch[5]`) describing every
model's wargear sections — the Sergeant's pistol options, each Trooper's lasgun,
the special/heavy-weapon swaps.

**The shape.** An option choice tuple is
`[choiceName, pts, choiceMax, pinnedProfile, ability, choiceComp]`, where
`choiceComp` is `[[modelName, [[sectionName, weaponArrays], …]], …]`:

```js
opts = [[
  "Unit Composition",
  [
    ["1 Sergeant and 9 Shock Troopers", 0, 1, null, null, [
      ["Shock Trooper Sergeant", [["", [["Laspistol","R","12\"","1","4+","3","0","1","Pistol"]]],
                                  ["Sergeant's weapon: Chainsword", [/* chainsword profile */]]]],
      ["Shock Troopers", [["", [["Lasgun","R","24\"","1","4+","3","0","1","Rapid Fire 1"]]]]],
    ]],
    ["2 Sergeants and 18 Shock Troopers", 0, 1, null, null, [/* …doubled layout… */]],
  ],
  1,
  "1 Sergeant and 9 Shock Troopers",   // default choice
]];
```

**The rules in play (all inside `resolveEquippedWeapons`).**

1. **`parseChoiceCounts(name)`** turns the choice's *display name* into per-model
   counts: `"1 Sergeant and 9 Shock Troopers"` → `Map { "Shock Trooper Sergeant"→1,
   "Shock Troopers"→9, "Shock Trooper"→9 }` (it also singularises the trailing
   word so the parser-emitted model name matches).

2. **`walkChoiceComp(ch[5], groupKey, addExtras, modelCounts)`** walks the nested
   composition the same way the UI does:
   - sections without a `"Group: Choice"` prefix are **static** (always equipped)
     → registered as both *option* and *selected*;
   - sections with that prefix become a **radio block** keyed by
     `"<group>::<model>::<sub-group>"`; the stored pick (or the first option)
     wins — so the Sergeant's "Chainsword vs Power weapon" choice resolves to the
     actually-selected one;
   - every weapon's count is multiplied by `modelCounts`, so the Troopers'
     **Lasgun shows ×9**, not ×1.

3. **The default fallback** — when nothing is stored (`!sel`), the group's default
   choice (`o[3]`, here "1 Sergeant and 9 Shock Troopers") is walked instead, so
   a freshly-added squad already shows the right loadout. *(In the live app the
   default is normally seeded into `item.wargear` when the unit is created, so
   `sel` is usually set; the fallback covers the un-seeded case.)*

4. **The filter** — the final pass keeps a weapon when it's integrated
   (`optionWeaponNames` doesn't contain it) **or** it's option-fed *and selected*
   (`selectedWeaponNames` contains it), then stamps each surviving weapon with its
   accumulated `weaponCounts[name]`. Switching from the 10-model to the 20-model
   choice re-runs the walk and the Lasgun count jumps 9 → 18.

```js
import { resolveEquippedWeapons } from "./loadout.js";
const equipped = resolveEquippedWeapons(cadianSquad, { wpnDict });
// → [{ n:"Lasgun", count:9, … }, { n:"Laspistol", count:1, … }, … ]
```

---

### One-line summary of the decision rules

| Question | Function |
|---|---|
| Which statline(s) to show? | `selectStatLines` |
| What is the unit's full weapon pool? | `buildAllWeapons` |
| Which weapons are the default loadout (vs variant/option)? | `computeDefaultWeapons` / `variantWeaponKeys` |
| What does a wargear choice name resolve to? | `createWeaponResolver().getChoiceWeapons` |
| Is this option group a real choice? How many can I take? | `isRealChoice` / `effectiveGMax` |
| Where does each option group belong (unit / model / counter)? | `classifyOptions` |
| What is **actually equipped right now** (no-composition units)? | `resolveEquippedWeapons` |
| Is the model count in bounds? | `unitModelTotals` |
