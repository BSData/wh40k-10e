# Référence complète — parser les catalogues BattleScribe (`.cat`/`.gst`) de wh40k-11e

> Consigne / documentation pour l'agent de l'application consommatrice. Objectif :
> parser et **évaluer** correctement le format, sans trous silencieux. Le format
> est **générique** (BattleScribe) ; les règles WH40K en sont une **interprétation**.
> La même réalité s'exprime de **plusieurs façons** → tu dois gérer **tous** les
> idiomes listés ici, pas seulement celui que tu as rencontré en premier.

> Règle d'or : **RÉSOUDRE (imports + entryLinks) → ÉVALUER (modifiers + conditions
> + contraintes) → AGRÉGER (profils, catégories, coûts)**. Ne lis jamais une valeur
> statique sans avoir d'abord exécuté les modifiers qui peuvent la changer.

---

## 0. Vocabulaire réel de la base (exhaustif)
- **Éléments** : `catalogue`/`gameSystem`, `sharedSelectionEntries`, `sharedSelectionEntryGroups`, `sharedProfiles`, `sharedRules`, `selectionEntry`, `selectionEntryGroup`, `entryLink`, `infoLink`, `catalogueLink`, `categoryEntry`, `categoryLink`, `profile`/`characteristic`, `rule`/`description`, `cost`, `constraint`, `modifier`/`modifierGroup`, `condition`/`conditionGroup`, `repeat`/`repeats`, `comment`.
- **`selectionEntry@type`** : `unit`, `model`, `upgrade`.
- **`link@type`** (`entryLink`/`infoLink`) : `selectionEntry`, `selectionEntryGroup`, `profile`, `rule`, **`infoGroup`**.
- **`modifier@type`** (11) : `set`, `increment`, `decrement`, `add`, `remove`, `set-primary`, `unset-primary`, `append`, `replace`, `floor`, `ceil`.
- **`modifier@field`** : un **id de contrainte**, un **typeId de coût**, `category`, `name`, **`hidden`**, **`defaultAmount`**, un **id de caractéristique** (stats d'arme/profil), ou métadonnée (`info`/`warning`/`error`/`annotation`).
- **`constraint@type`** : `min`, `max`.
- **`condition@type`** (7) : `atLeast`, `atMost`, `equalTo`, `greaterThan`, `lessThan`, `instanceOf`, `notInstanceOf`.
- **`condition@field`** : `selections`, **`forces`**, ou un **id** (contrainte/coût).
- **`conditionGroup@type`** : `and`, `or`, **`count`**.
- **`@scope`** (conditions & contraintes) : `self`, `parent`, **`ancestor`**, `unit`, `model`, **`model-or-unit`**, `force`, `roster`, `root-entry`, **`primary-catalogue`**, **`upgrade`**, ou un **id d'entrée** précis.
- **`cost@name`** : `pts` (matched play), `pl`, **`DP`** (détachement), + coûts de campagne (Crusade…, Honour/Logistics/Purgation Points…).
- **`profile@typeName`** : `Unit` (statline), `Ranged Weapons`, `Melee Weapons`, `Transport`, `Abilities`, **et de nombreux types « capacité » spécifiques** (`Orders`, `Rituals`, `C'tan Powers`, `Marks of Chaos`, `Force Disposition`, `Blessings of Khorne`, `Triarch Abilities`, …).
- **Attributs notables** : `collective`, `automatic`, `defaultAmount`, `defaultSelectionEntryId`, `percentValue`, `shared`, `includeChildSelections`, `includeChildForces`, `roundUp`, `flatten`, `hidden`, `import`.

---

## 1. Résolution (avant toute évaluation)
1. **Catalogues + game system** : un roster référence un game system (`.gst`) + des
   catalogues (`.cat`). Les **catégories/règles/profils partagés** (Battleline, mots-clefs,
   règles core) vivent souvent dans le `.gst` ; un `.cat` y référence par `targetId`.
2. **`catalogueLink`** : un catalogue en importe d'autres (bibliothèque partagée).
   Résous **transitivement** (Aeldari/Drukhari/Ynnari → *Aeldari Library* ; GSC →
   *Library - Tyranids* ; Chaos Daemons, Imperial Knights → leur Library…).
   - `importRootEntries="true"` : les unités racines de la cible deviennent
     **natives** du catalogue importateur (ne les classe PAS « Allied »).
3. **`entryLink` / `infoLink`** : une référence (`targetId`) vers une entrée/profil/règle
   **partagé**. Tu dois **résoudre la cible** puis **fusionner** : la cible fournit le
   contenu (profils, sous-entrées, coûts), et **le lien peut surcharger** (constraints,
   modifiers, costs, sous-`entryLinks`, `categoryLinks`). ⚠️ Une **contrainte/coût/
   catégorie peut être portée par le LIEN, pas par la cible** (et inversement) — lis les deux.
4. **`type` de la cible, pas le conteneur** : un `entryLink` dont la cible résolue est
   `type="model"` **est un modèle**, où qu'il soit placé (même au niveau unité).
   Décide « modèle vs option vs arme » d'après la **cible résolue**, jamais d'après
   le conteneur (`selectionEntries` vs `entryLinks`).

---

## 2. Profils (statlines, capacités, armes)
- Un profil est `profile@typeId` (stable) — ne te fie pas au seul `typeName`.
  - **`Unit`** = ligne de stats (M/T/Sv/W/Ld/OC).
  - **`Ranged/Melee Weapons`** = armes.
  - **`Transport`** = capacité de transport.
  - **toutes les autres** (`Abilities`, `Orders`, `Rituals`, `C'tan Powers`,
    `Marks of Chaos`, `Force Disposition`, …) = **capacités/règles de datasheet**.
    �mapData : collecte-les **toutes** (pas seulement `typeName="Abilities"`).
- Un profil peut être **inline** (`<profile>`) **ou via `infoLink type="profile"`**
  (cible un `sharedProfile`). Gère **les deux**.
- **Emplacement** : les capacités sont surtout sur l'**unité**, mais certaines sont sur
  un `selectionEntry type="model"` imbriqué (ex. capacité d'un sergent), ou sur une
  **option/arme**. La liste de capacités d'une datasheet = **union des profils
  `Abilities`-like de l'unité ET de tous ses modèles/sélections par défaut**, **dédupliquée**
  (une fois, pas une par figurine). Exclure `Unit` (stats) et armes.
- Armes : profil d'arme accessible directement ou via `infoLink type="profile"` sur
  l'`entryLink` d'arme. Résous le profil de l'arme **réellement sélectionnée** (option).

---

## 3. Contraintes (`constraint`)
`type` ∈ {`min`,`max`}. `field` = ce qui est compté/borné :
- **`selections`** (le plus courant) : nombre de sélections d'une entrée.
- un **typeId de coût** (ex. plafond de points) ou un **id de contrainte** (cible de modifier).
`value` = la borne. **`@scope`** définit le **périmètre du comptage** — gère TOUS :

| scope | compte / borne sur… |
|---|---|
| `self` | l'entrée elle-même |
| `parent` | le parent direct (souvent : **par modèle** / par groupe) |
| `ancestor` | un ancêtre quelconque |
| `unit` | l'unité entière (toutes figurines) |
| `model` / `model-or-unit` | la figurine (ou l'unité si pertinent) |
| `force` | le détachement/force |
| `roster` | toute l'armée |
| `root-entry` | l'entrée racine |
| **`primary-catalogue`** | **la faction primaire jouée** (voir §6, §7) |
| `upgrade` | dans le contexte d'upgrade |
| `<id>` | dans le périmètre de l'entrée d'`id` donné |

Autres attributs :
- **`shared`** : la contrainte est partagée entre les instances créées par répétition/quantité.
- **`includeChildSelections` / `includeChildForces`** : inclure les sous-sélections/forces dans le comptage.
- **`automatic="true"`** : valeur **dérivée** (recalculée par modifiers) → **lecture seule**.
- **`percentValue="true"`** : la valeur est un **pourcentage** (ex. 50 % des points), pas un absolu.
- ⚠️ **`min=0` = optionnel** (compte par défaut 0). **`min≥1` = équipé/forcé par défaut.**
  `max=1` (+ min 0) = **« 0 ou 1 », choix optionnel**. Ne JAMAIS afficher une entrée
  `min 0` au nombre de figurines par défaut.

---

## 4. Modifiers (`modifier`, `modifierGroup`)
Un modifier **change une valeur** (`field`) **si ses conditions sont vraies**.
**Ordre d'évaluation : `set` AVANT `increment`/`decrement`** ; puis `floor`/`ceil`.

| type | effet sur `field` |
|---|---|
| `set` | force la valeur (constrainte, coût, `hidden`, `defaultAmount`, stat) |
| `increment` / `decrement` | ajoute / retire (souvent **par `repeats`**, voir §5) |
| `add` / `remove` | **ajoute / retire une catégorie** (`field="category"`, `value=<categoryId>`) |
| `set-primary` / `unset-primary` | définit / retire la **catégorie primaire** (= rôle : Battleline, etc.) |
| `append` | concatène (surtout `field="name"` : « Deadly Demise **D3** », suffixes de taille) |
| `replace` | remplace une sous-chaîne (texte) |
| `floor` / `ceil` | arrondi (coûts/valeurs) — **à gérer** (sinon coût marginal faux) |

`field` peut être : **un id de contrainte** (modifie une borne, y compris d'un **groupe
importé** ailleurs — *cross-node*), **un typeId de coût** (modifie un prix), `category`,
`name`, **`hidden`** (montre/cache conditionnellement — ex. enhancement révélé dans son
détachement), **`defaultAmount`** (modifie le compte par défaut), ou un **id de
caractéristique** (buff de stat ; souvent effet in-game situationnel — un constructeur
de liste peut afficher le profil de base, mais sache les reconnaître).

**Conditions du modifier** : peuvent être dans le `<modifier>` **OU dans le
`<modifierGroup>` parent** (`<conditions>` et/ou `<conditionGroups>`). ⚠️ **Tu dois
remonter au `modifierGroup`** : beaucoup de modifiers n'ont pas de condition propre,
elle est sur le groupe. (C'est un piège classique : croire qu'un grant est
inconditionnel parce que la condition est un cran au-dessus.)

---

## 5. Conditions, conditionGroups, repeats
- **`condition`** : `type` (7), `field` (`selections` | **`forces`** | `<id>`),
  `value`, `@scope` (cf. table), `childId` (l'entrée/catégorie/force comptée),
  `includeChildSelections`/`includeChildForces`, `shared`.
  - `instanceOf`/`notInstanceOf` : présence (≥1) / absence d'un `childId` (catégorie,
    entrée, **détachement**) dans le scope. `atLeast/atMost/greaterThan/lessThan/equalTo`
    comparent un **compte**.
  - `field="forces"` : compte des **forces/détachements** (pas des sélections).
- **`conditionGroup@type`** : `and`, `or`, **`count`** (≥N des sous-conditions vraies).
  Les groupes **s'imbriquent** (arbre and/or/count) — évalue récursivement.
- **`repeats`/`repeat`** : applique le modifier **une fois par N sélections** de `childId`
  (`value`/`repeats`, `roundUp`). Ex. décrément « −1 arme de base par arme d'échange »,
  ou « +X par tranche de 5 figurines ». Un modifier peut avoir **plusieurs `repeat`**
  (somme). Gère `roundUp`.

---

## 6. Catégories, rôles, statut (Battleline & co.)
- `categoryEntry` (définition) ; `categoryLink@targetId` (l'unité **a** cette catégorie) ;
  `primary="true"` = **catégorie primaire** (= rôle/slot affiché).
- Le statut d'une unité = **catégories de base** (`categoryLink` statiques) **+**
  catégories **ajoutées conditionnellement** par modifiers `add`/`set-primary` actifs **+**
  catégories apportées par une **sélection** (une `categoryLink` posée sur une option/
  amélioration **ne compte que si l'option est prise** — ex. « Warlord Flag » sur l'option
  Warlord d'un modèle). Ne te fie **pas** aux seules `categoryLink` statiques.
- **`set-primary category`** change le **rôle primaire** (ex. devient **Battleline**) :
  reflète-le dans l'organisation/limites.
- **Grant Battleline** (détachement ou Warlord) = `modifierGroup` conditionnel portant
  `add`/`set-primary` **Battleline** + souvent `set 6` sur la contrainte `max` du datasheet
  (**0-3 → 0-6**). Condition : `scope="force" childId=<détachement>` (souvent `conditionGroup
  or` si plusieurs détachements), **ou** `scope="roster" childId=<flag de Warlord>`.
  → Exécute le modifier de catégorie **et** le `set 6` quand la condition tient.

---

## 7. Coûts (points)
- Utilise **`cost name="pts"`** (typeId `51b2-306e-1021-d207`) pour le matched play ;
  `DP` (typeId `0d99-4ee2-7b3c-1f5a`) = coût de **détachement** (= un détachement est une
  entrée à coût DP) ; ignore `pl` et coûts de campagne sauf besoin.
- **Coût par instance** : un `cost` est **par sélection**. Si N modèles prennent une
  arme/option payante, le surcoût = `coût × nombre de porteurs` (≠ une fois).
- **Coût par taille** (unités à paliers) : coût de base + `modifier set <prix>` conditionné
  par le **nombre de modèles** (`childId="model"`, `equalTo/greaterThan`). Exécute-les.
- **Surcoût par seuil de répétition** (« 3ᵉ exemplaire plus cher ») : `modifier increment
  <Δ>` sur le coût, conditionné `atLeast N+1` (scope roster, `childId` = la datasheet),
  + marqueur `<comment>repeat-cost: threshold=N delta=Δ</comment>`. ⚠️ Applique Δ **uniquement
  aux exemplaires au-delà du Nᵉ**, pas à tous.
- **Coût par chapitre/faction** (Space Marines) : `modifier set <prix>` conditionné
  **`scope="primary-catalogue"`** (+ marqueur `<comment>chapter-cost: XX</comment>`).
  → Évaluation BattleScribe standard, mais **il FAUT évaluer le scope `primary-catalogue`**.

---

## 8. Conventions WH40K propres à ce dépôt (marqueurs `<comment>` + structures)
Documentés en détail dans les prompts dédiés (à lire) :
- `repeat-cost: threshold=N delta=Δ` → `REPEAT_COST_APP_PROMPT.md`.
- `unique-detachment: X` (détachements mutuellement exclusifs par X) → `UNIQUE_DETACHMENT_APP_PROMPT.md`.
- `chapter-cost: XX` (`set` conditionné `primary-catalogue`) → `MARINE_CHAPTER_COST_APP_PROMPT.md`.
- Groupe `hidden`+`max=0` **`Can Lead (MFM)`** (unités menées par un chef) → `LEADER_LINKS_APP_PROMPT.md`.
- Règles d'armée/détachement en **bibliothèque partagée** (suivre `catalogueLink`,
  `infoLink` inter-fichiers, filtrer par `primary-catalogue`) → `SHARED_LIBRARY_RULES_APP_PROMPT.md`.
- « Allied Units » par **mot-clef de faction**, pas par fichier → `ALLIED_UNITS_APP_PROMPT.md`.
- Composition à choix de taille (résoudre entryLinks-modèles, exécuter modifiers,
  respecter min 0, échange d'arme par décrément) → `UNIT_COMPOSITION_APP_PROMPT.md`.
- Coût d'arme **par modèle** (×N porteurs) → idem `UNIT_COMPOSITION_APP_PROMPT.md`.
- Capacités au niveau **modèle** (pas que l'unité) → `MODEL_ABILITIES_APP_PROMPT.md`.
- Grants **Battleline** (catégorie conditionnelle + 0-6) → `BATTLELINE_GRANT_APP_PROMPT.md`.
- Arme de **base fixe** + **emplacement optionnel à choix** → `WEAPON_SLOTS_APP_PROMPT.md`.

---

## 9. Les « idiomes multiples » à couvrir (sources de trous silencieux)
Pour CHAQUE concept, plusieurs encodages existent — teste-les tous :

| Concept | Idiomes possibles |
|---|---|
| Profil (stat/capacité/arme) | `<profile>` inline **ou** `infoLink type="profile"` (sharedProfile) |
| Capacité | sur l'**unité** **ou** sur un **modèle** **ou** sur une **option** ; `typeName="Abilities"` **ou** type faction (`Orders`, `Rituals`…) |
| Contrainte/coût/catégorie d'une option | sur l'**entryLink** **ou** sur la **cible** résolue |
| Arme | **base** (`min≥1`) · **option** (groupe `max=1` min 0) · **compteur d'échange** (`min 0`+`max`+décrément base) · **base + option de même nom** (2 emplacements distincts) |
| Nombre d'armes/options | `defaultAmount` · `min/max` · `modifier set` sur la borne (y compris d'un **groupe importé**) |
| Condition d'un modifier | dans le `<modifier>` **ou** dans le `<modifierGroup>` parent (`conditions`/`conditionGroups`) |
| Catégorie/rôle | `categoryLink` statique · `add`/`set-primary` conditionnel · `categoryLink` sur une **sélection** (flag) |
| Limite par datasheet | `max scope="roster"` (3, ou 1 si Epic Hero) · relevée à 6 par un `set` (Battleline) |
| Compte par figurine vs unité | `scope="parent"` (par modèle) vs `scope="unit"` (total) — **les deux peuvent coexister** |
| Coût | fixe · par instance (×N) · par palier de taille (`set` conditionné modèles) · repeat-cost (`increment` conditionné) · par faction (`set` conditionné `primary-catalogue`) |
| Faction/détachement actif | condition `scope="force"`/`roster" childId=<détachement>` · `scope="primary-catalogue"` · `field="forces"` |

---

## 10. Pipeline d'évaluation recommandé
1. Charger game system + catalogues ; construire la **clôture d'import** (catalogueLink transitif).
2. Pour chaque entrée affichée : **résoudre** ses entryLinks/infoLinks (fusion lien↔cible).
3. **Évaluer les modifiers** (ordre set→incr/decr→floor/ceil), en évaluant **conditions +
   conditionGroups (and/or/count)** avec tous les scopes (dont `primary-catalogue`,
   `force`, `roster`, `parent`, `unit`) et `repeats`.
4. Calculer **contraintes effectives** (min/max après modifiers, `automatic`, `percentValue`).
5. **Composition** : sommer modèles (selectionEntry `type=model` directs + entryLinks-modèles)
   après modifiers, respecter `min 0`, exécuter les échanges (décréments).
6. **Armes/options** : base (min≥1, lecture seule) ; options (groupes max1 = choix ; min0 =
   compteur) ; appliquer plafonds par figurine **et** par unité ; coût **par instance**.
7. **Capacités** : union unité+modèles, tous typeNames de capacité, dédupliquées.
8. **Catégories/rôle** : base + grants conditionnels (`add`/`set-primary`) + flags de sélection.
9. **Coûts** : base + paliers + repeat-cost + par instance + chapter-cost (primary-catalogue).
10. **Détachements** : entrées à coût DP ; mutuellement exclusifs par `unique-detachment`.

---

## 11. Tests diagnostiques permanents conseillés (anti-régression)
Ajoute des sweeps qui **flaguent toute future datasheet** correspondant à un idiome à
risque, pour attraper les trous avant l'utilisateur :
- arme **base forcée (`min≥1`) + option de même nom** (pattern Rhino) ;
- véhicule/monstre **sans arme par défaut** et **sans groupe de choix à défaut** ;
- entrée d'arme **`min 0` rendue comme équipée** (devrait être un compteur/choix) ;
- `modifier field="category"` (add/set-primary) **non appliqué** sous condition vraie ;
- `modifier` ciblant un **id de contrainte d'un groupe importé** non exécuté (compte d'armes) ;
- condition utilisant `scope="primary-catalogue"` / `conditionGroup type="count"` /
  `field="forces"` (vérifie que ton évaluateur les gère) ;
- profil de capacité à `typeName` non-`Abilities` non collecté.

---

## 12. Invariants
- **Aucune valeur n'est statique** tant que des modifiers conditionnels peuvent l'altérer
  (coût, nombre, catégorie, visibilité, défaut). Évalue d'abord.
- Décide **par la cible résolue**, **par les contraintes** (`min`/`max`/`scope`), **par les
  conditions du groupe** — jamais par le conteneur ou un nom.
- `min 0` = optionnel · `min≥1` = base · `max 1` = choix « 0/1 » · `automatic` = dérivé.
- `scope=parent` = par figurine · `scope=unit` = total · `scope=primary-catalogue` = selon la faction jouée.
- En cas de doute sur un idiome : cherche le **prompt dédié** (§8) ; sinon, traite-le
  comme une variante des règles ci-dessus, et ajoute un test diagnostique (§11).
