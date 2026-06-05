// ─────────────────────────────────────────────────────────────────────────
// Loadout / display-decision rules — "WHAT to show", separated from "how".
//
// These are the pure functions that decide, for a given unit + its current
// selections, WHICH weapons and statlines to display:
//   • which statline(s) to render (single vs per-model profiles);
//   • the unit's full weapon pool, and which of those are "default" (always-on)
//     vs variant-/option-specific;
//   • the fuzzy resolution from an option-choice NAME to its weapon profiles;
//   • whether an option group is a real choice (and its effective max);
//   • the live "what is actually equipped right now" summary for a unit that has
//     no model composition — i.e. integrated weapons + the profiles granted by
//     the currently SELECTED option choices, with their counts.
//
// Extracted verbatim (de-closured into explicit parameters) from the
// `UnitBuilder` component in src/App.jsx. No React, no rendering — every
// function takes plain data and returns plain data. Pair the output with the
// renderers in render.js (or your own).
//
// Data shapes (BSData-aligned, as the app stores them):
//   item.weapons        [{n,t,rng,a,sk,s,ap,d,kw}]      base profiles
//   item.comp           [[groupName|"_fixed", min, max, [[modelName, modelMax,
//                          [...weapon arrays], …, [abilityPairs]?]], subOpts?, subCaps?]]
//   item.opts           [[groupName, [[choiceName, pts, choiceMax, profile?, ability?, choiceComp?]], groupMax, defaultChoiceName?]]
//   item.wargear        { [groupName]: choiceName | {choiceName:count} | …,
//                          __multi: { [group]: {choice:count} } }
//   item.models         { [modelName]: count }
//   wpnDict             { [weaponNameLower]: [[n,t,rng,a,sk,s,ap,d,kw], …] }   faction-wide profile dict
// ─────────────────────────────────────────────────────────────────────────

const toObj = (w) => ({ n: w[0], t: w[1], rng: w[2], a: w[3], sk: w[4], s: w[5], ap: w[6], d: w[7], kw: w[8] || "-" });

// ─── Statlines: WHEN to show which stats ─────────────────────────────────────
// Returns [{caption, stats}]:
//   • per-model profiles (statLines) when the datasheet fields several distinct
//     statlines (Boyz + Boss Nob, Gretchin + Runtherd) — each captioned;
//   • else one un-captioned bar from `stats`;
//   • else [] (no statline at all).
export function selectStatLines(unit) {
  if (Array.isArray(unit.statLines) && unit.statLines.length > 0) {
    return unit.statLines.map(([caption, stats]) => ({ caption, stats }));
  }
  if (!unit.stats) return [];
  return [{ caption: null, stats: unit.stats }];
}

// ─── The unit's full weapon pool ─────────────────────────────────────────────
// item.weapons plus the per-model profiles stored in comp[g][3][m][2], deduped.
// The dedup signature ignores the display sigils ('➤' sub-profile, '➜' reached-
// via-recursion) so the same profile reached two ways collapses to one entry.
export function buildAllWeapons(item) {
  const comp = item.comp || [];
  const normKey = (n, t, sk, s, ap, d) =>
    (n || "").toLowerCase().replace(/^[➜➤\s]+/, "").trim() + "|" + t + "|" + sk + "|" + s + "|" + ap + "|" + d;
  const out = [...(item.weapons || [])];
  const seen = new Set(out.map((w) => normKey(w.n, w.t, w.sk, w.s, w.ap, w.d)));
  for (const g of comp) {
    for (const m of (g[3] || [])) {
      const wps = m[2];
      if (!Array.isArray(wps)) continue;
      for (const w of wps) {
        if (!Array.isArray(w)) continue;
        const obj = toObj(w);
        const k = normKey(obj.n, obj.t, obj.sk, obj.s, obj.ap, obj.d);
        if (seen.has(k)) continue;
        seen.add(k);
        out.push(obj);
      }
    }
  }
  return out;
}

