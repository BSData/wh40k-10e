# PROMPT — Évaluer correctement la composition d'unité (entryLinks de modèles + modifiers)

> Prompt autonome : colle-le comme consigne à l'agent **dans le dépôt de ton
> application** (builder de listes qui lit les `.cat`/`.gst` de `wh40k-11e`).
> Aucune connaissance du dépôt de données n'est requise au-delà de ce fichier.

## Symptôme à corriger

Sur les unités à **choix de taille** (ex. **Jakhals** : « 10 models » /
« 20 models »), la composition affichée est **incomplète**. Jakhals montre
**3 / 3** (Jakhal Pack Leader + Jakhal w/ mauler chainblade + 1 Dishonoured)
alors qu'à 10 modèles la bonne réponse est **1 Pack Leader + 8 Jakhals +
1 Dishonoured = 10**, **sans** mauler par défaut. Même classe de bug sur
Aquila/Decimus Kill Teams, Wolf Scouts, Catachan Jungle Fighters, Death Korps
of Krieg, Cadian Shock Troops, Gretchin, Burna Boyz, Lootas, Squighog Boyz.

**La donnée est complète — c'est l'ÉVALUATION qui manque.** Ces fiches
utilisent trois mécanismes BattleScribe standards que ton parseur ne traite pas
encore. Aucune donnée n'est à changer.

## Ce que l'application doit faire (4 points)

### 1. Résoudre les `<entryLink>`-vers-modèle comme des modèles de composition
Un `<entryLink type="selectionEntry" targetId="…">` dont la **cible résolue**
est un `<selectionEntry type="model">` **EST un modèle** de l'unité, quel que
soit l'endroit où le lien est placé — **y compris au niveau de l'unité**, dans
les `<entryLinks>`, à côté d'autres liens (armes, Icon, Crusade…). Son
**nombre** vient des contraintes portées par le **lien** (sinon par la cible).
- Réel : **Jakhals** — les 8 Jakhals de base sont un
  `<entryLink targetId="0620-25eb-4da2-5dae">` (cible = modèle « Jakhal »)
  dans les `<entryLinks>` de l'unité, avec `min=8 max=8`. Ce sont **8 modèles**,
  pas une option/arme.
- **Ne décide pas « modèle vs option » d'après le conteneur**
  (`<selectionEntries>` vs `<entryLinks>`) : décide d'après le **type de la
  cible résolue** (`type="model"` → modèle).

### 2. Exécuter les `<modifier>` (pas seulement lire les min/max statiques)
Les nombres changent via des modifiers ; il faut les **évaluer** :
- `type="set" | "increment" | "decrement"`, `field="<id d'une contrainte>"`
  (ou un `costTypeId`). Ordre : **`set` AVANT `increment`/`decrement`**.
