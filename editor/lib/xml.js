'use strict';
/*
 * Faithful, zero-dependency XML parser + serializer tuned for BattleScribe
 * catalogue (.cat) and game-system (.gst) files.
 *
 * Goals
 * -----
 *  - Perfect round-trip on UNCHANGED nodes (so `git diff` only shows the
 *    lines a user actually edited). To guarantee this we keep attribute
 *    values and leaf text *exactly* as they appear in the file (still
 *    entity-encoded) and only re-encode a value when it is edited through
 *    the editing helpers below.
 *  - Reproduce BattleScribe's formatting: 2-space indentation, attributes
 *    separated by single spaces in their original order, self-closing empty
 *    elements, inline leaf text, no blank lines except inside text content.
 *
 * Node shape
 * ----------
 *   {
 *     tag:       string,
 *     attrs:     [ { name, value } ],   // value = RAW (entity-encoded)
 *     children:  [ node, ... ],         // element children only
 *     text:      string | null,         // RAW leaf text (entity-encoded)
 *     selfClose: boolean,               // <tag/> vs <tag></tag>
 *     pad:       string                 // original leading indentation (so
 *                                       //   pre-existing formatting quirks
 *                                       //   round-trip byte-for-byte; created
 *                                       //   nodes fall back to depth*2 spaces)
 *   }
 */

// ---------------------------------------------------------------------------
// Entity helpers (BattleScribe encodes & ' " < > everywhere)
// ---------------------------------------------------------------------------
function decodeEntities(s) {
  if (s == null) return s;
  return s
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&apos;/g, "'")
    .replace(/&amp;/g, '&');
}

function encodeEntities(s) {
  if (s == null) return s;
  return String(s)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;');
}

// ---------------------------------------------------------------------------
// Parser
// ---------------------------------------------------------------------------
function parse(str) {
  let i = 0;
  const n = str.length;

  function isWs(c) {
    return c === ' ' || c === '\t' || c === '\r' || c === '\n';
  }
  function skipWs() {
    while (i < n && isWs(str[i])) i++;
  }

  // Parse and preserve the XML declaration verbatim, plus any prolog.
  let decl = '';
  skipWs();
  if (str.startsWith('<?xml', i)) {
    const end = str.indexOf('?>', i);
    if (end === -1) throw new Error('Unterminated XML declaration');
    decl = str.slice(i, end + 2);
    i = end + 2;
  }
  skipWs();

  const root = parseElement();
  return { decl, root };

  function parseName() {
    const start = i;
    while (i < n) {
      const c = str[i];
      if (isWs(c) || c === '>' || c === '/' || c === '=') break;
      i++;
    }
    return str.slice(start, i);
  }

  function parseElement() {
    if (str[i] !== '<') throw new Error('Expected "<" at ' + i);
    // Recover this element's original leading indentation (the run of spaces
    // or tabs immediately before '<' on its line).
    let j = i - 1;
    while (j >= 0 && (str[j] === ' ' || str[j] === '\t')) j--;
    const pad = str.slice(j + 1, i);
    i++; // consume '<'
    const tag = parseName();
    const attrs = [];

    // attributes
    while (true) {
      skipWs();
      const c = str[i];
      if (c === '/' || c === '>') break;
      const name = parseName();
      skipWs();
      if (str[i] !== '=') throw new Error('Expected "=" after attr ' + name + ' at ' + i);
      i++; // '='
      skipWs();
      const quote = str[i];
      if (quote !== '"' && quote !== "'") {
        throw new Error('Expected quote for attr ' + name + ' at ' + i);
      }
      i++; // opening quote
      const vStart = i;
      while (i < n && str[i] !== quote) i++;
      const value = str.slice(vStart, i);
      i++; // closing quote
      attrs.push({ name, value });
    }

    if (str[i] === '/') {
      // self-closing
      i++; // '/'
      if (str[i] !== '>') throw new Error('Expected ">" after "/" at ' + i);
      i++; // '>'
      return { tag, attrs, children: [], text: null, selfClose: true, pad };
    }

    // str[i] === '>'
    i++; // '>'

    const children = [];
    let text = null;

    // Decide container vs leaf-text vs empty by peeking the first
    // non-whitespace content character.
    const save = i;
    skipWs();
    if (str.startsWith('</', i)) {
      // empty element written as <tag></tag>
      text = '';
    } else if (str[i] === '<') {
      // container: parse child elements
      i = save; // (whitespace between children is purely formatting)
      while (true) {
        skipWs();
        if (str.startsWith('</', i)) break;
        children.push(parseElement());
      }
    } else {
      // leaf text: capture raw substring up to the closing tag, including
      // any significant leading whitespace we just skipped over.
      i = save;
      const tStart = i;
      while (i < n && str[i] !== '<') i++;
      text = str.slice(tStart, i);
    }

    // consume closing tag </tag>
    skipWs();
    if (!str.startsWith('</', i)) throw new Error('Expected closing tag for ' + tag + ' at ' + i);
    i += 2;
    const closeName = parseName();
    if (closeName !== tag) {
      throw new Error('Mismatched closing tag: <' + tag + '> vs </' + closeName + '> at ' + i);
    }
    skipWs();
    if (str[i] !== '>') throw new Error('Expected ">" closing </' + tag + '> at ' + i);
    i++; // '>'

    return { tag, attrs, children, text, selfClose: false, pad };
  }
}

