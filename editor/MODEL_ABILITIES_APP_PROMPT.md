# PROMPT — Capacités de datasheet portées au niveau MODÈLE (pas seulement sur l'unité)

> Prompt autonome : colle-le comme consigne à l'agent **dans le dépôt de ton
> application** (builder de listes / afficheur de datasheets qui lit les
> `.cat`/`.gst` de `wh40k-11e`). Aucune connaissance du dépôt de données n'est
> requise au-delà de ce fichier.

## Symptôme
Certaines règles de datasheet ne s'affichent pas. Cause : la plupart des capacités
sont des profils `Abilities` posés sur la datasheet (`selectionEntry type="unit"`),
mais **quelques-unes sont posées sur un modèle** (`selectionEntry type="model"`
imbriqué dans l'unité). Une appli qui ne lit que les capacités au **niveau unité**
les rate (ex. observés : Skyweavers « Acrobatic Grace », War Walkers « Crystalline
Targeting » — et il peut y en avoir d'autres, y compris des capacités propres à un
modèle précis comme un Sergent/Champion).

## Modèle de données (BattleScribe `.cat`/`.gst`)
Une capacité = un `<profile typeName="Abilities" typeId="9cc3-6d83-4dd3-9b64">`
avec une caractéristique `Description`. Elle peut se trouver :
- sous le `<profiles>` **de l'unité** (cas majoritaire), **ou**
- sous le `<profiles>` **d'un `<selectionEntry type="model">`** imbriqué dans l'unité.

```xml
<selectionEntry type="unit" name="...">
  <profiles> … capacités au niveau unité … </profiles>
  <selectionEntries>
    <selectionEntry type="model" name="Skyweaver">
      <profiles>
        <profile name="Skyweaver" typeName="Unit" .../>            <!-- ligne de stats, PAS une capacité -->
        <profile name="Acrobatic Grace" typeName="Abilities">...</profile>  <!-- capacité au niveau MODÈLE -->
      </profiles>
    </selectionEntry>
  </selectionEntries>
</selectionEntry>
```

## Ce que l'application doit faire
1. **Collecter les capacités dans TOUT le sous-arbre de la datasheet**, pas
   seulement le `<profiles>` direct de l'unité : parcourir l'unité **et tous ses
   `selectionEntry type="model"`** et récupérer chaque `<profile>` dont
   `typeName="Abilities"` (typeId `9cc3-6d83-4dd3-9b64`).
2. **Ne garder que les capacités** : exclure `typeName="Unit"` (la ligne de
   stats M/T/Sv…), et les profils d'arme (`typeName="Ranged Weapons"` /
   `"Melee Weapons"`), qui ne sont pas des règles de datasheet.
3. **Dédupliquer et ne pas multiplier par le nombre de figurines** : une capacité
   portée par un modèle présent en N exemplaires (ex. 2 Skyweavers) ne doit
   apparaître **qu'une fois**. Déduplique par `id` de profil (ou par nom + texte).
4. **Capacité propre à un modèle** : si une capacité n'est portée que par un
   modèle précis d'une unité multi-modèles (ex. seulement le « Lead Player »),
   tu peux l'afficher en l'attribuant à ce modèle (« X — *Lead Player* »), mais
   affiche-la quoi qu'il arrive.
5. **Résolution d'import** : pour une unité importée d'une bibliothèque partagée
   via `entryLink`/`importRootEntries`, applique la même collecte sur l'entrée
   **résolue** (les capacités voyagent avec l'entrée importée).

## Invariants
- L'ensemble des capacités d'une datasheet = (profils `Abilities` de l'unité)
  ∪ (profils `Abilities` de chacun de ses modèles), **dédupliqués**.
- « Invulnerable Save » est aussi un profil `Abilities` : même traitement.
- Aucune donnée à modifier : c'est un correctif de **lecture/affichage** côté appli.

## Tests
- Une unité dont une capacité est sur le modèle (pas sur l'unité) affiche bien
  cette capacité.
- Une unité de 2+ figurines portant une capacité au niveau modèle l'affiche
  **une seule fois** (pas une par figurine).
- Les lignes de stats (`typeName="Unit"`) et les profils d'arme ne sont **pas**
  listés comme capacités de datasheet.