// ─── Default (always-on) weapons ─────────────────────────────────────────────
// The profiles shared by every model: drop variant-specific weapons (those keyed
// off a "<model> w/ <weapon>" composition entry) and sub-profiles (" - ").
export function variantWeaponKeys(comp) {
  const keys = new Set();
  (comp || []).forEach((g) => (g[3] || []).forEach((m) => {
    const p = m[0].toLowerCase().split(" w/ ");
    if (p.length > 1) keys.add(p[1]);
  }));
  return keys;
}
export function computeDefaultWeapons(allWeapons, comp) {
  const variant = variantWeaponKeys(comp);
  return allWeapons.filter((w) => !variant.has(w.n.toLowerCase()) && !w.n.includes(" - "));
}

// ─── Weapon resolver: option-choice NAME → weapon profile(s) ──────────────────
// Unit-level matches (allWeapons: one ID-stable profile per name) always win over
// the faction-wide wpnDict (which holds many homonymous profiles — e.g. 8+
// "Power weapon" entries, one per character). Returns the family of resolvers
// used by both the per-model display and the equipped-weapons summary.
export function createWeaponResolver({ allWeapons, wpnDict = {} }) {
  const wd = wpnDict;

  const lookupWeapons = (name) => {
    const wList = wd[(name || "").toLowerCase()];
    return (wList && wList.length) ? wList.map(toObj) : [];
  };

  // "<model> w/ <weapon>" → the weapon's profiles (unit pool first, then dict).
  const matchWeapons = (modelName) => {
    const parts = modelName.toLowerCase().split(" w/ ");
    if (parts.length > 1) {
      const wpnKey = parts[1];
      const fromUnit = allWeapons.filter((w) => w.n.toLowerCase().includes(wpnKey));
      if (fromUnit.length > 0) return fromUnit;
      const fromDict = lookupWeapons(wpnKey);
      if (fromDict.length > 0) return fromDict;
      if (wpnKey.endsWith("s")) { const r = lookupWeapons(wpnKey.slice(0, -1)); if (r.length > 0) return r; }
      for (const [k, v] of Object.entries(wd)) {
        if (wpnKey.includes(k) || k.includes(wpnKey)) {
          const unitNames = new Set(allWeapons.map((w) => w.n.toLowerCase()));
          const scoped = v.filter((w) => unitNames.has((w[0] || "").toLowerCase()));
          return (scoped.length > 0 ? scoped : v).map(toObj);
        }
      }
    }
    return [];
  };

  // "Two excruciator cannons" → 2. "Pair of" / "Twin" are single twin-linked
  // profiles, NOT a double count.
  const getWeaponCount = (name) => {
    const n = name.toLowerCase();
    const m = n.match(/^(\d+)x?\s/);
    if (m) { const v = parseInt(m[1], 10); if (v >= 2 && v <= 12) return v; }
    if (n.startsWith("two ")) return 2;
    if (n.startsWith("three ")) return 3;
    if (n.startsWith("four ")) return 4;
    if (n.startsWith("five ")) return 5;
    if (n.startsWith("six ")) return 6;
    return 1;
  };

  // Resolve one weapon name: exact in unit pool → base-name (sigils/sub-profile
  // stripped) in unit pool → faction dict.
  const resolveOne = (candidate) => {
    const c = (candidate || "").toLowerCase().trim();
    if (!c) return [];
    const u = allWeapons.filter((w) => w.n.toLowerCase() === c);
    if (u.length > 0) return u;
    const baseMatches = allWeapons.filter((w) => {
      const wn = (w.n || "").toLowerCase().replace(/^[➜➤\s]+/, "").trim();
      const base = wn.includes(" - ") ? wn.split(" - ")[0].trim() : wn;
      return base === c;
    });
    if (baseMatches.length > 0) return baseMatches;
    return lookupWeapons(c);
  };

  // Fuzzy choice-name → profiles. `pinned` (the profile the parser attached to
  // the choice tuple) short-circuits the fuzzy lookup with the exact stat block.
  const getChoiceWeapons = (choiceName, pinned) => {
    if (pinned && typeof pinned === "object" && pinned.n) return [pinned];
    if (!choiceName) return [];
    const cn = choiceName.toLowerCase();
    // 1. exact (unit pool first, then dict)
    const exact = resolveOne(cn);
    if (exact.length > 0) return exact;
    // 2. combo: split a multi-weapon loadout string into independent lookups
    const isCombo = !choiceName.includes("(") && !cn.includes(" w/ ")
      && (cn.includes(" & ") || cn.includes(", ") || / and /i.test(choiceName));
    if (isCombo) {
      const parts = choiceName.split(/\s*&\s*|\s*,\s*|\s+and\s+/i).map((s) => s.trim()).filter(Boolean);
      if (parts.length > 1) {
        const merged = []; const seen = new Set();
        parts.forEach((p) => {
          const cleaned = p.replace(/^\d+\s+/, ""); // drop a leading count token
          getChoiceWeapons(cleaned).forEach((w) => {
            const k = (w.n || "").toLowerCase() + "|" + w.t + "|" + w.rng + "|" + w.a + "|" + w.s + "|" + w.ap + "|" + w.d;
            if (!seen.has(k)) { seen.add(k); merged.push(w); }
          });
        });
        if (merged.length > 0) return merged;
      }
    }
    // 3. strip "Two/Three/Pair of/2x/2 " prefixes
    const stripped = cn.replace(/^(two |three |four |pair of |a |an |\d+x?\s+)/i, "").trim();
    if (stripped !== cn) {
      const r = resolveOne(stripped); if (r.length > 0) return r;
      if (stripped.endsWith("s")) { const r2 = resolveOne(stripped.slice(0, -1)); if (r2.length > 0) return r2; }
    }
    // 4. singular
    if (cn.endsWith("s")) { const r = resolveOne(cn.slice(0, -1)); if (r.length > 0) return r; }
    // 5. last 2 words
    const words = cn.split(" ");
    if (words.length > 2) {
      const last2 = words.slice(-2).join(" ");
      const r = resolveOne(last2); if (r.length > 0) return r;
      if (last2.endsWith("s")) { const r2 = resolveOne(last2.slice(0, -1)); if (r2.length > 0) return r2; }
    }
    // 6. contains-match in dict, scoped to the unit pool to drop homonyms. The
    //    reverse direction (k includes cn) is gated on a multi-word choice name
    //    so single-word marks (Khorne, Slaanesh…) don't drag in thematic weapons.
    const cnIsMultiWord = cn.includes(" ");
    for (const [k, v] of Object.entries(wd)) {
      if (cn.includes(k) || (cnIsMultiWord && k.includes(cn))) {
        const unitNames = new Set(allWeapons.map((w) => w.n.toLowerCase()));
        const scoped = v.filter((w) => unitNames.has((w[0] || "").toLowerCase()));
        return (scoped.length > 0 ? scoped : v).map(toObj);
      }
    }
    // 7. contains-match in unit pool (same single-word guard)
    return allWeapons.filter((w) => cn.includes(w.n.toLowerCase()) || (cnIsMultiWord && w.n.toLowerCase().includes(cn)));
  };

  // A choice that carries an ABILITY (ch[4]) and NO pinned weapon (ch[3]==null)
  // is a pure bonus (Marks of Chaos) — it grants no weapon, so return [] rather
  // than letting the dict contains-match surface a thematically-named weapon.
  const choiceWeapons = (ch) => (ch && ch[4] && !ch[3]) ? [] : getChoiceWeapons(ch[0], ch[3]);

  return { lookupWeapons, matchWeapons, getWeaponCount, resolveOne, getChoiceWeapons, choiceWeapons };
}