- **Cross-node** : un modifier porté par l'entrée A peut viser une contrainte
  définie sur l'entrée B, **par son `id`**. Ex. l'entrée « 20 models » porte
  des `set` qui modifient la contrainte de nombre du Jakhal de base, le nombre
  de Dishonoured, le plafond du mauler… L'entrée « 10 models » n'a **aucun**
  modifier (c'est la base par défaut).
- `<repeats><repeat … childId="X"/></repeats>` : applique le modifier **une
  fois par sélection de X**. Ex. Jakhals — `decrement 1` sur le nombre de
  Jakhals de base, **répété par « Jakhal w/ mauler chainblade »** → réguliers
  = base − (nb de maulers).
- Respecte les `<conditions>` / `<conditionGroups>` (scopes `self`, `parent`,
  `ancestor`, `force`, `roster`) si présentes.

### 3. Respecter min/max et les défauts
Un modèle **optionnel** (`max=1`, **pas** de contrainte `min` → min 0) vaut
**0 par défaut**, pas 1. Réel : Jakhals — « Jakhal w/ mauler chainblade »
(max 1, min 0) doit être **0** par défaut, pas `1×`.
Le total « Model Composition » = somme des **nombres évalués** (après modifiers)
de **tous** les modèles : `selectionEntry type="model"` directs + `entryLink`→
modèle (niveau unité **et** dans l'entrée de taille / les groupes sélectionnés)
+ modèles des groupes (`selectionEntryGroup` avec un total min=max).

### 4. Comptes `automatic` et UX d'échange d'arme
- Une contrainte avec **`automatic="true"`** est un nombre **dérivé**
  (recalculé par les modifiers), **pas** saisi par l'utilisateur → affiche-le
  en **lecture seule**, ne propose pas de +/- dessus.
- **Échange d'arme** (Wolf Scouts, Jakhals…) : les variantes d'arme spéciale
  (« Wolf Scout w/ plasma gun », « Jakhal w/ mauler chainblade »…) sont les
  sélections **éditables** par l'utilisateur (spinners `0..max`). Le modèle de
  **base** porte un compte `automatic` **+ un `decrement` par variante** → quand
  l'utilisateur prend une arme, **le base se recalcule tout seul** et le total
  reste fixe (6/12, 10/20…). Donc : **laisse ajouter l'arme**, **ne demande pas**
  de baisser le base à la main, et **ne bloque pas** l'ajout au prétexte que
  l'unité est « pleine » — c'est le `decrement` qui libère la place. Sans cette
  évaluation, l'arme devient impossible à prendre (le bug observé sur Wolf
  Scouts : « je ne peux pas diminuer les modèles de base pour faire rentrer les
  armes »).
- Concrètement, l'ordre d'évaluation par sélection/désélection d'une variante :
  recompter les variantes → ré-appliquer `set` (taille) puis `decrement`
  (`repeats` par variante) sur le compte du base → le total et les points
  (pilotés par le nombre de modèles) se mettent à jour.

## Cas de référence à tester — Jakhals
- **Défaut** (« 10 models » sélectionné, aucun modifier) :
  Pack Leader **1** + Jakhal (entryLink→`0620`) **8** + Dishonoured **1** =
  **10 modèles**, mauler **0**, **65 pts**.
- **Prendre 1 « Jakhal w/ mauler chainblade »** : le `decrement` ramène les
  Jakhals de base à **7** → 1 PL + 7 + 1 mauler + 1 Dishonoured = **10**
  (mauler ≤ 1 à cette taille).
- **Sélectionner « 20 models »** : les `set` de l'entrée passent le Jakhal de
  base à **17**, Dishonoured à **2**, plafond mauler à **2** → **20 modèles**,
  **140 pts**.

## Cas de référence à tester — Wolf Scouts (échange d'arme)
- **Défaut** (« 6 Models ») : 1 Wolf Scout Pack Leader + 1 Hunting Wolf +
  **4 Wolf Scouts** (base, contrainte `automatic`) = 6 ; aucune arme spéciale.
- **Prendre 1 « Wolf Scout w/ plasma gun »** : le `decrement` ramène le base de
  4 à **3** → 1 PL + 1 Hunting Wolf + 3 base + 1 plasma = **6**. L'ajout **ne
  doit pas être bloqué** : c'est le `decrement` qui libère la place. Idem pour
  « w/ haywire mine » / « w/ runic stave » (et « w/ instigator bolt carbine »,
  disponible **seulement à 12**).
- **Sélectionner « 12 Models »** : les `set` passent le base à **9**, Hunting
  Wolf à **2**, et activent l'instigator → **12**.

Si ces lignes tombent juste, **toutes** les unités remodelées suivent
(même mécanisme) : Aquila/Decimus Kill Teams, Wolf Scouts, Catachan, Death
Korps, Cadian Shock Troops, Gretchin, Burna Boyz, Lootas, Squighog Boyz.

## UX recommandée — l'arme spéciale échange un modèle de base (swap)

Pour toutes les unités « troupe + variantes d'arme » (Jakhals, Wolf Scouts,
Catachan, Death Korps, Cadian, Burna Boyz, Lootas, Squighog…), le bon modèle
d'interaction est l'**échange automatique** : prendre une arme spéciale
**remplace** un modèle de base par le modèle-variante qui la porte — **le total
de modèles ne bouge pas**.

1. **Une seule action utilisateur** : il incrémente la variante voulue
   (ex. « Wolf Scout w/ plasma gun » : 0 → 1). Il **ne touche jamais** au
   nombre de modèles de base.
2. **Le base est échangé tout seul** : le compte du modèle de base
   (contrainte `automatic`) baisse de 1 via le `decrement` → le **total reste
   constant**. Affichage : « 4 Wolf Scouts » → « 3 Wolf Scouts + 1 w/ plasma
   gun » (toujours 4 dans le groupe de troupe ; 6 au total avec Pack Leader +
   Hunting Wolf).
3. **Réversible** : retirer l'arme (1 → 0) rend +1 au base.
4. **Bornes naturelles, rien à coder en dur** :
   - chaque variante est plafonnée par son `max` évalué (mis à l'échelle par la
     taille : p. ex. 1 à 10 modèles, 2 à 20) ;
   - quand le base atteint son minimum, on ne peut plus échanger (plus de modèle
     de base à convertir) ;
   - le total reste verrouillé à la taille choisie — jamais d'unité hors-format.
5. **UI suggérée** : un **spinner par variante d'arme** (`0..max` évalué), le
   **modèle de base en lecture seule** qui se recalcule en direct, et un
   **compteur de total figé** (« 6/6 », « 12/12 »). Le coût en points suit le
   **total** (inchangé) : l'échange ne modifie pas les points, sauf surcoût
   propre à la variante (porté par le `cost` de la variante).

En somme : n'expose pas « base » et « variantes » comme deux compteurs
indépendants — expose **les variantes** comme seules éditables, et laisse le
`decrement` faire l'échange. C'est précisément ce que la donnée encode (base
`automatic` + `decrement` par variante) ; il suffit de l'évaluer (§2, §4) et de
présenter chaque « +1 arme » comme **un échange** qui consomme un modèle de base.

## Invariants
- Points et ratios d'armes par taille sont **déjà** pilotés par le nombre de
  modèles et par ces modifiers : une fois l'évaluation faite, rien d'autre à
  coder côté données.
- **Aucune donnée à modifier** : c'est strictement un correctif d'évaluation
  côté appli (résolution des `entryLink`-modèles + exécution des `modifier`
  cross-node/`repeats` + défauts min/max).
