// fetch-mfm.js — extracteur de points pour le MFM en ligne
// (https://mfm.warhammer-community.com/en)
//
// POURQUOI un script navigateur (et pas Node/curl) :
//   Le site est une appli JS protégée (il répond 403 aux clients non-navigateur)
//   et tous les hôtes warhammer-community sont hors politique réseau côté agent.
//   => impossible de le récupérer depuis un serveur/agent. En revanche, TON
//   navigateur a déjà passé la protection et rendu la page : on extrait depuis là.
//
// MODE D'EMPLOI :
//   1. Ouvre une page de faction sur https://mfm.warhammer-community.com/en
//      (et, juste avant l'étape 3, RECHARGE la page — pour que les requêtes de
//      données soient bien capturées par l'API performance).
//   2. Ouvre les DevTools (F12) → onglet "Console".
//   3. Colle TOUT ce fichier, Entrée. (Colle l'IIFE async ci-dessous ; le reste
//      n'est que commentaires.)
//   4. Le script :
//        - découvre les sources de données (Next/Nuxt, <script application/json>,
//          requêtes JSON déjà faites par l'appli) ET les re-télécharge depuis la
//          page (même origine, cookies → passe la protection) ;
//        - à défaut, scrape le DOM rendu de la faction courante ;
//        - DÉPOSE un fichier `mfm-raw-*.json` (et/ou `mfm-dom-*.json`) via le
//          téléchargeur, et copie un résumé dans le presse-papier.
//   5. Envoie-moi le(s) fichier(s) téléchargé(s). J'en tire `/tmp/mfm.json`
//      (forme attendue par editor/MFM_PROMPT.md) et j'applique les points.
//      Si le JSON brut est exploitable, je t'écris en plus un extracteur dédié
//      reproductible.
//
// Si l'auto-extraction ne renvoie rien d'utile, lance le snippet de DÉCOUVERTE
// minimal en bas de fichier et colle-moi sa sortie : je te taille l'extracteur
// exact à partir de la vraie structure.

