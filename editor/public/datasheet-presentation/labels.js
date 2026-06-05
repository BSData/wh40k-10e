// ─────────────────────────────────────────────────────────────────────────
// Display labels for a Warhammer 40k 10e datasheet — pure data, no framework.
//
// Only the APP CHROME is translated here (stat abbreviations, table headers,
// category names). BSData CONTENT — unit / weapon / ability / keyword names and
// rules text — is never translated; it is rendered verbatim.
//
// The underlying data keys never change; only what we DISPLAY is localised.
//   SL = ["M","T","SV","W","LD","OC"]  ← order of every statline array
// ─────────────────────────────────────────────────────────────────────────

export const LANGS = ["fr", "en"];

export function normalizeLang(l) {
  return l === "en" ? "en" : "fr";
}

// Plain translator: caller supplies `lang`; `en` defaults to `fr` when omitted.
export function tr(lang, fr, en) {
  return lang === "en" ? (en === undefined ? fr : en) : fr;
}

// Canonical statline order. Every `unit.stats` / statLine array is indexed by
// this: [Movement, Toughness, Save, Wounds, Leadership, Objective Control].
export const SL = ["M", "T", "SV", "W", "LD", "OC"];

// Stat names AND their 1–2 letter abbreviations, in display order (matches SL).
export const UNIT_STAT_ABBR = {
  fr: ["M", "E", "Svg", "PV", "Cd", "CO"],
  en: ["M", "T", "SV", "W", "LD", "OC"],
};
export const UNIT_STAT_FULL = {
  fr: ["Mouvement", "Endurance", "Sauvegarde", "Points de vie", "Commandement", "Contrôle d'objectif"],
  en: ["Movement", "Toughness", "Save", "Wounds", "Leadership", "Objective Control"],
};
export const UNIT_STAT_FULL_BY_KEY = {
  M:  { fr: "Mouvement", en: "Movement" },
  T:  { fr: "Endurance", en: "Toughness" },
  SV: { fr: "Sauvegarde", en: "Save" },
  W:  { fr: "Points de vie", en: "Wounds" },
  LD: { fr: "Commandement", en: "Leadership" },
  OC: { fr: "Contrôle d'objectif", en: "Objective Control" },
};

// Weapon profile headers / values.
//   bs = Ballistic Skill (ranged) → FR "CT" (Capacité de Tir)
//   ws = Weapon Skill   (melee)  → FR "CC" (Capacité de Combat)
//   s  = Strength → FR "F" · ap = Armour Penetration → FR "PA"
//   d  = Damage → FR "D" · a = Attacks → FR "A"
//   kw = Keywords → FR "MC" · range → FR "Po" (Portée)
export const WPN_STAT = {
  fr: { weapon: "ARME", range: "Po", a: "A", bs: "CT", ws: "CC", bsws: "CT/CC", s: "F", ap: "PA", d: "D", kw: "MC", melee: "Mêlée", rngTag: "Dist", melTag: "CaC" },
  en: { weapon: "WEAPON", range: "RNG", a: "A", bs: "BS", ws: "WS", bsws: "BS/WS", s: "S", ap: "AP", d: "D", kw: "KW", melee: "Melee", rngTag: "Rng", melTag: "Mel" },
};

// Unit category filter labels. The VALUE (key) stays English so it keeps
// matching BSData keywords; only the LABEL is localised.
export const CAT_LABEL = {
  fr: {
    All: "Tous", Character: "Personnage", Battleline: "Ligne de bataille",
    Infantry: "Infanterie", Vehicle: "Véhicule", Monster: "Monstre",
    Mounted: "Monté", Beast: "Bête", Transport: "Transport",
    Aircraft: "Aéronef", Fortification: "Fortification", Other: "Autre",
  },
  en: {
    All: "All", Character: "Character", Battleline: "Battleline",
    Infantry: "Infantry", Vehicle: "Vehicle", Monster: "Monster",
    Mounted: "Mounted", Beast: "Beast", Transport: "Transport",
    Aircraft: "Aircraft", Fortification: "Fortification", Other: "Other",
  },
};

// Misc UI strings used by the renderer, in one place for translation.
export const UI = {
  fr: {
    canLead: "Peut diriger", composition: "Composition", models: "figurines",
    fixed: "fixe", cost: " · Coût : ", addToList: "✦ Ajouter à la liste ✦",
    wargear: "Options d'équipement",
  },
  en: {
    canLead: "Can lead", composition: "Composition", models: "models",
    fixed: "fixed", cost: " · Cost: ", addToList: "✦ Add to army list ✦",
    wargear: "Wargear Options",
  },
};
