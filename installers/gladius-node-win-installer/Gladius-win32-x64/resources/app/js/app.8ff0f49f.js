(function(t){function n(n){for(var o,i,s=n[0],c=n[1],l=n[2],f=0,d=[];f<s.length;f++)i=s[f],r[i]&&d.push(r[i][0]),r[i]=0;for(o in c)Object.prototype.hasOwnProperty.call(c,o)&&(t[o]=c[o]);u&&u(n);while(d.length)d.shift()();return a.push.apply(a,l||[]),e()}function e(){for(var t,n=0;n<a.length;n++){for(var e=a[n],o=!0,s=1;s<e.length;s++){var c=e[s];0!==r[c]&&(o=!1)}o&&(a.splice(n--,1),t=i(i.s=e[0]))}return t}var o={},r={1:0},a=[];function i(n){if(o[n])return o[n].exports;var e=o[n]={i:n,l:!1,exports:{}};return t[n].call(e.exports,e,e.exports,i),e.l=!0,e.exports}i.m=t,i.c=o,i.d=function(t,n,e){i.o(t,n)||Object.defineProperty(t,n,{configurable:!1,enumerable:!0,get:e})},i.r=function(t){Object.defineProperty(t,"__esModule",{value:!0})},i.n=function(t){var n=t&&t.__esModule?function(){return t["default"]}:function(){return t};return i.d(n,"a",n),n},i.o=function(t,n){return Object.prototype.hasOwnProperty.call(t,n)},i.p="/";var s=window["webpackJsonp"]=window["webpackJsonp"]||[],c=s.push.bind(s);s.push=n,s=s.slice();for(var l=0;l<s.length;l++)n(s[l]);var u=c;a.push([9,0]),e()})({"5hmT":function(t,n,e){},"5pot":function(t,n,e){"use strict";var o=e("D4Uw"),r=e.n(o);r.a},9:function(t,n,e){t.exports=e("Vtdi")},D4Uw:function(t,n,e){},Vtdi:function(t,n,e){"use strict";e.r(n);e("VRzm");var o=e("Kw5r"),r=function(){var t=this,n=t.$createElement,o=t._self._c||n;return o("div",{attrs:{id:"app"}},[o("div",{staticClass:"container-fluid",attrs:{id:"navigation"}},[o("div",{staticClass:"row align-items-center justify-content-center"},[o("div",{staticClass:"col-sm-auto"},[o("router-link",{attrs:{to:"/"}},[o("img",{attrs:{src:e("mxmt")}})])],1)])]),t._v(" "),o("router-view")],1)},a=[],i=(e("nNx0"),e("KHd+")),s={},c=Object(i["a"])(s,r,a,!1,null,null,null),l=c.exports,u=e("jE9Z"),f=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"home"},[e("b-container",[e("b-row",{attrs:{"align-h":"center"}},t._l(t.nodeInfoArray,function(t){return e("b-col",{key:t.title,staticClass:"col",attrs:{lg:"4",md:"5",sm:"12",xs:"12"}},[e("block",{attrs:{title:t.title,message:t.field}})],1)})),t._v(" "),e("b-row",{attrs:{"align-h":"center"}},[e("b-col",{staticClass:"col",attrs:{lg:"8",md:"10",sm:"12",xs:"12"}},[e("card",{attrs:{title:"Account Information",fields:t.accountInfoArray}})],1)],1)],1)],1)},d=[],p=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("b-container",{attrs:{fluid:""}},[e("div",{staticClass:"gladius-info-card"},[e("div",{staticClass:"gladius-info-card__title"},[t._v(t._s(t.title))]),t._v(" "),e("div",{staticClass:"gladius-info-card__content"},[t._v(t._s(t.message))])])])},v=[],h={name:"Block",props:{title:String,message:String}},m=h,g=(e("r9Gr"),Object(i["a"])(m,p,v,!1,null,"72b45236",null)),_=g.exports,A=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("b-container",{attrs:{fluid:""}},[e("div",{staticClass:"gladius-card"},[e("div",{staticClass:"gladius-card__title pl-4 pr-4 pt-2 pb-2 gladius-card__title--borderless"},[t._v(t._s(t.title))]),t._v(" "),e("div",{staticClass:"gladius-card__content p-4 gladius-card--borderless"},t._l(t.fields,function(n){return e("div",{staticClass:"home__content-row"},[e("div",{staticClass:"home__content-title"},[t._v(t._s(n.title))]),t._v(" "),e("div",{staticClass:"home__content-value"},[t._v(t._s(n.field))])])}))])])},b=[],y={name:"Card",props:{title:String,fields:Array}},w=y,C=(e("nE3f"),Object(i["a"])(w,A,b,!1,null,"13e2c120",null)),I=C.exports,x={name:"home",components:{Block:_,Card:I},data:function(){return{nodeInfoArray:this.$store.state.nodeInfoArray,accountInfoArray:this.$store.state.accountInfoArray}},created:function(){this.$store.dispatch("walletInfoAsync"),this.$store.dispatch("nodeDataAsync")}},j=x,k=(e("5pot"),Object(i["a"])(j,f,d,!1,null,null,null)),O=k.exports;o["a"].use(u["a"]);var E=new u["a"]({routes:[{path:"/",name:"home",component:O}]}),N=(e("f3/d"),e("L2JU"));o["a"].use(N["a"]);var S=new N["a"].Store({state:{nodeInfoArray:[{title:"Upload Speed",field:"Coming Soon"},{title:"Status",field:"Coming Soon"}],accountInfoArray:[{title:"Name",field:"N/A"},{title:"Email",field:"N/A"},{title:"IP Address",field:"N/A"},{title:"Status",field:"N/A"},{title:"Wallet Address",field:"N/A"}]},mutations:{updateAccount:function(t,n){t.accountInfoArray[0].field=n.name,t.accountInfoArray[1].field=n.email,t.accountInfoArray[2].field=n.ip,t.accountInfoArray[3].field=n.status},updateWallet:function(t,n){t.accountInfoArray[4].field=n.address}},actions:{nodeDataAsync:function(t){var n=t.commit;fetch("http://localhost:3001/api/node/").then(function(t){return t.json()}).then(function(t){fetch("http://localhost:3001/api/node/"+t.response+"/data").then(function(t){return t.json()}).then(function(t){n("updateAccount",t.response)})})},walletInfoAsync:function(t){var n=t.commit;fetch("http://localhost:3001/api/keystore/wallets").then(function(t){return t.json()}).then(function(t){t.response.length>0&&n("updateWallet",t.response[0])})}},getters:{node:function(t){return t.node},account:function(t){return t.account}}}),$=e("lIOY");Object($["a"])("".concat("/","service-worker.js"),{ready:function(){console.log("App is being served from cache by a service worker.\nFor more details, visit https://goo.gl/AFskqB")},cached:function(){console.log("Content has been cached for offline use.")},updated:function(){console.log("New content is available; please refresh.")},offline:function(){console.log("No internet connection found. App is running in offline mode.")},error:function(t){console.error("Error during service worker registration:",t)}});var P=e("n3sq");e("+eM2"),e("LdiE");o["a"].config.productionTip=!1,o["a"].use(P["a"]),new o["a"]({router:E,store:S,render:function(t){return t(l)}}).$mount("#app")},fnoW:function(t,n,e){},mxmt:function(t,n,e){t.exports="./img/logo.c71b107a.svg"},nE3f:function(t,n,e){"use strict";var o=e("5hmT"),r=e.n(o);r.a},nNx0:function(t,n,e){"use strict";var o=e("fnoW"),r=e.n(o);r.a},r9Gr:function(t,n,e){"use strict";var o=e("uYAQ"),r=e.n(o);r.a},uYAQ:function(t,n,e){}});
//# sourceMappingURL=app.8ff0f49f.js.map
