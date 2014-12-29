tinymce.PluginManager.add("media",function(a,b){function c(a){return-1!=a.indexOf(".mp3")?"audio/mpeg":-1!=a.indexOf(".wav")?"audio/wav":-1!=a.indexOf(".mp4")?"video/mp4":-1!=a.indexOf(".webm")?"video/webm":-1!=a.indexOf(".ogg")?"video/ogg":-1!=a.indexOf(".swf")?"application/x-shockwave-flash":""}function d(b){var c=a.settings.media_scripts;if(c)for(var d=0;d<c.length;d++)if(-1!==b.indexOf(c[d].filter))return c[d]}function e(){function b(a){var b,c,f,g;b=d.find("#width")[0],c=d.find("#height")[0],f=b.value(),g=c.value(),d.find("#constrain")[0].checked()&&e&&j&&f&&g&&(a.control==b?(g=Math.round(f/e*g),c.value(g)):(f=Math.round(g/j*f),b.value(f))),e=f,j=g}function c(){k=h(this.value()),this.parent().parent().fromJSON(k)}var d,e,j,k,l=[{name:"source1",type:"filepicker",filetype:"media",size:40,autofocus:!0,label:"Source",onchange:function(a){tinymce.each(a.meta,function(a,b){d.find("#"+b).value(a)})}}];a.settings.media_alt_source!==!1&&l.push({name:"source2",type:"filepicker",filetype:"media",size:40,label:"Alternative source"}),a.settings.media_poster!==!1&&l.push({name:"poster",type:"filepicker",filetype:"image",size:40,label:"Poster"}),a.settings.media_dimensions!==!1&&l.push({type:"container",label:"Dimensions",layout:"flex",align:"center",spacing:5,items:[{name:"width",type:"textbox",maxLength:3,size:3,onchange:b},{type:"label",text:"x"},{name:"height",type:"textbox",maxLength:3,size:3,onchange:b},{name:"constrain",type:"checkbox",checked:!0,text:"Constrain proportions"}]}),k=i(a.selection.getNode()),e=k.width,j=k.height;var n={id:"mcemediasource",type:"textbox",flex:1,name:"embed",value:f(),multiline:!0,label:"Source"};n[m]=c,d=a.windowManager.open({title:"Insert/edit video",data:k,bodyType:"tabpanel",body:[{title:"General",type:"form",onShowTab:function(){k=h(this.next().find("#embed").value()),this.fromJSON(k)},items:l},{title:"Embed",type:"panel",layout:"flex",direction:"column",align:"stretch",padding:10,spacing:10,onShowTab:function(){this.find("#embed").value(g(this.parent().toJSON()))},items:[{type:"label",text:"Paste your embed code below:",forId:"mcemediasource"},n]}],onSubmit:function(){var b,c,d,e;for(b=a.dom.select("img[data-mce-object]"),a.insertContent(g(this.toJSON())),c=a.dom.select("img[data-mce-object]"),d=0;d<b.length;d++)for(e=c.length-1;e>=0;e--)b[d]==c[e]&&c.splice(e,1);a.selection.select(c[0]),a.nodeChanged()}})}function f(){var b=a.selection.getNode();return b.getAttribute("data-mce-object")?a.selection.getContent():void 0}function g(e){var f="";if(!e.source1&&(tinymce.extend(e,h(e.embed)),!e.source1))return"";if(e.source2||(e.source2=""),e.poster||(e.poster=""),e.source1=a.convertURL(e.source1,"source"),e.source2=a.convertURL(e.source2,"source"),e.source1mime=c(e.source1),e.source2mime=c(e.source2),e.poster=a.convertURL(e.poster,"poster"),e.flashPlayerUrl=a.convertURL(b+"/moxieplayer.swf","movie"),tinymce.each(l,function(a){var b,c,d;if(b=a.regex.exec(e.source1)){for(d=a.url,c=0;b[c];c++)d=d.replace("$"+c,function(){return b[c]});e.source1=d,e.type=a.type,e.width=e.width||a.w,e.height=e.height||a.h}}),e.embed)f=k(e.embed,e,!0);else{var g=d(e.source1);g&&(e.type="script",e.width=g.width,e.height=g.height),e.width=e.width||300,e.height=e.height||150,tinymce.each(e,function(b,c){e[c]=a.dom.encode(b)}),"iframe"==e.type?f+='<iframe src="'+e.source1+'" width="'+e.width+'" height="'+e.height+'"></iframe>':"application/x-shockwave-flash"==e.source1mime?(f+='<object data="'+e.source1+'" width="'+e.width+'" height="'+e.height+'" type="application/x-shockwave-flash">',e.poster&&(f+='<img src="'+e.poster+'" width="'+e.width+'" height="'+e.height+'" />'),f+="</object>"):-1!=e.source1mime.indexOf("audio")?a.settings.audio_template_callback?f=a.settings.audio_template_callback(e):f+='<audio controls="controls" src="'+e.source1+'">'+(e.source2?'\n<source src="'+e.source2+'"'+(e.source2mime?' type="'+e.source2mime+'"':"")+" />\n":"")+"</audio>":"script"==e.type?f+='<script src="'+e.source1+'"></script>':f=a.settings.video_template_callback?a.settings.video_template_callback(e):'<video width="'+e.width+'" height="'+e.height+'"'+(e.poster?' poster="'+e.poster+'"':"")+' controls="controls">\n<source src="'+e.source1+'"'+(e.source1mime?' type="'+e.source1mime+'"':"")+" />\n"+(e.source2?'<source src="'+e.source2+'"'+(e.source2mime?' type="'+e.source2mime+'"':"")+" />\n":"")+"</video>"}return f}function h(a){var b={};return new tinymce.html.SaxParser({validate:!1,allow_conditional_comments:!0,special:"script,noscript",start:function(a,c){if(b.source1||"param"!=a||(b.source1=c.map.movie),("iframe"==a||"object"==a||"embed"==a||"video"==a||"audio"==a)&&(b.type||(b.type=a),b=tinymce.extend(c.map,b)),"script"==a){var e=d(c.map.src);if(!e)return;b={type:"script",source1:c.map.src,width:e.width,height:e.height}}"source"==a&&(b.source1?b.source2||(b.source2=c.map.src):b.source1=c.map.src),"img"!=a||b.poster||(b.poster=c.map.src)}}).parse(a),b.source1=b.source1||b.src||b.data,b.source2=b.source2||"",b.poster=b.poster||"",b}function i(b){return b.getAttribute("data-mce-object")?h(a.serializer.serialize(b,{selection:!0})):{}}function j(b){if(a.settings.media_filter_html===!1)return b;var c=new tinymce.html.Writer;return new tinymce.html.SaxParser({validate:!1,allow_conditional_comments:!1,special:"script,noscript",comment:function(a){c.comment(a)},cdata:function(a){c.cdata(a)},text:function(a,b){c.text(a,b)},start:function(a,b,d){if("script"!=a&&"noscript"!=a){for(var e=0;e<b.length;e++)if(0===b[e].name.indexOf("on"))return;c.start(a,b,d)}},end:function(a){"script"!=a&&"noscript"!=a&&c.end(a)}},new tinymce.html.Schema({})).parse(b),c.getContent()}function k(a,b,c){function d(a,b){var c,d,e,f;for(c in b)if(e=""+b[c],a.map[c])for(d=a.length;d--;)f=a[d],f.name==c&&(e?(a.map[c]=e,f.value=e):(delete a.map[c],a.splice(d,1)));else e&&(a.push({name:c,value:e}),a.map[c]=e)}var e,f=new tinymce.html.Writer,g=0;return new tinymce.html.SaxParser({validate:!1,allow_conditional_comments:!0,special:"script,noscript",comment:function(a){f.comment(a)},cdata:function(a){f.cdata(a)},text:function(a,b){f.text(a,b)},start:function(a,h,i){switch(a){case"video":case"object":case"embed":case"img":case"iframe":d(h,{width:b.width,height:b.height})}if(c)switch(a){case"video":d(h,{poster:b.poster,src:""}),b.source2&&d(h,{src:""});break;case"iframe":d(h,{src:b.source1});break;case"source":if(g++,2>=g&&(d(h,{src:b["source"+g],type:b["source"+g+"mime"]}),!b["source"+g]))return;break;case"img":if(!b.poster)return;e=!0}f.start(a,h,i)},end:function(a){if("video"==a&&c)for(var h=1;2>=h;h++)if(b["source"+h]){var i=[];i.map={},h>g&&(d(i,{src:b["source"+h],type:b["source"+h+"mime"]}),f.start("source",i,!0))}if(b.poster&&"object"==a&&c&&!e){var j=[];j.map={},d(j,{src:b.poster,width:b.width,height:b.height}),f.start("img",j,!0)}f.end(a)}},new tinymce.html.Schema({})).parse(a),f.getContent()}var l=[{regex:/youtu\.be\/([\w\-.]+)/,type:"iframe",w:425,h:350,url:"//www.youtube.com/embed/$1"},{regex:/youtube\.com(.+)v=([^&]+)/,type:"iframe",w:425,h:350,url:"//www.youtube.com/embed/$2"},{regex:/vimeo\.com\/([0-9]+)/,type:"iframe",w:425,h:350,url:"//player.vimeo.com/video/$1?title=0&byline=0&portrait=0&color=8dc7dc"},{regex:/vimeo\.com\/(.*)\/([0-9]+)/,type:"iframe",w:425,h:350,url:"//player.vimeo.com/video/$2?title=0&amp;byline=0"},{regex:/maps\.google\.([a-z]{2,3})\/maps\/(.+)msid=(.+)/,type:"iframe",w:425,h:350,url:'//maps.google.com/maps/ms?msid=$2&output=embed"'}],m=tinymce.Env.ie&&tinymce.Env.ie<=8?"onChange":"onInput";a.on("ResolveName",function(a){var b;1==a.target.nodeType&&(b=a.target.getAttribute("data-mce-object"))&&(a.name=b)}),a.on("preInit",function(){var b=a.schema.getSpecialElements();tinymce.each("video audio iframe object".split(" "),function(a){b[a]=new RegExp("</"+a+"[^>]*>","gi")});var c=a.schema.getBoolAttrs();tinymce.each("webkitallowfullscreen mozallowfullscreen allowfullscreen".split(" "),function(a){c[a]={}}),a.parser.addNodeFilter("iframe,video,audio,object,embed,script",function(b,c){for(var e,f,g,h,i,j,k,l,m=b.length;m--;)if(f=b[m],f.parent&&("script"!=f.name||(l=d(f.attr("src"))))){for(g=new tinymce.html.Node("img",1),g.shortEnded=!0,l&&(l.width&&f.attr("width",l.width.toString()),l.height&&f.attr("height",l.height.toString())),j=f.attributes,e=j.length;e--;)h=j[e].name,i=j[e].value,"width"!==h&&"height"!==h&&"style"!==h&&(("data"==h||"src"==h)&&(i=a.convertURL(i,h)),g.attr("data-mce-p-"+h,i));k=f.firstChild&&f.firstChild.value,k&&(g.attr("data-mce-html",escape(k)),g.firstChild=null),g.attr({width:f.attr("width")||"300",height:f.attr("height")||("audio"==c?"30":"150"),style:f.attr("style"),src:tinymce.Env.transparentSrc,"data-mce-object":c,"class":"mce-object mce-object-"+c}),f.replace(g)}}),a.serializer.addAttributeFilter("data-mce-object",function(a,b){for(var c,d,e,f,g,h,i,k=a.length;k--;)if(c=a[k],c.parent){for(i=c.attr(b),d=new tinymce.html.Node(i,1),"audio"!=i&&"script"!=i&&d.attr({width:c.attr("width"),height:c.attr("height")}),d.attr({style:c.attr("style")}),f=c.attributes,e=f.length;e--;){var l=f[e].name;0===l.indexOf("data-mce-p-")&&d.attr(l.substr(11),f[e].value)}"script"==i&&d.attr("type","text/javascript"),g=c.attr("data-mce-html"),g&&(h=new tinymce.html.Node("#text",3),h.raw=!0,h.value=j(unescape(g)),d.append(h)),c.replace(d)}})}),a.on("ObjectSelected",function(a){var b=a.target.getAttribute("data-mce-object");("audio"==b||"script"==b)&&a.preventDefault()}),a.on("objectResized",function(a){var b,c=a.target;c.getAttribute("data-mce-object")&&(b=c.getAttribute("data-mce-html"),b&&(b=unescape(b),c.setAttribute("data-mce-html",escape(k(b,{width:a.width,height:a.height})))))}),a.addButton("media",{tooltip:"Insert/edit video",onclick:e,stateSelector:["img[data-mce-object=video]","img[data-mce-object=iframe]"]}),a.addMenuItem("media",{icon:"media",text:"Insert video",onclick:e,context:"insert",prependToContext:!0})});