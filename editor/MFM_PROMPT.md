# PROMPT — Intégrer un MFM (Munitorum Field Manual) dans wh40k-11e

> Prompt réutilisable : colle ce fichier comme consigne à l'agent quand le
> MFM (points des unités et des améliorations) sort. Il décrit l'encodage
> des points dans ce dépôt, **les deux nouveautés attendues** (surcoût par
> arme, prix par seuil de répétition), les pièges et la validation
> obligatoire. Conventions générales : voir `FACTION_PACK_PROMPT.md`.

Tu intègres un MFM GW (PDF) dans le dépôt `wh40k-11e` (données
BattleScribe `.cat`/`.gst`). Travaille sur la branche de dev, commit/push
par faction. Le PDF est dans `/root/.claude/uploads/<session>/`.

## Constantes

- Coût points : `typeId="51b2-306e-1021-d207"`, `name="pts"`.
- Les modifiers de coût utilisent ce même typeId dans `field`.
- DP (détachements) : `typeId="0d99-4ee2-7b3c-1f5a"` — le MFM ne les
  change pas, n'y touche pas.

## Encodage actuel des points (état des lieux, vérifié)

1. **Unité, taille de base** : `<cost name="pts" …value="N"/>` sur le
   selectionEntry `type="unit|model"` de la datasheet.
2. **Tailles supérieures** (« 10 modèles → X pts, 20 → Y pts ») :
   modifiers `type="set"` sur le champ pts, conditionnés par un décompte
   de modèles (`field="selections"`). La lib les lit/écrit :
   `readTiers(unitNode)` et `editUnit(file, id, { tiers })`
   (→ `applyTiers`). Lis ces deux fonctions avant d'écrire.
3. **Options d'armes** : aujourd'hui presque toutes à `value="0"`. Elles
   existent sous deux formes : selectionEntry `type="upgrade"` (ou
   variante de modèle `type="model"`, ex. « Khorne Berzerker w/
   eviscerator… ») dans un selectionEntryGroup, ou `entryLink` vers une
   arme partagée. `readOptions(unitNode)` lit le pts de chaque choix ;
   `editUnit(file, id, { options })` l'écrit. **Certaines unités n'ont
   pas leurs options modélisées** (groupes vides, ex. wargear du Chaos
   Rhino) — voir « Armes payantes », cas C.
4. **Améliorations** : `<cost name="pts"…/>` sur l'entrée d'amélioration
   (menu ou Upgrade). Beaucoup sont à 0 (placeholders), d'autres déjà
   chiffrées — toujours diff-checker.

## Workflow

1. **Extraction** : le MFM est une liste « unité / taille / pts » +
   améliorations par détachement. Extrais-le en table intermédiaire
   (`/tmp/mfm.json` : `{faction: {units: {name: [{models, pts}…]},
   enhancements: {detachment: {name: pts}}}}`). Méfie-toi des renvois de
   colonne et des noms abrégés ; ne devine jamais un chiffre illisible.
2. **Audit avant** : écris `/tmp/points_audit.js` qui dumpe pour chaque
   datasheet `name / coût de base / tiers / options non nulles` et chaque
   amélioration `name / pts`, et compare à `/tmp/mfm.json`. N'applique
   que les **différences** (diff-check maison : ne réécris pas une valeur
   identique).
3. **Application** : scripts Node via la lib (`editUnit({costs},
   {tiers}, {options})`, jamais de sed). Une exécution = une faction.
4. **Validation puis commit par faction** (gauntlet habituel : xmllint,
   `catalog.validate` ok 0 erreur, 0 id dupliqué vs HEAD) + re-run de
   l'audit qui doit sortir « 0 écart ». Message :
   `"<Faction>: points MFM <édition/date>"`.

## Nouveauté 1 — surcoût par arme

Le MFM peut dire « l'unité coûte +X pts si elle prend l'arme W ». Trois
cas, dans cet ordre de préférence :

- **A. L'option est un selectionEntry local à l'unité** (upgrade ou
  variante de modèle) : mets le pts **sur l'entrée d'option**
  (`editUnit({options: [{id, pts}]})`). BattleScribe additionne les
  coûts des sélections enfants — c'est exact, visible dans l'UI, et
  c'est le pattern natif.
- **B. L'option est un `entryLink` vers une arme partagée** : si le
  surcoût vaut pour tous les utilisateurs de l'arme, coût sur l'entrée
  partagée ; si le surcoût **dépend de la datasheet**, coût sur
  **l'entryLink local** (un entryLink porte ses propres `<costs>`,
  `readOptions` les lit déjà). Ne chiffre jamais l'entrée partagée avec
  la valeur d'une seule datasheet — vérifie `weaponUsage(weaponId)`.
- **C. L'option n'est pas modélisée** (groupe vide / arme en simple
  profil) : crée d'abord l'option (`addOptionChoice` ou entrée locale
  avec contrainte `max 1 @parent`), puis cas A. En dernier recours
  seulement (option impossible à modéliser proprement), modifier
  conditionnel sur le coût de l'unité :
  `increment <X> field=pts` + condition
  `atLeast 1 field="selections" scope="parent" childId="<id arme>"
  shared="true"` — documente-le en `<comment>`.

