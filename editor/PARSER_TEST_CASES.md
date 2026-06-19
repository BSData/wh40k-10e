# Cas de test du parseur — validation idiome par idiome

Compagnon de **`parser-test-cases.json`** (valeurs extraites de la vraie donnée).
But : que l'agent de l'appli **valide son parseur/évaluateur un idiome à la fois**,
en s'appuyant sur `editor/BSDATA_PARSING_REFERENCE.md` et les prompts spécialisés.

## Comment s'en servir
1. Charge `parser-test-cases.json`. Pour chaque `case` : ouvre la datasheet (`unitId`
   dans `file`), évalue chaque `scenario.given` (sélections), compare au `scenario.expect`.
2. Coûts en **`pts`** (typeId `51b2-306e-1021-d207`). Catégorie Battleline = `e338-111e-d0c6-b687`.
3. Un cas qui échoue = un idiome non géré → va lire le `promptRef` correspondant.
4. Transforme chaque `scenario` en assertion automatisée (et garde-les en non-régression).
5. Le JSON a **deux blocs** : `cases` (13 cas chiffrés, ci-dessous) **et** `blindSpotCases`
   (8 idiomes non encore audités, section « Angles morts » plus bas).

## Couverture (idiome → cas → règle de référence)
| Cas | Idiome testé | Réf |
|---|---|---|
| `weapon-slots-rhino` | base fixe `min=1` + emplacement optionnel `groupe max=1` ; même arme base+option | §3, §9 / WEAPON_SLOTS |
| `per-model-weapon-cost-retributor` | coût d'arme **× nb de porteurs** | §7 / UNIT_COMPOSITION |
| `collective-false-multislot-fireknife` | `collective=false` (instances) + 2 slots/modèle + défaut gratuit | §3,§7 / WEAPON_SLOTS |
| `count-based-swaps-troupe` | compteurs d'échange **indépendants** (2 dimensions) + paliers de points | §3,§5,§7 / UNIT_COMPOSITION |
| `battleline-warlord-wazdakka` | grant Battleline **conditionné Warlord** (drapeau de catégorie) | §6 / BATTLELINE_GRANT |
| `battleline-detachment-tzaangors` | grant Battleline **conditionné détachement** (OR multi-détachements) | §5,§6 / BATTLELINE_GRANT |
| `modifier-imported-group-count-warwalker` | `modifier set` sur la contrainte d'un **groupe importé** (nb d'armes) + capacité unité | §4,§9 / MODEL_ABILITIES |
| `unit-level-ability-skyweavers` | capacités collectées **unité + modèles**, dédupliquées | §2 / MODEL_ABILITIES |
| `datasheet-limit-harlequin-characters` | plafond **`max scope=roster`** (pas « 1 par perso ») ; Epic Hero ⇒ 1 | §3 |
| `repeat-cost-darkcommune` | surcoût répétition : Δ **au-delà du Nème** seulement | §7 / REPEAT_COST |
| `chapter-cost-primary-catalogue` | coût selon la **faction jouée** (`scope=primary-catalogue`) | §3,§7 / MARINE_CHAPTER_COST |
| `leader-links-can-lead` | groupe `hidden`+`max=0` « Can Lead (MFM) » (jamais sélectionnable) | §8 / LEADER_LINKS |
| `unique-detachment-exclusive` | détachements mutuellement exclusifs par mot-clef | §8 / UNIQUE_DETACHMENT |

