!function(){var a={},b=function(b){for(var c=a[b],e=c.deps,f=c.defn,g=e.length,h=new Array(g),i=0;i<g;++i)h[i]=d(e[i]);var j=f.apply(null,h);if(void 0===j)throw"module ["+b+"] returned undefined";c.instance=j},c=function(b,c,d){if("string"!=typeof b)throw"module id must be a string";if(void 0===c)throw"no dependencies for "+b;if(void 0===d)throw"no definition function for "+b;a[b]={deps:c,defn:d,instance:void 0}},d=function(c){var d=a[c];if(void 0===d)throw"module ["+c+"] was undefined";return void 0===d.instance&&b(c),d.instance},e=function(a,b){for(var c=a.length,e=new Array(c),f=0;f<c;++f)e.push(d(a[f]));b.apply(null,b)},f={};f.bolt={module:{api:{define:c,require:e,demand:d}}};var g=c,h=function(a,b){g(a,[],function(){return b})};h("7",tinymce.util.Tools.resolve),g("1",["7"],function(a){return a("tinymce.PluginManager")}),g("2",["7"],function(a){return a("tinymce.util.Delay")}),g("3",["7"],function(a){return a("tinymce.util.VK")}),g("8",["7"],function(a){return a("tinymce.dom.TreeWalker")}),g("9",["7"],function(a){return a("tinymce.util.Tools")}),g("a",[],function(){var a=function(a){return a.sort(function(a,b){return a.start.length>b.start.length?-1:a.start.length<b.start.length?1:0})},b=function(a,b){for(var c=0;c<a.length;c++)if(0===b.indexOf(a[c].start)&&(!a[c].end||b.lastIndexOf(a[c].end)===b.length-a[c].end.length))return a[c]},c=function(a,b,c,d){var e=b.substr(c-a.end.length-d,a.end.length);return e===a.end},d=function(a,b,c){return a-b-c.end.length-c.start.length>0},e=function(b,e,f,g){var h,i,j=a(b);for(i=0;i<j.length;i++)if(h=j[i],void 0!==h.end&&c(h,e,f,g)&&d(f,g,h))return h};return{findPattern:b,findEndPattern:e}}),g("4",["8","9","a"],function(a,b,c){var d=function(a,b,c,d,e){return a=d>0?a.splitText(d):a,a.splitText(c-d-e),a.deleteData(0,b.start.length),a.deleteData(a.data.length-b.end.length,b.end.length),a},e=function(a,b,e){var f,g,h,i,j,k,l,m,n,o,p;if(f=a.selection,g=a.dom,f.isCollapsed()&&(h=f.getRng(!0),i=h.startContainer,j=h.startOffset,l=i.data,o=e===!0?1:0,3==i.nodeType&&(n=c.findEndPattern(b,l,j,o),void 0!==n&&(k=Math.max(0,j-o),k=l.lastIndexOf(n.start,k-n.end.length-1),k!==-1&&(m=g.createRng(),m.setStart(i,k),m.setEnd(i,j-o),n=c.findPattern(b,m.toString()),n&&n.end&&!(i.data.length<=n.start.length+n.end.length))))))return p=a.formatter.get(n.format),p&&p[0].inline?(a.undoManager.transact(function(){i=d(i,n,j,k,o),a.formatter.apply(n.format,{},i)}),i):void 0},f=function(d,e){var f,g,h,i,j,k,l,m,n,o,p;if(f=d.selection,g=d.dom,f.isCollapsed()&&(l=g.getParent(f.getStart(),"p"))){for(n=new a(l,l);j=n.next();)if(3==j.nodeType){i=j;break}if(i){if(m=c.findPattern(e,i.data),!m)return;if(o=f.getRng(!0),h=o.startContainer,p=o.startOffset,i==h&&(p=Math.max(0,p-m.start.length)),b.trim(i.data).length==m.start.length)return;m.format&&(k=d.formatter.get(m.format),k&&k[0].block&&(i.deleteData(0,m.start.length),d.formatter.apply(m.format,{},i),o.setStart(h,p),o.collapse(!0),f.setRng(o))),m.cmd&&d.undoManager.transact(function(){i.deleteData(0,m.start.length),d.execCommand(m.cmd)})}}};return{applyInlineFormat:e,applyBlockFormat:f}}),g("5",["3","4"],function(a,b){function c(a,c){var d,e;e=b.applyInlineFormat(a,c,!1),e&&(d=a.dom.createRng(),d.setStart(e,e.data.length),d.setEnd(e,e.data.length),a.selection.setRng(d)),b.applyBlockFormat(a,c)}function d(a,c){var d,e,f,g,h;d=b.applyInlineFormat(a,c,!0),d&&(h=a.dom,e=d.data.slice(-1),/[\u00a0 ]/.test(e)&&(d.deleteData(d.data.length-1,1),f=h.doc.createTextNode(e),d.nextSibling?h.insertAfter(f,d.nextSibling):d.parentNode.appendChild(f),g=h.createRng(),g.setStart(f,1),g.setEnd(f,1),a.selection.setRng(g)))}var e=function(a,b,c){for(var d=0;d<a.length;d++)if(c(a[d],b))return!0},f=function(b,c){return e(b,c,function(b,c){return b===c.keyCode&&a.modifierPressed(c)===!1})},g=function(a,b){return e(a,b,function(a,b){return a.charCodeAt(0)===b.charCode})};return{handleEnter:c,handleInlineKey:d,checkCharCode:g,checkKeyCode:f}}),g("6",[],function(){var a=[{start:"*",end:"*",format:"italic"},{start:"**",end:"**",format:"bold"},{start:"#",format:"h1"},{start:"##",format:"h2"},{start:"###",format:"h3"},{start:"####",format:"h4"},{start:"#####",format:"h5"},{start:"######",format:"h6"},{start:"1. ",cmd:"InsertOrderedList"},{start:"* ",cmd:"InsertUnorderedList"},{start:"- ",cmd:"InsertUnorderedList"}],b=function(b){return void 0!==b.textpattern_patterns?b.textpattern_patterns:a};return{getPatterns:b}}),g("0",["1","2","3","4","5","6"],function(a,b,c,d,e,f){return a.add("textpattern",function(a){var d=f.getPatterns(a.settings),g=[",",".",";",":","!","?"],h=[32];a.on("keydown",function(b){13!==b.keyCode||c.modifierPressed(b)||e.handleEnter(a,d)},!0),a.on("keyup",function(b){e.checkKeyCode(h,b)&&e.handleInlineKey(a,d)}),a.on("keypress",function(c){e.checkCharCode(g,c)&&b.setEditorTimeout(a,function(){e.handleInlineKey(a,d)})}),this.setPatterns=function(a){d=a},this.getPatterns=function(){return d}}),function(){}}),d("0")()}();
