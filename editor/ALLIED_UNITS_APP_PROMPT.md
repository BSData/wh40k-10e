# PROMPT — Corriger le classement « Allied Units » des unités importées par `importRootEntries`

> Prompt autonome : colle-le comme consigne à l'agent **dans le dépôt de
> ton application** (builder de listes qui lit les données BattleScribe
> de `wh40k-11e`). Il décrit pourquoi une armée dont le roster est
> **importé d'une bibliothèque** voit toutes ses unités tomber dans
> « Allied Units », et la règle que l'application doit appliquer. Aucune
> connaissance du dépôt de données n'est requise au-delà de ce fichier.

## Symptôme à corriger

Quand on construit une liste **Chaos Daemons**, **toutes** les unités
sont rangées dans « Allied Units » au lieu de leur rôle de champ de
bataille (Battleline, Character, Mounted…). Le même bug touche toute
faction dont le catalogue jouable **importe son roster d'une
bibliothèque** (p. ex. **Imperial Knights**).

## Cause racine (la donnée est correcte — c'est l'interprétation qui manque)

- Un catalogue jouable peut **assembler son roster en important les
  entrées racines d'une bibliothèque liée**, via
  `<catalogueLink … importRootEntries="true">`.
- `Chaos - Chaos Daemons.cat` (`id="d265-877b-e03d-30ca"`,
  `library="false"`) **ne définit aucune unité localement** : il importe
  tout le roster démoniaque depuis `Chaos - Daemons Library.cat`
  (`id="b45c-af22-788a-dfd6"`, `library="true"`) avec
  `importRootEntries="true"`.
- Ces unités importées sont **correctement étiquetées** : catégorie
  primaire = rôle (Battleline / Mounted / Beast / Infantry), catégorie de
  faction = **« Faction: Legiones Daemonica »**
  (`id="571f-ec3a-a5a2-751a"`), et elles ne portent **aucune** catégorie
  « Allied Units ».
- **Le bug** : l'application décide « allié » d'après **le fichier où
  l'unité est physiquement définie** (la bibliothèque `b45c`) ≠ le
  catalogue primaire du roster (`d265`). Comme toutes les unités viennent
  de la bibliothèque, **tout** est marqué allié.
- **Preuve par contraste** : Craftworlds, Astra Militarum, World Eaters…
  importent aussi une bibliothèque pour le **contenu partagé**, mais
  listent leurs unités comme **`<entryLink>` explicites** dans le
  catalogue jouable (donc « natives ») → non alliées. Chaos Daemons (et
  Imperial Knights) s'appuient sur `importRootEntries` **pour les unités
  elles-mêmes** → alliées à tort.

## Le contrat BattleScribe à honorer

`importRootEntries="true"` signifie : **traiter les entrées racines du
catalogue cible (les `selectionEntry` racines et les `entryLink` racines)
comme si elles étaient déclarées à la racine du catalogue IMPORTATEUR.**
Une unité ainsi importée est une unité **native** du catalogue
importateur à **toutes** fins : sélection, catégories/rôles, ET
attribution de source/allié. **Le fichier de définition est sans
importance pour le statut allié.** L'import est **transitif** (une
bibliothèque peut elle-même importer une autre bibliothèque) : aplatis
la chaîne.

## La bonne règle « Allied Units »

« Allié » dépend de la **faction**, pas du fichier :

1. **Détermine la faction de l'armée** depuis le roster (le catalogue
   primaire et/ou le **Détachement** choisi). Pour un roster
   `Chaos - Chaos Daemons`, la faction est **Legiones Daemonica**.
2. Une unité dont les catégories **contiennent** le mot-clef de faction
   de l'armée → **unité primaire**, rangée par sa **catégorie de rôle**
   (Battleline, Character, Mounted…).
3. Une unité qui **ne le contient pas** → « Allied Units ».
4. Exception data : une unité dont la **catégorie primaire EST « Allied
   Units »** dans la donnée (p. ex. `Unaligned Forces`, `Library -
   Titans`) est **toujours** alliée, quelle que soit l'armée — respecte
   ça.
5. **N'utilise JAMAIS le fichier de définition** pour décider du statut
   allié. Les entrées importées par `importRootEntries` sont attribuées
   au catalogue importateur.

## Ce que l'application doit garantir

1. **Honorer `importRootEntries="true"`** : tire les `selectionEntry`
   racines + `entryLink` racines de la cible dans la racine du catalogue
   importateur, transitivement ; propriétaire/source = le catalogue
   importateur.
2. **Statut allié par mot-clef de faction** (+ exception catégorie
   primaire « Allied Units »), jamais par fichier.
3. **Rangement par rôle** : le groupe d'affichage d'une unité = sa
   **catégorie primaire** (rôles définis dans `Warhammer 40,000.gst` :
   la `forceEntry "Army Roster"` expose Epic Hero, Character, Battleline,
   Infantry, Mounted, Beast, Monster, Vehicle, … et **Allied Units** en
   dernier recours), indépendamment de la provenance.
4. **Détachement importé d'une bibliothèque** : `Chaos - Chaos
   Daemons.cat` expose un `entryLink "Detachment"` dont la cible vit dans
   la bibliothèque Daemons ; la résolution du détachement (et de la
   faction/règles d'armée qu'il porte) doit donc **suivre les liens vers
   les bibliothèques**.

## Tests

- Charger **Chaos Daemons** (`d265`) ; ajouter **Bloodletters** (définie
  dans la bibliothèque `b45c`, importée par `importRootEntries`). →
  apparaît sous **Battleline**, **PAS** sous Allied Units ; faction
  affichée = Legiones Daemonica.
- Ajouter une unité **liée en `entryLink` natif** dans le même catalogue
  (p. ex. **Chaos Lord**, faction Heretic Astartes) → **EST** alliée
  (faction différente). *(Montre que la règle est bien fondée sur la
  faction, dans les deux sens.)*
- **Imperial Knights** (même schéma `importRootEntries`) : les chevaliers
  apparaissent sous leurs rôles, pas en Allied Units.
- **Non-régression** : Craftworlds / Astra Militarum (unités en
  `entryLink` explicites) inchangées — unités primaires, et leurs alliés
  importés (Agents, Imperial Knights) toujours en Allied Units.
- Unités `Unaligned Forces` / `Titans` (catégorie primaire « Allied
  Units » dans la donnée) restent alliées dans n'importe quelle armée.

## Invariants (ce qui ne change PAS)

- **Les données sont correctes** : `importRootEntries` est un mécanisme
  BattleScribe légitime et idiomatique (BattleScribe et NewRecruit
  officiels l'honorent). Le correctif est **purement applicatif**.
- Le correctif porte sur (a) la prise en charge de `importRootEntries` et
  (b) l'attribution de la faction/source — pas sur les profils, règles,
  coûts, ni la structure des détachements.
