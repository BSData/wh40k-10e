const fs=require("fs");const dir="/home/user/wh40k-11e/editor/mfm-source";
const out={};
let total=0;
for(const file of fs.readdirSync(dir).filter(f=>f.endsWith(".txt")).sort()){
  const key=file.replace(/\.txt$/,"");
  const lines=fs.readFileSync(dir+"/"+file,"utf8").split(/\r?\n/).map(l=>l.trim()).filter(Boolean);
  const di=lines.findIndex(l=>/^DETACHMENTS$/i.test(l)); if(di<0)continue;
  const D=lines.slice(di+1);
  // walk detachments: a det starts at a name line followed by "<N>DP"
  const dets=[];
  for(let i=0;i<D.length;i++){ if(/^\d+\s*DP$/i.test(D[i])){ const name=D[i-1]; dets.push({name,start:i}); } }
  for(let j=0;j<dets.length;j++){
    const end=j+1<dets.length?dets[j+1].start-1:D.length;
    let uniq=null;
    for(let i=dets[j].start;i<end;i++){ const m=D[i].match(/^UNIQUE\s*:\s*(.+)$/i); if(m){uniq=m[1].trim();break;} if(/^ENHANCEMENTS$/i.test(D[i]))break; }
    if(uniq){ (out[key]=out[key]||[]).push({det:dets[j].name,unique:uniq}); total++; }
  }
}
fs.writeFileSync("/tmp/unique.json",JSON.stringify(out,null,2));
for(const [k,v] of Object.entries(out)) console.log(k.padEnd(20)+v.map(x=>x.det+" => "+x.unique).join(" | "));
console.log("\nTOTAL detachments with UNIQUE keyword: "+total+" across "+Object.keys(out).length+" factions");
