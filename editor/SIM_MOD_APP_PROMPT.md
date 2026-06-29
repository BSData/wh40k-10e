# SIM_MOD — bonus de capacités/améliorations pour le simulateur de dégâts

Prompt autonome pour l'application consommatrice (simulateur de dégâts).
But : matérialiser, **côté données**, les modificateurs offensifs accordés
par une **capacité de datasheet** ou une **amélioration** (ex. la compétence
de Castellan Crowe), pour que le simulateur puisse les proposer en bascule
(toggle) au lieu de forcer l'utilisateur à les saisir à la main.

## Ce qui est dans la base vs dans l'appli

- **Base** : un marqueur **déclaratif** `<comment>sim-mod: …</comment>`,
  posé en **premier enfant** de la `selectionEntry` de l'**unité/modèle**
  qui possède la capacité (même emplacement que `repeat-cost`/`chapter-cost`).
  Plusieurs effets = plusieurs lignes `sim-mod:` dans le même `<comment>`.
  Le marqueur ne décrit **que** ce qui touche le calcul de dégâts ; il ne
  remplace pas la prose de la capacité (qui reste la source de vérité).
- **Appli** : le parsing du marqueur, l'UI de bascule (une puce par
  `sim-mod`), et le **repli** des effets actifs dans l'objet `mods` passé à
  `simulate()`. Les mots-clefs d'**arme** ([SUSTAINED], [LETHAL], anti-X…)
  et les règles d'**armée universelles** restent gérés côté appli comme
  avant — `sim-mod` ne couvre **que** les bonus conditionnels portés par une
  capacité/amélioration d'unité.

## Grammaire

```
sim-mod: [source="…"] <effet>[=valeur] … [scope] [condition] …
```

Tokens (ordre libre, séparés par des espaces ; les valeurs avec espaces
sont entre guillemets) :

- `source="…"` — nom de la capacité/amélioration (affiché sur la puce).
- **Effets** (repliés dans `mods`) :
  - `attacks=+N` `str=+N` `ap=+N` `dmg=+N` `hit=+N` `wound=+N` — bonus
    numériques signés (sur A / S / PA / D / jet de touche / jet de blessure).
  - `reroll=hit` | `reroll=hit1` | `reroll=wound` | `reroll=wound1` |
    `reroll=dmg` — relances (full vs « 1 » uniquement).
  - `lethal` `dev` `ignores-cover` — drapeaux (Lethal Hits, Devastating
    Wounds, ignore le couvert).
  - `sustained=N` | `sustained=D3` — Sustained Hits N.
  - `crit-hit=N` `crit-wound=N` — seuil de critique abaissé.
  - `twin-linked` — relance de blessure pleine.
  - `anti=KEYWORD:N+` — Anti-KEYWORD N+.
- **Portée / conditions** :
  - `weapon="…"` — l'effet ne vaut **en théorie** que pour cette arme
    (affiché sur la puce ; voir limite ci-dessous).
  - `when=melee` | `when=ranged` — l'effet ne s'applique qu'à l'onglet R/M
    correspondant.
  - `vs=KW[,KW…]` — ne vaut que contre une cible portant ces mots-clefs
    (ex. `vs=Character`, `vs=Monster,Vehicle`). **Conditionnel.**
  - `oncePer=battle|phase|turn` — usage limité. **Conditionnel.**
  - `onCharge` — uniquement après une charge. **Conditionnel.**
  - `whileLeading` — uniquement en menant une unité. **Par défaut activé**
    (le cas courant d'un chef rattaché), pas marqué conditionnel.

## Comportement appli attendu

1. **Parser** chaque ligne `sim-mod:` en `{ source, effects:[{k,v}], weapon,
   when, vs:[], oncePer, whileLeading, onCharge, conditional }`. Un
   `sim-mod` est `conditional` s'il porte `vs`, `oncePer` ou `onCharge`.
2. **Attacher** le tableau `simMods` à l'unité (et, en cas d'unité +
   chef rattaché, **concaténer** les `simMods` de tous les modèles).
3. **UI** : une puce par `sim-mod` (libellé = `source: effets (portée)`).
   - Pré-cocher les `sim-mod` **non conditionnels** (y compris
     `whileLeading`).
   - Laisser **décochés** les conditionnels (`vs`, `oncePer`, `onCharge`).
4. **Repli** : pour chaque `sim-mod` coché, ajouter ses effets à une **copie**
   de l'objet `mods` manuel, puis appeler `simulate(profiles, target, effMods)`.
   - Respecter `when=melee|ranged` selon l'onglet actif.
   - Cumul additif pour les bonus numériques ; `max` pour les relances ;
     `min` pour les seuils de critique.
5. **Portée par arme** (`weapon="…"`) : l'effet ne doit toucher **que** les
   profils dont le nom correspond. Le moteur prend un seul `mods`, donc on lui
   passe une **surcouche par arme** : `mods.byWeapon[nomDuProfil]` = un objet
   `mods` complet (global + les effets scopés de cette arme) ; `resolveProfile`
   la substitue au `mods` global pour le profil correspondant. Un effet **sans**
   `weapon=` reste global. Une portée qui ne correspond à **aucun** profil
   activé est ignorée (le bonus n'a rien à toucher). Ainsi le +1 A de Crowe
   ne frappe que la Purifying Flame, pas le psycannon d'un Purificateur de la
   même unité.

## Surlignage

Quand un bonus est actif, l'appli relance la simu **sans** lui et peint en
**vert** toute valeur déplacée (tableau des cibles, cartes de stats, détail
par arme) — le joueur voit exactement ce que la capacité apporte.

## Exemple — Castellan Crowe (`Imperium - Grey Knights.cat`)

```xml
<selectionEntry type="model" name="Castellan Crowe" id="9ddb-760d-8cf7-1c8a">
  <comment>sim-mod: source="Champion of the Order of Purifiers" attacks=+1 weapon="Purifying Flame" whileLeading
sim-mod: source="Foesight" reroll=hit vs=Character</comment>
  …
```

Autres exemples du pilote : Grand Master — `sim-mod: source="Might of Titan"
attacks=+3 str=+3 when=melee oncePer=battle` ; Brother-Captain —
`sim-mod: source="Hammerhand" lethal when=melee whileLeading`.