## Résultats attendus en bref (les pièges)
- **Rhino** : 1 combi-bolter base **+** pintle (combi-bolter **ou** combi-weapon) ⇒ peut avoir **2 combi-bolters**.
- **Retributor** : 4× multi-melta = **+20** (pas +5).
- **Crisis Fireknife** : défaut 100 (plasma gratuit), missile pod **+5**, **2 par figurine** (pas 2 pour l'unité), chaque figurine configurable.
- **Troupe** : 5/6/11/12 = **85/100/190/205** ; special weapon **+** neuro cumulables ; neuro/fusion ≤2 (≤9 fig.) / ≤4 (≥10).
- **Warbikers** : Battleline + **0-6** seulement si **Wazdakka est Warlord**.
- **Tzaangors** : Battleline + 0-6 sous **Warpmeld Pact OU Servants of Change**.
- **War Walker** : **2** armes lourdes (modifier set=2 sur groupe importé) ; **Crystalline Targeting** (capacité unité).
- **Skyweavers** : **Acrobatic Grace** + **Invulnerable Save** (capacités unité).
- **Persos Harlequins** : Troupe Master/Shadowseer/Death Jester = **3** ; Solitaire = **1**.
- **Dark Commune** : ×2 = **190** (90 + 100), pas 200.
- **Captain with Jump Pack** : **75**, mais **80** si la faction primaire est Blood Angels.

## Angles morts — idiomes que l'appli n'a PAS encore audités (bloc `blindSpotCases`)
Le JSON contient un **second bloc**, `blindSpotCases` (8 cas). Ce sont des idiomes
**réels et fréquents** que la passe « cherche d'autres bugs du même genre » n'a pas
examinés : ils ne déclenchent pas forcément un bug visible sur une fiche précise, mais
un constructeur de liste / simulateur qui les ignore **perd silencieusement** des
capacités, affiche de mauvaises options, ou évalue de fausses contraintes. Chaque cas
pointe des **exemples réels** (vérifiés dans la donnée) à transformer en tests.

| Cas | Idiome (angle mort) | Réf | Exemple réel vérifié |
|---|---|---|---|
| `blind-non-abilities-profiles` | capacités à `typeName ≠ 'Abilities'` (Orders, Rituals, Triarch Abilities, Marks of Chaos, Hymn of Battle, Blessings of Khorne…) | §2 / MODEL_ABILITIES | Cadian Castellan `2b49-4d03-aaf5-3532` (Orders) ; Silent King `7422-7fbf-8694-364c` (Triarch Abilities) |
| `blind-conditional-hidden` | visibilité conditionnelle via `modifier field='hidden'` | §4 | Celerity `3ad6-26c4-206b-aa4f` (enhancement SM, 556 modif. hidden) |
| `blind-conditiongroup-count` | `conditionGroup type='count'` (≥N sous-conditions vraies) | §5 | Abominant `97b1-4873-9fcb-5cb8` (GSC) |
| `blind-condition-field-forces` | `condition field='forces'` (compter détachements, pas sélections) | §5 | Asurmen `828d-840a-9a67-9074` (Aeldari, 273 occ.) |
| `blind-scopes` | scopes `ancestor` / `model-or-unit` / `upgrade` / `primary-catalogue` | §3 | Spirit Stone of Raelyth (ancestor) ; Sword of the Void's Eye (upgrade) ; Chaos Knights (model-or-unit) |
| `blind-infogroup-link` | `link type='infoGroup'` (paquet de règles/profils) | §1,§2 | Aleya `9e42-7207-9c30-6122` « Talons » (Custodes) |
| `blind-modifier-remove-defaultamount` | `modifier remove`/`unset-primary` (catégorie) + `field='defaultAmount'` | §4 | Jetbike (remove cat, Aeldari) ; Show Imperial Knights (defaultAmount) |
| `blind-replace-floor-ceil` | modifiers `replace` (texte/carac.) et `floor`/`ceil` (arrondi) | §4 | Aspect of Murder (replace, Aeldari) ; Knight Diabolus (floor, Chaos Knights) |

> **Comment les attaquer** : pour chaque cas, ouvre l'exemple cité, vérifie que ton
> évaluateur (a) **collecte/affiche** ce qu'il doit, (b) **évalue** la bonne condition/
> scope. Un échec ⇒ idiome non géré → lis le `promptRef`. Les 3 premiers (profils non-
> Abilities, hidden, count) sont les plus impactants pour un **constructeur de liste** ;
> `replace`/`floor`/`ceil` surtout pour un **simulateur** de profils.

> Si un cas passe mais qu'un idiome voisin reste douteux, ajoute une datasheet de la
> même classe (la colonne « idiomes multiples » de la référence §9 liste les variantes).
