# PROMPT — Prix par seuil de répétition : surcoût « au-delà du Nème » par modifier

> Prompt autonome : colle-le comme consigne à l'agent **dans le dépôt de ton
> application** (builder de listes qui lit les `.cat`/`.gst` de `wh40k-11e`).
> Aucune connaissance du dépôt de données n'est requise au-delà de ce fichier.

## Symptôme à corriger

Les unités à palier de répétition (le MFM dit « **YOUR 1ST TO 2ND UNITS COST
X**, YOUR 3RD + UNIT COSTS Y », ou « 1ST … / 2ND + … ») ne facturent pas le
surcoût : p. ex. la **3e escouade Purgation** reste à 110 alors qu'elle devrait
coûter 120. (Auparavant la donnée encodait ça par une **entrée dupliquée
cachée** « X (additional) » qui n'apparaissait jamais dans l'appli — supprimée.)

## Nouvel encodage (la donnée est correcte — c'est l'évaluation qui manque)

Sur le `selectionEntry` de l'unité, un **modifier de coût** porte le surcoût et
un **marqueur** indique la sémantique :

```xml
<modifier type="increment" field="51b2-306e-1021-d207" value="Δ">
  <comment>repeat-cost: threshold=N delta=Δ (surcout par exemplaire au-dela du Neme uniquement; ...)</comment>
  <conditions>
    <condition type="atLeast" value="N+1" field="selections" scope="roster"
               childId="&lt;id de CETTE unité&gt;" shared="true"
               includeChildSelections="true" includeChildForces="true"/>
  </conditions>
</modifier>
```

- `field="51b2-306e-1021-d207"` = coût en **points** ; `type="increment"`,
  `value="Δ"` = le **surcoût par exemplaire** (Δ = prix_fort − prix_base,
  constant quelle que soit la taille de l'unité).
- **Marqueur** `<comment>repeat-cost: threshold=N delta=Δ …</comment>` : c'est lui
  qui porte la sémantique. `threshold=N` = nombre d'exemplaires au **prix de
  base** ; au-delà, surcoût `delta`. (`N` est aussi déductible de la condition :
  `value` de la condition `atLeast` − 1.)
- La condition `atLeast N+1 … scope="roster" childId=<unité>` ne sert qu'à
  borner : le surcoût n'est pertinent que si l'armée contient **plus de N**
  exemplaires de l'unité.

## Ce que l'application DOIT faire

Pour une unité dont un modifier de coût (`field` = points) porte un `<comment>`
contenant `repeat-cost: threshold=N`, avec `delta` = `value` du modifier :

1. **Compte les exemplaires** de cette **datasheet** dans le **roster entier**
   (`scope="roster"`, tous détachements confondus — `includeChildForces`).
2. Les **N premiers** exemplaires coûtent leur **prix normal** (coût de base +
   paliers de taille habituels).
3. Chaque exemplaire **à partir du (N+1)ème** coûte **prix normal + Δ**.
4. **N'ajoute Δ ni aux N premiers, ni à tous les exemplaires.** Le surcoût ne
   touche **que** les exemplaires au-delà du seuil. C'est tout l'intérêt du
   marqueur : la lecture naïve du modifier (« +Δ sur l'unité dès qu'on en a
   N+1 ») surfacturerait les N premiers — **ne fais pas ça**.

Δ est un **forfait par exemplaire**, indépendant de la taille (nombre de
figurines) de l'exemplaire surtaxé : applique-le tel quel par-dessus le coût
de taille déjà calculé.

## Pseudocode

```
copies = roster.unitsMatching(datasheet)              // toutes tailles, tout le roster
for (i, copy) in enumerate(copies):                   // i = 0,1,2,...
    cost = sizeBasedCost(copy)                         // base + paliers de taille
    if i >= N: cost += delta                           // (N+1)ème et au-delà
    total += cost
```

L'ordre des exemplaires n'a pas d'importance pour le **total** (N au prix bas,
le reste au prix fort) ; si tu affiches un coût par unité, montre simplement N
exemplaires au prix bas et les autres au prix fort.

## Cas de référence

- **Purgation Squad** (Grey Knights) : prix de base 5 fig = **110**,
  `threshold=2 delta=10`.
  - 1 escouade → 110. 2 → 220. **3 → 110+110+120 = 340**. 4 → 460.
- **Land Raider** (Grey Knights) : base **220**, `threshold=2 delta=20`.
  - 3 Land Raiders → 220+220+240 = **680**.
- **Brotherhood Terminator Squad** : paliers 4/5/8/10 fig (140/175/300/375),
  `threshold=3 delta=10`. La 4e escouade (quelle que soit sa taille) paie son
  coût de taille **+10**.

## Invariants

- **Aucune donnée à modifier** : le surcoût (Δ), le seuil (N) et la portée
  (roster) sont déjà dans le modifier + le marqueur + la condition. Le correctif
  est **purement applicatif** : compter les exemplaires et n'appliquer Δ qu'aux
  exemplaires au-delà du Nème.
- Plus aucune entrée « (additional) » dupliquée : si ton appli en gérait,
  retire ce traitement — l'encodage par modifier le remplace.
