# PROMPT — Afficher le chargement d'arme par DÉFAUT d'un modèle

> Prompt autonome (application consommatrice). Correctif d'**affichage/évaluation du
> loadout par défaut**. Aucune donnée à changer.

## Symptôme
Un modèle n'affiche **pas ses armes** alors qu'elles sont dans la donnée. Ex.
**Ravager** (Drukhari) : la datasheet dit « *equipped with: 3 dark lances;
bladevanes* » mais l'appli ne montre **aucune** arme à distance (ni les 3 dark
lances). Pareil pour tout modèle dont l'arme de base est dans un **groupe à
compteur** (Wraithlord, Telemon/Contemptor/Leviathan dreadnoughts, Acastus
Porphyrion, Hekaton Land Fortress…).

## Pourquoi (le piège)
Le loadout par défaut d'un modèle est la **somme** de :
1. Les armes **toujours équipées** : `selectionEntry`/`entryLink` avec **`min≥1`**
   (ex. Ravager *Bladevanes* `min=1`). ⇒ toujours présentes.
2. Les armes d'un **groupe à compteur** : un `selectionEntryGroup` `min=N max=N`
   (« prendre exactement N armes ») dont le **défaut** est donné par :
   - **`defaultAmount`** sur les options (le **nombre** par arme — ex. Dark Lance
     `defaultAmount="3"`), et/ou
   - **`defaultSelectionEntryId`** sur le groupe (l'**option** par défaut).

```xml
<!-- Ravager -->
<selectionEntry name="Bladevanes" type="upgrade"> <constraints>min=1 max=1</constraints> </selectionEntry>
<selectionEntryGroup name="Weapon Option" defaultSelectionEntryId="&lt;Dark Lance&gt;">
  <constraints> min=3 / max=3 </constraints>
  <selectionEntry name="Disintegrator Cannon"/>
  <selectionEntry name="Dark Lance" defaultAmount="3"/>   <!-- défaut = 3 dark lances -->
</selectionEntryGroup>
```

Une appli qui **n'auto-remplit pas** le `min` d'un groupe à compteur — ou qui lit
`defaultSelectionEntryId` (quelle arme) **sans en déduire le compte N** — affiche
**0 arme** pour ce slot. C'est exactement le cas du Ravager.

## Ce que l'appli DOIT faire
1. **Collecter toutes les armes** du sous-arbre de la datasheet (unité **+**
   modèles), pas seulement les profils inline.
2. **Armes de base** (`min≥1`) ⇒ **toujours équipées**, afficher leur quantité = `min`.
3. **Groupe à compteur** (`min=N`, `N≥1`) ⇒ **remplir exactement N sélections** avec le
   défaut, dans cet ordre de priorité :
   1. **`defaultAmount`** des options : la somme des `defaultAmount` **vaut N**
      (ex. Dark Lance 3 ⇒ **3× Dark Lance**). Affiche chaque option à sa quantité.
   2. À défaut, **`defaultSelectionEntryId`** : mets **N×** cette option (ex. min=3,
      DSEI=Dark Lance ⇒ 3× Dark Lance).
   3. À défaut encore, mets N× la 1ʳᵉ option valide (et respecte les `max` par option).
4. **Afficher** le loadout résultant (Ravager ⇒ **3× Dark Lance** + **Bladevanes**),
   puis laisser l'utilisateur échanger (« any number can be replaced with… »).
5. Le **coût** d'une arme est par exemplaire : ×sa quantité (ici toutes gratuites).

## Exemple — Ravager (`3376-d337-6a33-4bca`, `Aeldari - Aeldari Library.cat`)
- *Bladevanes* `min=1` ⇒ toujours (mêlée).
- Groupe *Weapon Option* `min=3 max=3`, *Dark Lance* `defaultAmount=3` ⇒ **3× Dark Lance**.
- Échange possible : chaque Dark Lance → 1 Disintegrator Cannon (max 3).
- Loadout affiché par défaut : **3 Dark Lances + Bladevanes**, 110 pts.

## Invariants
- Le loadout par défaut **satisfait toujours** le `min` de chaque groupe : un slot
  `min=N` n'est **jamais** vide à l'affichage.
- `defaultAmount` (compte par option) **prime** ; sinon `defaultSelectionEntryId`
  (option) × `min` du groupe ; sinon 1ʳᵉ option × `min`.
- Correctif côté appli : la donnée est correcte (armes présentes, défauts posés,
  `catalog.validate` 0 erreur). Cf. `UNIT_COMPOSITION_APP_PROMPT.md` et
  `WEAPON_SLOTS_APP_PROMPT.md`.
