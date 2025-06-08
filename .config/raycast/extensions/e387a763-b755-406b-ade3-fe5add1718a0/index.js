"use strict";var Hn=Object.create;var X=Object.defineProperty;var Dn=Object.getOwnPropertyDescriptor;var Wn=Object.getOwnPropertyNames;var Xn=Object.getPrototypeOf,zn=Object.prototype.hasOwnProperty;var d=(e,t)=>()=>(t||e((t={exports:{}}).exports,t),t.exports),Kn=(e,t)=>{for(var n in t)X(e,n,{get:t[n],enumerable:!0})},Me=(e,t,n,r)=>{if(t&&typeof t=="object"||typeof t=="function")for(let o of Wn(t))!zn.call(e,o)&&o!==n&&X(e,o,{get:()=>t[o],enumerable:!(r=Dn(t,o))||r.enumerable});return e};var b=(e,t,n)=>(n=e!=null?Hn(Xn(e)):{},Me(t||!e||!e.__esModule?X(n,"default",{value:e,enumerable:!0}):n,e)),Vn=e=>Me(X({},"__esModule",{value:!0}),e);var Ke=d((ni,ze)=>{ze.exports=Xe;Xe.sync=Yn;var De=require("fs");function Zn(e,t){var n=t.pathExt!==void 0?t.pathExt:process.env.PATHEXT;if(!n||(n=n.split(";"),n.indexOf("")!==-1))return!0;for(var r=0;r<n.length;r++){var o=n[r].toLowerCase();if(o&&e.substr(-o.length).toLowerCase()===o)return!0}return!1}function We(e,t,n){return!e.isSymbolicLink()&&!e.isFile()?!1:Zn(t,n)}function Xe(e,t,n){De.stat(e,function(r,o){n(r,r?!1:We(o,e,t))})}function Yn(e,t){return We(De.statSync(e),e,t)}});var Je=d((ri,Qe)=>{Qe.exports=Ze;Ze.sync=Qn;var Ve=require("fs");function Ze(e,t,n){Ve.stat(e,function(r,o){n(r,r?!1:Ye(o,t))})}function Qn(e,t){return Ye(Ve.statSync(e),t)}function Ye(e,t){return e.isFile()&&Jn(e,t)}function Jn(e,t){var n=e.mode,r=e.uid,o=e.gid,i=t.uid!==void 0?t.uid:process.getuid&&process.getuid(),s=t.gid!==void 0?t.gid:process.getgid&&process.getgid(),a=parseInt("100",8),l=parseInt("010",8),u=parseInt("001",8),w=a|l,m=n&u||n&l&&o===s||n&a&&r===i||n&w&&i===0;return m}});var tt=d((ii,et)=>{var oi=require("fs"),K;process.platform==="win32"||global.TESTING_WINDOWS?K=Ke():K=Je();et.exports=ue;ue.sync=er;function ue(e,t,n){if(typeof t=="function"&&(n=t,t={}),!n){if(typeof Promise!="function")throw new TypeError("callback not provided");return new Promise(function(r,o){ue(e,t||{},function(i,s){i?o(i):r(s)})})}K(e,t||{},function(r,o){r&&(r.code==="EACCES"||t&&t.ignoreErrors)&&(r=null,o=!1),n(r,o)})}function er(e,t){try{return K.sync(e,t||{})}catch(n){if(t&&t.ignoreErrors||n.code==="EACCES")return!1;throw n}}});var ct=d((si,at)=>{var R=process.platform==="win32"||process.env.OSTYPE==="cygwin"||process.env.OSTYPE==="msys",nt=require("path"),tr=R?";":":",rt=tt(),ot=e=>Object.assign(new Error(`not found: ${e}`),{code:"ENOENT"}),it=(e,t)=>{let n=t.colon||tr,r=e.match(/\//)||R&&e.match(/\\/)?[""]:[...R?[process.cwd()]:[],...(t.path||process.env.PATH||"").split(n)],o=R?t.pathExt||process.env.PATHEXT||".EXE;.CMD;.BAT;.COM":"",i=R?o.split(n):[""];return R&&e.indexOf(".")!==-1&&i[0]!==""&&i.unshift(""),{pathEnv:r,pathExt:i,pathExtExe:o}},st=(e,t,n)=>{typeof t=="function"&&(n=t,t={}),t||(t={});let{pathEnv:r,pathExt:o,pathExtExe:i}=it(e,t),s=[],a=u=>new Promise((w,m)=>{if(u===r.length)return t.all&&s.length?w(s):m(ot(e));let y=r[u],_=/^".*"$/.test(y)?y.slice(1,-1):y,x=nt.join(_,e),h=!_&&/^\.[\\\/]/.test(e)?e.slice(0,2)+x:x;w(l(h,u,0))}),l=(u,w,m)=>new Promise((y,_)=>{if(m===o.length)return y(a(w+1));let x=o[m];rt(u+x,{pathExt:i},(h,f)=>{if(!h&&f)if(t.all)s.push(u+x);else return y(u+x);return y(l(u,w,m+1))})});return n?a(0).then(u=>n(null,u),n):a(0)},nr=(e,t)=>{t=t||{};let{pathEnv:n,pathExt:r,pathExtExe:o}=it(e,t),i=[];for(let s=0;s<n.length;s++){let a=n[s],l=/^".*"$/.test(a)?a.slice(1,-1):a,u=nt.join(l,e),w=!l&&/^\.[\\\/]/.test(e)?e.slice(0,2)+u:u;for(let m=0;m<r.length;m++){let y=w+r[m];try{if(rt.sync(y,{pathExt:o}))if(t.all)i.push(y);else return y}catch{}}}if(t.all&&i.length)return i;if(t.nothrow)return null;throw ot(e)};at.exports=st;st.sync=nr});var fe=d((ai,de)=>{"use strict";var lt=(e={})=>{let t=e.env||process.env;return(e.platform||process.platform)!=="win32"?"PATH":Object.keys(t).reverse().find(r=>r.toUpperCase()==="PATH")||"Path"};de.exports=lt;de.exports.default=lt});var pt=d((ci,ft)=>{"use strict";var ut=require("path"),rr=ct(),or=fe();function dt(e,t){let n=e.options.env||process.env,r=process.cwd(),o=e.options.cwd!=null,i=o&&process.chdir!==void 0&&!process.chdir.disabled;if(i)try{process.chdir(e.options.cwd)}catch{}let s;try{s=rr.sync(e.command,{path:n[or({env:n})],pathExt:t?ut.delimiter:void 0})}catch{}finally{i&&process.chdir(r)}return s&&(s=ut.resolve(o?e.options.cwd:"",s)),s}function ir(e){return dt(e)||dt(e,!0)}ft.exports=ir});var mt=d((li,me)=>{"use strict";var pe=/([()\][%!^"`<>&|;, *?])/g;function sr(e){return e=e.replace(pe,"^$1"),e}function ar(e,t){return e=`${e}`,e=e.replace(/(\\*)"/g,'$1$1\\"'),e=e.replace(/(\\*)$/,"$1$1"),e=`"${e}"`,e=e.replace(pe,"^$1"),t&&(e=e.replace(pe,"^$1")),e}me.exports.command=sr;me.exports.argument=ar});var wt=d((ui,ht)=>{"use strict";ht.exports=/^#!(.*)/});var gt=d((di,yt)=>{"use strict";var cr=wt();yt.exports=(e="")=>{let t=e.match(cr);if(!t)return null;let[n,r]=t[0].replace(/#! ?/,"").split(" "),o=n.split("/").pop();return o==="env"?r:r?`${o} ${r}`:o}});var xt=d((fi,St)=>{"use strict";var he=require("fs"),lr=gt();function ur(e){let n=Buffer.alloc(150),r;try{r=he.openSync(e,"r"),he.readSync(r,n,0,150,0),he.closeSync(r)}catch{}return lr(n.toString())}St.exports=ur});var vt=d((pi,Et)=>{"use strict";var dr=require("path"),_t=pt(),bt=mt(),fr=xt(),pr=process.platform==="win32",mr=/\.(?:com|exe)$/i,hr=/node_modules[\\/].bin[\\/][^\\/]+\.cmd$/i;function wr(e){e.file=_t(e);let t=e.file&&fr(e.file);return t?(e.args.unshift(e.file),e.command=t,_t(e)):e.file}function yr(e){if(!pr)return e;let t=wr(e),n=!mr.test(t);if(e.options.forceShell||n){let r=hr.test(t);e.command=dr.normalize(e.command),e.command=bt.command(e.command),e.args=e.args.map(i=>bt.argument(i,r));let o=[e.command].concat(e.args).join(" ");e.args=["/d","/s","/c",`"${o}"`],e.command=process.env.comspec||"cmd.exe",e.options.windowsVerbatimArguments=!0}return e}function gr(e,t,n){t&&!Array.isArray(t)&&(n=t,t=null),t=t?t.slice(0):[],n=Object.assign({},n);let r={command:e,args:t,options:n,file:void 0,original:{command:e,args:t}};return n.shell?r:yr(r)}Et.exports=gr});var Pt=d((mi,Tt)=>{"use strict";var we=process.platform==="win32";function ye(e,t){return Object.assign(new Error(`${t} ${e.command} ENOENT`),{code:"ENOENT",errno:"ENOENT",syscall:`${t} ${e.command}`,path:e.command,spawnargs:e.args})}function Sr(e,t){if(!we)return;let n=e.emit;e.emit=function(r,o){if(r==="exit"){let i=It(o,t,"spawn");if(i)return n.call(e,"error",i)}return n.apply(e,arguments)}}function It(e,t){return we&&e===1&&!t.file?ye(t.original,"spawn"):null}function xr(e,t){return we&&e===1&&!t.file?ye(t.original,"spawnSync"):null}Tt.exports={hookChildProcess:Sr,verifyENOENT:It,verifyENOENTSync:xr,notFoundError:ye}});var Gt=d((hi,k)=>{"use strict";var At=require("child_process"),ge=vt(),Se=Pt();function Ct(e,t,n){let r=ge(e,t,n),o=At.spawn(r.command,r.args,r.options);return Se.hookChildProcess(o,r),o}function _r(e,t,n){let r=ge(e,t,n),o=At.spawnSync(r.command,r.args,r.options);return o.error=o.error||Se.verifyENOENTSync(o.status,r),o}k.exports=Ct;k.exports.spawn=Ct;k.exports.sync=_r;k.exports._parse=ge;k.exports._enoent=Se});var kt=d((wi,Rt)=>{"use strict";Rt.exports=e=>{let t=typeof e=="string"?`
`:10,n=typeof e=="string"?"\r":13;return e[e.length-1]===t&&(e=e.slice(0,e.length-1)),e[e.length-1]===n&&(e=e.slice(0,e.length-1)),e}});var Nt=d((yi,B)=>{"use strict";var F=require("path"),Lt=fe(),Ot=e=>{e={cwd:process.cwd(),path:process.env[Lt()],execPath:process.execPath,...e};let t,n=F.resolve(e.cwd),r=[];for(;t!==n;)r.push(F.join(n,"node_modules/.bin")),t=n,n=F.resolve(n,"..");let o=F.resolve(e.cwd,e.execPath,"..");return r.push(o),r.concat(e.path).join(F.delimiter)};B.exports=Ot;B.exports.default=Ot;B.exports.env=e=>{e={env:process.env,...e};let t={...e.env},n=Lt({env:t});return e.path=t[n],t[n]=B.exports(e),t}});var $t=d((gi,xe)=>{"use strict";var qt=(e,t)=>{for(let n of Reflect.ownKeys(t))Object.defineProperty(e,n,Object.getOwnPropertyDescriptor(t,n));return e};xe.exports=qt;xe.exports.default=qt});var Ft=d((Si,Z)=>{"use strict";var br=$t(),V=new WeakMap,Mt=(e,t={})=>{if(typeof e!="function")throw new TypeError("Expected a function");let n,r=0,o=e.displayName||e.name||"<anonymous>",i=function(...s){if(V.set(i,++r),r===1)n=e.apply(this,s),e=null;else if(t.throw===!0)throw new Error(`Function \`${o}\` can only be called once`);return n};return br(i,e),V.set(i,r),i};Z.exports=Mt;Z.exports.default=Mt;Z.exports.callCount=e=>{if(!V.has(e))throw new Error(`The given function \`${e.name}\` is not wrapped by the \`onetime\` package`);return V.get(e)}});var Bt=d(Y=>{"use strict";Object.defineProperty(Y,"__esModule",{value:!0});Y.SIGNALS=void 0;var Er=[{name:"SIGHUP",number:1,action:"terminate",description:"Terminal closed",standard:"posix"},{name:"SIGINT",number:2,action:"terminate",description:"User interruption with CTRL-C",standard:"ansi"},{name:"SIGQUIT",number:3,action:"core",description:"User interruption with CTRL-\\",standard:"posix"},{name:"SIGILL",number:4,action:"core",description:"Invalid machine instruction",standard:"ansi"},{name:"SIGTRAP",number:5,action:"core",description:"Debugger breakpoint",standard:"posix"},{name:"SIGABRT",number:6,action:"core",description:"Aborted",standard:"ansi"},{name:"SIGIOT",number:6,action:"core",description:"Aborted",standard:"bsd"},{name:"SIGBUS",number:7,action:"core",description:"Bus error due to misaligned, non-existing address or paging error",standard:"bsd"},{name:"SIGEMT",number:7,action:"terminate",description:"Command should be emulated but is not implemented",standard:"other"},{name:"SIGFPE",number:8,action:"core",description:"Floating point arithmetic error",standard:"ansi"},{name:"SIGKILL",number:9,action:"terminate",description:"Forced termination",standard:"posix",forced:!0},{name:"SIGUSR1",number:10,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGSEGV",number:11,action:"core",description:"Segmentation fault",standard:"ansi"},{name:"SIGUSR2",number:12,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGPIPE",number:13,action:"terminate",description:"Broken pipe or socket",standard:"posix"},{name:"SIGALRM",number:14,action:"terminate",description:"Timeout or timer",standard:"posix"},{name:"SIGTERM",number:15,action:"terminate",description:"Termination",standard:"ansi"},{name:"SIGSTKFLT",number:16,action:"terminate",description:"Stack is empty or overflowed",standard:"other"},{name:"SIGCHLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"posix"},{name:"SIGCLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"other"},{name:"SIGCONT",number:18,action:"unpause",description:"Unpaused",standard:"posix",forced:!0},{name:"SIGSTOP",number:19,action:"pause",description:"Paused",standard:"posix",forced:!0},{name:"SIGTSTP",number:20,action:"pause",description:'Paused using CTRL-Z or "suspend"',standard:"posix"},{name:"SIGTTIN",number:21,action:"pause",description:"Background process cannot read terminal input",standard:"posix"},{name:"SIGBREAK",number:21,action:"terminate",description:"User interruption with CTRL-BREAK",standard:"other"},{name:"SIGTTOU",number:22,action:"pause",description:"Background process cannot write to terminal output",standard:"posix"},{name:"SIGURG",number:23,action:"ignore",description:"Socket received out-of-band data",standard:"bsd"},{name:"SIGXCPU",number:24,action:"core",description:"Process timed out",standard:"bsd"},{name:"SIGXFSZ",number:25,action:"core",description:"File too big",standard:"bsd"},{name:"SIGVTALRM",number:26,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGPROF",number:27,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGWINCH",number:28,action:"ignore",description:"Terminal window size changed",standard:"bsd"},{name:"SIGIO",number:29,action:"terminate",description:"I/O is available",standard:"other"},{name:"SIGPOLL",number:29,action:"terminate",description:"Watched event",standard:"other"},{name:"SIGINFO",number:29,action:"ignore",description:"Request for process information",standard:"other"},{name:"SIGPWR",number:30,action:"terminate",description:"Device running out of power",standard:"systemv"},{name:"SIGSYS",number:31,action:"core",description:"Invalid system call",standard:"other"},{name:"SIGUNUSED",number:31,action:"terminate",description:"Invalid system call",standard:"other"}];Y.SIGNALS=Er});var _e=d(L=>{"use strict";Object.defineProperty(L,"__esModule",{value:!0});L.SIGRTMAX=L.getRealtimeSignals=void 0;var vr=function(){let e=Ut-jt+1;return Array.from({length:e},Ir)};L.getRealtimeSignals=vr;var Ir=function(e,t){return{name:`SIGRT${t+1}`,number:jt+t,action:"terminate",description:"Application-specific signal (realtime)",standard:"posix"}},jt=34,Ut=64;L.SIGRTMAX=Ut});var Ht=d(Q=>{"use strict";Object.defineProperty(Q,"__esModule",{value:!0});Q.getSignals=void 0;var Tr=require("os"),Pr=Bt(),Ar=_e(),Cr=function(){let e=(0,Ar.getRealtimeSignals)();return[...Pr.SIGNALS,...e].map(Gr)};Q.getSignals=Cr;var Gr=function({name:e,number:t,description:n,action:r,forced:o=!1,standard:i}){let{signals:{[e]:s}}=Tr.constants,a=s!==void 0;return{name:e,number:a?s:t,description:n,supported:a,action:r,forced:o,standard:i}}});var Wt=d(O=>{"use strict";Object.defineProperty(O,"__esModule",{value:!0});O.signalsByNumber=O.signalsByName=void 0;var Rr=require("os"),Dt=Ht(),kr=_e(),Lr=function(){return(0,Dt.getSignals)().reduce(Or,{})},Or=function(e,{name:t,number:n,description:r,supported:o,action:i,forced:s,standard:a}){return{...e,[t]:{name:t,number:n,description:r,supported:o,action:i,forced:s,standard:a}}},Nr=Lr();O.signalsByName=Nr;var qr=function(){let e=(0,Dt.getSignals)(),t=kr.SIGRTMAX+1,n=Array.from({length:t},(r,o)=>$r(o,e));return Object.assign({},...n)},$r=function(e,t){let n=Mr(e,t);if(n===void 0)return{};let{name:r,description:o,supported:i,action:s,forced:a,standard:l}=n;return{[e]:{name:r,number:e,description:o,supported:i,action:s,forced:a,standard:l}}},Mr=function(e,t){let n=t.find(({name:r})=>Rr.constants.signals[r]===e);return n!==void 0?n:t.find(r=>r.number===e)},Fr=qr();O.signalsByNumber=Fr});var zt=d((vi,Xt)=>{"use strict";var{signalsByName:Br}=Wt(),jr=({timedOut:e,timeout:t,errorCode:n,signal:r,signalDescription:o,exitCode:i,isCanceled:s})=>e?`timed out after ${t} milliseconds`:s?"was canceled":n!==void 0?`failed with ${n}`:r!==void 0?`was killed with ${r} (${o})`:i!==void 0?`failed with exit code ${i}`:"failed",Ur=({stdout:e,stderr:t,all:n,error:r,signal:o,exitCode:i,command:s,escapedCommand:a,timedOut:l,isCanceled:u,killed:w,parsed:{options:{timeout:m}}})=>{i=i===null?void 0:i,o=o===null?void 0:o;let y=o===void 0?void 0:Br[o].description,_=r&&r.code,h=`Command ${jr({timedOut:l,timeout:m,errorCode:_,signal:o,signalDescription:y,exitCode:i,isCanceled:u})}: ${s}`,f=Object.prototype.toString.call(r)==="[object Error]",I=f?`${h}
${r.message}`:h,W=[I,t,e].filter(Boolean).join(`
`);return f?(r.originalMessage=r.message,r.message=W):r=new Error(W),r.shortMessage=I,r.command=s,r.escapedCommand=a,r.exitCode=i,r.signal=o,r.signalDescription=y,r.stdout=e,r.stderr=t,n!==void 0&&(r.all=n),"bufferedData"in r&&delete r.bufferedData,r.failed=!0,r.timedOut=!!l,r.isCanceled=u,r.killed=w&&!l,r};Xt.exports=Ur});var Vt=d((Ii,be)=>{"use strict";var J=["stdin","stdout","stderr"],Hr=e=>J.some(t=>e[t]!==void 0),Kt=e=>{if(!e)return;let{stdio:t}=e;if(t===void 0)return J.map(r=>e[r]);if(Hr(e))throw new Error(`It's not possible to provide \`stdio\` in combination with one of ${J.map(r=>`\`${r}\``).join(", ")}`);if(typeof t=="string")return t;if(!Array.isArray(t))throw new TypeError(`Expected \`stdio\` to be of type \`string\` or \`Array\`, got \`${typeof t}\``);let n=Math.max(t.length,J.length);return Array.from({length:n},(r,o)=>t[o])};be.exports=Kt;be.exports.node=e=>{let t=Kt(e);return t==="ipc"?"ipc":t===void 0||typeof t=="string"?[t,t,t,"ipc"]:t.includes("ipc")?t:[...t,"ipc"]}});var Zt=d((Ti,ee)=>{ee.exports=["SIGABRT","SIGALRM","SIGHUP","SIGINT","SIGTERM"];process.platform!=="win32"&&ee.exports.push("SIGVTALRM","SIGXCPU","SIGXFSZ","SIGUSR2","SIGTRAP","SIGSYS","SIGQUIT","SIGIOT");process.platform==="linux"&&ee.exports.push("SIGIO","SIGPOLL","SIGPWR","SIGSTKFLT","SIGUNUSED")});var tn=d((Pi,$)=>{var p=global.process,T=function(e){return e&&typeof e=="object"&&typeof e.removeListener=="function"&&typeof e.emit=="function"&&typeof e.reallyExit=="function"&&typeof e.listeners=="function"&&typeof e.kill=="function"&&typeof e.pid=="number"&&typeof e.on=="function"};T(p)?(Yt=require("assert"),N=Zt(),Qt=/^win/i.test(p.platform),j=require("events"),typeof j!="function"&&(j=j.EventEmitter),p.__signal_exit_emitter__?g=p.__signal_exit_emitter__:(g=p.__signal_exit_emitter__=new j,g.count=0,g.emitted={}),g.infinite||(g.setMaxListeners(1/0),g.infinite=!0),$.exports=function(e,t){if(!T(global.process))return function(){};Yt.equal(typeof e,"function","a callback must be provided for exit handler"),q===!1&&Ee();var n="exit";t&&t.alwaysLast&&(n="afterexit");var r=function(){g.removeListener(n,e),g.listeners("exit").length===0&&g.listeners("afterexit").length===0&&te()};return g.on(n,e),r},te=function(){!q||!T(global.process)||(q=!1,N.forEach(function(t){try{p.removeListener(t,ne[t])}catch{}}),p.emit=re,p.reallyExit=ve,g.count-=1)},$.exports.unload=te,P=function(t,n,r){g.emitted[t]||(g.emitted[t]=!0,g.emit(t,n,r))},ne={},N.forEach(function(e){ne[e]=function(){if(T(global.process)){var n=p.listeners(e);n.length===g.count&&(te(),P("exit",null,e),P("afterexit",null,e),Qt&&e==="SIGHUP"&&(e="SIGINT"),p.kill(p.pid,e))}}}),$.exports.signals=function(){return N},q=!1,Ee=function(){q||!T(global.process)||(q=!0,g.count+=1,N=N.filter(function(t){try{return p.on(t,ne[t]),!0}catch{return!1}}),p.emit=en,p.reallyExit=Jt)},$.exports.load=Ee,ve=p.reallyExit,Jt=function(t){T(global.process)&&(p.exitCode=t||0,P("exit",p.exitCode,null),P("afterexit",p.exitCode,null),ve.call(p,p.exitCode))},re=p.emit,en=function(t,n){if(t==="exit"&&T(global.process)){n!==void 0&&(p.exitCode=n);var r=re.apply(this,arguments);return P("exit",p.exitCode,null),P("afterexit",p.exitCode,null),r}else return re.apply(this,arguments)}):$.exports=function(){return function(){}};var Yt,N,Qt,j,g,te,P,ne,q,Ee,ve,Jt,re,en});var rn=d((Ai,nn)=>{"use strict";var Dr=require("os"),Wr=tn(),Xr=1e3*5,zr=(e,t="SIGTERM",n={})=>{let r=e(t);return Kr(e,t,n,r),r},Kr=(e,t,n,r)=>{if(!Vr(t,n,r))return;let o=Yr(n),i=setTimeout(()=>{e("SIGKILL")},o);i.unref&&i.unref()},Vr=(e,{forceKillAfterTimeout:t},n)=>Zr(e)&&t!==!1&&n,Zr=e=>e===Dr.constants.signals.SIGTERM||typeof e=="string"&&e.toUpperCase()==="SIGTERM",Yr=({forceKillAfterTimeout:e=!0})=>{if(e===!0)return Xr;if(!Number.isFinite(e)||e<0)throw new TypeError(`Expected the \`forceKillAfterTimeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`);return e},Qr=(e,t)=>{e.kill()&&(t.isCanceled=!0)},Jr=(e,t,n)=>{e.kill(t),n(Object.assign(new Error("Timed out"),{timedOut:!0,signal:t}))},eo=(e,{timeout:t,killSignal:n="SIGTERM"},r)=>{if(t===0||t===void 0)return r;let o,i=new Promise((a,l)=>{o=setTimeout(()=>{Jr(e,n,l)},t)}),s=r.finally(()=>{clearTimeout(o)});return Promise.race([i,s])},to=({timeout:e})=>{if(e!==void 0&&(!Number.isFinite(e)||e<0))throw new TypeError(`Expected the \`timeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`)},no=async(e,{cleanup:t,detached:n},r)=>{if(!t||n)return r;let o=Wr(()=>{e.kill()});return r.finally(()=>{o()})};nn.exports={spawnedKill:zr,spawnedCancel:Qr,setupTimeout:eo,validateTimeout:to,setExitHandler:no}});var sn=d((Ci,on)=>{"use strict";var E=e=>e!==null&&typeof e=="object"&&typeof e.pipe=="function";E.writable=e=>E(e)&&e.writable!==!1&&typeof e._write=="function"&&typeof e._writableState=="object";E.readable=e=>E(e)&&e.readable!==!1&&typeof e._read=="function"&&typeof e._readableState=="object";E.duplex=e=>E.writable(e)&&E.readable(e);E.transform=e=>E.duplex(e)&&typeof e._transform=="function";on.exports=E});var cn=d((Gi,an)=>{"use strict";var{PassThrough:ro}=require("stream");an.exports=e=>{e={...e};let{array:t}=e,{encoding:n}=e,r=n==="buffer",o=!1;t?o=!(n||r):n=n||"utf8",r&&(n=null);let i=new ro({objectMode:o});n&&i.setEncoding(n);let s=0,a=[];return i.on("data",l=>{a.push(l),o?s=a.length:s+=l.length}),i.getBufferedValue=()=>t?a:r?Buffer.concat(a,s):a.join(""),i.getBufferedLength=()=>s,i}});var ln=d((Ri,U)=>{"use strict";var{constants:oo}=require("buffer"),io=require("stream"),{promisify:so}=require("util"),ao=cn(),co=so(io.pipeline),oe=class extends Error{constructor(){super("maxBuffer exceeded"),this.name="MaxBufferError"}};async function Ie(e,t){if(!e)throw new Error("Expected a stream");t={maxBuffer:1/0,...t};let{maxBuffer:n}=t,r=ao(t);return await new Promise((o,i)=>{let s=a=>{a&&r.getBufferedLength()<=oo.MAX_LENGTH&&(a.bufferedData=r.getBufferedValue()),i(a)};(async()=>{try{await co(e,r),o()}catch(a){s(a)}})(),r.on("data",()=>{r.getBufferedLength()>n&&s(new oe)})}),r.getBufferedValue()}U.exports=Ie;U.exports.buffer=(e,t)=>Ie(e,{...t,encoding:"buffer"});U.exports.array=(e,t)=>Ie(e,{...t,array:!0});U.exports.MaxBufferError=oe});var dn=d((ki,un)=>{"use strict";var{PassThrough:lo}=require("stream");un.exports=function(){var e=[],t=new lo({objectMode:!0});return t.setMaxListeners(0),t.add=n,t.isEmpty=r,t.on("unpipe",o),Array.prototype.slice.call(arguments).forEach(n),t;function n(i){return Array.isArray(i)?(i.forEach(n),this):(e.push(i),i.once("end",o.bind(null,i)),i.once("error",t.emit.bind(t,"error")),i.pipe(t,{end:!1}),this)}function r(){return e.length==0}function o(i){e=e.filter(function(s){return s!==i}),!e.length&&t.readable&&t.end()}}});var hn=d((Li,mn)=>{"use strict";var pn=sn(),fn=ln(),uo=dn(),fo=(e,t)=>{t===void 0||e.stdin===void 0||(pn(t)?t.pipe(e.stdin):e.stdin.end(t))},po=(e,{all:t})=>{if(!t||!e.stdout&&!e.stderr)return;let n=uo();return e.stdout&&n.add(e.stdout),e.stderr&&n.add(e.stderr),n},Te=async(e,t)=>{if(e){e.destroy();try{return await t}catch(n){return n.bufferedData}}},Pe=(e,{encoding:t,buffer:n,maxBuffer:r})=>{if(!(!e||!n))return t?fn(e,{encoding:t,maxBuffer:r}):fn.buffer(e,{maxBuffer:r})},mo=async({stdout:e,stderr:t,all:n},{encoding:r,buffer:o,maxBuffer:i},s)=>{let a=Pe(e,{encoding:r,buffer:o,maxBuffer:i}),l=Pe(t,{encoding:r,buffer:o,maxBuffer:i}),u=Pe(n,{encoding:r,buffer:o,maxBuffer:i*2});try{return await Promise.all([s,a,l,u])}catch(w){return Promise.all([{error:w,signal:w.signal,timedOut:w.timedOut},Te(e,a),Te(t,l),Te(n,u)])}},ho=({input:e})=>{if(pn(e))throw new TypeError("The `input` option cannot be a stream in sync mode")};mn.exports={handleInput:fo,makeAllStream:po,getSpawnedResult:mo,validateInputSync:ho}});var yn=d((Oi,wn)=>{"use strict";var wo=(async()=>{})().constructor.prototype,yo=["then","catch","finally"].map(e=>[e,Reflect.getOwnPropertyDescriptor(wo,e)]),go=(e,t)=>{for(let[n,r]of yo){let o=typeof t=="function"?(...i)=>Reflect.apply(r.value,t(),i):r.value.bind(t);Reflect.defineProperty(e,n,{...r,value:o})}return e},So=e=>new Promise((t,n)=>{e.on("exit",(r,o)=>{t({exitCode:r,signal:o})}),e.on("error",r=>{n(r)}),e.stdin&&e.stdin.on("error",r=>{n(r)})});wn.exports={mergePromise:go,getSpawnedPromise:So}});var xn=d((Ni,Sn)=>{"use strict";var gn=(e,t=[])=>Array.isArray(t)?[e,...t]:[e],xo=/^[\w.-]+$/,_o=/"/g,bo=e=>typeof e!="string"||xo.test(e)?e:`"${e.replace(_o,'\\"')}"`,Eo=(e,t)=>gn(e,t).join(" "),vo=(e,t)=>gn(e,t).map(n=>bo(n)).join(" "),Io=/ +/g,To=e=>{let t=[];for(let n of e.trim().split(Io)){let r=t[t.length-1];r&&r.endsWith("\\")?t[t.length-1]=`${r.slice(0,-1)} ${n}`:t.push(n)}return t};Sn.exports={joinCommand:Eo,getEscapedCommand:vo,parseCommand:To}});var Ce=d((qi,M)=>{"use strict";var Po=require("path"),Ae=require("child_process"),Ao=Gt(),Co=kt(),Go=Nt(),Ro=Ft(),ie=zt(),bn=Vt(),{spawnedKill:ko,spawnedCancel:Lo,setupTimeout:Oo,validateTimeout:No,setExitHandler:qo}=rn(),{handleInput:$o,getSpawnedResult:Mo,makeAllStream:Fo,validateInputSync:Bo}=hn(),{mergePromise:_n,getSpawnedPromise:jo}=yn(),{joinCommand:En,parseCommand:vn,getEscapedCommand:In}=xn(),Uo=1e3*1e3*100,Ho=({env:e,extendEnv:t,preferLocal:n,localDir:r,execPath:o})=>{let i=t?{...process.env,...e}:e;return n?Go.env({env:i,cwd:r,execPath:o}):i},Tn=(e,t,n={})=>{let r=Ao._parse(e,t,n);return e=r.command,t=r.args,n=r.options,n={maxBuffer:Uo,buffer:!0,stripFinalNewline:!0,extendEnv:!0,preferLocal:!1,localDir:n.cwd||process.cwd(),execPath:process.execPath,encoding:"utf8",reject:!0,cleanup:!0,all:!1,windowsHide:!0,...n},n.env=Ho(n),n.stdio=bn(n),process.platform==="win32"&&Po.basename(e,".exe")==="cmd"&&t.unshift("/q"),{file:e,args:t,options:n,parsed:r}},H=(e,t,n)=>typeof t!="string"&&!Buffer.isBuffer(t)?n===void 0?void 0:"":e.stripFinalNewline?Co(t):t,se=(e,t,n)=>{let r=Tn(e,t,n),o=En(e,t),i=In(e,t);No(r.options);let s;try{s=Ae.spawn(r.file,r.args,r.options)}catch(_){let x=new Ae.ChildProcess,h=Promise.reject(ie({error:_,stdout:"",stderr:"",all:"",command:o,escapedCommand:i,parsed:r,timedOut:!1,isCanceled:!1,killed:!1}));return _n(x,h)}let a=jo(s),l=Oo(s,r.options,a),u=qo(s,r.options,l),w={isCanceled:!1};s.kill=ko.bind(null,s.kill.bind(s)),s.cancel=Lo.bind(null,s,w);let y=Ro(async()=>{let[{error:_,exitCode:x,signal:h,timedOut:f},I,W,Un]=await Mo(s,r.options,u),Oe=H(r.options,I),Ne=H(r.options,W),qe=H(r.options,Un);if(_||x!==0||h!==null){let $e=ie({error:_,exitCode:x,signal:h,stdout:Oe,stderr:Ne,all:qe,command:o,escapedCommand:i,parsed:r,timedOut:f,isCanceled:w.isCanceled,killed:s.killed});if(!r.options.reject)return $e;throw $e}return{command:o,escapedCommand:i,exitCode:0,stdout:Oe,stderr:Ne,all:qe,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}});return $o(s,r.options.input),s.all=Fo(s,r.options),_n(s,y)};M.exports=se;M.exports.sync=(e,t,n)=>{let r=Tn(e,t,n),o=En(e,t),i=In(e,t);Bo(r.options);let s;try{s=Ae.spawnSync(r.file,r.args,r.options)}catch(u){throw ie({error:u,stdout:"",stderr:"",all:"",command:o,escapedCommand:i,parsed:r,timedOut:!1,isCanceled:!1,killed:!1})}let a=H(r.options,s.stdout,s.error),l=H(r.options,s.stderr,s.error);if(s.error||s.status!==0||s.signal!==null){let u=ie({stdout:a,stderr:l,error:s.error,signal:s.signal,exitCode:s.status,command:o,escapedCommand:i,parsed:r,timedOut:s.error&&s.error.code==="ETIMEDOUT",isCanceled:!1,killed:s.signal!==null});if(!r.options.reject)return u;throw u}return{command:o,escapedCommand:i,exitCode:0,stdout:a,stderr:l,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}};M.exports.command=(e,t)=>{let[n,...r]=vn(e);return se(n,r,t)};M.exports.commandSync=(e,t)=>{let[n,...r]=vn(e);return se.sync(n,r,t)};M.exports.node=(e,t,n={})=>{t&&!Array.isArray(t)&&typeof t=="object"&&(n=t,t=[]);let r=bn.node(n),o=process.execArgv.filter(a=>!a.startsWith("--inspect")),{nodePath:i=process.execPath,nodeOptions:s=o}=n;return se(i,[...s,e,...Array.isArray(t)?t:[]],{...n,stdin:void 0,stdout:void 0,stderr:void 0,stdio:r,shell:!1})}});var Jo={};Kn(Jo,{default:()=>jn,getCachedEnv:()=>Bn});module.exports=Vn(Jo);var v=require("react"),c=require("@raycast/api");var je=b(require("os"),1),G=b(require("fs"),1),z=b(require("path"),1),Ue=b(require("child_process"),1);function Fe(e){let t=/^: \d+:0;/;return e.trim().split(`
`).map(n=>t.test(n)?n.split(";").slice(1).join(";"):n)}function Be({extraPaths:e=[]}={}){if(process.env.HISTFILE)return process.env.HISTFILE;let t=je.default.homedir(),n=new Set([z.default.join(t,".bash_history"),z.default.join(t,".zsh_history"),z.default.join(t,".history")]);for(let o of e)n.add(o);return(()=>{let o,i=0;for(let s of n)G.default.existsSync(s)&&G.default.statSync(s).size>i&&(i=G.default.statSync(s).size,o=s);return o})()}function He(e={}){if(process.platform==="win32"){let t=Be(e);if(t)return Fe(G.default.readFileSync(t,"utf8"));let{stdout:n}=Ue.default.spawnSync("doskey",["/history"],{encoding:"utf8"});return n.trim().split(`\r
`)}return Fe(G.default.readFileSync(Be(e),"utf8"))}var ce=b(require("node:process"),1),Cn=b(Ce(),1);function Ge({onlyFirst:e=!1}={}){let t=["[\\u001B\\u009B][[\\]()#;?]*(?:(?:(?:(?:;[-a-zA-Z\\d\\/#&.:=?%@~_]+)*|[a-zA-Z\\d]+(?:;[-a-zA-Z\\d\\/#&.:=?%@~_]*)*)?\\u0007)","(?:(?:\\d{1,4}(?:;\\d{0,4})*)?[\\dA-PR-TZcf-ntqry=><~]))"].join("|");return new RegExp(t,e?void 0:"g")}function Re(e){if(typeof e!="string")throw new TypeError(`Expected a \`string\`, got \`${typeof e}\``);return e.replace(Ge(),"")}var ae=b(require("node:process"),1),Pn=require("node:os"),Do=()=>{let{env:e}=ae.default;if(ae.default.platform==="win32")return e.COMSPEC||"cmd.exe";try{let{shell:t}=(0,Pn.userInfo)();if(t)return t}catch{}return ae.default.platform==="darwin"?e.SHELL||"/bin/zsh":e.SHELL||"/bin/sh"},Wo=Do(),An=Wo;var Xo=["-ilc",'echo -n "_SHELL_ENV_DELIMITER_"; env; echo -n "_SHELL_ENV_DELIMITER_"; exit'],zo={DISABLE_AUTO_UPDATE:"true"},Ko=e=>{e=e.split("_SHELL_ENV_DELIMITER_")[1];let t={};for(let n of Re(e).split(`
`).filter(r=>!!r)){let[r,...o]=n.split("=");t[r]=o.join("=")}return t};async function Gn(e){if(ce.default.platform==="win32")return ce.default.env;try{let{stdout:t}=await(0,Cn.default)(e||An,Xo,{env:zo});return Ko(t)}catch(t){if(e)throw t;return ce.default.env}}var Fn=require("child_process");var Rn=b(require("node:process"),1),kn=b(Ce(),1);async function A(e){if(Rn.default.platform!=="darwin")throw new Error("macOS only");let{stdout:t}=await(0,kn.default)("osascript",["-e",e]);return t}var Vo=b(require("react"),1),Zo=require("react");var Yo=require("@raycast/api");var ke=require("@raycast/api"),C=require("react");function Le(e,t){let[n,r]=(0,C.useState)(!0),[o,i]=(0,C.useState)(t);(0,C.useEffect)(()=>{let a=!1;return(async()=>{let l=await ke.LocalStorage.getItem(e);typeof l=="string"&&(a||i(JSON.parse(l))),r(!1)})(),()=>{a=!0}},[]);let s=(0,C.useCallback)(a=>{i(l=>{let u=typeof a=="function"?a(l):a;return ke.LocalStorage.setItem(e,JSON.stringify(u)),u})},[]);return[o,s,n]}var D=b(require("fs")),S=require("react/jsx-runtime"),le=null,Bn=async()=>{if(le)return le;let e=await Gn();return le={env:e,cwd:e.HOME||`/Users/${process.env.USER}`,shell:e.SHELL},le},Ln=({cmd:e})=>{let[t,n]=(0,v.useState)(""),[r,o]=(0,v.useState)(!1);return(0,v.useEffect)(()=>{let i=!1,s=null;return(async()=>{let l=await Bn();s=(0,Fn.exec)(`$SHELL -i -c "${e}"`,l),s.stderr?.on("data",u=>{i||(n(u),(0,c.showToast)({style:c.Toast.Style.Failure,title:"Error executing command"}))}),s.stdout?.on("data",u=>{i||((0,c.showToast)({style:c.Toast.Style.Animated,title:"Executing command..."}),n(u))}),s.on("exit",()=>{(0,c.showToast)({style:c.Toast.Style.Success,title:"Command execution complete"}),o(!0)})})(),function(){i=!0,s!==null&&s.kill("SIGTERM")}},[e,n,o]),(0,S.jsx)(c.Detail,{markdown:"```\n$ "+e+` 
`+t+"\n```",isLoading:!r,actions:(0,S.jsx)(c.ActionPanel,{children:(0,S.jsx)(c.Action.CopyToClipboard,{content:t,shortcut:{modifiers:["cmd"],key:"c"}})})})},On=e=>{let n=`
    tell application "System Events"
      do shell script "/Applications/kitty.app/Contents/MacOS/kitty -1 kitten @ launch --hold ${e.replaceAll('"','\\"')}"
    end tell
  `;A(n)},Nn=e=>{let t=`
    -- Set this property to true to open in a new window instead of a new tab
    property open_in_new_window : false

    on new_window()
    	tell application "iTerm" to create window with default profile
    end new_window

    on new_tab()
    	tell application "iTerm" to tell the first window to create tab with default profile
    end new_tab

    on call_forward()
    	tell application "iTerm" to activate
    end call_forward

    on is_running()
    	application "iTerm" is running
    end is_running

    on is_processing()
    	tell application "iTerm" to tell the first window to tell current session to get is processing
    end is_processing

    on has_windows()
    	if not is_running() then return false
    	if windows of application "iTerm" is {} then return false
    	true
    end has_windows

    on send_text(custom_text)
    	tell application "iTerm" to tell the first window to tell current session to write text custom_text
    end send_text

    -- Main
    if has_windows() then
      if open_in_new_window then
        new_window()
      else
        new_tab()
      end if
    else
    	-- If iTerm is not running and we tell it to create a new window, we get two
    	-- One from opening the application, and the other from the command
    	if is_running() then
    		new_window()
    	else
    		call_forward()
    	end if
    end if


    -- Make sure a window exists before we continue, or the write may fail
    repeat until has_windows()
    	delay 0.01
    end repeat

    send_text("${e.replaceAll('"','\\"')}")
    call_forward()
  `;A(t)},qn=e=>{let t=`
      -- For the latest version:
      -- https://github.com/DavidMChan/custom-alfred-warp-scripts

      -- Set this property to true to always open in a new window
      property open_in_new_window : true

      -- Set this property to true to always open in a new tab
      property open_in_new_tab : false

      -- Don't change this :)
      property opened_new_window : false

      -- Handlers
      on new_window()
          tell application "System Events" to tell process "Warp"
              click menu item "New Window" of menu "File" of menu bar 1
              set frontmost to true
          end tell
      end new_window

      on new_tab()
          tell application "System Events" to tell process "Warp"
              click menu item "New Tab" of menu "File" of menu bar 1
              set frontmost to true
          end tell
      end new_tab

      on call_forward()
          tell application "Warp" to activate
      end call_forward

      on is_running()
          application "Warp" is running
      end is_running

      on has_windows()
          if not is_running() then return false
          tell application "System Events"
              if windows of process "Warp" is {} then return false
          end tell
          true
      end has_windows

      on send_text(custom_text)
          tell application "System Events"
              keystroke custom_text
          end tell
      end send_text


      -- Main
      if not is_running() then
          call_forward()
          set opened_new_window to true
      else
          call_forward()
          set opened_new_window to false
      end if

      if has_windows() then
          if open_in_new_window and not opened_new_window then
              new_window()
          else if open_in_new_tab and not opened_new_window then
              new_tab()
          end if
      else
          new_window()
      end if


      -- Make sure a window exists before we continue, or the write may fail
      repeat until has_windows()
          delay 0.5
      end repeat
      delay 0.5

      send_text("${e}")
      call_forward()
  `;A(t)},$n=e=>{let t=`
      -- Set this property to true to always open in a new window
      property open_in_new_window : true

      -- Set this property to true to always open in a new tab
      property open_in_new_tab : false

      -- Reset this property to false
      property opened_new_window : false

      -- Handlers
      on new_window()
          tell application "System Events" to tell process "Ghostty"
              click menu item "New Window" of menu "File" of menu bar 1
              set frontmost to true
          end tell
      end new_window

      on new_tab()
          tell application "System Events" to tell process "Ghostty"
              click menu item "New Tab" of menu "File" of menu bar 1
              set frontmost to true
          end tell
      end new_tab

      on call_forward()
          tell application "Ghostty" to activate
      end call_forward

      on is_running()
          application "Ghostty" is running
      end is_running

      on has_windows()
          if not is_running() then return false
          tell application "System Events"
              if windows of process "Ghostty" is {} then return false
          end tell
          true
      end has_windows

      on send_text(custom_text)
          tell application "System Events"
              keystroke custom_text
          end tell
      end send_text


      -- Main
      if not is_running() then
          call_forward()
          set opened_new_window to true
      else
          call_forward()
          set opened_new_window to false
      end if

      if has_windows() then
          if open_in_new_window and not opened_new_window then
              new_window()
          else if open_in_new_tab and not opened_new_window then
              new_tab()
          end if
      else
          new_window()
      end if


      -- Make sure a window exists before we continue, or the write may fail
      repeat until has_windows()
          delay 0.5
      end repeat
      delay 0.5

      send_text("${e}")
      call_forward()
  `;A(t)},Mn=e=>{let t=`
  tell application "Terminal"
    do script "${e.replaceAll('"','\\"')}"
    activate
  end tell
  `;A(t)};function jn(e){let[t,n]=(0,v.useState)(""),[r,o]=(0,v.useState)(),[i,s]=Le("recently-used",[]),a=D.default.existsSync("/Applications/iTerm.app"),l=D.default.existsSync("/Applications/kitty.app"),u=D.default.existsSync("/Applications/Warp.app"),w=D.default.existsSync("/Applications/Ghostty.app"),m=h=>{s(f=>f.find(I=>I===h)?f:[h,...f].slice(0,10))};(0,v.useEffect)(()=>{o([...new Set(He().reverse())])},[o]);let{arguments_terminal_type:y,arguments_terminal:_}=(0,c.getPreferenceValues)();if((0,v.useEffect)(()=>{if(e.arguments?.command&&_)switch(m(e.arguments.command),(0,c.showHUD)("Ran command in "+y),(0,c.popToRoot)(),(0,c.closeMainWindow)(),y){case"kitty":On(e.arguments.command);break;case"iTerm":Nn(e.arguments.command);break;case"Warp":qn(e.arguments.command);break;case"Ghostty":$n(e.arguments.command);break;default:Mn(e.arguments.command);break}},[e.arguments]),e.arguments?.command)return _?null:(0,S.jsx)(Ln,{cmd:e.arguments.command});let x=[];return t&&x.push({category:"New command",items:[t]}),i.length>0&&x.push({category:"Raycast History",items:i.filter(h=>h.includes(t)).slice(0,50)}),r!==void 0&&r.length>0&&x.push({category:"Bash History",items:r.filter(h=>h.includes(t)).slice(0,50)}),(0,S.jsx)(c.List,{isLoading:r===void 0,enableFiltering:!1,onSearchTextChange:n,navigationTitle:"Shell command",searchBarPlaceholder:"Enter shell-command",children:x.map(h=>(0,S.jsx)(c.List.Section,{title:h.category,children:h.items.map((f,I)=>(0,S.jsx)(c.List.Item,{icon:c.Icon.Terminal,title:f,actions:(0,S.jsxs)(c.ActionPanel,{children:[(0,S.jsx)(c.Action.Push,{title:"Execute",icon:c.Icon.List,onPush:()=>m(f),target:(0,S.jsx)(Ln,{cmd:f})}),l?(0,S.jsx)(c.Action,{title:"Execute in kitty.app",icon:{fileIcon:"/Applications/kitty.app"},onAction:()=>{(0,c.closeMainWindow)(),(0,c.popToRoot)(),m(f),On(f)}}):null,a?(0,S.jsx)(c.Action,{title:"Execute in iTerm.app",icon:{fileIcon:"/Applications/iTerm.app"},onAction:()=>{(0,c.closeMainWindow)(),(0,c.popToRoot)(),m(f),Nn(f)}}):null,w?(0,S.jsx)(c.Action,{title:"Execute in Ghostty.app",icon:{fileIcon:"/Applications/Ghostty.app"},onAction:()=>{(0,c.closeMainWindow)(),(0,c.popToRoot)(),m(f),$n(f)}}):null,u?(0,S.jsx)(c.Action,{title:"Execute in Warp.app",icon:{fileIcon:"/Applications/Warp.app"},onAction:()=>{(0,c.closeMainWindow)(),(0,c.popToRoot)(),m(f),qn(f)}}):null,(0,S.jsx)(c.Action,{title:"Execute in Terminal.app",icon:{fileIcon:"/System/Applications/Utilities/Terminal.app"},onAction:()=>{(0,c.closeMainWindow)(),(0,c.popToRoot)(),m(f),Mn(f)}}),(0,S.jsx)(c.Action.CopyToClipboard,{title:"Copy to Clipboard",content:f,onCopy:()=>{m(f)}})]})},I))},h.category))})}0&&(module.exports={getCachedEnv});
