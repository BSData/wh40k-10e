# PROMPT — Liens « chef → unités menées » & « support → unités renforcées » (toutes factions)

> Prompt autonome : colle-le comme consigne à l'agent **dans le dépôt de ton
> application** (builder de listes qui lit les `.cat`/`.gst` de `wh40k-11e`).
> Aucune connaissance du dépôt de données n'est requise au-delà de ce fichier.

## Ce qui est encodé

Chaque datasheet de **chef** (capacité *Leader*) porte, dans la prose de sa
capacité, la phrase « *This model can be attached to the following units: …* ».
Cette liste est **redondée** sur la datasheet sous forme d'un
`selectionEntryGroup` déclaratif, pour que l'appli n'ait pas à parser la prose :

```xml
<selectionEntryGroup name="Can Lead (MFM)" hidden="true" id="…">
  <comment>leader-link: unites menables par ce chef (source: prose datasheet "Leader"; declaratif hidden+max0; …)</comment>
  <constraints>
    <constraint type="max" value="0" field="selections" scope="parent" shared="true" id="…"/>
  </constraints>
  <entryLinks>
    <entryLink type="selectionEntry" hidden="true" targetId="&lt;datasheet unité menée&gt;"/>
    …
  </entryLinks>
</selectionEntryGroup>
```

- **Un seul sens, sur le chef** : le groupe est porté par la datasheet du chef
  et pointe vers les datasheets des unités qu'il peut rejoindre. (La prose étant
  côté chef et les cibles résolues dans la **clôture d'import** du fichier, aucun
  lien « inverse » n'est nécessaire — contrairement à une version antérieure.)
- `hidden="true"` + `max=0` → **jamais sélectionnable**, coût nul : ce sont des
  **métadonnées**, pas une option de liste.
- Le tag `(MFM)` est purement un identifiant stable ; la **source réelle** est la
  prose de la capacité *Leader* de la datasheet.
- Couvre **toutes les factions** (Space Marines + chapitres, Chaos, Aeldari,
  Astra Militarum, Necrons, Orks, T'au, etc.) — partout où une datasheet liste
  des unités menées en clair.

## Ce que l'application DOIT faire

Pour obtenir les unités qu'un chef **L** peut mener :

```
leadables(L) = { unité B : B ∈ liens du groupe "Can Lead (MFM)" de L }
               restreint aux datasheets réellement disponibles dans l'armée courante
```

- Lis le groupe **`Can Lead (MFM)`** de la datasheet du chef ; chaque `entryLink.targetId`
  est une datasheet d'unité menable. Sers-t'en pour proposer/valider le
  rattachement (mécanique *Leader* 10e/11e).
- Ne propose **jamais** ce groupe comme sélection, n'en compte pas le coût
  (`hidden`+`max=0`).

## Variante SUPPORT — groupe `Can Support (MFM)`

Certaines unités ne sont pas des chefs (*Leader*) mais des modèles **Support**
(capacité de base **SUPPORT** = `infoLink type="rule" targetId="21f5-c07c-6d97-4405"`) :
elles se rattachent à une des unités listées sur leur datasheet « *in the same
manner as a Leader* », pour la **renforcer**. Cette liste est redondée **à
l'identique** sous un groupe nommé **`Can Support (MFM)`** :

```xml
<selectionEntryGroup name="Can Support (MFM)" hidden="true" id="…">
  <comment>support-link: unites que ce modele Support peut rejoindre (…)</comment>
  <constraints><constraint type="max" value="0" field="selections" scope="parent" shared="true" id="…"/></constraints>
  <entryLinks><entryLink type="selectionEntry" hidden="true" targetId="&lt;unité renforçable&gt;"/> …</entryLinks>
</selectionEntryGroup>
```

- **Même structure et mêmes invariants** que `Can Lead (MFM)` (hidden, `max=0`,
  jamais sélectionnable, cibles dans la clôture d'import) — lis-le exactement pareil.
- Un modèle est **Support** (et non *Leader*) ssi il porte la capacité de base
  **SUPPORT** (`infoLink` `21f5-…`). Le mot-clef est **par faction** dans le MFM :
  une même fiche peut être *Leader* dans une faction et *Support* dans une autre
  (ex. **Ministorum Priest**, **Master of Executions**) — fie-toi au groupe présent
  (`Can Lead` vs `Can Support`) et à la présence du mot-clef SUPPORT, pas au nom.

## Ce qui n'est PAS encodé en liens (rester sur la prose)

Quelques rattachements ne se réduisent pas à une liste de datasheets et
**restent uniquement dans la prose** de la capacité *Leader* — l'appli doit
continuer à les lire dans le texte :

- **Par mot-clef** (« *any* ^^**DESTROYER CULT**^^ *unit* », « *an* INQUISITORIAL
  AGENTS *unit* », « IMPERIUM BATTLELINE INFANTRY »…) : cible une **catégorie**, pas
  une datasheet précise.
- **Rattachement accordé par une amélioration** (ex. enhancement Necron qui
  permet d'attacher le porteur à telle unité) : conditionné à l'amélioration.
- **Inter-fichiers hors clôture d'import** (rare) : ex. un Inquisiteur (Agents)
  listant des kill teams Deathwatch non importées dans son catalogue.

## Invariants

- **Aucune référence pendante** : chaque `entryLink` cible une datasheet visible
  dans la clôture d'import du fichier (vérifié par `catalog.validate`, 0 erreur).
- Les liens ne créent **aucune unité ni coût** (`max=0`, `hidden`). Si ton
  évaluateur ignore les entrées `hidden`/`max=0`, lis quand même ce groupe par
  son **nom** pour reconstituer les rattachements.
