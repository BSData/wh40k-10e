#!/usr/bin/env node
/*
 * fetch-wahapedia.js — récupère les pages Wahapedia des factions Chaos
 * (fiches d'unités + page faction = règles d'armée / détachements), les
 * convertit en texte lisible, et écrit un .txt par page dans ./wahapedia/.
 *
 * À LANCER SUR TA MACHINE (pas dans la session distante : Wahapedia bloque
 * les fetchs côté serveur). Node 18+ requis (fetch global).
 *
 *   node tools/fetch-wahapedia.js
 *
 * Puis UPLOAD les fichiers ./wahapedia/*.txt dans la conversation (ou
 * `git add wahapedia/ && git commit && git push` et je les lirai après pull).
 *
 * Si une page revient en erreur 403 / très courte (« Just a moment… ») =
 * protection anti-bot : ouvre l'URL dans ton navigateur et enregistre la
 * page (Ctrl+S, format « texte » ou « page web »), puis uploade-la.
 */
'use strict';
const fs = require('fs');
const path = require('path');

const BASE = 'https://wahapedia.ru/wh40k10ed/factions';

// Slugs des factions Chaos. Édite si l'un d'eux diffère sur Wahapedia.
const FACTIONS = [
  'chaos-space-marines',
  'chaos-daemons',
  'death-guard',
  'world-eaters',
  'emperors-children',
  'thousand-sons',
  'chaos-knights',
];

// Pour chaque faction : la page "datasheets" (toutes les fiches, avec les
// "WARGEAR OPTIONS" — c'est là que se trouve « 1 X can be equipped with… »)
// + la page d'accueil (règle d'armée + détachements).
const URLS = [];
for (const f of FACTIONS) {
  URLS.push([`${f}__datasheets`, `${BASE}/${f}/datasheets.html`]);
  URLS.push([`${f}__faction`, `${BASE}/${f}/`]);
}
// Besoin d'une fiche précise ? Ajoute-la ici, ex. :
// URLS.push(['csm__legionaries', `${BASE}/chaos-space-marines/Legionaries`]);

const OUT = path.join(process.cwd(), 'wahapedia');
fs.mkdirSync(OUT, { recursive: true });

const HEADERS = {
  'User-Agent':
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 ' +
    '(KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36',
  Accept: 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
  'Accept-Language': 'en-US,en;q=0.9,fr;q=0.8',
  Referer: 'https://wahapedia.ru/',
};

function htmlToText(html) {
  return html
    .replace(/<script[\s\S]*?<\/script>/gi, ' ')
    .replace(/<style[\s\S]*?<\/style>/gi, ' ')
    .replace(/<!--[\s\S]*?-->/g, ' ')
    .replace(/<li[^>]*>/gi, '\n- ')
    .replace(/<\/(p|div|li|tr|h[1-6]|td|th|section|article)>/gi, '\n')
    .replace(/<br\s*\/?>/gi, '\n')
    .replace(/<[^>]+>/g, ' ')
    .replace(/&nbsp;/gi, ' ')
    .replace(/&amp;/gi, '&')
    .replace(/&lt;/gi, '<')
    .replace(/&gt;/gi, '>')
    .replace(/&quot;/gi, '"')
    .replace(/&#(\d+);/g, (_, n) => String.fromCharCode(+n))
    .replace(/&[a-z]+;/gi, ' ')
    .replace(/[ \t]+/g, ' ')
    .replace(/\n[ \t]+/g, '\n')
    .replace(/\n{3,}/g, '\n\n')
    .trim();
}

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

(async () => {
  if (typeof fetch !== 'function') {
    console.error('Node 18+ requis (fetch global introuvable).');
    process.exit(1);
  }
  let ok = 0,
    warn = 0,
    fail = 0;
  for (const [name, url] of URLS) {
    try {
      const res = await fetch(url, { headers: HEADERS, redirect: 'follow' });
      if (!res.ok) {
        console.error(`[HTTP ${res.status}] ${url}`);
        fail++;
        await sleep(1500);
        continue;
      }
      const html = await res.text();
      const txt = htmlToText(html);
      const file = path.join(OUT, `${name}.txt`);
      fs.writeFileSync(file, `SOURCE: ${url}\n\n${txt}\n`, 'utf8');
      const blocked = /just a moment|cf-browser-verification|enable javascript/i.test(txt);
      if (blocked || txt.length < 2000) {
        console.warn(`WARN ${url} -> ${file} (${txt.length} car. — anti-bot probable ?)`);
        warn++;
      } else {
        console.log(`OK   ${url} -> ${file} (${txt.length} car.)`);
        ok++;
      }
    } catch (e) {
      console.error(`ERR  ${url}: ${e.message}`);
      fail++;
    }
    await sleep(1500); // courtoisie : 1 requête / 1,5 s
  }
  console.log(`\nTerminé : ${ok} OK, ${warn} douteux, ${fail} échecs.`);
  console.log(`Fichiers dans : ${OUT}`);
  console.log('=> Uploade les wahapedia/*.txt ici (ou commit/push le dossier).');
})();
