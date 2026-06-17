# PROMPT — Surcoûts par chapitre des unités du tronc commun Space Marines

> Prompt autonome : colle-le comme consigne à l'agent **dans le dépôt de ton
> application** (builder de listes qui lit les `.cat`/`.gst` de `wh40k-11e`).
> Aucune connaissance du dépôt de données n'est requise au-delà de ce fichier.

## Contexte

Les unités du **tronc commun Space Marines** sont définies une seule fois dans
`Imperium - Space Marines.cat` et importées par les chapitres
(`catalogueLink importRootEntries="true"`) : Blood Angels, Dark Angels,
Deathwatch, Space Wolves, Black Templars, Imperial Fists, Ultramarines, etc.

Or le MFM tarife **différemment** quelques-unes de ces unités selon le
chapitre. Exemples (Blood Angels) : Assault Intercessors 75→**80**, Bladeguard
80→**85**, Outriders 70→**75**, Repulsor Executioner 240→**230**. (Quand un
chapitre **redéfinit** localement l'unité dans son propre `.cat` — cas de
Black Templars — le prix est déjà sur l'entrée locale ; rien à faire ici.)

## Encodage (rien de spécial à coder — éval BattleScribe standard)

Sur l'entrée **partagée** de `Space Marines.cat`, un **modifier de coût `set`**
porte le prix du chapitre, conditionné par le **catalogue primaire** du roster :

```xml
<modifier type="set" field="51b2-306e-1021-d207" value="80">
  <comment>chapter-cost: BA (surcout/escompte par chapitre via primary-catalogue; ...)</comment>
  <conditions>
    <condition type="instanceOf" value="1" field="selections"
               scope="primary-catalogue" childId="&lt;id catalogue chapitre&gt;" shared="true"/>
  </conditions>
</modifier>
```

- `scope="primary-catalogue"` + `type="instanceOf"` + `childId=<id du .cat du
  chapitre>` : la condition est vraie **uniquement si le catalogue primaire du
  roster est ce chapitre**. C'est le **même mécanisme** que celui qui rend déjà
  certaines unités disponibles ou non selon le chapitre (≈145 conditions
  `primary-catalogue` préexistantes dans `Space Marines.cat`).
- Pour une unité **à palier de taille**, il y a **un modifier `set` par
  palier** : le palier de base (`primary-catalogue=chapitre` seul) puis, le cas
  échéant, le grand palier (`primary-catalogue=chapitre` **ET** la même
  condition de taille `atLeast K childId=<modèle>` que le palier générique).
  Ils sont placés **après** les paliers génériques et **avant** l'éventuel
  modifier `repeat-cost`, pour que : (1) le prix du chapitre l'emporte sur le
  générique, (2) le surcoût `repeat-cost` s'applique bien **par-dessus** le prix
  du chapitre.

## Ce que l'application DOIT faire

**Rien de particulier.** Évalue ces modifiers comme **n'importe quel modifier de
coût BattleScribe** : applique le `set` quand sa/ses condition(s) sont vraies,
dans l'ordre du document (dernier `set` applicable l'emporte). Tu sais déjà
déterminer le **catalogue primaire** du roster (tu le fais pour la disponibilité
des unités) et tu sais déjà appliquer un `set` de coût conditionné (paliers de
taille). La combinaison des deux suffit — **aucune interprétation spéciale**,
contrairement au marqueur `repeat-cost` (voir `REPEAT_COST_APP_PROMPT.md`).

Le `<comment>chapter-cost: XX</comment>` est purement **documentaire** (il
identifie le chapitre concerné pour l'humain) ; ne lui fais porter aucune
logique.

## Cas de référence (Blood Angels)

- **Assault Intercessor Squad** : base SM 75/150 (5/10 fig). En BA : **80**/150.
  - 5 fig en BA → 80 ; 10 fig en BA → 150 ; 5 fig en Ultramarines → 75.
- **Repulsor Executioner** : base SM 240, `repeat-cost +20` (3e+). En BA/DA/DW/SW :
  **230** (donc 3e+ = 230+20 = 250). En vanilla SM / Imperial Fists : 240.
- **Vanguard Veterans w/ Jump Packs** : SM 100/200, `repeat +10`. En BA :
  **105/210** ; 3e escouade de 10 en BA → 210+10 = 220.

## Invariants

- **Aucune donnée à modifier côté appli** : prix de base (générique) sur
  l'entrée, prix par chapitre dans des modifiers `set` conditionnés
  `primary-catalogue`. Le correctif est **nul** si ton évaluateur applique déjà
  correctement les modifiers de coût conditionnés.
- Ne confonds pas avec un chapitre qui **redéfinit** l'unité dans son propre
  `.cat` (entrée locale, prix déjà dessus) : là il n'y a pas de modifier
  `chapter-cost`, c'est l'entrée locale qui prime via l'import.
