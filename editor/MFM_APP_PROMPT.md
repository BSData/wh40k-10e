# PROMPT — Adapter une application consommatrice (type NewRecruit) au MFM

> Prompt autonome : colle-le comme consigne à l'agent **dans le dépôt de
> ton application** (builder de listes qui lit les données BattleScribe
> de `wh40k-11e`). Il décrit ce qui va changer dans les données quand les
> points MFM seront intégrés, et ce que l'application doit savoir
> évaluer. Aucune connaissance du dépôt de données n'est requise au-delà
> de ce fichier.

## Contexte

Mon application lit les fichiers BattleScribe `.cat`/`.gst` du dépôt
`wh40k-11e` (Warhammer 40,000 11e). Une mise à jour de points (MFM) va y
introduire deux mécanismes nouveaux en plus des changements de valeurs :
**surcoût par arme** et **prix par seuil de répétition d'une unité dans
le roster**. Ta mission : auditer mon moteur de calcul de coûts, combler
les manques listés ci-dessous, et livrer les tests associés.

## Contrat de données (ce que produira le dépôt)

Type de coût points : `typeId="51b2-306e-1021-d207"`, `name="pts"`.

1. **Changements de valeurs** (déjà existant) : `<cost name="pts"
   typeId="51b2-306e-1021-d207" value="N"/>` sur les selectionEntries
   d'unités et d'améliorations.

2. **Tiers de taille** (déjà existant) : sur l'entrée d'unité, modifiers
   `<modifier type="set" value="Y" field="51b2-306e-1021-d207">` avec
   une condition sur le nombre de modèles sélectionnés
   (`field="selections"`). Exemple réel : coût de base 180, `set 360`
   quand la taille double est prise.

3. **NOUVEAU — surcoût par arme** : des `<cost name="pts" value="X"/>`
   non nuls apparaîtront sur :
   - des selectionEntries d'options (`type="upgrade"`) et des variantes
     de modèles (`type="model"`) à l'intérieur des unités ;
   - des `entryLink` (le coût porté par le **link**, pas par l'entrée
     partagée cible — les deux cas existeront) ;
   - en dernier recours, certains surcoûts seront des modifiers
     `increment` sur le coût de l'unité, conditionnés à la sélection de
     l'arme (`condition atLeast 1 field="selections" scope="parent"
     childId="<id arme>" shared="true"`).

4. **Seuil de répétition** — ⚠️ **OBSOLÈTE.** L'encodage par **entrée
   scindée** `(additional)` décrit ci-dessous a été **abandonné** (la
   jumelle cachée n'apparaissait pas dans les applis). Il est remplacé par
   un **modifier de coût `increment` + marqueur
   `repeat-cost: threshold=N delta=Δ`** sur l'unité — voir
   `REPEAT_COST_APP_PROMPT.md` (et la règle #5 du `CLAUDE.md`). La
   description qui suit n'est conservée que pour reconnaître d'éventuelles
   anciennes jumelles `(additional)` résiduelles dans des données non
   migrées ; **n'implémente pas ce mécanisme pour de nouvelles données**.
   Ancien encodage (entrée scindée, « les N premiers au prix de base,
   chaque exemplaire au-delà du Nième à un autre prix ») :
   - l'entrée d'origine reçoit une contrainte `max N field="selections"
     scope="roster" shared="true"` ;
   - une entrée jumelle `"<Unité> (additional)"` (selectionEntry clonée,
     ids propres) porte le prix « au-delà », est `hidden="true"` par
     défaut et révélée par `modifier set hidden=false` + `condition
     atLeast N field="selections" scope="roster" childId="<id de
     l'origine>" shared="true"` ;
   - les plafonds datasheet de la jumelle (`max field="selections"`
     scope force/roster) sont réduits de N : origine + jumelle
     respectent ensemble la limite d'armée ;
   - chaque `entryLink` exposant l'origine a un jumeau pointant la
     jumelle ;
   - les deux entrées portent un `<comment>` machine-lisible
     `repeat-tier: role=base|extra threshold=N partner=<id> [capId=…]`
     — ignore-le pour le calcul, mais il est fiable si tu veux grouper
     l'affichage du couple dans l'UI.

5. Mécanismes BattleScribe standards déjà présents dans les données et
   qu'il faut évaluer correctement : `modifierGroups`
   (`type="and"/"or"`), `<repeats>` (`<repeat value v, repeats r,
   field="selections", scope, childId, shared, roundUp,
   includeChildSelections>` → le modifier s'applique
   `r × floor(count/v)` fois, `ceil` si `roundUp`),
   `includeChildSelections="true"` sur les conditions (compte les
   sélections descendantes, pas seulement directes).

## Ce que l'application doit garantir

1. **Sommation récursive des coûts** : le total d'une unité = somme des
   `pts` (après modifiers) de l'entrée **et de toutes ses sélections
   descendantes** (modèles, options, entryLinks, améliorations
   rattachées). Si le moteur ne lit aujourd'hui que le coût racine des
   unités, c'est le chantier n°1.
2. **Évaluation des modifiers sur les champs de coût** : `set`,
   `increment`, `decrement` ciblant `field="51b2-306e-1021-d207"`, dans
   l'ordre du document, `set` évalué avant les `increment/decrement`
   qui s'y empilent ; conditions avec scopes `self`, `parent`,
   `ancestor`, `force`, `roster`, `primary-catalogue` ; résolution du
   `childId` à travers les entryLinks (un decompte par childId doit
   compter les sélections issues de links vers cette cible —
   `shared="true"`).