// ─── Option groups: WHICH are real choices, and how they're bucketed ─────────
// Filter out "fake" groups where you can simply take everything (no decision).
export function isRealChoice(o) {
  const gName = o[0] || "";
  if (gName.includes("::") || gName.includes("Optional")) return true;
  const gMax = o[2] || 99;
  const choices = o[1] || [];
  if (choices.length === 1 && gMax === 1) return true;     // binary take-it/leave-it toggle
  if (gMax >= 99) return true;                             // "no limit" independent group
  const effectiveMaxes = choices.map((c) => { const cm = c[2] || 1; return cm >= 99 ? 1 : cm; });
  const allSingleMax = effectiveMaxes.every((cm) => cm <= 1);
  const effectiveTotal = effectiveMaxes.reduce((s, cm) => s + cm, 0);
  if (gMax >= effectiveTotal && allSingleMax) return false; // gMax covers everything → not a choice
  return true;
}

// Effective group max for display: cap at the sum of effective per-choice maxes.
export function effectiveGMax(o) {
  const gMax = o[2] || 99;
  const effectiveTotal = (o[1] || []).reduce((s, c) => { const cm = c[2] || 1; return s + (cm >= 99 ? 1 : cm); }, 0);
  return Math.min(gMax, effectiveTotal);
}

