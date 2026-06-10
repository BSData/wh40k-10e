# PROMPT — Intégrer un faction pack 11e dans wh40k-11e (données BattleScribe)

> Prompt réutilisable : colle ce fichier (ou son contenu) comme consigne à
> l'agent pour intégrer un nouveau faction pack GW. Il encode les
> conventions du dépôt, **la règle des améliorations**, l'encodage par
> mots-clefs, les pièges et la validation obligatoire.

Tu intègres un nouveau faction pack GW (PDF) dans le dépôt `wh40k-11e`
(données BattleScribe `.cat`/`.gst`). Travaille sur la branche de dev,
commit/push par faction (conteneur éphémère). Le/les PDF sont dans
`/root/.claude/uploads/<session>/`.

## Outillage (réutilise-le, ne réinvente pas)
- `editor/lib/catalog.js` + `editor/lib/xml.js` = modèle XML round-trip
  fidèle (diff git propre). Écris des scripts Node dans `/tmp` :
  `const {Catalog}=require("/home/user/wh40k-11e/editor/lib/catalog");
   const xml=require("/home/user/wh40k-11e/editor/lib/xml");
   const c=new Catalog("/home/user/wh40k-11e").load();`
- Méthodes utiles : `listFactionContents`, `getDetachment`, `editDetachment`,
  `addRule`, `removeRule`, `removeEnhancement`, `editUnit`,
  `datasheetsForTargeting`, `_moveEnhToShared`, `_attachEnhLink`, `newId`,
  `markDirty`, `validate`, `save`, `findParentInNode`.
