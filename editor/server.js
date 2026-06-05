'use strict';
/*
 * Zero-dependency HTTP server for the wh40k catalogue editor.
 *
 * Serves the static UI from ./public and a small JSON API backed by the
 * in-memory Catalog. Run with:  node editor/server.js  [--port 4040]
 */

const http = require('http');
const fs = require('fs');
const path = require('path');
const { execFile } = require('child_process');
const { Catalog } = require('./lib/catalog');

const ROOT = path.resolve(__dirname, '..'); // repository root (where .cat live)
const PUBLIC = path.join(__dirname, 'public');
const PORT = parseInt(getArg('--port') || process.env.PORT || '4040', 10);

const catalog = new Catalog(ROOT).load();
console.log(
  `[wh40k-editor] loaded ${catalog.docs.size} files, ${catalog.byId.size} ids indexed`
);

const MIME = {
  '.html': 'text/html; charset=utf-8',
  '.js': 'text/javascript; charset=utf-8',
  '.css': 'text/css; charset=utf-8',
  '.json': 'application/json; charset=utf-8',
  '.svg': 'image/svg+xml',
};

const server = http.createServer((req, res) => {
  const url = new URL(req.url, `http://localhost:${PORT}`);
  if (url.pathname.startsWith('/api/')) {
    handleApi(req, res, url).catch((err) => sendJson(res, 500, { error: String(err.message || err) }));
    return;
  }
  serveStatic(url.pathname, res);
});

server.listen(PORT, () => {
  console.log(`[wh40k-editor] http://localhost:${PORT}`);
});

// ---------------------------------------------------------------------------
// API
// ---------------------------------------------------------------------------
async function handleApi(req, res, url) {
  const p = url.pathname;
  const q = url.searchParams;

  if (req.method === 'GET') {
    switch (p) {
      case '/api/factions':
        return sendJson(res, 200, catalog.listFactions());
      case '/api/faction':
        return sendJson(res, 200, must(catalog.listFactionContents(q.get('file')), 'faction'));
      case '/api/unit':
        return sendJson(res, 200, must(catalog.getUnit(q.get('file'), q.get('id')), 'unit'));
      case '/api/weapon':
        return sendJson(res, 200, must(catalog.getWeapon(q.get('file'), q.get('id')), 'weapon'));
      case '/api/detachment':
        return sendJson(res, 200, must(catalog.getDetachment(q.get('file'), q.get('id')), 'detachment'));
      case '/api/weapon/usage':
        return sendJson(res, 200, catalog.weaponUsage(q.get('id')));
      case '/api/categories':
        return sendJson(res, 200, catalog.listCategories());
      case '/api/status':
        return sendJson(res, 200, await statusPayload());
      case '/api/preview':
        return send(res, 200, 'text/plain; charset=utf-8', catalog.preview(q.get('file')) || '');
      default:
        return sendJson(res, 404, { error: 'unknown endpoint ' + p });
    }
  }

  if (req.method === 'POST') {
    const body = await readBody(req);
    switch (p) {
      case '/api/unit/edit':
        return sendJson(res, 200, catalog.editUnit(body.file, body.id, body.patch || {}));
      case '/api/weapon/edit':
        return sendJson(
          res,
          200,
          catalog.editWeapon(body.file, body.id, body.patch || {}, body.scope, body.selectedOwnerIds)
        );
      case '/api/weapon/create':
        return sendJson(res, 200, catalog.createWeapon(body.file, body.data || {}));
      case '/api/unit/create':
        return sendJson(res, 200, catalog.createUnit(body.file, body.data || {}));
      case '/api/detachment/create':
        return sendJson(res, 200, catalog.createDetachment(body.file, body.data || {}));
      case '/api/save': {
        const written = catalog.save();
        return sendJson(res, 200, { written });
      }
      case '/api/commit':
        return sendJson(res, 200, await commit(body.message, body.push));
      default:
        return sendJson(res, 404, { error: 'unknown endpoint ' + p });
    }
  }

  return sendJson(res, 405, { error: 'method not allowed' });
}

// ---------------------------------------------------------------------------
// git helpers
// ---------------------------------------------------------------------------
function git(args) {
  return new Promise((resolve, reject) => {
    execFile('git', args, { cwd: ROOT, maxBuffer: 16 * 1024 * 1024 }, (err, stdout, stderr) => {
      if (err) return reject(new Error((stderr || stdout || err.message).trim()));
      resolve(stdout.trim());
    });
  });
}

async function statusPayload() {
  const dirtyInMemory = catalog.dirtyFiles();
  let branch = '';
  let gitStatus = '';
  try {
    branch = await git(['rev-parse', '--abbrev-ref', 'HEAD']);
    gitStatus = await git(['status', '--short']);
  } catch (e) {
    /* not a git repo or git unavailable */
  }
  return { dirtyInMemory, branch, gitStatus };
}

async function commit(message, push) {
  if (!message || !message.trim()) throw new Error('commit message required');
  const written = catalog.save();
  await git(['add', '--', ...catalogFiles()]);
  const out = await git(['commit', '-m', message]);
  let pushed = null;
  if (push) {
    const branch = await git(['rev-parse', '--abbrev-ref', 'HEAD']);
    pushed = await git(['push', '-u', 'origin', branch]);
  }
  return { written, commit: out, pushed };
}

function catalogFiles() {
  return fs.readdirSync(ROOT).filter((f) => f.endsWith('.cat') || f.endsWith('.gst'));
}

// ---------------------------------------------------------------------------
// static files
// ---------------------------------------------------------------------------
function serveStatic(pathname, res) {
  let rel = pathname === '/' ? '/index.html' : pathname;
  rel = rel.replace(/\.\./g, '');
  const file = path.join(PUBLIC, rel);
  fs.readFile(file, (err, data) => {
    if (err) return send(res, 404, 'text/plain', 'Not found');
    send(res, 200, MIME[path.extname(file)] || 'application/octet-stream', data);
  });
}

// ---------------------------------------------------------------------------
// small helpers
// ---------------------------------------------------------------------------
function readBody(req) {
  return new Promise((resolve, reject) => {
    let data = '';
    req.on('data', (c) => {
      data += c;
      if (data.length > 32 * 1024 * 1024) reject(new Error('body too large'));
    });
    req.on('end', () => {
      try {
        resolve(data ? JSON.parse(data) : {});
      } catch (e) {
        reject(new Error('invalid JSON body'));
      }
    });
    req.on('error', reject);
  });
}

function sendJson(res, code, obj) {
  send(res, code, 'application/json; charset=utf-8', JSON.stringify(obj));
}

function send(res, code, type, body) {
  res.writeHead(code, { 'Content-Type': type, 'Cache-Control': 'no-store' });
  res.end(body);
}

function must(v, what) {
  if (v == null) throw new Error(what + ' not found');
  return v;
}

function getArg(name) {
  const i = process.argv.indexOf(name);
  return i >= 0 ? process.argv[i + 1] : null;
}
