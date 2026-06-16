# PROMPT — Adapter une application consommatrice (type NewRecruit) au rattachement « 1 modèle porte l'amélioration »

> Prompt autonome : colle-le comme consigne à l'agent **dans le dépôt de
> ton application** (builder de listes qui lit les données BattleScribe
> de `wh40k-11e`). Il décrit comment les données désignent **quel modèle
> d'une unité porte une amélioration de groupe** (icône, bannière,
> instrument, arme spéciale) et le comportement que l'application doit
> garantir. Aucune connaissance du dépôt de données n'est requise au-delà
> de ce fichier.

## Symptôme à corriger

Dans l'application, les icônes / bannières / instruments d'une unité
(p. ex. « Daemonic Icon », « Chaos icon », « Icon of Flame »,
« Sanguinary Banner », « Instrument of Chaos ») ne peuvent être attribués
qu'au **chef d'unité** (champion). C'est un bug d'interprétation : le
modèle porteur n'est PAS le chef par défaut, il est **désigné par la
donnée**. L'application doit calculer l'ensemble des modèles éligibles à
partir de l'amélioration elle-même, et laisser l'utilisateur en choisir
un — le chef n'a aucun statut particulier.

## Contrat de données (comment la donnée désigne le porteur)

Une amélioration de groupe qui « se met sur 1 modèle » porte un élément
`<association>` :

```xml
<selectionEntry type="upgrade" name="Daemonic Icon">   <!-- ou <entryLink ... name="Daemonic Icon"> -->
  <associations>
    <association min="1" max="1" scope="<id d'unité>|parent" childId="model|<id>"
                 includeChildSelections="true|absent" name="…" id="…"/>
  </associations>
</selectionEntry>
```

L'élément vit sous `<associations>`, lui-même enfant **soit d'un
`selectionEntry`, soit d'un `entryLink`** (les deux cas existent dans le
dépôt — gère les deux). Attributs :

- `id`, `name` : **cosmétiques** (ne décident de rien).
- `min`, `max` : **combien de modèles** portent l'amélioration. Dans tout
  le dépôt c'est `min="1" max="1"` → exactement **un** modèle.
