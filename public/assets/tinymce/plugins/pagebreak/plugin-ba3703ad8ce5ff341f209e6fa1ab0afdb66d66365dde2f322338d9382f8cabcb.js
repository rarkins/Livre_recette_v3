!function(){var a={},b=function(b){for(var c=a[b],e=c.deps,f=c.defn,g=e.length,h=new Array(g),i=0;i<g;++i)h[i]=d(e[i]);var j=f.apply(null,h);if(void 0===j)throw"module ["+b+"] returned undefined";c.instance=j},c=function(b,c,d){if("string"!=typeof b)throw"module id must be a string";if(void 0===c)throw"no dependencies for "+b;if(void 0===d)throw"no definition function for "+b;a[b]={deps:c,defn:d,instance:void 0}},d=function(c){var d=a[c];if(void 0===d)throw"module ["+c+"] was undefined";return void 0===d.instance&&b(c),d.instance},e=function(a,b){for(var c=a.length,e=new Array(c),f=0;f<c;++f)e.push(d(a[f]));b.apply(null,b)},f={};f.bolt={module:{api:{define:c,require:e,demand:d}}};var g=c,h=function(a,b){g(a,[],function(){return b})};h("3",tinymce.util.Tools.resolve),g("1",["3"],function(a){return a("tinymce.PluginManager")}),g("2",["3"],function(a){return a("tinymce.Env")}),g("0",["1","2"],function(a,b){return a.add("pagebreak",function(a){var c="mce-pagebreak",d=a.getParam("pagebreak_separator","<!-- pagebreak -->"),e=new RegExp(d.replace(/[\?\.\*\[\]\(\)\{\}\+\^\$\:]/g,function(a){return"\\"+a}),"gi"),f='<img src="'+b.transparentSrc+'" class="'+c+'" data-mce-resize="false" data-mce-placeholder />';a.addCommand("mcePageBreak",function(){a.settings.pagebreak_split_block?a.insertContent("<p>"+f+"</p>"):a.insertContent(f)}),a.addButton("pagebreak",{title:"Page break",cmd:"mcePageBreak"}),a.addMenuItem("pagebreak",{text:"Page break",icon:"pagebreak",cmd:"mcePageBreak",context:"insert"}),a.on("ResolveName",function(b){"IMG"==b.target.nodeName&&a.dom.hasClass(b.target,c)&&(b.name="pagebreak")}),a.on("click",function(b){b=b.target,"IMG"===b.nodeName&&a.dom.hasClass(b,c)&&a.selection.select(b)}),a.on("BeforeSetContent",function(a){a.content=a.content.replace(e,f)}),a.on("PreInit",function(){a.serializer.addNodeFilter("img",function(b){for(var c,e,f=b.length;f--;)if(c=b[f],e=c.attr("class"),e&&e.indexOf("mce-pagebreak")!==-1){var g=c.parent;if(a.schema.getBlockElements()[g.name]&&a.settings.pagebreak_split_block){g.type=3,g.value=d,g.raw=!0,c.remove();continue}c.type=3,c.value=d,c.raw=!0}})})}),function(){}}),d("0")()}();