(async () => {
  const out = {
    capturedAt: new Date().toISOString(),
    url: location.href,
    title: document.title,
    discovered: {},
    refetched: [],
    domScrape: null,
  };

  const safe = (fn) => { try { return fn(); } catch (e) { return undefined; } };

  // --- 1. Données embarquées par le framework -----------------------------
  const nextData = safe(() => window.__NEXT_DATA__);
  if (nextData) out.discovered.__NEXT_DATA__ = nextData;

  // Next.js App Router : flux RSC dans self.__next_f (tableau de chunks)
  const nextFlight = safe(() => self.__next_f);
  if (nextFlight && nextFlight.length) {
    out.discovered.__next_f = nextFlight.map((c) => (Array.isArray(c) ? c[1] : c));
  }

  const nuxt = safe(() => window.__NUXT__);
  if (nuxt) out.discovered.__NUXT__ = nuxt;

  // Tout <script type="application/json"> (souvent les données initiales)
  const jsonScripts = [...document.querySelectorAll('script[type="application/json"]')]
    .map((s) => safe(() => JSON.parse(s.textContent)))
    .filter(Boolean);
  if (jsonScripts.length) out.discovered.jsonScripts = jsonScripts;

  // --- 2. Endpoints de données déjà appelés par l'appli -------------------
  const dataUrls = [
    ...new Set(
      performance
        .getEntriesByType('resource')
        .map((e) => e.name)
        .filter((u) => /\/api\/|\.json(\?|$)|graphql|\/data\/|_next\/data\//i.test(u))
    ),
  ];
  out.discovered.dataUrls = dataUrls;

  // Re-télécharge ces endpoints DEPUIS la page (même origine → autorisé)
  for (const u of dataUrls) {
    try {
      const r = await fetch(u, { credentials: 'include' });
      const ct = r.headers.get('content-type') || '';
      const body = ct.includes('json') ? await r.json() : await r.text();
      out.refetched.push({ url: u, status: r.status, body });
    } catch (e) {
      out.refetched.push({ url: u, error: String(e) });
    }
  }

  // --- 3. Scrape DOM de la faction courante (fallback, heuristique) -------
  // Cherche des "lignes" contenant un nom + un nombre de points, et regroupe
  // sous le titre de section le plus proche au-dessus.
  const ptsRe = /(\d{1,4})\s*(?:pts|points|pt)\b/i;
  const modelsRe = /(\d{1,3})\s*(?:models?|model)\b/i;
  const rows = [];
  let currentSection = out.title || '';
  const walker = document.createTreeWalker(document.body, NodeFilter.SHOW_ELEMENT);
  const headingTags = new Set(['H1', 'H2', 'H3', 'H4', 'TH']);
  while (walker.nextNode()) {
    const el = walker.currentNode;
    const txt = (el.textContent || '').trim();
    if (!txt || txt.length > 200) continue;
    // Garde le dernier titre rencontré comme contexte de section
    if (headingTags.has(el.tagName) && el.children.length === 0) {
      currentSection = txt;
      continue;
    }
    // Une "ligne feuille" (sans enfant élément) qui contient des points
    if (el.children.length === 0 && ptsRe.test(txt)) {
      const pts = Number(txt.match(ptsRe)[1]);
      const models = modelsRe.test(txt) ? Number(txt.match(modelsRe)[1]) : null;
      // nom = la ligne sœur/parent textuelle la plus proche sans chiffre de points
      const rowText = (el.closest('tr, li, [class*="row"], [class*="item"]')?.textContent || txt)
        .replace(/\s+/g, ' ')
        .trim();
      rows.push({ section: currentSection, models, pts, raw: rowText.slice(0, 160) });
    }
  }
  // dédoublonne
  const seen = new Set();
  out.domScrape = {
    faction: out.title,
    rows: rows.filter((r) => {
      const k = r.section + '|' + r.raw + '|' + r.pts;
      if (seen.has(k)) return false;
      seen.add(k);
      return true;
    }),
  };

  // --- 4. Sortie : téléchargements + presse-papier ------------------------
  const slug = (out.title || 'mfm').replace(/[^a-z0-9]+/gi, '-').toLowerCase().slice(0, 40);
  const download = (name, obj) => {
    const a = document.createElement('a');
    a.href = URL.createObjectURL(new Blob([JSON.stringify(obj, null, 2)], { type: 'application/json' }));
    a.download = name;
    document.body.appendChild(a);
    a.click();
    a.remove();
  };

  const hasRaw =
    out.refetched.some((x) => x.body) ||
    out.discovered.__NEXT_DATA__ ||
    out.discovered.jsonScripts ||
    out.discovered.__next_f ||
    out.discovered.__NUXT__;

  if (hasRaw) {
    download(`mfm-raw-${slug}.json`, {
      url: out.url,
      discovered: out.discovered,
      refetched: out.refetched,
    });
    console.log('%c✓ Données brutes trouvées → fichier mfm-raw-%s.json téléchargé.', 'color:green;font-weight:bold', slug);
    console.log('  dataUrls:', out.discovered.dataUrls);
  } else {
    console.warn('Aucune source JSON brute détectée — fallback DOM uniquement.');
  }
  download(`mfm-dom-${slug}.json`, out.domScrape);
  console.log('%c✓ Scrape DOM → fichier mfm-dom-%s.json téléchargé (%d lignes).', 'color:green;font-weight:bold', slug, out.domScrape.rows.length);

  window.__MFM = out; // inspectable manuellement
  try {
    copy(JSON.stringify({ url: out.url, dataUrls: out.discovered.dataUrls, domRows: out.domScrape.rows.length }, null, 2));
    console.log('Résumé copié dans le presse-papier. Détail complet dans window.__MFM');
  } catch (e) {
    console.log('Détail complet dans window.__MFM');
  }
  console.log(out);
  return out;
})();

// ----------------------------------------------------------------------------
// SNIPPET DE DÉCOUVERTE MINIMAL (si l'auto-extraction ci-dessus ne donne rien) :
// colle juste ces lignes, recharge la page d'abord, et envoie-moi la sortie.
//
//   console.log(JSON.stringify({
//     next: !!window.__NEXT_DATA__,
//     nextF: (self.__next_f||[]).length,
//     nuxt: !!window.__NUXT__,
//     jsonScripts: document.querySelectorAll('script[type="application/json"]').length,
//     dataUrls: [...new Set(performance.getEntriesByType('resource').map(e=>e.name)
//       .filter(u=>/\/api\/|\.json|graphql|_next\/data\//i.test(u)))],
//     tables: document.querySelectorAll('table').length,
//     sampleText: document.body.innerText.slice(0, 800)
//   }, null, 2));
// ----------------------------------------------------------------------------
