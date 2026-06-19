# PROMPT — Arme de base fixe + emplacement d'arme optionnel « au choix »

> Prompt autonome (application consommatrice). Correctif d'**affichage/évaluation des
> options d'arme**. Aucune donnée à changer.

## Mécanique
Un modèle a une **arme de base toujours équipée**, **plus** un **emplacement optionnel**
où l'on choisit **au plus une** arme parmi une liste. Ex. **Chaos Rhino** : combi-bolter
de base **+** emplacement « Pintle weapon » = 0 ou 1 arme, au choix **Combi-bolter** ou
**Combi-weapon**.

## Distinguer base / optionnel dans la donnée
- **Arme de BASE (toujours là)** : `entryLink`/`selectionEntry` avec **`min=1`**
  (`scope="parent"`). ⇒ toujours équipée, **pas un choix** → lecture seule.
- **Emplacement OPTIONNEL « au choix »** : un **`selectionEntryGroup`** avec **`max=1`**
  et **sans `min`** (min 0), contenant **plusieurs** options d'arme. ⇒ **0 ou 1** →
  choix « une parmi, ou aucune » (radio avec option vide / menu incluant « — »).
- **Option isolée** (ex. Havoc launcher) : entrée `min 0 / max 1` hors groupe ⇒ bascule oui/non.
- ⚠️ Une **même arme peut figurer en base ET comme option** (même `targetId`, ids de
  sélection différents) = **deux emplacements distincts** : le modèle peut cumuler les
  deux (ex. 2 combi-bolters).

## Ce que l'appli doit faire
1. **Toujours équiper** les armes `min ≥ 1` (base) ; ne pas les présenter comme un choix.
2. **Rendre un groupe `max=1` (min 0)** comme **choix exclusif optionnel** (une parmi, ou
   aucune ; respecter `max=1`).
3. **Proposer toutes** les options du groupe (pas seulement la première / le défaut).
4. **Ne pas fusionner** base et option de même nom : compte-les séparément (loadout final
   peut lister 2× la même arme).
5. **Coût** : chaque arme sélectionnée ajoute son propre coût (base + option). Évalue
   par modèle (`scope="parent"`) vs par unité (`scope="unit"`).

## Exemple — Chaos Rhino
- Base : **Combi-bolter** (×1, toujours). Option isolée : **Havoc launcher** (0/1).
- Emplacement « **Pintle weapon** » (`max 1`, min 0) : **Combi-bolter** ou **Combi-weapon**, ou rien.
- Loadouts valides : `combi-bolter` ; `+ combi-bolter` ; `+ combi-weapon` ; (± havoc launcher).

## Invariants
- `min ≥ 1` ⇒ base (lecture seule) ; `max=1` + min 0 ⇒ choix « 0/1 ».
- Arme en base **et** en option = deux emplacements indépendants.
- Correctif côté appli : la donnée est correcte.
