// markdown-it-footnote@4.0.0 downloaded from https://ga.jspm.io/npm:markdown-it-footnote@4.0.0/index.mjs

function render_footnote_anchor_name(e,o,t,n){const r=Number(e[o].meta.id+1).toString();let s="";typeof n.docId==="string"&&(s=`-${n.docId}-`);return s+r}function render_footnote_caption(e,o){let t=Number(e[o].meta.id+1).toString();e[o].meta.subId>0&&(t+=`:${e[o].meta.subId}`);return`[${t}]`}function render_footnote_ref(e,o,t,n,r){const s=r.rules.footnote_anchor_name(e,o,t,n,r);const f=r.rules.footnote_caption(e,o,t,n,r);let l=s;e[o].meta.subId>0&&(l+=`:${e[o].meta.subId}`);return`<sup class="footnote-ref"><a href="#fn${s}" id="fnref${l}">${f}</a></sup>`}function render_footnote_block_open(e,o,t){return(t.xhtmlOut?'<hr class="footnotes-sep" />\n':'<hr class="footnotes-sep">\n')+'<section class="footnotes">\n<ol class="footnotes-list">\n'}function render_footnote_block_close(){return"</ol>\n</section>\n"}function render_footnote_open(e,o,t,n,r){let s=r.rules.footnote_anchor_name(e,o,t,n,r);e[o].meta.subId>0&&(s+=`:${e[o].meta.subId}`);return`<li id="fn${s}" class="footnote-item">`}function render_footnote_close(){return"</li>\n"}function render_footnote_anchor(e,o,t,n,r){let s=r.rules.footnote_anchor_name(e,o,t,n,r);e[o].meta.subId>0&&(s+=`:${e[o].meta.subId}`);return` <a href="#fnref${s}" class="footnote-backref">↩︎</a>`}function footnote_plugin(e){const o=e.helpers.parseLinkLabel;const t=e.utils.isSpace;e.renderer.rules.footnote_ref=render_footnote_ref;e.renderer.rules.footnote_block_open=render_footnote_block_open;e.renderer.rules.footnote_block_close=render_footnote_block_close;e.renderer.rules.footnote_open=render_footnote_open;e.renderer.rules.footnote_close=render_footnote_close;e.renderer.rules.footnote_anchor=render_footnote_anchor;e.renderer.rules.footnote_caption=render_footnote_caption;e.renderer.rules.footnote_anchor_name=render_footnote_anchor_name;function footnote_def(e,o,n,r){const s=e.bMarks[o]+e.tShift[o];const f=e.eMarks[o];if(s+4>f)return false;if(e.src.charCodeAt(s)!==91)return false;if(e.src.charCodeAt(s+1)!==94)return false;let l;for(l=s+2;l<f;l++){if(e.src.charCodeAt(l)===32)return false;if(e.src.charCodeAt(l)===93)break}if(l===s+2)return false;if(l+1>=f||e.src.charCodeAt(++l)!==58)return false;if(r)return true;l++;e.env.footnotes||(e.env.footnotes={});e.env.footnotes.refs||(e.env.footnotes.refs={});const c=e.src.slice(s+2,l-2);e.env.footnotes.refs[`:${c}`]=-1;const a=new e.Token("footnote_reference_open","",1);a.meta={label:c};a.level=e.level++;e.tokens.push(a);const u=e.bMarks[o];const i=e.tShift[o];const _=e.sCount[o];const d=e.parentType;const p=l;const h=e.sCount[o]+l-(e.bMarks[o]+e.tShift[o]);let k=h;while(l<f){const o=e.src.charCodeAt(l);if(!t(o))break;o===9?k+=4-k%4:k++;l++}e.tShift[o]=l-p;e.sCount[o]=k-h;e.bMarks[o]=p;e.blkIndent+=4;e.parentType="footnote";e.sCount[o]<e.blkIndent&&(e.sCount[o]+=e.blkIndent);e.md.block.tokenize(e,o,n,true);e.parentType=d;e.blkIndent-=4;e.tShift[o]=i;e.sCount[o]=_;e.bMarks[o]=u;const b=new e.Token("footnote_reference_close","",-1);b.level=--e.level;e.tokens.push(b);return true}function footnote_inline(e,t){const n=e.posMax;const r=e.pos;if(r+2>=n)return false;if(e.src.charCodeAt(r)!==94)return false;if(e.src.charCodeAt(r+1)!==91)return false;const s=r+2;const f=o(e,r+1);if(f<0)return false;if(!t){e.env.footnotes||(e.env.footnotes={});e.env.footnotes.list||(e.env.footnotes.list=[]);const o=e.env.footnotes.list.length;const t=[];e.md.inline.parse(e.src.slice(s,f),e.md,e.env,t);const n=e.push("footnote_ref","",0);n.meta={id:o};e.env.footnotes.list[o]={content:e.src.slice(s,f),tokens:t}}e.pos=f+1;e.posMax=n;return true}function footnote_ref(e,o){const t=e.posMax;const n=e.pos;if(n+3>t)return false;if(!e.env.footnotes||!e.env.footnotes.refs)return false;if(e.src.charCodeAt(n)!==91)return false;if(e.src.charCodeAt(n+1)!==94)return false;let r;for(r=n+2;r<t;r++){if(e.src.charCodeAt(r)===32)return false;if(e.src.charCodeAt(r)===10)return false;if(e.src.charCodeAt(r)===93)break}if(r===n+2)return false;if(r>=t)return false;r++;const s=e.src.slice(n+2,r-1);if(typeof e.env.footnotes.refs[`:${s}`]==="undefined")return false;if(!o){e.env.footnotes.list||(e.env.footnotes.list=[]);let o;if(e.env.footnotes.refs[`:${s}`]<0){o=e.env.footnotes.list.length;e.env.footnotes.list[o]={label:s,count:0};e.env.footnotes.refs[`:${s}`]=o}else o=e.env.footnotes.refs[`:${s}`];const t=e.env.footnotes.list[o].count;e.env.footnotes.list[o].count++;const n=e.push("footnote_ref","",0);n.meta={id:o,subId:t,label:s}}e.pos=r;e.posMax=t;return true}function footnote_tail(e){let o;let t;let n;let r=false;const s={};if(!e.env.footnotes)return;e.tokens=e.tokens.filter((function(e){if(e.type==="footnote_reference_open"){r=true;t=[];n=e.meta.label;return false}if(e.type==="footnote_reference_close"){r=false;s[":"+n]=t;return false}r&&t.push(e);return!r}));if(!e.env.footnotes.list)return;const f=e.env.footnotes.list;e.tokens.push(new e.Token("footnote_block_open","",1));for(let t=0,n=f.length;t<n;t++){const n=new e.Token("footnote_open","",1);n.meta={id:t,label:f[t].label};e.tokens.push(n);if(f[t].tokens){o=[];const n=new e.Token("paragraph_open","p",1);n.block=true;o.push(n);const r=new e.Token("inline","",0);r.children=f[t].tokens;r.content=f[t].content;o.push(r);const s=new e.Token("paragraph_close","p",-1);s.block=true;o.push(s)}else f[t].label&&(o=s[`:${f[t].label}`]);o&&(e.tokens=e.tokens.concat(o));let r;r=e.tokens[e.tokens.length-1].type==="paragraph_close"?e.tokens.pop():null;const l=f[t].count>0?f[t].count:1;for(let o=0;o<l;o++){const n=new e.Token("footnote_anchor","",0);n.meta={id:t,subId:o,label:f[t].label};e.tokens.push(n)}r&&e.tokens.push(r);e.tokens.push(new e.Token("footnote_close","",-1))}e.tokens.push(new e.Token("footnote_block_close","",-1))}e.block.ruler.before("reference","footnote_def",footnote_def,{alt:["paragraph","reference"]});e.inline.ruler.after("image","footnote_inline",footnote_inline);e.inline.ruler.after("footnote_inline","footnote_ref",footnote_ref);e.core.ruler.after("inline","footnote_tail",footnote_tail)}export{footnote_plugin as default};

