# PROMPT — Évaluer correctement la composition d'unité (entryLinks de modèles + modifiers)

> Prompt autonome : colle-le comme consigne à l'agent **dans le dépôt de ton
> application** (builder de listes qui lit les `.cat`/`.gst` de `wh40k-11e`).
> Aucune connaissance du dépôt de données n'est requise au-delà de ce fichier.

## Symptôme à corriger

Sur les unités à **choix de taille** (ex. **Jakhals** : « 10 models » /
« 20 models »), la composition affichée est **incomplète**. Jakhals montre
**3 / 3** (Jakhal Pack Leader + Jakhal w/ mauler chainblade + 1 Dishonoured)
alors qu'à 10 modèles la bonne réponse est **1 Pack Leader + 8 Jakhals +
1 Dishonoured = 10**, **sans** mauler par défaut. Même classe de bug sur
Aquila/Decimus Kill Teams, Wolf Scouts, Catachan Jungle Fighters, Death Korps
of Krieg, Cadian Shock Troops, Gretchin, Burna Boyz, Lootas, Squighog Boyz.

**La donnée est complète — c'est l'ÉVALUATION qui manque.** Ces fiches
utilisent trois mécanismes BattleScribe standards que ton parseur ne traite pas
encore. Aucune donnée n'est à changer.

## Ce que l'application doit faire (3 manques)

### 1. Résoudre les `<entryLink>`-vers-modèle comme des modèles de composition
Un `<entryLink type="selectionEntry" targetId="…">` dont la **cible résolue**
est un `<selectionEntry type="model">` **EST un modèle** de l'unité, quel que
soit l'endroit où le lien est placé — **y compris au niveau de l'unité**, dans
les `<entryLinks>`, à côté d'autres liens (armes, Icon, Crusade…). Son
**nombre** vient des contraintes portées par le **lien** (sinon par la cible).
- Réel : **Jakhals** — les 8 Jakhals de base sont un
  `<entryLink targetId="0620-25eb-4da2-5dae">` (cible = modèle « Jakhal »)
  dans les `<entryLinks>` de l'unité, avec `min=8 max=8`. Ce sont **8 modèles**,
  pas une option/arme.
- **Ne décide pas « modèle vs option » d'après le conteneur**
  (`<selectionEntries>` vs `<entryLinks>`) : décide d'après le **type de la
  cible résolue** (`type="model"` → modèle).

### 2. Exécuter les `<modifier>` (pas seulement lire les min/max statiques)
Les nombres changent via des modifiers ; il faut les **évaluer** :
- `type="set" | "increment" | "decrement"`, `field="<id d'une contrainte>"`
  (ou un `costTypeId`). Ordre : **`set` AVANT `increment`/`decrement`**.
- **Cross-node** : un modifier porté par l'entrée A peut viser une contrainte
  définie sur l'entrée B, **par son `id`**. Ex. l'entrée « 20 models » porte
  des `set` qui modifient la contrainte de nombre du Jakhal de base, le nombre
  de Dishonoured, le plafond du mauler… L'entrée « 10 models » n'a **aucun**
  modifier (c'est la base par défaut).
- `<repeats><repeat … childId="X"/></repeats>` : applique le modifier **une
  fois par sélection de X**. Ex. Jakhals — `decrement 1` sur le nombre de
  Jakhals de base, **répété par « Jakhal w/ mauler chainblade »** → réguliers
  = base − (nb de maulers).
- Respecte les `<conditions>` / `<conditionGroups>` (scopes `self`, `parent`,
  `ancestor`, `force`, `roster`) si présentes.

### 3. Respecter min/max et les défauts
Un modèle **optionnel** (`max=1`, **pas** de contrainte `min` → min 0) vaut
**0 par défaut**, pas 1. Réel : Jakhals — « Jakhal w/ mauler chainblade »
(max 1, min 0) doit être **0** par défaut, pas `1×`.
Le total « Model Composition » = somme des **nombres évalués** (après modifiers)
de **tous** les modèles : `selectionEntry type="model"` directs + `entryLink`→
modèle (niveau unité **et** dans l'entrée de taille / les groupes sélectionnés)
+ modèles des groupes (`selectionEntryGroup` avec un total min=max).

## Cas de référence à tester — Jakhals
- **Défaut** (« 10 models » sélectionné, aucun modifier) :
  Pack Leader **1** + Jakhal (entryLink→`0620`) **8** + Dishonoured **1** =
  **10 modèles**, mauler **0**, **65 pts**.
- **Prendre 1 « Jakhal w/ mauler chainblade »** : le `decrement` ramène les
  Jakhals de base à **7** → 1 PL + 7 + 1 mauler + 1 Dishonoured = **10**
  (mauler ≤ 1 à cette taille).
- **Sélectionner « 20 models »** : les `set` de l'entrée passent le Jakhal de
  base à **17**, Dishonoured à **2**, plafond mauler à **2** → **20 modèles**,
  **140 pts**.

Si ces trois lignes tombent juste, **toutes** les unités remodelées suivent
(même mécanisme) : Aquila/Decimus Kill Teams, Wolf Scouts, Catachan, Death
Korps, Cadian Shock Troops, Gretchin, Burna Boyz, Lootas, Squighog Boyz.

## Invariants
- Points et ratios d'armes par taille sont **déjà** pilotés par le nombre de
  modèles et par ces modifiers : une fois l'évaluation faite, rien d'autre à
  coder côté données.
- **Aucune donnée à modifier** : c'est strictement un correctif d'évaluation
  côté appli (résolution des `entryLink`-modèles + exécution des `modifier`
  cross-node/`repeats` + défauts min/max).
