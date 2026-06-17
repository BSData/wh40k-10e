# PROMPT — Détachements à mot-clef « UNIQUE » mutuellement exclusifs

> Prompt autonome : colle-le comme consigne à l'agent **dans le dépôt de ton
> application** (builder de listes qui lit les `.cat`/`.gst` de `wh40k-11e`).
> Aucune connaissance du dépôt de données n'est requise au-delà de ce fichier.

## Symptôme à corriger

Le MFM marque certains détachements d'un mot-clef **« UNIQUE: X »** (p. ex.
`UNIQUE: REVEREND`, `UNIQUE: LIONS`, `UNIQUE: ARMOURY`, `UNIQUE: DATA-PSALM`,
`UNIQUE: ACROBATIC`, `UNIQUE: DYNASTY`…). Deux détachements qui **partagent le
même** mot-clef UNIQUE sont **mutuellement exclusifs** : une armée ne peut pas
en contenir deux à la fois. Si ton appli autorise **plusieurs détachements** par
armée (ou des annexes/alliés de détachement), elle doit empêcher de prendre
deux détachements partageant un mot-clef UNIQUE — ce qu'elle ne fait pas
aujourd'hui.

## Encodage dans la donnée

Sur le `selectionEntry` du détachement concerné, un **marqueur** `<comment>`
porte le mot-clef :

```xml
<selectionEntry type="upgrade" name="Champions of Faith" …>
  <comment>unique-detachment: REVEREND</comment>
  …
</selectionEntry>
```

- Le mot-clef est la valeur après `unique-detachment:` (ici `REVEREND`),
  normalisée en MAJUSCULES, telle quelle depuis le MFM.
- Les détachements **sans** ce marqueur n'ont aucune restriction d'exclusivité.
- Le marqueur est la **source de vérité** : ne te fie pas au nom du détachement.

## La règle que l'application doit appliquer

1. Collecte, pour chaque détachement choisi dans le roster, son mot-clef
   `unique-detachment: X` (s'il en a un).
2. **Au plus UN détachement par valeur de X** dans l'ensemble du roster. Deux
   détachements portant le même X ne peuvent **pas** coexister.
3. Concrètement : dès qu'un détachement de mot-clef X est dans la liste, **grise
   / masque / rends inéligibles** les autres détachements portant ce même X dans
   le sélecteur de détachement. À la désélection, ré-active-les.
4. Des valeurs de X **différentes** ne se gênent pas : on peut combiner un
   détachement `UNIQUE: LIONS` avec un détachement `UNIQUE: ARMOURY`.
5. Les détachements **sans** marqueur ne sont jamais bloqués par cette règle
   (seule leur propre logique d'armée s'applique).

## Pseudocode

```
chosen = roster.detachments
usedKeywords = new Set()
for d in chosen (dans l'ordre de sélection):
    k = d.uniqueDetachmentKeyword     // depuis le marqueur, sinon null
    if k != null and usedKeywords.has(k):
        reject(d)                      // déjà un détachement avec ce mot-clef
    if k != null: usedKeywords.add(k)
// pour le sélecteur : un détachement de mot-clef k est sélectionnable
// seulement si usedKeywords ne contient pas déjà k
```

## Exemples (mêmes mots-clefs = exclusifs)

- **REVEREND** (Adepta Sororitas) : *Champions of Faith*, *Sacred Champions* →
  un seul des deux.
- **LIONS** (Adeptus Custodes) : *Lions of the Emperor*, *Tharanatoi Hammerblow*.
- **ARMOURY** (Adeptus Custodes) : *Might of the Moritoi*, *Solar Spearhead*.
- **DATA-PSALM** (Adeptus Mechanicus) : *Data-Psalm Conclave*, *Luminen Auto-choir*.
- **ACROBATIC** (Aeldari) : *Fateful Performance*, *Ghosts of the Webway*,
  *Serpent's Brood*, *Twilight Flickers* → un seul.
- **HEARTHBAND** (Votann), **DYNASTY** / **HYPERCRYPT** (Necrons),
  **WYCH CULT** / **KABAL** / **COVENS** (Drukhari), **FLYBLOWN** / **ENGINES**
  (Death Guard), **GRACE** / **DOOMED** (Blood Angels), **MUTANT** (Thousand
  Sons), **WAGONS** (Orks), **ARMIGERS** (Imperial Knights), **RECON** /
  **ABHUMAN** (Astra Militarum), **PURESTRAIN** / **HOSTS** (GSC),
  **AUXILIARY** / **BATTLESUIT** (T'au), **ONSLAUGHT** (World Eaters)…

## Invariants

- **Aucune donnée de jeu à recalculer** : l'exclusivité est purement une
  contrainte de construction de liste. Le marqueur `unique-detachment:` porte
  toute l'information ; le correctif est **applicatif**.
- Si ton format n'autorise qu'**un seul** détachement par armée, cette règle est
  sans effet (elle ne mord que sur les armées multi-détachements).
