if(!self.define){let c,s={};const e=(e,n)=>(e=new URL(e+".js",n).href,s[e]||new Promise((s=>{if("document"in self){const c=document.createElement("script");c.src=e,c.onload=s,document.head.appendChild(c)}else c=e,importScripts(e),s()})).then((()=>{let c=s[e];if(!c)throw new Error(`Module ${e} didn’t register its module`);return c})));self.define=(n,d)=>{const l=c||("document"in self?document.currentScript.src:"")||location.href;if(s[l])return;let i={};const r=c=>e(c,l),u={module:{uri:l},exports:i,require:r};s[l]=Promise.all(n.map((c=>u[c]||r(c)))).then((c=>(d(...c),i)))}}define(["./workbox-db5fc017"],(function(c){"use strict";c.setCacheNameDetails({prefix:"cgd103_g2_backend"}),self.addEventListener("message",(c=>{c.data&&"SKIP_WAITING"===c.data.type&&self.skipWaiting()})),c.precacheAndRoute([{url:"/cgd103_g2_backend/.htaccess",revision:"a4264489cb842cd4c2e288e50048462a"},{url:"/cgd103_g2_backend/css/174.6244ed79.css",revision:null},{url:"/cgd103_g2_backend/css/187.42ef384f.css",revision:null},{url:"/cgd103_g2_backend/css/214.dcfe55ac.css",revision:null},{url:"/cgd103_g2_backend/css/240.9d05d105.css",revision:null},{url:"/cgd103_g2_backend/css/457.ca8fde48.css",revision:null},{url:"/cgd103_g2_backend/css/462.f1700818.css",revision:null},{url:"/cgd103_g2_backend/css/634.aee12e19.css",revision:null},{url:"/cgd103_g2_backend/css/686.0528b1f9.css",revision:null},{url:"/cgd103_g2_backend/css/747.5101a8cc.css",revision:null},{url:"/cgd103_g2_backend/css/983.82b9ac05.css",revision:null},{url:"/cgd103_g2_backend/css/985.fa8de3a3.css",revision:null},{url:"/cgd103_g2_backend/css/app.eba9f094.css",revision:null},{url:"/cgd103_g2_backend/icon_file.png",revision:"4031f2b795b886314028bacfdce300b0"},{url:"/cgd103_g2_backend/icon_ootd.png",revision:"4990a4d75c2d5e99a1e73a2e61b8447d"},{url:"/cgd103_g2_backend/icon_overline.png",revision:"9771a7afb23dbbb9bdd64b6c26483581"},{url:"/cgd103_g2_backend/index.html",revision:"89997ca2d1a66153a83ed7f065dff3b2"},{url:"/cgd103_g2_backend/js/174.e2fb5f63.js",revision:null},{url:"/cgd103_g2_backend/js/187.f88cd6cd.js",revision:null},{url:"/cgd103_g2_backend/js/214.eec37587.js",revision:null},{url:"/cgd103_g2_backend/js/240.a393911a.js",revision:null},{url:"/cgd103_g2_backend/js/457.b15cf85b.js",revision:null},{url:"/cgd103_g2_backend/js/462.6dbd8c30.js",revision:null},{url:"/cgd103_g2_backend/js/634.212c24e4.js",revision:null},{url:"/cgd103_g2_backend/js/686.dc478771.js",revision:null},{url:"/cgd103_g2_backend/js/747.785a4fcf.js",revision:null},{url:"/cgd103_g2_backend/js/983.39e62044.js",revision:null},{url:"/cgd103_g2_backend/js/985.2fb55878.js",revision:null},{url:"/cgd103_g2_backend/js/app.b519a359.js",revision:null},{url:"/cgd103_g2_backend/js/chunk-vendors.b294630c.js",revision:null},{url:"/cgd103_g2_backend/manifest.json",revision:"7d6e3879ad8d73b0391904bdb7491374"},{url:"/cgd103_g2_backend/robots.txt",revision:"b6216d61c03e6ce0c9aea6ca7808f7ca"}],{})}));
//# sourceMappingURL=service-worker.js.map