// Bucket the option groups the way the UI lays them out:
//   multiGroups  — special-weapon / model-loadout counters ("… w/ …", Marine…)
//   modelOpts    — scoped to a specific composition model ("<model>::…" or a
//                  group named exactly after a model)
//   singleGroups — unit-level radio/toggle groups (vehicles, non-comp units)
export function classifyOptions({ opts = [], comp = [], showCrusade = false } = {}) {
  const real = opts.filter(isRealChoice);
  const compModelNames = new Set();
  (comp || []).forEach((g) => (g[3] || []).forEach((m) => { if (m && m[0]) compModelNames.add(m[0]); }));
  const multiGroups = real.filter((o) => (o[1] || []).some((c) =>
    c[0].includes(" w/ ") || c[0].includes("Marine") || c[0].includes("Destroyer") || c[0].includes("Terminator")));
  const modelOpts = real
    .filter((o) => o[0].includes("::") || compModelNames.has(o[0]))
    .filter((o) => showCrusade || !o[0].includes("Crusade"));
  const singleGroups = real
    .filter((o) => !multiGroups.includes(o) && !o[0].includes("::") && !compModelNames.has(o[0]))
    .filter((o) => showCrusade || (!o[0].includes("Crusade") && !o[0].includes("Order of Battle")
      && !o[0].includes("Weapon Upgrades") && !o[0].includes("Weapon Modifications")));
  // model name → its option groups (path form "<model>::<group>" or bare name)
  const getModelOpts = (modelName) => modelOpts.filter((o) => o[0].startsWith(modelName + "::") || o[0] === modelName);
  return { multiGroups, modelOpts, singleGroups, getModelOpts, compModelNames };
}

// ─── Model-count bookkeeping (composition validity + header counts) ──────────
export function unitModelTotals(item) {
  const comp = item.comp || [];
  const models = item.models || {};
  const validK = new Set();
  comp.forEach((g) => { if (g && g[3]) g[3].forEach((m) => validK.add(m[0])); });
  const compCount = Object.entries(models).reduce((s, [k, v]) => validK.has(k) ? s + v : s, 0);
  const multiData = (item.wargear || {}).__multi || {};
  const multiCount = Object.values(multiData).reduce((s, g) => s + Object.values(g || {}).reduce((s2, v) => s2 + v, 0), 0);
  const totalM = compCount + multiCount;
  const minM = comp.reduce((s, g) => s + (g[1] || 0), 0);
  const maxM = comp.reduce((s, g) => s + (g[2] || 0), 0);
  // Bound check compares compCount only (multi loadouts don't add comp models).
  const totalInvalid = (maxM > 0 && compCount > maxM) || (minM > 0 && compCount < minM);
  return { compCount, multiCount, totalM, minM, maxM, totalInvalid };
}

