// three/examples/jsm/libs/stats.module.js@0.172.0 downloaded from https://ga.jspm.io/npm:three@0.172.0/examples/jsm/libs/stats.module.js

var Stats=function(){var e=0;var l=document.createElement("div");l.style.cssText="position:fixed;top:0;left:0;cursor:pointer;opacity:0.9;z-index:10000";l.addEventListener("click",(function(a){a.preventDefault();showPanel(++e%l.children.length)}),false);function addPanel(e){l.appendChild(e.dom);return e}function showPanel(a){for(var n=0;n<l.children.length;n++)l.children[n].style.display=n===a?"block":"none";e=a}var a=(performance||Date).now(),n=a,t=0;var i=addPanel(new Stats.Panel("FPS","#0ff","#002"));var o=addPanel(new Stats.Panel("MS","#0f0","#020"));if(self.performance&&self.performance.memory)var r=addPanel(new Stats.Panel("MB","#f08","#201"));showPanel(0);return{REVISION:16,dom:l,addPanel:addPanel,showPanel:showPanel,begin:function(){a=(performance||Date).now()},end:function(){t++;var e=(performance||Date).now();o.update(e-a,200);if(e>=n+1e3){i.update(t*1e3/(e-n),100);n=e;t=0;if(r){var l=performance.memory;r.update(l.usedJSHeapSize/1048576,l.jsHeapSizeLimit/1048576)}}return e},update:function(){a=this.end()},domElement:l,setMode:showPanel}};Stats.Panel=function(e,l,a){var n=Infinity,t=0,i=Math.round;var o=i(window.devicePixelRatio||1);var r=80*o,d=48*o,f=3*o,c=2*o,s=3*o,p=15*o,h=74*o,u=30*o;var m=document.createElement("canvas");m.width=r;m.height=d;m.style.cssText="width:80px;height:48px";var v=m.getContext("2d");v.font="bold "+9*o+"px Helvetica,Arial,sans-serif";v.textBaseline="top";v.fillStyle=a;v.fillRect(0,0,r,d);v.fillStyle=l;v.fillText(e,f,c);v.fillRect(s,p,h,u);v.fillStyle=a;v.globalAlpha=.9;v.fillRect(s,p,h,u);return{dom:m,update:function(d,P){n=Math.min(n,d);t=Math.max(t,d);v.fillStyle=a;v.globalAlpha=1;v.fillRect(0,0,r,p);v.fillStyle=l;v.fillText(i(d)+" "+e+" ("+i(n)+"-"+i(t)+")",f,c);v.drawImage(m,s+o,p,h-o,u,s,p,h-o,u);v.fillRect(s+h-o,p,o,u);v.fillStyle=a;v.globalAlpha=.9;v.fillRect(s+h-o,p,o,i((1-d/P)*u))}}};export{Stats as default};