// ---------------------------------------------------------------------------
// Serializer
// ---------------------------------------------------------------------------
function serialize(doc) {
  const out = [];
  if (doc.decl) out.push(doc.decl + '\n');
  serializeElement(doc.root, 0, out);
  let s = out.join('');
  if (!s.endsWith('\n')) s += '\n';
  return s;
}

function attrString(attrs) {
  let s = '';
  for (const a of attrs) s += ' ' + a.name + '="' + a.value + '"';
  return s;
}

function serializeElement(node, depth, out) {
  // Reuse the element's original indentation so pre-existing formatting quirks
  // round-trip exactly; created nodes (no .pad) get standard depth*2 spaces.
  const pad = node.pad != null ? node.pad : '  '.repeat(depth);
  const open = '<' + node.tag + attrString(node.attrs);

  if (node.selfClose) {
    out.push(pad + open + '/>\n');
    return;
  }

  if (node.children && node.children.length > 0) {
    out.push(pad + open + '>\n');
    for (const child of node.children) serializeElement(child, depth + 1, out);
    out.push(pad + '</' + node.tag + '>\n');
    return;
  }

  // leaf: text (possibly empty) inline
  const text = node.text == null ? '' : node.text;
  out.push(pad + open + '>' + text + '</' + node.tag + '>\n');
}

// ---------------------------------------------------------------------------
// Convenience node helpers
// ---------------------------------------------------------------------------
function getAttr(node, name) {
  if (!node || !node.attrs) return undefined;
  const a = node.attrs.find((x) => x.name === name);
  return a ? a.value : undefined; // RAW value
}

function getAttrDecoded(node, name) {
  const v = getAttr(node, name);
  return v == null ? v : decodeEntities(v);
}

function setAttr(node, name, decodedValue) {
  const raw = encodeEntities(decodedValue);
  const a = node.attrs.find((x) => x.name === name);
  if (a) {
    a.value = raw;
  } else {
    node.attrs.push({ name, value: raw });
  }
}

function getText(node) {
  return node && node.text != null ? decodeEntities(node.text) : '';
}

function setText(node, decodedValue) {
  node.text = encodeEntities(decodedValue);
  node.selfClose = false;
  node.children = [];
}

// Depth-first walk over element nodes. fn(node, parent, ancestors)
function walk(node, fn, parent = null, ancestors = []) {
  fn(node, parent, ancestors);
  if (node.children) {
    const next = ancestors.concat(node);
    for (const c of node.children) walk(c, fn, node, next);
  }
}

// Find the first child element with the given tag name.
function child(node, tag) {
  if (!node || !node.children) return null;
  return node.children.find((c) => c.tag === tag) || null;
}

// Find/create a container child (e.g. <costs>, <categoryLinks>) keeping it
// after siblings of the same logical group; appends if missing.
function ensureChild(node, tag) {
  let c = child(node, tag);
  if (!c) {
    c = { tag, attrs: [], children: [], text: null, selfClose: false };
    node.children.push(c);
  }
  return c;
}

function elem(tag, attrsObj = {}, children = []) {
  const attrs = Object.keys(attrsObj).map((name) => ({
    name,
    value: encodeEntities(attrsObj[name]),
  }));
  return { tag, attrs, children, text: null, selfClose: children.length === 0 };
}

module.exports = {
  parse,
  serialize,
  decodeEntities,
  encodeEntities,
  getAttr,
  getAttrDecoded,
  setAttr,
  getText,
  setText,
  walk,
  child,
  ensureChild,
  elem,
};
