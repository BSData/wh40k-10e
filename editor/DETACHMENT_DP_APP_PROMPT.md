# PROMPT — DP de détachement variable par sous-chapitre (Space Marines)

> Prompt autonome (application consommatrice). Correctif d'**évaluation du coût DP
> d'un détachement**. Aucune donnée à changer.

## Symptôme
Un détachement **partagé** du tronc Space Marines affiche le **même coût DP** quel
que soit le chapitre, alors que le MFM le **tarife différemment selon le
sous-chapitre**. Ex. **Stormlance Task Force** : l'appli montre **3 DP** en Blood
Angels alors qu'il devrait coûter **2 DP** ; **Bastion Task Force** montre 2 DP en
Black Templars alors qu'il devrait être **3 DP**.

## Pourquoi
Les détachements du tronc commun sont définis **une seule fois** dans
`Imperium - Space Marines.cat` et importés par les chapitres
(`catalogueLink importRootEntries="true"`). Leur **coût DP** (cost typeId
`0d99-4ee2-7b3c-1f5a`) porte une valeur **de base**, et les écarts par chapitre
sont encodés par des **modifiers de coût `set`** conditionnés au **catalogue
primaire** du roster — exactement comme le `chapter-cost` des unités, mais sur le
champ **DP** au lieu de `pts`.

```xml
<selectionEntry name="Stormlance Task Force" id="50ed-…">   <!-- détachement partagé -->
  <costs>
    <cost name="DP" typeId="0d99-4ee2-7b3c-1f5a" value="3"/>  <!-- DP de BASE -->
  </costs>
  <modifiers>
    <modifier type="set" value="2" field="0d99-4ee2-7b3c-1f5a">
      <comment>chapter-cost: BT/BA/DW DP=2 (…)</comment>
      <conditionGroups><conditionGroup type="or"><conditions>
        <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="36d3-36bc-68dd-40ac" shared="true"/> <!-- Black Templars -->
        <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="4ef9-15ce-e3e6-36de" shared="true"/> <!-- Blood Angels -->
        <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="f89b-84e0-6e3b-f1e2" shared="true"/> <!-- Deathwatch -->
      </conditions></conditionGroup></conditionGroups>
    </modifier>
  </modifiers>
  …
</selectionEntry>
```

- `scope="primary-catalogue"` + `instanceOf` + `childId=<id du .cat du chapitre>` :
  la condition est vraie **uniquement si le catalogue primaire du roster est ce
  chapitre**. C'est le **même mécanisme** que celui qui rend déjà des unités
  disponibles/tarifées par chapitre.
- Le `<comment>chapter-cost: …</comment>` est **documentaire** (identifie les
  chapitres concernés) ; ne lui fais porter aucune logique.

## Ce que l'appli doit faire
**Rien de spécial — évalue le DP comme n'importe quel coût.** Le DP est un *cost
type* (`0d99-4ee2-7b3c-1f5a`) au même titre que `pts` ; applique-lui le **même
pipeline de modifiers de coût** :
1. Pars du `<cost name="DP">` de base du détachement.
2. Évalue les `modifier type="set" field="0d99-4ee2-7b3c-1f5a"` ; applique celui
   dont la/les condition(s) `primary-catalogue` sont vraies (dernier `set`
   applicable l'emporte). Tu sais déjà déterminer le **catalogue primaire** du
   roster (tu le fais pour la dispo des unités).
3. Le DP affiché / décompté pour le détachement = le résultat après ce `set`.
4. **Recalcule** quand l'utilisateur change de chapitre (catalogue primaire) **ou**
   de détachement.

⚠️ Piège fréquent : un évaluateur qui n'applique le `chapter-cost`/`primary-catalogue`
**qu'au champ `pts`** ratera le DP. Applique le mécanisme **génériquement à tout
cost typeId**, DP inclus.

## Distinguer du cas « redéfini localement »
Si un chapitre **redéfinit** le détachement dans son **propre** `.cat` (entrée
locale, non importée), le DP est **déjà** sur l'entrée locale — pas de modifier
`chapter-cost`, c'est l'entrée locale qui prime via l'import. Ne cumule pas.

## Exemples de référence
- **Stormlance Task Force** : base **3 DP** → **2 DP** en Black Templars, Blood
  Angels, Deathwatch ; reste **3 DP** en Dark Angels, Space Wolves, vanilla SM.
- **Bastion Task Force** : base **2 DP** → **3 DP** en Black Templars ; reste **2
  DP** ailleurs.

## Invariants
- Le DP n'est pas un coût « à part » : c'est un cost typeId ⇒ **même éval de
  modifiers** que `pts`.
- Valeur de base sur l'entrée + écarts dans des `set` conditionnés
  `primary-catalogue` ; le correctif est **nul** si ton évaluateur applique déjà
  les modifiers de coût conditionnés à **tous** les cost types.
- Correctif côté appli : la donnée est correcte (`catalog.validate` 0 erreur).
- Compagnon : `MARINE_CHAPTER_COST_APP_PROMPT.md` (même mécanisme, champ `pts`).
