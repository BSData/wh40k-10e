const {Catalog}=require("/home/user/wh40k-11e/editor/lib/catalog");const xml=require("/home/user/wh40k-11e/editor/lib/xml");const fs=require("fs");
const c=new Catalog("/home/user/wh40k-11e").load();
const SM="Imperium - Space Marines.cat";
const FF=["Imperium - Imperial Fists.cat","Imperium - Iron Hands.cat","Imperium - Raven Guard.cat","Imperium - Salamanders.cat","Imperium - Ultramarines.cat","Imperium - White Scars.cat"];
const SRC={
 "space-marines":[SM,...FF],
 "black-templars":["Imperium - Black Templars.cat",SM],
 "blood-angels":["Imperium - Blood Angels.cat",SM],
 "dark-angels":["Imperium - Dark Angels.cat",SM],
 "deathwatch":["Imperium - Deathwatch.cat",SM],
 "space-wolves":["Imperium - Space Wolves.cat",SM],
};
const norm=s=>(s||"").toUpperCase().replace(/[’'`]/g,"'").replace(/\s+/g," ").trim();
// name -> [{id,file}] over all marine files (datasheets + depth-0 models)
const allFiles=[SM,...FF,"Imperium - Black Templars.cat","Imperium - Blood Angels.cat","Imperium - Dark Angels.cat","Imperium - Deathwatch.cat","Imperium - Space Wolves.cat"];
const nameMap=new Map();
for(const f of allFiles){ const doc=c.docs.get(f); if(!doc)continue;
  for(const d of c.datasheetsForTargeting(f)){ const k=norm(d.name); if(!nameMap.has(k))nameMap.set(k,[]); if(!nameMap.get(k).some(x=>x.file===f))nameMap.get(k).push({id:d.id,file:f}); }
  xml.walk(doc.root,(n,p,anc)=>{ if(n.tag==="selectionEntry"&&xml.getAttr(n,"type")==="model"&&!anc.some(a=>a.tag==="selectionEntry"||a.tag==="selectionEntryGroup")){ const k=norm(xml.getAttrDecoded(n,"name")); if(!k)return; if(!nameMap.has(k))nameMap.set(k,[]); if(!nameMap.get(k).some(x=>x.file===f))nameMap.get(k).push({id:xml.getAttr(n,"id"),file:f}); } });
}
function resolve(name,scope){ const k=norm(name); const cand=nameMap.get(k); if(!cand)return null;
  for(const f of scope){ const hit=cand.find(x=>x.file===f); if(hit)return hit; } return null; }
let pairs=0, miss=new Set(), orphan=[], byDecl=new Map();
for(const [src,scope] of Object.entries(SRC)){
  const txt=fs.readFileSync("/home/user/wh40k-11e/editor/mfm-source/"+src+".txt","utf8");
  for(const line of txt.split(/\r?\n/)){ const m=line.match(/^(.+?) -> (.+)$/); if(!m)continue;
    const L=resolve(m[1],scope); if(!L){miss.add(src+":LEADER:"+m[1]);continue;}
    for(const bn of m[2].split(",").map(s=>s.trim()).filter(Boolean)){
      const B=resolve(bn,scope); if(!B){miss.add(src+":BG:"+bn);continue;}
      pairs++;
      // declaration file + endpoint
      let D,onLeader;
      if(L.file===SM&&B.file===SM){ D=SM; onLeader=true; }
      else if(L.file!==SM&&B.file===SM){ D=L.file; onLeader=true; }       // chapter leader, core bg
      else if(L.file===SM&&B.file!==SM){ D=B.file; onLeader=false; }      // core leader, chapter bg -> on bg
      else if(L.file===B.file){ D=L.file; onLeader=true; }                // same chapter
      else { orphan.push(src+": "+m[1]+"("+L.file.replace("Imperium - ","")+") -> "+bn+"("+B.file.replace("Imperium - ","")+")"); continue; }
      const key=D; if(!byDecl.has(key))byDecl.set(key,0); byDecl.set(key,byDecl.get(key)+1);
    }
  }
}
console.log("pairs resolved: "+pairs);
console.log("declarations per file:"); for(const [f,n] of [...byDecl.entries()].sort((a,b)=>b[1]-a[1])) console.log("  "+f.replace("Imperium - ","")+": "+n);
console.log("MISSING names ("+miss.size+"): "+[...miss].slice(0,20).join(" | "));
console.log("CROSS-CHAPTER orphans ("+orphan.length+"): "+(orphan.slice(0,10).join(" || ")||"none"));
