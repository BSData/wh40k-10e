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
- **`editor/ICON_BEARER_APP_PROMPT.md`** — prompt autonome (application
  consommatrice) pour interpréter le rattachement « 1 modèle porte
  l'amélioration » : icônes/bannières via `<association>` (`childId="model"`
  = n'importe quel modèle, ou un modèle/groupe/catégorie précis) ; le
  porteur n'est **jamais le chef par défaut**, il sort de `scope`+`childId`.
- **`editor/ALLIED_UNITS_APP_PROMPT.md`** — prompt autonome (application
  consommatrice) : une armée dont le roster est importé d'une bibliothèque
  via `catalogueLink importRootEntries="true"` (Chaos Daemons, Imperial
  Knights) ne doit pas voir toutes ses unités tomber en « Allied Units » —
  les entrées importées sont **natives** du catalogue importateur ; le
  statut allié se décide par **mot-clef de faction**, jamais par fichier.
- **`editor/UNIT_COMPOSITION_APP_PROMPT.md`** — prompt autonome (application
  consommatrice) : pour afficher la bonne composition des unités à choix de
  taille (Jakhals, etc.), l'appli doit **résoudre les `entryLink`-vers-modèle**
  (même au niveau unité) comme des modèles, **exécuter les `modifier`**
  (`set`/`decrement`, cross-node, `repeats`) et **respecter min=0** — la donnée
  est complète, c'est l'évaluation qui manque.
- **`editor/SHARED_LIBRARY_RULES_APP_PROMPT.md`** — prompt autonome (application
  consommatrice) : les règles d'armée et de détachement des factions
  « importateur mince » (Aeldari/Drukhari/Ynnari → `Aeldari - Aeldari
  Library.cat`, etc.) ne sont **pas dans le `.cat` de la faction** (0 règle) ;
  l'appli doit **suivre les `<catalogueLink>` par `targetId`** (transitif),
  résoudre les `<infoLink type="rule">` **inter-fichiers**, et filtrer les
  détachements par condition **`primary-catalogue`**, jamais par fichier.
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
5. **Prix par seuil de répétition (MFM)** : sémantique « les N premiers
   au prix de base, au-delà du Nième à l'autre prix » → toujours le
   pattern d'**entrée scindée** via `catalog.splitRepeatTier` (audit
   `auditRepeatTiers`, dépose `removeRepeatTier`) — jamais de re-prix
   global par condition roster. Détails : `editor/MFM_PROMPT.md`.

## Git

Commits par faction, messages descriptifs ; ne jamais committer un état
non validé.
