# Cogitator Editorius — éditeur de données wh40k

Interface graphique pour **consulter et modifier** les données BattleScribe
(`.cat` / `.gst`) de ce dépôt en vue des mises à jour git. Présentation de type
*datasheet* Warhammer 40 000, édition de tout (points, caractéristiques,
capacités, mots-clés, armes, stats d'armes), gestion des **armes partagées**
entre unités, et création de nouvelles armes / unités / détachements.

## Lancer

```bash
node editor/server.js            # http://localhost:4040
node editor/server.js --port 8080
```

Aucune dépendance à installer : 100 % Node natif + JS navigateur.

## Fonctionnalités

- **Navigation** par faction (fichier), onglets *Unités / Armes / Détachements*,
  filtre de recherche.
- **Édition d'une unité** : nom, points (coût `pts`), caractéristiques
  (M/T/SV/W/LD/OC, y compris les profils des sous-modèles), capacités
  (texte des profils), mots-clés (ajout/retrait). Les armes liées sont
  affichées ; elles se modifient depuis l'onglet *Armes*.
- **Édition d'une arme** : nom, profil(s) (Range/A/BS|WS/S/AP/D/Keywords),
  mots-clés. La liste des datasheets qui l'utilisent est affichée.
- **Impact des armes partagées** : si une arme est utilisée par plusieurs
  unités, l'éditeur prévient et propose :
  - **Changer pour TOUTES** les unités (modifie l'arme en place) ;
  - **Changer pour certaines** : crée une **nouvelle arme (variante)** et
    remplace le lien (`targetId`) des unités sélectionnées vers cette variante.
    Le repointage fonctionne **entre fichiers** (ex. une arme Space Marines
    référencée par Blood Angels est repointée dans `Blood Angels.cat`).
- **Création** d'une arme, d'une unité, d'un détachement (entrées BattleScribe
  valides : bons `typeId` de caractéristiques, échappement correct, indentation).
- **Enregistrement** : « Enregistrer fichiers » écrit les fichiers modifiés ;
  « Commit… » fait `git add` + `git commit` (option `push`).

## Diffs git propres

Le parseur/sérialiseur XML maison (`lib/xml.js`) garantit un round-trip
**byte-pour-byte** sur les 47 fichiers du dépôt : seules les lignes réellement
éditées apparaissent dans `git diff`. L'indentation d'origine de chaque nœud
est préservée (y compris d'éventuelles incohérences de formatage déjà
présentes dans les sources).

## Architecture

```
editor/
  server.js        # serveur HTTP (API JSON + fichiers statiques), zéro dépendance
  lib/
    xml.js         # parseur + sérialiseur XML fidèle (round-trip parfait)
    catalog.js     # chargement, indexation globale, requêtes et éditions
  public/
    index.html     # structure de l'UI
    style.css      # thème datasheet 40k
    app.js         # logique front (rendu, édition, dialogues, création)
```

### API (résumé)

| Méthode | Endpoint | Rôle |
|--------|----------|------|
| GET  | `/api/factions` | liste des fichiers |
| GET  | `/api/faction?file=` | unités / armes / détachements d'un fichier |
| GET  | `/api/unit?file=&id=` | détail d'une unité |
| GET  | `/api/weapon?file=&id=` | détail d'une arme + `usedBy` |
| GET  | `/api/categories` | mots-clés disponibles |
| POST | `/api/unit/edit` | `{file,id,patch}` |
| POST | `/api/weapon/edit` | `{file,id,patch,scope,selectedOwnerIds}` |
| POST | `/api/weapon/create` · `/api/unit/create` · `/api/detachment/create` | création |
| GET  | `/api/status` | branche + fichiers non enregistrés |
| POST | `/api/save` · `/api/commit` | persistance / git |

## Notes

- Les détachements doivent être créés dans un fichier qui définit un groupe
  `Detachment` (typiquement la bibliothèque de la faction, ex.
  `Imperium - Space Marines.cat`).
- Les unités créées sont ajoutées comme entrées partagées
  (`sharedSelectionEntries`) ; le rattachement à l'organisation d'armée se
  fait ensuite côté fichier.
