# wh40k-11e — données BattleScribe (11e édition)

Dépôt de données Warhammer 40,000 11e : fichiers `.cat`/`.gst` (XML
BattleScribe) + un éditeur web zéro-dépendance dans `/editor`.

## À lire avant de modifier les données

- **`editor/FACTION_PACK_PROMPT.md`** — LE guide d'intégration d'un
  faction pack (workflow complet, règle des améliorations, encodage,
  pièges, constantes d'ids, validation obligatoire). À suivre pour toute
  intégration de pack et, plus largement, pour toute édition de
  détachements/améliorations.
- **`editor/MFM_PROMPT.md`** — le guide d'intégration d'un MFM (points
  unités/améliorations, surcoûts par arme, prix par seuil de répétition).
  Compagnon : `editor/MFM_APP_PROMPT.md`, prompt autonome à coller dans
  le dépôt d'une application consommatrice (type NewRecruit) pour
  l'adapter à ces mécanismes.
- `editor/README.md` — l'éditeur web (`node editor/server.js`) et la lib
  `editor/lib/catalog.js` + `editor/lib/xml.js` (round-trip XML fidèle :
  toujours passer par cette lib pour éditer, jamais de sed/regex sur les
  fichiers).

## Règles maison non négociables

1. **Améliorations** : nom contenant « Upgrade » → rattachée à des
   **unités** par mots-clefs, **cumulable** (pas d'unicité d'armée),
   plafond global de 4, max 1 par unité, **jamais sur un Epic Hero**.
   Toutes les autres → **personnages non-Epic uniquement**, uniques
   (`max 1 roster`). Cas limites → demander à l'utilisateur.
2. Les porteurs se résolvent par **conjonction de mots-clefs** de la
   prose (« KROOT SHAPER » = mots-clefs KROOT **et** SHAPER) — jamais en
   traversant le menu central « Enhancements ».
3. Chaque détachement classé porte un coût **DP** et un profil **Force
   Disposition** ; stratagems = `<rule name="X (Stratagem, NCP)">` au
   format uniforme.
4. Validation avant tout commit : `xmllint`, `catalog.validate` (ok,
   0 erreur), **0 id dupliqué introduit** vs HEAD, audit de la règle des
   améliorations. Diff-check : ne réécrire un texte que s'il diffère.

## Git

Commits par faction, messages descriptifs ; ne jamais committer un état
non validé.
