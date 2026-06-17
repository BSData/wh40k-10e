// node /tmp/unique_apply.js [apply]  — mark detachments (entries with a DP cost) with <comment>unique-detachment: X</comment>
const {Catalog}=require("/home/user/wh40k-11e/editor/lib/catalog");const xml=require("/home/user/wh40k-11e/editor/lib/xml");
const UNI=require("/tmp/unique.json");const DO=process.argv[2]==="apply";
const c=new Catalog("/home/user/wh40k-11e").load();const DP="0d99-4ee2-7b3c-1f5a";
const norm=s=>(s||"").toUpperCase().replace(/[’'`]/g,"'").replace(/\s+/g," ").trim();
// faction-key -> candidate files (incl shared libraries where detachments actually live)
const FILES={
 "adepta-sororitas":["Imperium - Adepta Sororitas.cat"],
 "adeptus-custodes":["Imperium - Adeptus Custodes.cat"],
 "adeptus-mechanicus":["Imperium - Adeptus Mechanicus.cat"],
 "aeldari":["Aeldari - Aeldari Library.cat"],
 "astra-militarum":["Imperium - Astra Militarum.cat","Imperium - Astra Militarum - Library.cat"],
 "blood-angels":["Imperium - Blood Angels.cat","Imperium - Space Marines.cat"],
 "chaos-knights":["Chaos - Chaos Knights.cat","Chaos - Chaos Knights Library.cat"],
 "chaos-space-marines":["Chaos - Chaos Space Marines.cat"],
 "death-guard":["Chaos - Death Guard.cat"],
 "drukhari":["Aeldari - Aeldari Library.cat"],
 "genestealer-cults":["Genestealer Cults.cat","Library - Tyranids.cat"],
 "imperial-knights":["Imperium - Imperial Knights.cat","Imperium - Imperial Knights - Library.cat"],
 "necrons":["Necrons.cat"],
 "orks":["Orks.cat"],
 "tau":["T'au Empire.cat"],
 "thousand-sons":["Chaos - Thousand Sons.cat"],
 "votann":["Leagues of Votann.cat"],
 "world-eaters":["Chaos - World Eaters.cat"],
};
const hasDP=n=>{const cs=xml.child(n,"costs");return !!(cs&&cs.children.some(x=>x.tag==="cost"&&xml.getAttr(x,"typeId")===DP));};
function detsIn(files){ const map=new Map(); for(const f of files){ const doc=c.docs.get(f); if(!doc)continue; xml.walk(doc.root,n=>{ if(n.tag==="selectionEntry"&&xml.getAttr(n,"type")==="upgrade"&&hasDP(n)){ const k=norm(xml.getAttrDecoded(n,"name")); if(!map.has(k))map.set(k,[]); map.get(k).push({id:xml.getAttr(n,"id"),file:f,name:xml.getAttrDecoded(n,"name")}); } }); } return map; }
const touched=new Set(); let added=0,already=0,miss=[],ambig=[];
for(const [key,list] of Object.entries(UNI)){
  const files=FILES[key]; const map=detsIn(files);
  for(const {det,unique} of list){
    const cand=map.get(norm(det));
    if(!cand||!cand.length){ miss.push(key+" / "+det); continue; }
    if(cand.length>1){ ambig.push(key+" / "+det+" -> ["+cand.map(x=>x.file.replace("Imperium - ","")).join(",")+"]"); continue; }
    const node=c.byId.get(cand[0].id).node;
    let has=false; for(const ch of node.children) if(ch.tag==="comment"&&/unique-detachment:/i.test(xml.getText(ch)))has=true;
    if(has){already++;continue;}
    if(DO){ node.selfClose=false; const cmt=xml.elem("comment",{}); xml.setText(cmt,"unique-detachment: "+unique); node.children.unshift(cmt); touched.add(cand[0].file); }
    added++;
  }
}
console.log(`unique-detachment ${DO?"APPLY":"DRY"}: would-add=${added} already=${already} missing=${miss.length} ambiguous=${ambig.length}`);
if(miss.length)console.log("  MISSING: "+miss.join(" | "));
if(ambig.length)console.log("  AMBIG: "+ambig.join(" | "));
if(DO){ for(const f of touched)c.markDirty(f); c.save(); console.log("SAVED: "+[...touched].join(", ")); }
