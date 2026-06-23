# PROMPT — Reconnaître les modèles SUPPORT (capacité de base via `infoLink`)

> Prompt autonome (application consommatrice). Correctif de **lecture des capacités
> de base**. Aucune donnée à changer.

## Symptôme
Un modèle qui est **Support** (ex. **Chronomancer** Necrons, **Master of Executions**
CSM, **Ancient/Apothecary/Lieutenant** Space Marines, **Dialogus** Sororitas…)
n'apparaît **pas** comme Support dans l'appli : son mot-clef SUPPORT n'est pas
affiché et la mécanique de rattachement n'est pas proposée. L'appli traite ces
unités comme des unités ordinaires (ou comme des chefs).

## Pourquoi (le piège)
**SUPPORT est une capacité de base (« core ability »), pas un profil `Abilities`
en clair.** Elle est encodée par un **`infoLink type="rule"`** qui pointe vers une
règle **définie dans le fichier game system `Warhammer 40,000.gst`** (pas dans le
`.cat` de la faction) :

```xml
<!-- sur la datasheet (Necrons.cat) -->
<infoLink name="Support" type="rule" targetId="21f5-c07c-6d97-4405"/>
```
```xml
<!-- la règle ciblée, dans Warhammer 40,000.gst -->
<rule id="21f5-c07c-6d97-4405" name="Support" page="84">
  <description>Some models have 'Support' listed among their core abilities. Such models
  are support models. While a support model is on the battlefield it can be attached to
  one of the units listed on its datasheet (in the same manner as a Leader)…</description>
  <alias>SUPPORT</alias>
</rule>
```

Une appli qui ne lit que les `<profile typeName="Abilities">` inline — ou qui ne
**résout pas** les `<infoLink type="rule">` **inter-fichiers** (jusqu'au `.gst`) —
**rate** cette capacité. C'est exactement le cas du Chronomancer : son SUPPORT est
un `infoLink` vers `21f5-…`, rien dans ses profils inline ne dit « Support ».

## Ce que l'appli doit faire
1. **Collecter les capacités de base d'une datasheet en résolvant TOUS les
   `<infoLink type="rule">`** (et `type="infoGroup"`) de **tout le sous-arbre**
   (unité **+** modèles imbriqués), en suivant `targetId` **à travers les fichiers**,
   y compris le game system `Warhammer 40,000.gst` et les bibliothèques partagées.
   (Beaucoup de core abilities sont ainsi : Deep Strike, Scouts, Lone Operative,
   Reanimation Protocols… **et Support**.)
2. **Marquer le modèle comme SUPPORT** dès qu'une règle résolue est la règle Support :
   test robuste = **`targetId="21f5-c07c-6d97-4405"`** (ou, à défaut, nom/alias
   = `Support` / `SUPPORT`). Affiche le mot-clef **SUPPORT** comme pour Leader, Deep Strike, etc.
3. **Appliquer la mécanique Support** : le modèle peut se **rattacher** à l'une des
   unités listées sur sa datasheet « *in the same manner as a Leader* » pour la
   renforcer (Attached unit). La liste des unités rattachables est fournie, en
   **structuré**, par le groupe **`Can Support (MFM)`** (cf. `LEADER_LINKS_APP_PROMPT.md`) :
   chaque `entryLink.targetId` y est une unité rattachable.
4. **Ne confonds pas Leader et Support** : le mot-clef est **par faction** dans le MFM
   — une même fiche peut être *Leader* dans une faction et *Support* dans une autre
   (ex. **Ministorum Priest**, **Master of Executions**). Fie-toi à la présence de
   l'`infoLink` Support (`21f5-…`) et au groupe (`Can Lead (MFM)` vs `Can Support (MFM)`),
   pas au nom de l'unité ni à un éventuel profil « Leader » résiduel.

## Exemple — Chronomancer (Necrons, `5b7d-54ea-f7a8-9688`)
- `infoLink` Support (`21f5-…`) ⇒ **c'est un modèle SUPPORT**.
- Groupe `Can Support (MFM)` ⇒ rattachable à **Immortals** / **Necron Warriors**.
- Prix par répétition (1er 80, 2e+ 90) : géré à part (cf. `REPEAT_COST_APP_PROMPT.md`).
- 6 Crypteks Necrons sont Support (Chronomancer, Geomancer, Plasmancer, Psychomancer,
  Technomancer, + Orikan) — même schéma.

## Invariants
- SUPPORT = **core ability via `infoLink type="rule"` → `21f5-c07c-6d97-4405`** (règle
  dans le `.gst`), **jamais** un simple profil inline. Il **faut résoudre les infoLinks
  inter-fichiers** pour la voir.
- Détection par **`targetId`** (stable), pas par texte.
- Une fois détecté Support : proposer le rattachement via le groupe `Can Support (MFM)`.
- Correctif côté appli : la donnée est correcte (36 modèles Support taggés + liés,
  `catalog.validate` 0 erreur).
