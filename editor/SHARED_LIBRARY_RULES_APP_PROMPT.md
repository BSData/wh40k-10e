# PROMPT — Trouver les règles d'armée et de détachement définies dans une bibliothèque partagée

> Prompt autonome : colle-le comme consigne à l'agent **dans le dépôt de ton
> application** (builder de listes qui lit les `.cat`/`.gst` de `wh40k-11e`).
> Aucune connaissance du dépôt de données n'est requise au-delà de ce fichier.

## Symptôme à corriger

Pour **Drukhari**, **Aeldari/Craftworlds**, **Ynnari** (et toute faction du
même schéma), l'appli n'affiche **aucune règle d'armée** ni **règle de
détachement**, ou montre « No rule text available ». Pourtant les règles
existent — elles ne sont **pas** dans le fichier de la faction.

## Cause racine (la donnée est correcte — c'est la résolution qui manque)

Le catalogue jouable d'une faction est un **importateur mince** : il ne définit
**aucune règle** localement. Tout (datasheets liées, détachements, règles
d'armée, règles de détachement, profils) vit dans une **bibliothèque partagée**
qu'il référence par `<catalogueLink>`.

Exemple réel — Aeldari/Drukhari, **une seule** bibliothèque pour plusieurs
factions :

| Fichier | catalogue `name` | `id` | `library` | règles définies |
|---|---|---|---|---|
| `Aeldari - Drukhari.cat` | Xenos - Drukhari | `38de-521f-1ce0-44a0` | false | **0** |
| `Aeldari - Craftworlds.cat` | Xenos - Aeldari | `34a5-8c7e-f468-82d1` | false | **0** |
| `Aeldari - Ynnari.cat` | Aeldari - Ynnari | `1f1-47f9-a3a4-9bfb` | true | **0** |
| `Aeldari - Aeldari Library.cat` | Aeldari - Aeldari Library | `dfcf-1214-b57-2205` | true | **toutes** |

Chaque importateur pointe la bibliothèque par **`targetId`** :
`<catalogueLink name="Aeldari - Aeldari Library" targetId="dfcf-1214-b57-2205"
type="catalogue" …/>` (Craftworlds/Ynnari ajoutent `importRootEntries="true"` ;
Drukhari liste plutôt ses unités en `<entryLink>` explicites — **les deux styles
mènent à la même bibliothèque**). Le `name` du `<catalogueLink>` peut différer du
**nom de fichier** : **résous toujours par `targetId`**, jamais par nom/fichier.

**Le bug** : l'appli cherche les règles dans le fichier de la faction (vide) et
ne **suit pas le `<catalogueLink>`** vers la bibliothèque.

## Le contrat à honorer

1. **Aplatis les `<catalogueLink>` de façon transitive.** Au chargement d'un
   catalogue de faction, charge aussi **chaque catalogue cible** (par `targetId`),
   récursivement, **plus le game system `.gst`**. Construis **un seul pool**
   de définitions (`<rule>`, `<profile>`, `<infoGroup>`, entrées…) sur l'union
   `{faction} ∪ {bibliothèques liées, transitif} ∪ {.gst}`.
2. **Résous chaque `<infoLink type="rule">` par `targetId` dans ce pool.** La
   **référence** (`<infoLink>`) est posée sur la datasheet ou le détachement ;
   la **définition** (`<rule>` avec son `<description>` = le texte) vit dans la
   bibliothèque. La résolution est donc **inter-fichiers**, obligatoire.
3. **Ne conclus jamais « pas de règle » parce que le `.cat` de faction est
   vide** : c'est le fonctionnement attendu, le texte est dans la bibliothèque
   liée.

## Où sont les règles (et comment les présenter)

### Règles d'armée
- Définies comme `<rule>` dans le bloc **`<sharedRules>`** à la racine de la
  bibliothèque. Leur `<description>` est **conditionnée par la faction**
  (« If your Army Faction is ^^Drukhari^^… », « …is ^^Asuryani^^… »).
- Elles sont **rattachées à chaque datasheet** de la faction via
  `<infoLink type="rule" targetId="…">`.
- Mapping confirmé (mêmes ids dans `Aeldari - Aeldari Library.cat`) :
  - **Drukhari** → **Power from Pain** (`5e02-2ddc-f55-e6dd`)
  - **Aeldari / Craftworlds (Asuryani)** → **Battle Focus** (`c324-e193-e23c-7d2e`)
    (+ le mécanisme **Strands of Fate**)
  - **Ynnari** → **Strength From Death** (`8d75-16ba-0739-1355`)
  - **Corsairs** → **Relentless Raiders** (`7eb7-8188-254a-fb75`)
- Présentation : pour le panneau « Army Rule », affiche les `<rule>` que les
  datasheets de la faction référencent et dont la description gate sur l'Army
  Faction du roster.

### Règles de détachement
- Le sélecteur de détachement est un `selectionEntry name="Detachment"`
  (`68f1-24f4-a4c6-303f`) → groupe **`Detachments`** (`7466-16bc-8db6-814`).
- Chaque détachement est un `selectionEntry type="upgrade"` qui porte sa règle
  **en `<rule>` inline** (nom + `<description>`), plus un coût **DP**
  (`<cost typeId="0d99-4ee2-7b3c-1f5a">`) et un profil **Force Disposition**.
  Ex. *Realspace Raiders* (`e299-e560-ccec-eeb3`) → règle **Alliance of Agony**
  (`9e6b-b67a-7f41-1a8a`).
- Pour afficher la règle d'un détachement choisi : lis le `<rule>` inline du
  `selectionEntry` du détachement (et résous ses éventuels `<infoLink>`
  additionnels via le pool, §contrat 2).

### Le filtre faction ↔ détachement est une CONDITION, pas un fichier
Comme **une** bibliothèque sert plusieurs factions, chaque détachement se
**masque** quand le catalogue primaire du roster n'est pas le sien :
`<modifier type="set" field="hidden" value="true">` conditionné par
`<condition type="notInstanceOf" scope="primary-catalogue"
childId="<id du catalogue de faction>">`. Les détachements **Drukhari** gatent
sur `childId="38de-521f-1ce0-44a0"`, les **Aeldari** sur l'id Aeldari, etc.
→ **Évalue cette condition** contre l'**id du catalogue primaire** du roster
pour ne montrer que les bons détachements. **Ne filtre jamais par fichier**
(tout est dans le même fichier de bibliothèque).

## Cas de référence à tester

1. **Roster Drukhari** (primaire = `38de-521f-1ce0-44a0`) :
   - Army Rule affichée = **Power from Pain** (texte résolu depuis la
     bibliothèque, pas vide).
   - Détachements proposés = ceux gatés sur l'id Drukhari (Realspace Raiders,
     Skysplinter Assault, Kabalite Cartel…), **pas** les détachements Aeldari.
   - Choix *Realspace Raiders* → règle **Alliance of Agony** affichée + DP +
     Force Disposition.
2. **Roster Craftworlds** (importe la bibliothèque en `importRootEntries`) :
   Army Rule = **Battle Focus** ; détachements = Warhost, Windrider Host… ;
   **pas** les détachements Drukhari.
3. **Roster Ynnari** : Army Rule = **Strength From Death**.
4. **Non-régression mono-fichier** : une faction qui définit ses règles dans
   son propre `.cat` (sans bibliothèque) continue de fonctionner — la résolution
   par pool inclut le fichier de la faction lui-même.

## Invariants (ce qui ne change PAS)

- **Aucune donnée à modifier** : le schéma « importateur mince + bibliothèque
  partagée » est l'encodage BattleScribe idiomatique (Aeldari+Drukhari,
  Tyranids+GSC, Chaos Daemons, Astra Militarum, Imperial Knights…). Le correctif
  est **purement applicatif**.
- Le correctif porte sur (a) la résolution **transitive** des `<catalogueLink>`
  par `targetId`, (b) la résolution **inter-fichiers** des `<infoLink type="rule">`,
  et (c) le filtre des détachements par condition `primary-catalogue` — pas sur
  les textes, coûts, ni la structure des règles.