## Nouveauté 2 — prix par seuil de répétition (RÈGLE FIGÉE)

**Sémantique confirmée par l'utilisateur** : « les N premiers
exemplaires au prix de base, chaque exemplaire **au-delà du Nième** à un
autre prix ». Le MFM donne les deux prix. C'est inexprimable par
modifier pur (les instances d'une même entrée sont indistinguables, une
condition roster les re-prixerait toutes) → **pattern d'entrée scindée**,
outillé dans la lib et **testé** (round-trip byte-identique) :

```js
// création — threshold = N (dernier exemplaire au prix de base),
// pts = prix des exemplaires au-delà ; tiers obligatoire si l'unité a
// des paliers de taille (forme applyTiers : [{idx, pts}])
c.splitRepeatTier(file, unitId, { threshold: 3, pts: 200,
                                  tiers: [{ idx: 0, pts: 400 }] });
c.removeRepeatTier(unitId);   // dépose (origine ou jumelle) — réversible
c.auditRepeatTiers();         // [] attendu — à inclure dans le gauntlet
```

Ce que fait `splitRepeatTier` (ne le ré-implémente pas à la main) :
- **origine** : contrainte `max=N field="selections" scope="roster"
  shared="true"` + marqueur `<comment>repeat-tier: role=base
  threshold=N partner=<idJumelle> capId=<idContrainte></comment>` ;
- **jumelle** `"<Nom> (additional)"` : clone à ids neufs avec **remap
  des références internes** (`cloneWithNewIdsRemapped` — indispensable :
  les tiers de taille utilisent `scope="<id de l'unité>"`), prix `pts`,
  paliers de taille re-chiffrés via `tiers`, plafonds datasheet
  (`field="selections"` scope force/roster) **réduits de N** pour que le
  total reste conforme, `hidden="true"` + modifier `set hidden=false`
  conditionné `atLeast N @roster childId=<idOrigine> shared="true"`,
  marqueur `role=extra` ;
- **entryLinks** : chaque link exposant l'origine est dupliqué vers la
  jumelle (tous fichiers — bibliothèques partagées comprises), plafonds
  de link réduits pareillement.

Garde-fous intégrés : refus si seuil ≥ plafond datasheet (scission
inutile), si l'unité a des paliers de taille sans `tiers` fourni, ou si
l'entrée est déjà scindée. Les marqueurs `repeat-tier:` sont la source
de vérité de l'audit et de la dépose — ne les édite jamais à la main.

La brique « increment + `<repeats>` + condition seuil » existe déjà dans
le dépôt pour des paliers **intra-unité** (par modèle au-delà du Nième) ;
réutilise-la telle quelle si le MFM introduit des paliers par modèle.

## Améliorations

- `editDetachment(file, id, {enhancements: [{id, pts}…]})` ou édition
  directe du `<cost>` de l'entrée. Les améliorations sont par
  détachement : un même nom dans deux détachements = deux entrées, deux
  prix possibles.
- Les « X Upgrade » (rattachées aux unités) se chiffrent pareil — leur
  coût s'ajoute à l'unité porteuse automatiquement.

## Pièges

- **Bibliothèques partagées** (Aeldari/Drukhari, Tyranids/GSC, Chaos
  Knights/Daemons Library…) : la datasheet peut vivre dans un autre
  fichier que la faction du MFM. Résous par `datasheetsForTargeting` /
  l'index `byId`, et chiffre l'entrée **source**, pas l'entryLink,
  sauf surcoût spécifique à la faction (alors coût sur le link).
- `scope="roster"` compte tout le roster (multi-détachements compris) ;
  `scope="force"` un seul détachement. Le MFM parle d'« armée » →
  roster. Toujours `shared="true"` sur les conditions par childId.
- Unités à double entrée (ex. personnage à pied / monté) : le seuil de
  répétition vise-t-il chaque entrée ou l'ensemble ? Lis le texte GW ;
  pour viser l'ensemble, la condition peut porter sur une
  **categoryEntry** commune (childId = id de catégorie) plutôt que sur
  l'entrée.
- Ne touche ni aux profils, ni aux règles, ni aux mots-clefs : un MFM ne
  change que des nombres. Tout écart non numérique dans ton diff est un
  bug de ton script.
- 0 id dupliqué : tout nouvel élément (option créée, clone scindé,
  modifier) prend `c.newId()`.

## Validation finale (obligatoire, par faction)

1. `xmllint --noout` sur chaque fichier touché.
2. `catalog.validate({dirtyOnly:false})` → ok, 0 erreur.
3. Ids dupliqués identiques à HEAD (`grep -oE 'id="[^"]+"' | sort |
   uniq -d`).
4. Re-run `/tmp/points_audit.js` → 0 écart vs `/tmp/mfm.json`.
5. `c.auditRepeatTiers()` → `[]` (0 problème) si des scissions existent.
6. Diff git lisible : uniquement des `value="…"` de coûts, des modifiers
   de coût, et les éventuelles entrées d'option/scission documentées.
