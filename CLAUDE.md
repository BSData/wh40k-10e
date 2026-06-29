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
- **`editor/REPEAT_COST_APP_PROMPT.md`** — prompt autonome (application
  consommatrice) : le surcoût « 3e+ exemplaire plus cher » est encodé par
  un `<modifier>` de coût + marqueur `repeat-cost: threshold=N delta=Δ` ;
  l'appli doit n'appliquer Δ qu'aux exemplaires **au-delà du Nème** (pas à
  tous). Remplace l'ancienne entrée dupliquée `(additional)`.
- **`editor/UNIQUE_DETACHMENT_APP_PROMPT.md`** — prompt autonome (application
  consommatrice) : les détachements à mot-clef `UNIQUE: X` (marqueur
  `<comment>unique-detachment: X</comment>`) sont **mutuellement exclusifs** par
  X — une armée multi-détachements ne peut en contenir qu'un par mot-clef.
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
- **`editor/MARINE_CHAPTER_COST_APP_PROMPT.md`** — prompt autonome (application
  consommatrice) : quelques unités du **tronc commun Space Marines** (définies
  dans `Imperium - Space Marines.cat`, importées par les chapitres) ont un
  **prix différent selon le chapitre** ; encodé par un modifier de coût `set`
  conditionné **`primary-catalogue`** (marqueur `<comment>chapter-cost: XX</comment>`).
  Aucune logique spéciale côté appli : **éval BattleScribe standard** (contraste
  avec `repeat-cost`). Si le chapitre **redéfinit** l'unité localement (Black
  Templars), le prix est déjà sur l'entrée locale.
- **`editor/LEADER_LINKS_APP_PROMPT.md`** — prompt autonome (application
  consommatrice) : « quelles unités un chef peut mener », **toutes factions**,
  encodé sur chaque datasheet de chef par un `selectionEntryGroup` **déclaratif**
  `hidden`+`max=0` nommé `Can Lead (MFM)` (entryLinks vers les unités menées).
  **Source = la prose de la capacité *Leader*** (« can be attached to the following
  units: … »), redondée en données ; un seul sens (côté chef), cibles résolues
  dans la clôture d'import. Restent dans la prose seule : rattachements **par
  mot-clef**, **accordés par amélioration**, ou inter-fichiers hors import.
- **`editor/MODEL_ABILITIES_APP_PROMPT.md`** — prompt autonome (application
  consommatrice) : la plupart des capacités de datasheet sont des profils
  `Abilities` sur l'**unité**, mais quelques-unes sont portées par un
  `selectionEntry type="model"` imbriqué (ex. capacité propre à un Sergent). L'appli
  doit collecter les capacités dans **tout le sous-arbre** (unité **+** modèles),
  exclure les lignes de stats (`typeName="Unit"`) et les armes, et **dédupliquer**
  (une fois, pas une par figurine). Correctif de lecture/affichage, aucune donnée.
- **`editor/SIM_MOD_APP_PROMPT.md`** — prompt autonome (simulateur de dégâts) :
  les bonus **offensifs** accordés par une capacité de datasheet ou une
  amélioration (ex. compétence de Castellan Crowe) sont matérialisés par un
  marqueur `<comment>sim-mod: source="…" attacks=+1 weapon="…" whileLeading
  …</comment>` posé en **1ᵉʳ enfant** de la `selectionEntry` de l'unité ; l'appli
  parse les lignes `sim-mod:`, les attache à l'unité (`simMods`), les propose en
  **bascule** (pré-cochées si non conditionnelles) et **replie** les effets actifs
  dans l'objet `mods` de `simulate()`. Ne couvre **que** les bonus de
  capacité/amélioration — mots-clefs d'arme et règles d'armée restent côté appli.
- **`editor/BSDATA_PARSING_REFERENCE.md`** — **doc de référence complète** pour
  l'agent de l'appli consommatrice : tout le vocabulaire réel du format (11 types de
  modifier, 7 de condition, scopes dont `primary-catalogue`/`ancestor`/`forces`,
  `conditionGroup` and/or/**count**, `infoLink type=infoGroup`, `field=hidden/defaultAmount`,
  profils-capacité à `typeName` non-`Abilities`…), le pipeline résoudre→évaluer→agréger,
  les **idiomes multiples** (sources de trous silencieux) et un renvoi vers chaque prompt
  spécialisé. À donner à toute appli qui parse la base.
- **`editor/BATTLELINE_GRANT_APP_PROMPT.md`** — grants Battleline (catégorie
  conditionnelle `add`/`set-primary` + plafond 0-3→0-6), conditionnés détachement
  (`scope="force"`) ou Warlord (drapeau de catégorie sur la sélection Warlord).
- **`editor/WEAPON_SLOTS_APP_PROMPT.md`** — arme de **base fixe** (`min≥1`) +
  **emplacement optionnel à choix** (groupe `max=1`/min 0) ; même arme en base ET en
  option = deux emplacements (ex. Chaos Rhino : combi-bolter + pintle combi-bolter/weapon).
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
5. **Prix par seuil de répétition (MFM)** : « les N premiers au prix de
   base, au-delà du Nième à l'autre prix » → **modifier de coût**
   `increment` + marqueur `<comment>repeat-cost: threshold=N delta=Δ</comment>`
   sur l'unité ; l'**appli** n'applique Δ qu'aux exemplaires au-delà du
   Nème (`editor/REPEAT_COST_APP_PROMPT.md`). **Ne plus dupliquer
   l'entrée** : `splitRepeatTier` abandonné (l'entrée cachée
   n'apparaissait pas dans les applis), `removeRepeatTier` ne sert qu'à
   déposer d'anciennes jumelles `(additional)`. Détails :
   `editor/MFM_PROMPT.md`.

## Git

Commits par faction, messages descriptifs ; ne jamais committer un état
non validé.