3. **Réactivité roster-scope** : ajouter le Nième exemplaire d'une unité
   doit **révéler l'entrée jumelle** (et son retrait la masquer) — la
   visibilité d'une entrée dépend de l'état du roster entier, pas de la
   seule entrée. Invalide tout cache de visibilité/coût à chaque
   ajout/retrait/changement d'option dans le roster, ou recalcule à la
   volée à partir de l'état complet.
4. **Affichage** : le prix affiché dans le picker (catalogue) peut
   différer du prix effectif dans le roster (conditions roster). Affiche
   le prix évalué dans le contexte du roster courant, et idéalement un
   indicateur quand un palier est actif (« 3+ exemplaires : Y pts »).
5. **Validation des contraintes** : `max N scope="roster"` sur une
   entrée d'unité (pattern entrée scindée) doit être appliqué, et
   l'entrée jumelle masquée ne doit être proposée que lorsque sa
   condition de visibilité est vraie.
6. **Évaluation complète des modifiers `hidden`** (bug réel constaté
   sur les améliorations Adeptus Custodes du dépôt) :
   - dans un `conditionGroup`, les `<conditions>` directes ET les
     `<conditionGroups>` imbriqués comptent **ensemble** dans le
     or/and du groupe — n'ignore jamais l'un des deux ;
   - `instanceOf`/`notInstanceOf` avec `scope="ancestor"` et
     `childId=<categoryEntry>` se résout en remontant les ancêtres de
     la sélection et leurs **categoryLinks** (catégories héritées
     comprises) ; une condition non implémentée ne doit JAMAIS être
     évaluée « vraie » par défaut — échoue bruyamment ou logge ;
   - cas réels de référence (fichier `Imperium - Adeptus
     Custodes.cat`, détachement Shield Host) : « From the Hall of
     Armouries » = cachée si `notInstanceOf ancestor Shield-Captain`
     (condition directe + sous-groupe détachement dans le même OR) ;
     « Auric Mantle » = cachée si `AND(notInstanceOf Shield-Captain,
     notInstanceOf Blade Champion)` (deux sous-groupes, pas de
     condition directe). Attendu : un Blade Champion en Shield Host
     voit Auric Mantle mais PAS From the Hall of Armouries ; un
     Shield-Captain voit les deux.

## Plan de travail demandé

1. Audite le moteur actuel : où sont lus les `<cost>` ? les modifiers de
   coût sont-ils évalués ? avec quels scopes ? les `repeats` ? Produis un
   tableau des manques par rapport à la section « garantir ».
2. Implémente les manques, dans cet ordre : sommation récursive →
   modifiers de coût (set/increment/decrement + conditions tous scopes)
   → repeats → réactivité roster → entrée scindée (hidden +
   max@roster).
3. **Tests** (fixtures XML minimales, indépendantes du vrai dépôt) :
   - unité 100 pts + option d'arme 10 pts → 110 ; retrait → 100 ;
   - coût porté par un entryLink (et non par l'entrée cible) → compté ;
   - surcoût encodé en `increment` conditionné à la sélection de
     l'arme → identique au cas coût-sur-entrée ;
   - tiers de taille : 5 modèles = 90, 10 modèles = 180 (modifier
     `set`) ;
   - entrée scindée : la jumelle est invisible avec N−1 exemplaires de
     l'origine, visible au Nième (et re-masquée au retrait) ;
     contrainte `max N @roster` sur l'origine et plafonds réduits de la
     jumelle respectés ; total exact X×N + Y×(k−N) ;
   - entrée scindée + tiers de taille : la jumelle prise en taille
     supérieure utilise **ses propres** modifiers de prix (références
     internes re-mappées sur ses ids), pas ceux de l'origine ;
   - amélioration à 25 pts sur un personnage → ajoutée au total de
     l'unité porteuse ;
   - `repeats` : +5 pts par modèle au-delà du 2e (`repeat` +
     condition `atLeast 3`) → 3 modèles = +15−10 (reproduis le
     modifierGroup réel : increment 5 répété + decrement 10 fixe) ;
   - visibilité d'amélioration (cas Custodes ci-dessus) : porteur
     Blade Champion en Shield Host → « Auric Mantle » proposée,
     « From the Hall of Armouries » masquée ; porteur Shield-Captain
     → les deux proposées ; hors Shield Host (sans force Croisade) →
     les deux masquées. Fixture reprenant la structure exacte :
     OR(condition directe, sous-groupe AND) pour l'une,
     OR(sous-groupe AND, sous-groupe AND) pour l'autre.
4. Non-régression : les rosters existants sauvegardés doivent recharger
   au même total tant que les données n'ont pas changé.

## Invariants (ce qui ne changera PAS avec le MFM)

- Profils, règles, stratagèmes (`<rule name="X (Stratagem, NCP)">`),
  mots-clefs, structure des détachements : inchangés par un MFM.
- Le typeId des points et la structure générale des fichiers.
- Les coûts annexes (`Crusade Points`, etc.) restent à 0 — ne pas les
  additionner dans le total en points.
