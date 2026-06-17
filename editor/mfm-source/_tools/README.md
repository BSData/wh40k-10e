# Outils d'intégration MFM (juin 2026)

Scripts utilisés pour intégrer les points/mécanismes du MFM en ligne
(`mfm.warhammer-community.com`) à partir des captures `editor/mfm-source/*.txt`.
Chemins absolus `/home/user/wh40k-11e` + dossier de travail `/tmp` (parse → JSON
→ application). Toute édition passe par `editor/lib/{catalog,xml}.js` (round-trip
fidèle), jamais de sed/regex sur les `.cat`.

## Pipeline points

1. `parse_mfm.js` — parse `/tmp/mfm_raw/*.txt` (copie des captures durables) en
   `/tmp/mfm.json` : tiers de taille, seuil de répétition (`threshold`/`extraTiers`),
   options d'arme, détachements + enhancements.
2. `apply.js <factionKey> <fichier1[,fichier2]> [apply]` — applique points/tiers/
   options/enhancements + **repeat-cost** (modifier `increment` + marqueur
   `repeat-cost`, voir `REPEAT_COST_APP_PROMPT.md`). Résout aussi les datasheets
   **entrée-modèle de profondeur 0** (châssis de bibliothèque partagée : Leman Russ,
   Soul Grinder). Sans `apply` = dry-run (flags NOMATCH/AMBIG/TIERCOUNT/PER-MODEL).
3. `override.js [apply]` — surcoûts **par chapitre** Space Marines sur les unités du
   tronc commun importées (modifier `set` conditionné `primary-catalogue`), vérifiés
   par simulation (chapitre × taille × exemplaire). Voir `MARINE_CHAPTER_COST_APP_PROMPT.md`.

## Pipeline marqueurs / liens

4. `extract_unique.js` → `/tmp/unique.json` puis `unique_apply.js [apply]` —
   marqueurs `<comment>unique-detachment: X</comment>` (détachement = entrée à coût DP).
   Voir `UNIQUE_DETACHMENT_APP_PROMPT.md`.
5. `leader_analyze.js` (lecture seule) puis `leader_write.js [apply]` — liens
   chef→unités (groupes déclaratifs `hidden`+`max=0`). Voir `LEADER_LINKS_APP_PROMPT.md`.

## Validation (avant chaque commit)

- `val.js "<fichiers>"` — `catalog.validate` (0 erreur), xmllint, **0 id dupliqué
  introduit vs HEAD**, **seuils d'occurrence (caps roster/force) inchangés**.
- `capcheck.js <fichier> <baselineHEAD>` — diff des caps seul. (NB : faux positifs
  possibles sur datasheets homonymes — recouper avec `git diff` des `<constraint>`.)
- `unsplit.js` — dépose d'anciennes jumelles dupliquées `(additional)` (legacy).