- Extraction PDF : `pdftotext -layout -f P -l P fichier.pdf -`. Les pages
  sont en 2 colonnes → recrée un splitter Python (gouttière = bande de
  ≥0.9 d'espaces au milieu) puis concatène colonne gauche puis droite.
  Lis d'abord la TOC ; méfie-toi d'un décalage de pagination (page
  manquante → demande le PDF corrigé, ne devine pas).

## Modèle de données par détachement
- selectionEntry `type="upgrade"` dans le groupe `Detachment` **ou**
  `Detachments` (selon la faction ; certaines partagent une library, ex.
  Aeldari+Drukhari → `Aeldari - Aeldari Library.cat`, Tyranids+GSC →
  `Library - Tyranids.cat`). Les datasheets d'unités peuvent être dans un
  autre fichier que les détachements.
- Règle(s) de détachement = `<rule>` dans `<rules>` du selectionEntry.
- Stratagems = `<rule name="X (Stratagem, NCP)">`, description =
  `"<Détachement> – STRATAGEM (NCP)\n\nWHEN: …\nTARGET: …\nEFFECT: …"`
  (tiret cadratin « – », texte BRUT sans markup, `RESTRICTIONS:` si présent).
- Coût `<cost name="DP" typeId="0d99-4ee2-7b3c-1f5a" value="N"/>` +
  profil Force Disposition (voir plus bas). Détachements Boarding Actions
  (Ramship Raiders…) = ni DP ni Force Disposition.
- Règles/améliorations = markup `**^^Mot Clef^^**` et `**[ABILITY]**`.

## ⭐ RÈGLE DES AMÉLIORATIONS (la plus importante)
1. **Nom contenant « Upgrade »** → s'applique à des **UNITÉS** (résolues
   par mots-clefs de la prose), **CUMULABLE** (AUCUNE unicité d'armée :
   pas de `max 1 roster/force`, pas de modifier d'auto-masquage),
   plafonnée par le **cap d'armée de 4** (catégorie Enhancement), **max 1
   par unité** (contrainte du groupe de lien), **JAMAIS sur un Epic Hero**.
2. **Toutes les autres** → **personnages NON-Epic uniquement** (par
   mots-clefs), **UNIQUES** (`max 1 roster`).
3. Cas limites → **DEMANDER** (AskUserQuestion), ne tranche pas seul :
   - amélioration NON nommée « Upgrade » dont la prose dit « <unité
     non-personnage> unit only » (ex. « WOLF GUARD TERMINATORS unit
     only ») → renommer en « … Upgrade » ? rattacher ? strict→inutilisable ?
   - amélioration nommant un **Epic Hero** dans sa prose (ex. « Prince
     Yriel unit only ») → exception Epic à confirmer (rattacher au seul
     Epic nommé).
   - GW autorise parfois des unités non-personnages « nommées
     personnages » au muster (ex. War Dogs, AM Titanic, Corsairs) → le
     menu central est le bon encodage SI la prose n'a pas de restriction ;
     sinon rattacher au set exact. **Ne change rien sans confirmation.**

## Résolution des porteurs par mots-clefs
- « KROOT SHAPER model only » = datasheets ayant **à la fois** KROOT et
  SHAPER (partition exacte par noms de catégories complètes ; fallback =
  union de mots, à signaler). « WAGON » = Battlewagon/Hunta Rig/Kill Rig.
- `model only` → datasheets **Character** ; `unit only` → toutes ;
  honore « (excluding X) » ; exclus **[Legends]/[Crucible]** ; exclus
  **Epic Hero** (toujours pour Upgrade ; aussi pour les character-only).
- **NE TRAVERSE JAMAIS le menu central « Enhancements »** pour trouver des
  porteurs : chaque personnage lie ce menu en bloc → le traverser ferait
  de tout personnage un porteur et effacerait les restrictions de prose.
  Seuls les groupes dédiés par datasheet créent des porteurs.

## Encodage
- **Amélioration d'unité** : entrée dans `sharedSelectionEntries`
  (`_moveEnhToShared`) + categoryLink Enhancement + (Upgrade : aucune
  unicité / autre : `max 1 roster`) ; sur chaque datasheet cible, un
  groupe `<selectionEntryGroup name="<Détachement> Enhancement">` avec :
  modifier `set hidden=true` si `lessThan 1 selections roster
  childId=<detId>`, contrainte `max 1 parent`, `entryLink`→l'amélioration.
  Utilise `_attachEnhLink(dsNode, enhId, enhName, detId, detName)`.
- **Amélioration de personnage (menu)** : reste dans le groupe central
  `<Détachement> Enhancements`.
- **Nouveau détachement** : clone le gating d'un détachement **de la même
  (sous-)faction** (faction gate `instanceOf ancestor childId=…` à
  recopier verbatim ; ne devine pas l'id) ; enregistre-le dans le groupe
  Detachment(s).
- **Force Disposition** : sur le selectionEntry du détachement, ajoute
  `<profile name="Force Disposition" typeId="4680-63ad-ad70-1872"
   typeName="Force Disposition"><characteristics><characteristic
   name="Force Disposition" typeId="9145-6e6a-17b9-0a2c">VALEUR</…>`
  (VALEUR ∈ Take and Hold / Purge the Foe / Disruption / Reconnaissance /
  Priority Assets).

## Invariants du menu central « Enhancements » (par faction)
- **Un seul** bloc `<constraints>` et **un seul** `<modifiers>` (fusionne
  les doublons : certains parseurs ne lisent que le premier bloc).
- **Plafond unique** : `max 1 self/parent` (1 par perso) + `max 4 roster`
  (le cap d'armée) ; supprime tout `max 3` ou `max 4 force` redondant
  (garde l'id que cible un éventuel modifier `set -1` Boarding Actions).
- categoryLink Enhancement présent (le menu compte dans le cap).
- modifier de masquage Epic présent (`instanceOf ancestor
  childId=<cat Epic Hero>`, souvent `4f3a-f0f7-6647-348d` — vérifie).

## Pièges (déjà rencontrés — évite-les)
- `xml.elem(tag,{},[])` met `selfClose=true` ; après `push` d'enfants,
  force `node.selfClose=false`, sinon `<profiles/>`/`<constraints/>`
  s'auto-ferme et **les enfants sont perdus au save**. Préfère construire
  avec les enfants inline.
- `newId()` est sûr (teste l'index) ; un clone **texte** peut dupliquer →
  régénère tous les ids et revérifie.
- Apostrophes/accents typographiques (’ â ê) : matche en normalisant
  (`/[’'`]/→'`, lowercase, espaces) ; le sérialiseur échappe `&apos;`/`&quot;`.
- Beaucoup d'errata sont **déjà à jour** : diff-check, n'écris que si le
  texte diffère réellement (zéro churn).
- Capacité de transport = `<profile typeName="Transport">` (pas Abilities).
  Leader/Support/Hover/Deep Strike = infoLinks vers règles partagées
  (échange par targetId, ne réécris pas le texte).

## Constantes
- Enhancement (cap 4 roster) : `6226-9b9b-107a-9ada`
- DP costType : `0d99-4ee2-7b3c-1f5a`
- pts : `51b2-306e-1021-d207` (+ 4 Crusade : `b03b-c239-15a5-da55`,
  `75bb-ded1-c86d-bdf0`, `a623-fe74-1d33-cddf`, `716d-91b7-d55a-1022`)
- Abilities profile : `9cc3-6d83-4dd3-9b64` / Description char `9b8f-694b-e5e-b573`
- Force Disposition profileType `4680-63ad-ad70-1872` / char `9145-6e6a-17b9-0a2c`
- Boarding Actions force gate : `cac3-71d1-ea4b-795d`

## Validation OBLIGATOIRE avant chaque commit
1. `xmllint --noout` sur chaque fichier modifié.
2. `catalog.validate({dirtyOnly:false})` → `ok:true`, 0 erreur/warning.
3. dup-id : pour chaque fichier, le nombre de groupes d'ids dupliqués
   doit être **inchangé vs HEAD** (`git show HEAD:f | grep -oE 'id="…"' |
   sort | uniq -d | wc -l`).
4. Audit règle Upgrade : 0 violation (epic / non-personnage / unicité /
   classe Upgrade-vs-autre) sur l'inventaire complet des améliorations.
5. Force Disposition : 1 profil par détachement classé.

## Demander confirmation (AskUserQuestion) pour
- réductions destructives (supprimer des améliorations absentes du pack) ;
- cas limites unit-bearer non-« Upgrade » et exceptions Epic nommées ;
- page de détachement manquante/illisible (réclame le PDF) ;
- toute reclassification touchant des données que je n'ai pas créées.

## Livrables par faction
Réconcilier les détachements réimprimés (règles + set d'améliorations +
stratagems), créer les nouveaux, appliquer DP + Force Disposition + errata
de datasheets (FRAME, vol M/OC→« - », 9″→8″, capacités, profils d'armes,
Leader→Support), câbler les améliorations selon LA RÈGLE, valider, commit,
push.
