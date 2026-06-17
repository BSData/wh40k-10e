# PROMPT — Liens « chef → unités menées » (Space Marines & chapitres)

> Prompt autonome : colle-le comme consigne à l'agent **dans le dépôt de ton
> application** (builder de listes qui lit les `.cat`/`.gst` de `wh40k-11e`).
> Aucune connaissance du dépôt de données n'est requise au-delà de ce fichier.

## Ce qui est encodé

Le MFM précise, pour chaque personnage **LEADER**, la liste des unités qu'il
peut rejoindre. C'est encodé sur les datasheets par des
**`selectionEntryGroup` déclaratifs** : `hidden="true"` + une contrainte
`max=0` (donc **jamais sélectionnables** — ce sont des métadonnées, pas des
options de liste), contenant des `entryLink` vers les datasheets partenaires.

Deux noms de groupe, selon le sens :

```xml
<!-- sur un CHEF : unités qu'il peut mener -->
<selectionEntryGroup name="Can Lead (MFM)" hidden="true" id="…">
  <comment>leader-link: unites menables par ce chef …</comment>
  <constraints><constraint type="max" value="0" field="selections" scope="parent" .../></constraints>
  <entryLinks>
    <entryLink type="selectionEntry" hidden="true" targetId="&lt;datasheet unité&gt;"/>
    …
  </entryLinks>
</selectionEntryGroup>

<!-- sur une UNITÉ : chefs qui peuvent la mener -->
<selectionEntryGroup name="Can Be Led By (MFM)" hidden="true" id="…">
  <comment>leader-link: chefs pouvant mener cette unite …</comment>
  <constraints><constraint type="max" value="0" .../></constraints>
  <entryLinks><entryLink type="selectionEntry" hidden="true" targetId="&lt;datasheet chef&gt;"/> …</entryLinks>
</selectionEntryGroup>
```

## Pourquoi DEUX sens (et pas seulement « Can Lead » sur le chef)

Le tronc commun Space Marines (`Imperium - Space Marines.cat`) est **importé**
par les chapitres (Blood Angels, Dark Angels, Deathwatch, Space Wolves,
Black Templars, Imperial Fists, Ultramarines, etc.) — jamais l'inverse. Une
paire chef→unité doit être **déclarée dans un fichier qui voit les deux** :

- chef **et** unité dans `Space Marines.cat` → `Can Lead (MFM)` sur le chef, dans `Space Marines.cat` ;
- chef de **chapitre** + unité du tronc commun → `Can Lead (MFM)` sur le chef, dans le fichier du chapitre (l'unité y est visible par import) ;
- chef du **tronc commun** + unité **spécifique au chapitre** (ex. Captain → Sanguinary Guard, Victrix Honour Guard, Deathwing Knights…) → impossible de pointer depuis `Space Marines.cat` (référence pendante). On déclare alors `Can Be Led By (MFM)` **sur l'unité du chapitre**, dans le fichier du chapitre, pointant vers le chef importé.

## Ce que l'application DOIT faire

Pour obtenir l'ensemble des unités qu'un chef **L** peut mener **dans l'armée
courante** :

```
leadables(L) =  { B : B ∈ liens "Can Lead (MFM)" de L }
              ∪ { B : L ∈ liens "Can Be Led By (MFM)" de B }
```

c'est-à-dire **l'union** des liens portés par le chef *et* des liens « led-by »
portés par les unités — puis **restreinte aux datasheets réellement disponibles
dans le catalogue primaire courant** (une unité spécifique à un autre chapitre
n'apparaît pas, donc le lien est inerte hors de son chapitre). Symétriquement,
pour une unité, ses chefs possibles = union des deux sens.

- Ces groupes sont **`hidden` + `max=0`** : ne les propose **jamais** comme
  sélection/option dans le builder ; ne compte pas leur coût. Sers-t'en
  uniquement pour proposer/valider le **rattachement** d'un personnage à une
  unité (mécanique « Leader » de la 10e/11e).
- Le `<comment>leader-link: …</comment>` est purement documentaire.

## Invariants

- **Aucune référence pendante** : chaque `entryLink` cible une datasheet
  visible dans le fichier où il est déclaré (vérifié par `catalog.validate`).
- Les liens ne créent **aucune unité ni coût** : `max=0`, `hidden`. Si ton
  évaluateur ignore les entrées `hidden`/`max=0`, le rattachement n'est pas
  proposé — il faut donc lire explicitement ces deux groupes par leur nom.
- Données présentes pour **Space Marines + chapitres** uniquement (seules
  factions dont le MFM publie les listes LEADER). Les autres factions
  s'appuient sur les mots-clefs de la prose, comme avant.
