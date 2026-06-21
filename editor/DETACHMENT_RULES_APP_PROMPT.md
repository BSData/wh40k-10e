# PROMPT — Lire TOUTES les règles d'un détachement (pas seulement la première)

> Prompt autonome (application consommatrice). Correctif d'**évaluation/affichage** :
> agréger toutes les règles d'un détachement. Aucune donnée à changer.

## Symptôme
Un détachement n'affiche qu'**une** règle alors qu'il en a plusieurs. Ex. **Vanguard
Onslaught** (Tyranids, `f773-f91c-2999-c7e1`) a **deux** règles —
*Vanguard Prime* **et** *Questing Tendrils* — mais l'appli ne montre que la **première**
(*Vanguard Prime*) et **perd** la vraie règle de détachement (*Questing Tendrils*).
Cause : le parseur lit `rules[0]` au lieu d'itérer toute la liste, et il **ne résout pas**
les règles attachées par `<infoLink type="rule">`.

## Où sont les règles d'un détachement (3 sources)
Le détachement est un `selectionEntry` identifiable par un **coût DP**
(`<cost typeId="0d99-4ee2-7b3c-1f5a">`) et/ou un profil **Force Disposition**
(`typeName="Force Disposition"`). Ses règles viennent de :

1. **Règles en clair** — **tous** les `<rule>` sous `<rules>` (itérer la liste entière) :
```xml
<selectionEntry type="upgrade" name="Vanguard Onslaught" id="f773-f91c-2999-c7e1">
  <rules>
    <rule name="Vanguard Prime" id="299e-…"><description>…Deathleaper…</description></rule>
    <rule name="Questing Tendrils" id="8b66-…"><description>…charge after Fell Back / Advanced…</description></rule>
  </rules>
</selectionEntry>
```
2. **Règles par lien** — **tous** les `<infoLink type="rule">` sous `<infoLinks>`, à
   **résoudre par `targetId`** (règle partagée, possiblement dans un autre fichier). C'est
   souvent **LA** règle de détachement définie ailleurs (ex. *Hallowed Martyrs* → *The Blood
   of Martyrs* ; *Daemonic Incursion* → *Warp Rifts*). 38 détachements en ont.
3. (Le texte d'une règle est dans `<rule><description>` ; pour un infoLink, dans la
   `<description>` de la règle **cible**.)

## Ce qu'il NE faut PAS confondre avec une règle de détachement
- **Stratagèmes** : des `<rule>` nommés `… (Stratagem, NCP)` (ex. *Malicious Frenzy
  (Stratagem, 1CP)*) vivent **dans le même `<rules>`** (503 dans la base). Les **exclure**
  de la liste « règles de détachement » et les présenter à part (section Stratagèmes).
- **Enhancements** : des `selectionEntry` (coût en `pts`) dans un groupe *Enhancements* —
  ce ne sont **pas** des `<rule>`, ils ne polluent pas la liste.
- Une règle peut légitimement s'appeler **`Keywords`** (5 détachements) : elle est
  **visible**, garde-la.

## Ce que l'appli doit faire
1. **Itérer TOUS** les `<rule>` enfants de `<rules>` (jamais `rules[0]` seul).
2. **Résoudre TOUS** les `<infoLink type="rule">` (par `targetId`, inter-fichiers) et
   ajouter leur règle cible.
3. **Filtrer** : règle de détachement = nom **ne matchant pas** `\(Stratagem,\s*\d*CP\)`.
   Les stratagèmes vont dans leur propre liste.
4. **Respecter `hidden`** pour l'affichage : un `<rule>`/`infoLink` `hidden="true"` est en
   général structurel/partagé (mot-clefs) — l'afficher seulement si ton UI montre ce genre
   de règles. Les règles de détachement « titre » sont `hidden="false"`.
5. **Dédupliquer** par `id`/`targetId` (une règle liée + définie ne doit pas apparaître 2×).
6. Rendre le **texte** depuis `<description>` ; le balisage `**…**` = gras, `^^…^^` =
   mot-clef (petites capitales).

## Détachements multi-règles (à utiliser comme tests — doivent TOUS montrer ≥2 règles)
Aeldari : *Ghosts of the Webway, Devoted of Ynnead, Serpent's Brood, Eldritch Raiders,
Corsair Coterie* · Daemons : *Blood Legion* · CSM : *Renegade Warband* (3) ·
Emperor's Children : *Court of the Phoenician* · Custodes : *Solar Spearhead* (3) ·
Astra Militarum : *Steel Hammer, Armoured Infantry* · Imperial Knights : *Questor
Forgepact, Questoris Companions, Spearhead-at-Arms* · Space Marines : *Black Spear Task
Force* · Tyranids : **Vanguard Onslaught**, *Subterranean Assault, Brood Brother Auxilia,
Final Day* · T'au : *Kroot Hunting Pack*.
(20 détachements à ≥2 règles en clair, **+38** qui ajoutent une règle par `infoLink`.)

## Invariants
- Une règle de détachement = **n'importe lequel** des `<rule>` non-stratagème **+** les
  règles cibles des `<infoLink type="rule">`. Jamais « la première seulement ».
- Sources multiples : en clair **et** par lien, éventuellement dans un autre fichier.
- Stratagèmes (`(Stratagem, NCP)`) et enhancements ne sont pas des règles de détachement.
- Correctif côté appli : la donnée est correcte (cf. *Vanguard Onslaught* = *Vanguard
  Prime* + *Questing Tendrils*, conforme à la carte officielle).
