// node /tmp/val.js "File A.cat,File B.cat"  — validate + caps + dup-ids vs HEAD
const {Catalog}=require("/home/user/wh40k-11e/editor/lib/catalog");const xml=require("/home/user/wh40k-11e/editor/lib/xml");
const {execSync}=require("child_process");const fs=require("fs");
const files=process.argv[2].split(",").map(s=>s.trim());
const c=new Catalog("/home/user/wh40k-11e").load();
const r=c.validate({dirtyOnly:false});
console.log("catalog.validate errors:",(r.errors||[]).length);
(r.errors||[]).slice(0,10).forEach(e=>console.log("  ",JSON.stringify(e)));
const norm=s=>(s||"").toUpperCase().replace(/\[[^\]]*\]/g,"").replace(/[’'`]/g,"'").replace(/\s+/g," ").trim();
function maxCaps(node){const cons=xml.child(node,"constraints");if(!cons)return"";return cons.children.filter(k=>k.tag==="constraint"&&xml.getAttr(k,"type")==="max"&&xml.getAttr(k,"field")==="selections"&&["roster","force"].includes(xml.getAttr(k,"scope"))).map(k=>xml.getAttr(k,"scope")+"="+xml.getAttr(k,"value")).sort().join(",");}
function ids(root){const m=new Map();xml.walk(root,n=>{const id=xml.getAttr(n,"id");if(id)m.set(id,(m.get(id)||0)+1);});return m;}
let totDup=0, totCap=0;
for (const f of files){
  process.stdout.write("  "+f+": ");
  try{ execSync(`xmllint --noout "${f}"`,{cwd:"/home/user/wh40k-11e"}); process.stdout.write("xml-ok "); }catch(e){ process.stdout.write("XML-FAIL "); }
  const baseTxt=execSync(`git show HEAD:"${f}"`,{cwd:"/home/user/wh40k-11e",maxBuffer:1e9}).toString();
  const baseRoot=xml.parse(baseTxt).root;
  // caps
  const cur=new Map(); for(const d of c.datasheetsForTargeting(f)) cur.set(norm(d.name),maxCaps(c.byId.get(d.id).node));
  const base=new Map(); xml.walk(baseRoot,(n,p,anc)=>{ if(n.tag==="selectionEntry"&&["unit","model"].includes(xml.getAttr(n,"type"))&&!anc.some(a=>a.tag==="selectionEntry"))base.set(norm(xml.getAttrDecoded(n,"name")),maxCaps(n)); });
  let cd=0; for(const [nm,b] of base){ if(/\(ADDITIONAL\)/.test(nm))continue; const cc=cur.get(nm); if(cc===undefined)continue; if(cc!==b){cd++;console.log("\n    CAP DIFF "+nm+" base["+(b||"-")+"] cur["+(cc||"-")+"]");} }
  totCap+=cd;
  // dup ids
  const ci=ids(c.docs.get(f).root), bi=ids(baseRoot); let nd=0; for(const [id,n] of ci){ if(n>1&&(bi.get(id)||0)<=1){nd++;console.log("\n    NEW DUP "+id);} }
  totDup+=nd;
  process.stdout.write("caps-diff="+cd+" new-dups="+nd+"\n");
}
console.log(`TOTAL cap-diffs=${totCap} new-dups=${totDup}`);