// ─── The live equipped-weapons summary (units with NO composition) ───────────
// "What's actually equipped right now": integrated weapons (those not provided
// by any option choice) + the profiles granted by the currently SELECTED choices
// in each option group, with per-weapon counts. An option-fed weapon is shown
// only when its option is the selected one, so switching a wargear choice
// actually swaps the weapon in the summary. Returns [{…weapon, count?}].
export function resolveEquippedWeapons(item, { wpnDict = {} } = {}) {
  const allWeapons = buildAllWeapons(item);
  const opts = item.opts || [];
  const wargear = item.wargear || {};
  const { getChoiceWeapons, getWeaponCount } = createWeaponResolver({ allWeapons, wpnDict });

  const optionWeaponNames = new Set();   // weapons granted by ANY option choice
  const selectedWeaponNames = new Set(); // weapons granted by the SELECTED choices
  const weaponCounts = { ...(item.defaultWeaponCounts || {}) }; // per-name # override
  const extraSelectedWeapons = new Map(); // name → weapon object NOT in the base pool
  const baseWeaponNames = new Set(allWeapons.map((w) => (w.n || "").toLowerCase()));

  // Every plausible normalisation of a choice display name, as a safety net when
  // name resolution diverges ("2 Twin pulse carbines" → "twin pulse carbine").
  const choiceNameVariants = (s) => {
    if (!s) return [];
    const lower = s.toLowerCase().trim();
    const out = new Set([lower]);
    const stripped = lower.replace(/^(two |pair of |a |an |\d+x |\d+\s)/i, "").trim();
    if (stripped) out.add(stripped);
    for (const v of [...out]) if (v.endsWith("s")) out.add(v.slice(0, -1));
    return [...out];
  };
  // "1 Sergeant and 9 Troopers" → {Sergeant:1, Trooper:9} (per-model counts).
  const parseChoiceCounts = (name) => {
    const m = new Map();
    if (!name) return m;
    for (const part of name.split(/\s+and\s+/i)) {
      const mm = part.match(/^\s*(\d+)\s+(.+?)\s*$/);
      if (!mm) continue;
      const n = parseInt(mm[1], 10); const nm = mm[2].trim();
      m.set(nm, n);
      if (nm.endsWith("s")) m.set(nm.slice(0, -1), n);
      if (nm.endsWith("ies")) m.set(nm.slice(0, -3) + "y", n);
    }
    return m;
  };
  // Variants of a weapon name (sigils stripped, sub-profile base) for matching.
  const nameKeys = (rawName) => {
    if (!rawName) return [];
    const out = new Set();
    const lower = rawName.toLowerCase();
    out.add(lower);
    const clean = lower.replace(/^[➜➤\s]+/, "").trim();
    if (clean && clean !== lower) out.add(clean);
    if (clean.includes(" - ")) out.add(clean.split(" - ")[0].trim());
    return [...out];
  };
  // Walk a choice's nested composition (ch[5]): static sections are always
  // equipped (registered as option AND selected); radio blocks pick the stored
  // choice or the first option. modelCounts multiplies a model's weapons.
  const walkChoiceComp = (comp, parentKey, addExtras, modelCounts) => {
    if (!Array.isArray(comp)) return;
    for (const entry of comp) {
      if (!Array.isArray(entry) || entry.length < 2) continue;
      const [mname, sections] = entry;
      if (!Array.isArray(sections)) continue;
      let mCount = 0;
      if (modelCounts) {
        if (modelCounts.has(mname)) mCount = modelCounts.get(mname);
        else if (mname.endsWith("s") && modelCounts.has(mname.slice(0, -1))) mCount = modelCounts.get(mname.slice(0, -1));
      } else mCount = 1;
      if (modelCounts && mCount <= 0) continue;
      const blocks = [];
      for (const sec of sections) {
        if (!Array.isArray(sec) || sec.length < 2) continue;
        const [sectName, weapons] = sec;
        const colonIdx = (sectName || "").indexOf(": ");
        if (colonIdx >= 0) {
          const groupName = sectName.slice(0, colonIdx);
          const choiceName = sectName.slice(colonIdx + 2);
          const last = blocks[blocks.length - 1];
          if (last && last.type === "radio" && last.groupName === groupName) last.choices.push([choiceName, weapons]);
          else blocks.push({ type: "radio", groupName, choices: [[choiceName, weapons]] });
        } else blocks.push({ type: "static", weapons });
      }
      for (const b of blocks) {
        if (b.type === "static") {
          for (const w of (b.weapons || [])) {
            const keys = nameKeys(w[0]);
            if (keys.length === 0) continue;
            for (const k of keys) { selectedWeaponNames.add(k); weaponCounts[k] = (weaponCounts[k] || 0) + mCount; }
            const primary = keys[0];
            if (addExtras && !baseWeaponNames.has(primary) && !extraSelectedWeapons.has(primary))
              extraSelectedWeapons.set(primary, toObj(w));
          }
          continue;
        }
        const subKey = (parentKey || "") + "::" + mname + "::" + b.groupName;
        const selectedChoiceName = wargear[subKey] || (b.choices[0] && b.choices[0][0]) || "";
        for (const [cname, weapons] of b.choices) {
          const isSelected = cname === selectedChoiceName;
          for (const w of (weapons || [])) {
            const keys = nameKeys(w[0]);
            if (keys.length === 0) continue;
            for (const k of keys) optionWeaponNames.add(k);
            if (isSelected) {
              for (const k of keys) { selectedWeaponNames.add(k); weaponCounts[k] = (weaponCounts[k] || 0) + mCount; }
              const primary = keys[0];
              if (addExtras && !baseWeaponNames.has(primary) && !extraSelectedWeapons.has(primary))
                extraSelectedWeapons.set(primary, toObj(w));
            }
          }
        }
      }
    }
  };

  opts.forEach((o) => {
    const gn = o[0] || "";
    if (gn.includes("::") || gn.includes("Crusade") || gn.includes("Weapon Upgrades")) return;
    (o[1] || []).forEach((c) => {
      for (const cw of getChoiceWeapons(c[0])) for (const k of nameKeys(cw.n)) optionWeaponNames.add(k);
      for (const v of choiceNameVariants(c[0])) optionWeaponNames.add(v);
      for (const entry of (c[5] || [])) {
        if (!Array.isArray(entry) || entry.length < 2) continue;
        for (const sec of (entry[1] || [])) {
          if (!Array.isArray(sec) || sec.length < 2) continue;
          for (const w of (sec[1] || [])) for (const k of nameKeys(w[0])) optionWeaponNames.add(k);
        }
      }
    });
    const sel = wargear[gn];
    if (typeof sel === "string" && sel) {
      const per = getWeaponCount(sel);
      for (const cw of getChoiceWeapons(sel)) {
        const k = (cw.n || "").toLowerCase();
        if (!k) continue;
        selectedWeaponNames.add(k); weaponCounts[k] = (weaponCounts[k] || 0) + per;
        if (!baseWeaponNames.has(k)) extraSelectedWeapons.set(k, cw);
      }
      for (const v of choiceNameVariants(sel)) selectedWeaponNames.add(v);
      const selectedChoice = (o[1] || []).find((c) => c[0] === sel);
      if (selectedChoice && selectedChoice[5]) walkChoiceComp(selectedChoice[5], gn, true, parseChoiceCounts(sel));
    } else if (sel && typeof sel === "object" && !Array.isArray(sel)) {
      for (const [cn, cnt] of Object.entries(sel)) {
        if (!(cnt > 0)) continue;
        const per = getWeaponCount(cn);
        for (const cw of getChoiceWeapons(cn)) {
          const k = (cw.n || "").toLowerCase();
          if (!k) continue;
          selectedWeaponNames.add(k); weaponCounts[k] = (weaponCounts[k] || 0) + cnt * per;
          if (!baseWeaponNames.has(k)) extraSelectedWeapons.set(k, cw);
        }
        for (const v of choiceNameVariants(cn)) selectedWeaponNames.add(v);
      }
    } else if (!sel) {
      // No stored selection → fall back to the default (BSData default or first
      // choice) so the summary reflects the UI's defaults.
      const defaultName = o[3] || ((o[1] && o[1][0]) ? o[1][0][0] : "");
      if (defaultName) {
        const defaultChoice = (o[1] || []).find((c) => c[0] === defaultName);
        if (defaultChoice && defaultChoice[5]) walkChoiceComp(defaultChoice[5], gn, true, parseChoiceCounts(defaultName));
      }
    }
  });

  const filtered = allWeapons.filter((w) => {
    const cleanName = w.n.replace(/^[➜➤\s]+/, "").trim();
    const base = cleanName.includes(" - ") ? cleanName.split(" - ")[0].trim().toLowerCase() : cleanName.toLowerCase();
    if (optionWeaponNames.has(base)) return selectedWeaponNames.has(base); // option-fed → only if selected
    return true; // integrated → always
  }).map((w) => {
    const k = (w.n || "").toLowerCase();
    return weaponCounts[k] ? { ...w, count: weaponCounts[k] } : w;
  });
  // Append selected option weapons absent from the base unit profile (Seeker
  // missile on a Devilfish, etc).
  for (const [k, w] of extraSelectedWeapons) {
    if (filtered.some((fw) => (fw.n || "").toLowerCase() === k)) continue;
    filtered.push(weaponCounts[k] ? { ...w, count: weaponCounts[k] } : w);
  }
  return filtered;
}