- `scope` : **où chercher** les modèles éligibles. Soit le jeton
  `"parent"` (= l'unité qui contient la sélection porteuse), soit un
  **id concret** (en pratique l'id du `selectionEntry` de l'unité).
  **Traite `"parent"` et l'id de l'unité de façon identique → « l'unité ».**
  (BattleScribe définit aussi `self`/`ancestor`/`force`/`roster`/
  `primary-catalogue` ; supporte-les génériquement, mais les
  icônes/bannières utilisent `parent` ou l'id d'unité.)
- `childId` : **quels modèles** sont éligibles, à l'intérieur du `scope` :
  - **`"model"`** (jeton littéral) → **N'IMPORTE QUEL modèle** du scope
    (toute l'unité). **Le champion est inclus.**
  - un id de `selectionEntry` `type="model"` → **ce modèle précis** seulement.
  - un id de `selectionEntryGroup` → **les modèles de ce groupe** seulement.
  - un id de `categoryEntry` → les modèles dont **les catégories** le
    contiennent (p. ex. « Jakhal »).
- `includeChildSelections="true"` (optionnel) → en résolvant/comptant,
  **descends dans les sélections imbriquées**, pas seulement les enfants
  directs.

**Ensemble des porteurs éligibles** = { sélections `type="model"` situées
dans `resolve(scope)` qui correspondent à `childId` }. L'amélioration est
portée par exactement `min..max` (= 1) modèle **choisi dans cet
ensemble**.

### Deux cas réels du dépôt qui DOIVENT se comporter différemment

Ils prouvent que le chef n'a aucun statut particulier — seul `scope` +
`childId` décident :

1. **Bloodcrushers** (`Chaos - Chaos Daemons Library.cat`, unité
   `2f31-9132-b703-5fd8`) : modèles = **Bloodcrusher** (troupe) +
   **Bloodhunter** (champion).
   `Daemonic Icon` → `<association min="1" max="1" scope="2f31-…"
   childId="model"/>`.
   → **Les deux** modèles sont éligibles ; l'utilisateur doit pouvoir
   poser l'icône sur le Bloodcrusher **ou** sur le Bloodhunter (champion).

2. **Rubric Marines** (`Chaos - Thousand Sons.cat`, unité
   `5d3d-e13b-8b76-dad3`) : le champion **Aspiring Sorcerer** est un
   modèle direct ; la troupe est dans le groupe **« 4-9 Rubric Marines »**
   (`cf91-4bac-8211-36f8`).
   `Icon of Flame` → `<association min="1" max="1" scope="5d3d-…"
   childId="cf91-…"/>`.
   → éligibles = **les 3 modèles de troupe uniquement** ; l'Aspiring
   Sorcerer (champion) **ne doit PAS** se voir proposer l'icône.

Cas spécifique supplémentaire : « Instrument of Chaos » est souvent
`childId="<id du modèle de troupe>"` → attribuable **à ce seul modèle**.

### Contre-modèle (PAS d'association) — porteur dédié

De nombreuses factions modélisent la bannière comme une **variante de
modèle** `type="model"` distincte, choisie au **compte** (p. ex. Astra
Militarum « w/ Regimental standard », Adepta Sororitas « Novitiate with
Sacred Banner », Genestealer Cults « w/ Cult Icon », Grey Knights « with
Ancient's Banner »). Il n'y a **pas d'`association`** : le porteur **est**
l'un des modèles de l'unité, pris comme les autres. L'application gère
déjà ces cas via la sélection de modèles normale — **ne les fais pas
passer par la logique d'association**. (Mentionné pour distinguer les
deux mécanismes.)

## Ce que l'application doit garantir

1. **Porteurs issus de la donnée, jamais d'heuristique « chef »** : pour
   chaque amélioration portant une `<association>`, calcule
   `éligibles = resolve(scope) ∩ childId` (règles ci-dessus, en
   parcourant le sous-arbre / en respectant `includeChildSelections`).
   Le chef/champion est éligible **si et seulement si** il appartient à
   cet ensemble (vrai pour `childId="model"`, faux pour un
   groupe/catégorie/modèle qui l'exclut).
2. **L'utilisateur choisit le modèle porteur** : expose l'amélioration
   comme attribuable à **un** modèle parmi les éligibles (sélecteur de
   modèle sur l'amélioration, ou exposition de l'amélioration sous chaque
   modèle éligible avec coche d'exactement un). Respecte `min`/`max`
   (= 1 ici). Un défaut raisonnable peut être le premier éligible, mais
   l'utilisateur **doit pouvoir le déplacer sur n'importe quel modèle
   éligible** — champion compris quand `childId="model"`.
3. **Bug à supprimer** : tout chemin de code qui (a) rattache les options
   de groupe au premier modèle / au chef, ou (b) n'affiche ces options
   que sous le champion. C'est le défaut signalé.
4. **Deux hôtes possibles** : l'association peut être portée par un
   `entryLink` (lien vers une amélioration partagée) **ou** par un
   `selectionEntry` inline. Lis le `<associations>` sous le nœud qui
   porte réellement l'amélioration, quel que soit son type.
5. **Persistance** : le modèle porteur choisi doit faire l'aller-retour
   (sauvegarde/rechargement) — mémorise quelle instance de modèle porte
   quelle association. Les rosters existants doivent recharger à
   l'identique.
6. **Tous les types de `childId`** : implémente la résolution `model` /
   `selectionEntryGroup` / `categoryEntry`. Un type de `childId` non
   implémenté doit **échouer bruyamment** (log/erreur), **jamais**
   retomber silencieusement sur « le chef » ou « n'importe lequel ».

## Plan de travail demandé

1. **Audite** : où l'application décide-t-elle aujourd'hui quel modèle
   porte une option de groupe ? L'élément `<association>` est-il parsé ?
   S'il ne l'est pas, c'est la cause racine (l'app utilise une
   heuristique « premier modèle / chef »).
2. **Implémente** le parsing de `<association>` + la résolution de
   l'ensemble des porteurs (`scope` + `childId` + `includeChildSelections`),
   les trois types de `childId`, et l'attribution au modèle choisi en
   respectant `min`/`max`.
3. **Câble l'UI** pour rendre l'amélioration attribuable à n'importe quel
   modèle éligible ; **retire** le chemin « chef uniquement ».
4. **Tests** (fixtures + les deux cas réels ci-dessus).

## Tests

- **Icône any-model** : unité troupe `R` + champion `C` ; amélioration
  `U` avec `childId="model"` `scope=unité` → `U` attribuable à `R` **ET**
  à `C` ; l'attribuer à `C` est valide ; `max` 1. (Réel : Bloodcrushers /
  Bloodhunter.)
- **Icône scopée à un groupe** : unité avec champion `C` (modèle direct)
  + groupe `G` de troupe ; `U` avec `childId=G` → `U` attribuable **à la
  troupe uniquement** ; `C` ne se voit **pas** proposer `U`. (Réel :
  Rubric Marines / Aspiring Sorcerer + « 4-9 Rubric Marines ».)
- **Modèle précis** : `U` avec `childId=<id modèle M>` → attribuable au
  seul `M`. (Réel : Instrument of Chaos épinglé à « Bloodletter ».)
- **Porteur dédié (sans association)** : unité avec variante « w/
  standard » → choisie au compte, pas via association ; le chef n'est pas
  forcé.
- **Aller-retour** : attribuer `U` à un modèle non-chef, sauvegarder,
  recharger → toujours sur ce modèle.
- **Échec bruyant** : association avec un type de `childId` inconnu →
  erreur/log, pas de repli silencieux sur le chef.

## Invariants (ce qui ne change PAS)

- Profils, règles, coûts, stratagèmes, structure des détachements :
  inchangés.
- L'élément `<association>` et ses attributs
  (`min`/`max`/`scope`/`childId`/`includeChildSelections`) **sont** le
  contrat ; `name`/`id` sont cosmétiques.
- `min`/`max` font foi pour le **nombre** de modèles porteurs (1 ici).
