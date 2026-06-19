# PROMPT — Détachements / Warlords qui accordent le mot-clef Battleline (statut + 0-6)

> Prompt autonome (application consommatrice). Correctif d'**évaluation** : exécuter
> des modifiers conditionnels de catégorie. Aucune donnée à changer.

## Symptôme
Des règles (de **détachement** ou de **Warlord**) donnent le mot-clef **Battleline**
à certaines unités (ex. *Spirit Conclave* → Wraithguard ; *Houndpack Lance* → War
Dogs ; *Dread Mob* → Gretchin ; **Waaagh! Wazdakka** → Warbikers si Wazdakka est
Warlord…). Dans l'appli, ces unités n'obtiennent pas le statut Battleline quand la
condition est remplie : elles restent non-Battleline, plafonnées à 0-3.

## Modèle de données
Grant = **modifier de catégorie conditionnel**, souvent groupé avec un relèvement du plafond :
```xml
<modifierGroup type="and">
  <modifiers>
    <modifier type="add"         value="e338-111e-d0c6-b687" field="category"/>  <!-- gagne Battleline -->
    <modifier type="set-primary" value="e338-111e-d0c6-b687" field="category"/>  <!-- Battleline = rôle primaire -->
    <modifier type="set" value="6" field="<id de la contrainte max de l'unité>"/> <!-- 0-3 -> 0-6 -->
  </modifiers>
  <conditions> … (A détachement / B Warlord) … </conditions>
</modifierGroup>
```
`e338-111e-d0c6-b687` = catégorie **Battleline** (game system).

- **A. Détachement** : `condition atLeast 1 field="selections" scope="force" childId="<détachement>"`.
  Peut être un `conditionGroup type="or"` (unité accordée par plusieurs détachements).
- **B. Warlord** (« If this model is your WARLORD… ») : la sélection **Warlord** du modèle
  porte une `categoryLink` vers une **catégorie-drapeau cachée** (ex. « Wazdakka Warlord
  Flag ») ; le grant est conditionné sur ce drapeau : `condition atLeast 1 scope="roster"
  childId="<flag>"`. ⇒ le drapeau n'existe que si ce modèle est désigné Warlord.

## Ce que l'appli doit faire
1. Évaluer les conditions des `modifierGroup` (y compris `conditionGroup or`, `scope="force"`,
   `scope="roster"`) **avant** d'établir catégories et plafonds.
2. Une `categoryLink` portée par une **sélection active** (option Warlord, amélioration…)
   **ajoute sa catégorie au roster** → compte-la dans les conditions.
3. Appliquer le modifier : `add` ⇒ gagne Battleline ; `set-primary` ⇒ Battleline = **rôle primaire**.
4. Appliquer le `set 6` lié ⇒ plafond du datasheet **0-6** tant que la condition tient.
5. Recalculer à chaque changement de détachement **ou de Warlord**.

## Invariants
- Statut = catégories de base + catégories ajoutées par modifiers/sélections conditionnels actifs.
- `set-primary category` change le rôle primaire, pas un simple tag.
- Le 0-6 vient d'un `modifier set 6` à exécuter.
- Correctif côté appli : la donnée est correcte (34 grants détachement + le grant Warlord Wazdakka, tous conditionnés).
