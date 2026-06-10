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

4. **NOUVEAU — seuil de répétition** : deux encodages possibles selon le
   texte GW :
   - **Palier global** : sur l'entrée d'unité, `modifier set|increment`
     du coût avec `condition atLeast N field="selections"
     scope="roster" childId="<id de l'unité (ou d'une catégorie)>"
     shared="true"`. Sens : dès que le roster contient ≥N exemplaires,
     **chaque** exemplaire prend le nouveau prix.
   - **Entrée scindée** : l'entrée d'origine reçoit une contrainte
     `max N scope="roster"` ; une seconde entrée clonée
     (`"<Unité> (au-delà du Nième)"`, prix Y) est `hidden="true"` par
     défaut et révélée par un `modifier set hidden=false` conditionné
     au décompte roster de la première.

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
   doit **re-prix(er) les N−1 autres** (palier global) ou révéler/masquer
   l'entrée scindée. Le coût d'une entrée n'est donc pas cachable
   isolément : invalide le cache de coûts à chaque ajout/retrait/
   changement d'option dans le roster, ou recalcule le total à la
   volée à partir de l'état complet.
4. **Affichage** : le prix affiché dans le picker (catalogue) peut
   différer du prix effectif dans le roster (conditions roster). Affiche
   le prix évalué dans le contexte du roster courant, et idéalement un
   indicateur quand un palier est actif (« 3+ exemplaires : Y pts »).
5. **Validation des contraintes** : `max N scope="roster"` sur une
   entrée d'unité (pattern entrée scindée) doit être appliqué, et
   l'entrée jumelle masquée ne doit être proposée que lorsque sa
   condition de visibilité est vraie.

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
   - palier global : 2 exemplaires à 100 = 200 ; ajout du 3e
     (condition `atLeast 3 @roster`, set 110) → total 330, retrait →
     200 ;
   - palier + tiers combinés sur la même unité (set taille +
     increment seuil) → ordre d'évaluation correct ;
   - entrée scindée : la jumelle apparaît au Nième, contrainte
     `max N @roster` respectée, total exact X×N + Y×(k−N) ;
   - amélioration à 25 pts sur un personnage → ajoutée au total de
     l'unité porteuse ;
   - `repeats` : +5 pts par modèle au-delà du 2e (`repeat` +
     condition `atLeast 3`) → 3 modèles = +15−10 (reproduis le
     modifierGroup réel : increment 5 répété + decrement 10 fixe).
4. Non-régression : les rosters existants sauvegardés doivent recharger
   au même total tant que les données n'ont pas changé.

## Invariants (ce qui ne changera PAS avec le MFM)

- Profils, règles, stratagèmes (`<rule name="X (Stratagem, NCP)">`),
  mots-clefs, structure des détachements : inchangés par un MFM.
- Le typeId des points et la structure générale des fichiers.
- Les coûts annexes (`Crusade Points`, etc.) restent à 0 — ne pas les
  additionner dans le total en points.
