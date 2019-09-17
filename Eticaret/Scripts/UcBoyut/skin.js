// Garden Gnome Software - Skin
// Object2VR 3.0/10616
// Filename: camper-SS.ggsk
// Generated Cmt 14. Haz 00:51:35 2014

function object2vrSkin(player,base) {
	var me=this;
	var flag=false;
	var nodeMarker=new Array();
	var activeNodeMarker=new Array();
	this.player=player;
	this.player.skinObj=this;
	this.divSkin=player.divSkin;
	var basePath="";
	// auto detect base path
	if (base=='?') {
		var scripts = document.getElementsByTagName('script');
		for(var i=0;i<scripts.length;i++) {
			var src=scripts[i].src;
			if (src.indexOf('skin.js')>=0) {
				var p=src.lastIndexOf('/');
				if (p>=0) {
					basePath=src.substr(0,p+1);
				}
			}
		}
	} else
	if (base) {
		basePath=base;
	}
	this.elementMouseDown=new Array();
	this.elementMouseOver=new Array();
	var cssPrefix='';
	var domTransition='transition';
	var domTransform='transform';
	var prefixes='Webkit,Moz,O,ms,Ms'.split(',');
	var i;
	for(i=0;i<prefixes.length;i++) {
		if (typeof document.body.style[prefixes[i] + 'Transform'] !== 'undefined') {
			cssPrefix='-' + prefixes[i].toLowerCase() + '-';
			domTransition=prefixes[i] + 'Transition';
			domTransform=prefixes[i] + 'Transform';
		}
	}
	
	this.player.setMargins(0,0,0,0);
	
	this.updateSize=function(startElement) {
		var stack=new Array();
		stack.push(startElement);
		while(stack.length>0) {
			e=stack.pop();
			if (e.ggUpdatePosition) {
				e.ggUpdatePosition();
			}
			if (e.hasChildNodes()) {
				for(i=0;i<e.childNodes.length;i++) {
					stack.push(e.childNodes[i]);
				}
			}
		}
	}
	
	parameterToTransform=function(p) {
		var hs='translate(' + p.rx + 'px,' + p.ry + 'px) rotate(' + p.a + 'deg) scale(' + p.sx + ',' + p.sy + ')';
		return hs;
	}
	
	this.findElements=function(id,regex) {
		var r=new Array();
		var stack=new Array();
		var pat=new RegExp(id,'');
		stack.push(me.divSkin);
		while(stack.length>0) {
			e=stack.pop();
			if (regex) {
				if (pat.test(e.ggId)) r.push(e);
			} else {
				if (e.ggId==id) r.push(e);
			}
			if (e.hasChildNodes()) {
				for(i=0;i<e.childNodes.length;i++) {
					stack.push(e.childNodes[i]);
				}
			}
		}
		return r;
	}
	basePath = '/Uploads/UrunResimleri3D/';
	this.preloadImages=function() {
		var preLoadImg=new Image();
		preLoadImg.src=basePath + 'buton/sol_fotometrik360__o.png';
		preLoadImg.src=basePath + 'buton/sag_fotometrik360__o.png';
		preLoadImg.src=basePath + 'buton/yakinlas_fotometrik360__o.png';
		preLoadImg.src=basePath + 'buton/uzaklas_fotometrik360__o.png';
		preLoadImg.src=basePath + 'buton/dondurdurdur_fotometrik360__o.png';
	}
	
	this.addSkin=function() {
		this._toolbar=document.createElement('div');
		this._toolbar.ggId="toolbar";
		this._toolbar.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._toolbar.ggVisible=true;
		this._toolbar.className='ggskin ggskin_rectangle';
		this._toolbar.ggType='rectangle';
		this._toolbar.ggUpdatePosition=function() {
			this.style[domTransition]='none';
			if (this.parentNode) {
				w=this.parentNode.offsetWidth;
				this.style.left=(-107 + w/2) + 'px';
				h=this.parentNode.offsetHeight;
				this.style.top=(-45 + h) + 'px';
			}
		}
		hs ='position:absolute;';
		hs+='left: -107px;';
		hs+='top:  -45px;';
		hs+='width: 290px;';
		hs+='height: 32px;';
		hs+=cssPrefix + 'transform-origin: 100% 100%;';
		hs+='visibility: inherit;';
		hs+='background: #000000;';
		hs+='background: rgba(0,0,0,0.00392157);';
		hs+='border: 0px solid #000000;';
		this._toolbar.setAttribute('style',hs);
		this._sol_fotometrik360=document.createElement('div');
		this._sol_fotometrik360.ggId="sol_fotometrik360";
		this._sol_fotometrik360.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._sol_fotometrik360.ggVisible=true;
		this._sol_fotometrik360.className='ggskin ggskin_button';
		this._sol_fotometrik360.ggType='button';
		hs ='position:absolute;';
		hs+='left: -4px;';
		hs+='top:  0px;';
		hs+='width: 31px;';
		hs+='height: 31px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		hs+='cursor: pointer;';
		this._sol_fotometrik360.setAttribute('style',hs);
		this._sol_fotometrik360__img=document.createElement('img');
		this._sol_fotometrik360__img.className='ggskin ggskin_button';
		this._sol_fotometrik360__img.setAttribute('src',basePath + 'buton/sol_fotometrik360.png');
		this._sol_fotometrik360__img.setAttribute('style','position: absolute;top: 0px;left: 0px;-webkit-user-drag:none;');
		this._sol_fotometrik360__img.className='ggskin ggskin_button';
		this._sol_fotometrik360__img['ondragstart']=function() { return false; };
		me.player.checkLoaded.push(this._sol_fotometrik360__img);
		this._sol_fotometrik360.appendChild(this._sol_fotometrik360__img);
		this._sol_fotometrik360.onmouseover=function () {
			me._saatyonu.style[domTransition]='none';
			me._saatyonu.style.opacity='1';
			me._saatyonu.style.visibility=me._saatyonu.ggVisible?'inherit':'hidden';
			me._sol_fotometrik360__img.src=basePath + 'buton/sol_fotometrik360__o.png';
		}
		this._sol_fotometrik360.onmouseout=function () {
			if (me.player.transitionsDisabled) {
				me._saatyonu.style[domTransition]='none';
			} else {
				me._saatyonu.style[domTransition]='all 500ms ease-out 0ms';
			}
			me._saatyonu.style.opacity='0';
			me._saatyonu.style.visibility='hidden';
			me._sol_fotometrik360__img.src=basePath + 'buton/sol_fotometrik360.png';
			me.elementMouseDown['sol_fotometrik360']=false;
		}
		this._sol_fotometrik360.onmousedown=function () {
			me.elementMouseDown['sol_fotometrik360']=true;
		}
		this._sol_fotometrik360.onmouseup=function () {
			me.elementMouseDown['sol_fotometrik360']=false;
		}
		this._sol_fotometrik360.ontouchend=function () {
			me.elementMouseDown['sol_fotometrik360']=false;
		}
		this._toolbar.appendChild(this._sol_fotometrik360);
		this._sag_fotometrik360=document.createElement('div');
		this._sag_fotometrik360.ggId="sag_fotometrik360";
		this._sag_fotometrik360.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._sag_fotometrik360.ggVisible=true;
		this._sag_fotometrik360.className='ggskin ggskin_button';
		this._sag_fotometrik360.ggType='button';
		hs ='position:absolute;';
		hs+='left: 34px;';
		hs+='top:  0px;';
		hs+='width: 31px;';
		hs+='height: 31px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		hs+='cursor: pointer;';
		this._sag_fotometrik360.setAttribute('style',hs);
		this._sag_fotometrik360__img=document.createElement('img');
		this._sag_fotometrik360__img.className='ggskin ggskin_button';
		this._sag_fotometrik360__img.setAttribute('src',basePath + 'buton/sag_fotometrik360.png');
		this._sag_fotometrik360__img.setAttribute('style','position: absolute;top: 0px;left: 0px;-webkit-user-drag:none;');
		this._sag_fotometrik360__img.className='ggskin ggskin_button';
		this._sag_fotometrik360__img['ondragstart']=function() { return false; };
		me.player.checkLoaded.push(this._sag_fotometrik360__img);
		this._sag_fotometrik360.appendChild(this._sag_fotometrik360__img);
		this._sag_fotometrik360.onmouseover=function () {
			me._saattersi.style[domTransition]='none';
			me._saattersi.style.opacity='1';
			me._saattersi.style.visibility=me._saattersi.ggVisible?'inherit':'hidden';
			me._sag_fotometrik360__img.src=basePath + 'buton/sag_fotometrik360__o.png';
		}
		this._sag_fotometrik360.onmouseout=function () {
			if (me.player.transitionsDisabled) {
				me._saattersi.style[domTransition]='none';
			} else {
				me._saattersi.style[domTransition]='all 500ms ease-out 0ms';
			}
			me._saattersi.style.opacity='0';
			me._saattersi.style.visibility='hidden';
			me._sag_fotometrik360__img.src=basePath + 'buton/sag_fotometrik360.png';
			me.elementMouseDown['sag_fotometrik360']=false;
		}
		this._sag_fotometrik360.onmousedown=function () {
			me.elementMouseDown['sag_fotometrik360']=true;
		}
		this._sag_fotometrik360.onmouseup=function () {
			me.elementMouseDown['sag_fotometrik360']=false;
		}
		this._sag_fotometrik360.ontouchend=function () {
			me.elementMouseDown['sag_fotometrik360']=false;
		}
		this._toolbar.appendChild(this._sag_fotometrik360);
		this._yakinlas_fotometrik360=document.createElement('div');
		this._yakinlas_fotometrik360.ggId="yakinlas_fotometrik360";
		this._yakinlas_fotometrik360.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._yakinlas_fotometrik360.ggVisible=true;
		this._yakinlas_fotometrik360.className='ggskin ggskin_button';
		this._yakinlas_fotometrik360.ggType='button';
		hs ='position:absolute;';
		hs+='left: 72px;';
		hs+='top:  0px;';
		hs+='width: 31px;';
		hs+='height: 31px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		hs+='cursor: pointer;';
		this._yakinlas_fotometrik360.setAttribute('style',hs);
		this._yakinlas_fotometrik360__img=document.createElement('img');
		this._yakinlas_fotometrik360__img.className='ggskin ggskin_button';
		this._yakinlas_fotometrik360__img.setAttribute('src',basePath + 'buton/yakinlas_fotometrik360.png');
		this._yakinlas_fotometrik360__img.setAttribute('style','position: absolute;top: 0px;left: 0px;-webkit-user-drag:none;');
		this._yakinlas_fotometrik360__img.className='ggskin ggskin_button';
		this._yakinlas_fotometrik360__img['ondragstart']=function() { return false; };
		me.player.checkLoaded.push(this._yakinlas_fotometrik360__img);
		this._yakinlas_fotometrik360.appendChild(this._yakinlas_fotometrik360__img);
		this._yakinlas_fotometrik360.onclick=function () {
			me.player.stopAutorotate();
		}
		this._yakinlas_fotometrik360.onmouseover=function () {
			me._yaklas.style[domTransition]='none';
			me._yaklas.style.opacity='1';
			me._yaklas.style.visibility=me._yaklas.ggVisible?'inherit':'hidden';
			me._yakinlas_fotometrik360__img.src=basePath + 'buton/yakinlas_fotometrik360__o.png';
		}
		this._yakinlas_fotometrik360.onmouseout=function () {
			if (me.player.transitionsDisabled) {
				me._yaklas.style[domTransition]='none';
			} else {
				me._yaklas.style[domTransition]='all 500ms ease-out 0ms';
			}
			me._yaklas.style.opacity='0';
			me._yaklas.style.visibility='hidden';
			me._yakinlas_fotometrik360__img.src=basePath + 'buton/yakinlas_fotometrik360.png';
			me.elementMouseDown['yakinlas_fotometrik360']=false;
		}
		this._yakinlas_fotometrik360.onmousedown=function () {
			me.elementMouseDown['yakinlas_fotometrik360']=true;
		}
		this._yakinlas_fotometrik360.onmouseup=function () {
			me.elementMouseDown['yakinlas_fotometrik360']=false;
		}
		this._yakinlas_fotometrik360.ontouchend=function () {
			me.elementMouseDown['yakinlas_fotometrik360']=false;
		}
		this._toolbar.appendChild(this._yakinlas_fotometrik360);
		this._uzaklas_fotometrik360=document.createElement('div');
		this._uzaklas_fotometrik360.ggId="uzaklas_fotometrik360";
		this._uzaklas_fotometrik360.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._uzaklas_fotometrik360.ggVisible=true;
		this._uzaklas_fotometrik360.className='ggskin ggskin_button';
		this._uzaklas_fotometrik360.ggType='button';
		hs ='position:absolute;';
		hs+='left: 110px;';
		hs+='top:  0px;';
		hs+='width: 31px;';
		hs+='height: 31px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		hs+='cursor: pointer;';
		this._uzaklas_fotometrik360.setAttribute('style',hs);
		this._uzaklas_fotometrik360__img=document.createElement('img');
		this._uzaklas_fotometrik360__img.className='ggskin ggskin_button';
		this._uzaklas_fotometrik360__img.setAttribute('src',basePath + 'buton/uzaklas_fotometrik360.png');
		this._uzaklas_fotometrik360__img.setAttribute('style','position: absolute;top: 0px;left: 0px;-webkit-user-drag:none;');
		this._uzaklas_fotometrik360__img.className='ggskin ggskin_button';
		this._uzaklas_fotometrik360__img['ondragstart']=function() { return false; };
		me.player.checkLoaded.push(this._uzaklas_fotometrik360__img);
		this._uzaklas_fotometrik360.appendChild(this._uzaklas_fotometrik360__img);
		this._uzaklas_fotometrik360.onclick=function () {
			me.player.startAutorotate("");
		}
		this._uzaklas_fotometrik360.onmouseover=function () {
			me._uzaklas.style[domTransition]='none';
			me._uzaklas.style.opacity='1';
			me._uzaklas.style.visibility=me._uzaklas.ggVisible?'inherit':'hidden';
			me._uzaklas_fotometrik360__img.src=basePath + 'buton/uzaklas_fotometrik360__o.png';
		}
		this._uzaklas_fotometrik360.onmouseout=function () {
			if (me.player.transitionsDisabled) {
				me._uzaklas.style[domTransition]='none';
			} else {
				me._uzaklas.style[domTransition]='all 500ms ease-out 0ms';
			}
			me._uzaklas.style.opacity='0';
			me._uzaklas.style.visibility='hidden';
			me._uzaklas_fotometrik360__img.src=basePath + 'buton/uzaklas_fotometrik360.png';
			me.elementMouseDown['uzaklas_fotometrik360']=false;
		}
		this._uzaklas_fotometrik360.onmousedown=function () {
			me.elementMouseDown['uzaklas_fotometrik360']=true;
		}
		this._uzaklas_fotometrik360.onmouseup=function () {
			me.elementMouseDown['uzaklas_fotometrik360']=false;
		}
		this._uzaklas_fotometrik360.ontouchend=function () {
			me.elementMouseDown['uzaklas_fotometrik360']=false;
		}
		this._toolbar.appendChild(this._uzaklas_fotometrik360);
		this._dondurdurdur_fotometrik360=document.createElement('div');
		this._dondurdurdur_fotometrik360.ggId="dondur-durdur_fotometrik360";
		this._dondurdurdur_fotometrik360.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._dondurdurdur_fotometrik360.ggVisible=true;
		this._dondurdurdur_fotometrik360.className='ggskin ggskin_button';
		this._dondurdurdur_fotometrik360.ggType='button';
		hs ='position:absolute;';
		hs+='left: 148px;';
		hs+='top:  0px;';
		hs+='width: 31px;';
		hs+='height: 31px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		hs+='cursor: pointer;';
		this._dondurdurdur_fotometrik360.setAttribute('style',hs);
		this._dondurdurdur_fotometrik360__img=document.createElement('img');
		this._dondurdurdur_fotometrik360__img.className='ggskin ggskin_button';
		this._dondurdurdur_fotometrik360__img.setAttribute('src',basePath + 'buton/dondurdurdur_fotometrik360.png');
		this._dondurdurdur_fotometrik360__img.setAttribute('style','position: absolute;top: 0px;left: 0px;-webkit-user-drag:none;');
		this._dondurdurdur_fotometrik360__img.className='ggskin ggskin_button';
		this._dondurdurdur_fotometrik360__img['ondragstart']=function() { return false; };
		me.player.checkLoaded.push(this._dondurdurdur_fotometrik360__img);
		this._dondurdurdur_fotometrik360.appendChild(this._dondurdurdur_fotometrik360__img);
		this._dondurdurdur_fotometrik360.onclick=function () {
			me.player.toggleAutorotate();
			me.player.changeViewMode(0);
		}
		this._dondurdurdur_fotometrik360.onmouseover=function () {
			me._dondurdurdur.style[domTransition]='none';
			me._dondurdurdur.style.opacity='1';
			me._dondurdurdur.style.visibility=me._dondurdurdur.ggVisible?'inherit':'hidden';
			me._dondurdurdur_fotometrik360__img.src=basePath + 'buton/dondurdurdur_fotometrik360__o.png';
		}
		this._dondurdurdur_fotometrik360.onmouseout=function () {
			if (me.player.transitionsDisabled) {
				me._dondurdurdur.style[domTransition]='none';
			} else {
				me._dondurdurdur.style[domTransition]='all 500ms ease-out 0ms';
			}
			me._dondurdurdur.style.opacity='0';
			me._dondurdurdur.style.visibility='hidden';
			me._dondurdurdur_fotometrik360__img.src=basePath + 'buton/dondurdurdur_fotometrik360.png';
		}
		this._toolbar.appendChild(this._dondurdurdur_fotometrik360);
		this._bilgi_fotometrik360=document.createElement('div');
		this._bilgi_fotometrik360.ggId="bilgi_fotometrik360";
		this._bilgi_fotometrik360.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._bilgi_fotometrik360.ggVisible=true;
		this._bilgi_fotometrik360.className='ggskin ggskin_button';
		this._bilgi_fotometrik360.ggType='button';
		hs ='position:absolute;';
		hs+='left: 186px;';
		hs+='top:  0px;';
		hs+='width: 31px;';
		hs+='height: 31px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		hs+='cursor: pointer;';
		this._bilgi_fotometrik360.setAttribute('style',hs);
		this._bilgi_fotometrik360__img=document.createElement('img');
		this._bilgi_fotometrik360__img.className='ggskin ggskin_button';
		this._bilgi_fotometrik360__img.setAttribute('src',basePath + 'buton/bilgi_fotometrik360.png');
		this._bilgi_fotometrik360__img.setAttribute('style','position: absolute;top: 0px;left: 0px;-webkit-user-drag:none;');
		this._bilgi_fotometrik360__img.className='ggskin ggskin_button';
		this._bilgi_fotometrik360__img['ondragstart']=function() { return false; };
		me.player.checkLoaded.push(this._bilgi_fotometrik360__img);
		this._bilgi_fotometrik360.appendChild(this._bilgi_fotometrik360__img);
		this._bilgi_fotometrik360.onclick=function () {
			me.player.toggleAutorotate();
			me.player.changeViewMode(0);
			flag=(me._infor.style.visibility=='hidden');
			me._infor.style[domTransition]='none';
			me._infor.style.visibility=flag?'inherit':'hidden';
			me._infor.ggVisible=flag;
		}
		this._bilgi_fotometrik360.onmouseover=function () {
			me._info.style[domTransition]='none';
			me._info.style.opacity='1';
			me._info.style.visibility=me._info.ggVisible?'inherit':'hidden';
		}
		this._bilgi_fotometrik360.onmouseout=function () {
			if (me.player.transitionsDisabled) {
				me._info.style[domTransition]='none';
			} else {
				me._info.style[domTransition]='all 500ms ease-out 0ms';
			}
			me._info.style.opacity='0';
			me._info.style.visibility='hidden';
		}
		this._toolbar.appendChild(this._bilgi_fotometrik360);
		this.divSkin.appendChild(this._toolbar);
		/*this._logo=document.createElement('div');
		this._logo.ggId="logo";
		this._logo.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._logo.ggVisible=true;
		this._logo.className='ggskin ggskin_image';
		this._logo.ggType='image';
		this._logo.ggUpdatePosition=function() {
			this.style[domTransition]='none';
			if (this.parentNode) {
				w=this.parentNode.offsetWidth;
				this.style.left=(-124 + w) + 'px';
			}
		}
		hs ='position:absolute;';
		hs+='left: -124px;';
		hs+='top:  5px;';
		hs+='width: 120px;';
		hs+='height: 59px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		hs+='cursor: pointer;';
		this._logo.setAttribute('style',hs);
		this._logo__img=document.createElement('img');
		this._logo__img.className='ggskin ggskin_image';
		this._logo__img.setAttribute('src',basePath + 'buton/logo.png');
		this._logo__img.setAttribute('style','position: absolute;top: 0px;left: 0px;-webkit-user-drag:none;');
		this._logo__img.className='ggskin ggskin_image';
		this._logo__img['ondragstart']=function() { return false; };
		me.player.checkLoaded.push(this._logo__img);
		this._logo.appendChild(this._logo__img);
		this._logo.onclick=function () {
			me.player.openUrl("http:\/\/www.fotometrik360.com","blank");
		}
		this.divSkin.appendChild(this._logo);*/
		this._loading=document.createElement('div');
		this._loading.ggId="loading";
		this._loading.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._loading.ggVisible=true;
		this._loading.className='ggskin ggskin_image';
		this._loading.ggType='image';
		this._loading.ggUpdatePosition=function() {
			this.style[domTransition]='none';
			if (this.parentNode) {
				w=this.parentNode.offsetWidth;
				this.style.left=(-116 + w/2) + 'px';
				h=this.parentNode.offsetHeight;
				this.style.top=(-40 + h/2) + 'px';
			}
		}
		hs ='position:absolute;';
		hs+='left: -116px;';
		hs+='top:  -40px;';
		hs+='width: 232px;';
		hs+='height: 80px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		this._loading.setAttribute('style',hs);
		this._loading__img=document.createElement('img');
		this._loading__img.className='ggskin ggskin_image';
		this._loading__img.setAttribute('src',basePath + 'buton/loading.png');
		this._loading__img.setAttribute('style','position: absolute;top: 0px;left: 0px;-webkit-user-drag:none;');
		this._loading__img.className='ggskin ggskin_image';
		this._loading__img['ondragstart']=function() { return false; };
		me.player.checkLoaded.push(this._loading__img);
		this._loading.appendChild(this._loading__img);
		this._load_text=document.createElement('div');
		this._load_text.ggId="load_text";
		this._load_text.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._load_text.ggVisible=true;
		this._load_text.className='ggskin ggskin_image';
		this._load_text.ggType='image';
		hs ='position:absolute;';
		hs+='left: 0px;';
		hs+='top:  0px;';
		hs+='width: 232px;';
		hs+='height: 80px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		this._load_text.setAttribute('style',hs);
		this._load_text__img=document.createElement('img');
		this._load_text__img.className='ggskin ggskin_image';
		this._load_text__img.setAttribute('src',basePath + 'buton/load_text.png');
		this._load_text__img.setAttribute('style','position: absolute;top: 0px;left: 0px;-webkit-user-drag:none;');
		this._load_text__img.className='ggskin ggskin_image';
		this._load_text__img['ondragstart']=function() { return false; };
		me.player.checkLoaded.push(this._load_text__img);
		this._load_text.appendChild(this._load_text__img);
		this._load_text.onclick=function () {
			me.player.openUrl("http:\/\/www.fotometrik360.com\/","blank");
		}
		this._loading.appendChild(this._load_text);
		this._loading_text=document.createElement('div');
		this._loading_text__text=document.createElement('div');
		this._loading_text.className='ggskin ggskin_textdiv';
		this._loading_text.ggTextDiv=this._loading_text__text;
		this._loading_text.ggId="loading text";
		this._loading_text.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._loading_text.ggVisible=true;
		this._loading_text.className='ggskin ggskin_text';
		this._loading_text.ggType='text';
		hs ='position:absolute;';
		hs+='left: 135px;';
		hs+='top:  19px;';
		hs+='width: 43px;';
		hs+='height: 18px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		this._loading_text.setAttribute('style',hs);
		hs ='position:absolute;';
		hs+='left: 0px;';
		hs+='top:  0px;';
		hs+='width: 43px;';
		hs+='height: 18px;';
		hs+='border: 0px solid #000000;';
		hs+='color: #000000;';
		hs+='text-align: center;';
		hs+='white-space: nowrap;';
		hs+='padding: 0px 1px 0px 1px;';
		hs+='overflow: hidden;';
		this._loading_text__text.setAttribute('style',hs);
		this._loading_text.ggUpdateText=function() {
			var hs="<b>"+(me.player.getPercentLoaded()*100.0).toFixed(0)+"%<\/b>";
			if (hs!=this.ggText) {
				this.ggText=hs;
				this.ggTextDiv.innerHTML=hs;
			}
		}
		this._loading_text.ggUpdateText();
		this._loading_text.appendChild(this._loading_text__text);
		this._loading.appendChild(this._loading_text);
		this._image_74=document.createElement('div');
		this._image_74.ggId="Image 74";
		this._image_74.ggParameter={ rx:0,ry:0,a:0,sx:0.75,sy:0.75 };
		this._image_74.ggVisible=true;
		this._image_74.className='ggskin ggskin_image';
		this._image_74.ggType='image';
		hs ='position:absolute;';
		hs+='left: 172px;';
		hs+='top:  17px;';
		hs+='width: 23px;';
		hs+='height: 23px;';
		hs+=cssPrefix + 'transform-origin: 100% 50%;';
		hs+=cssPrefix + 'transform: ' + parameterToTransform(this._image_74.ggParameter) + ';';
		hs+='visibility: inherit;';
		hs+='cursor: pointer;';
		this._image_74.setAttribute('style',hs);
		this._image_74__img=document.createElement('img');
		this._image_74__img.className='ggskin ggskin_image';
		this._image_74__img.setAttribute('src',basePath + 'buton/image_74.png');
		this._image_74__img.setAttribute('style','position: absolute;top: 0px;left: 0px;-webkit-user-drag:none;');
		this._image_74__img.className='ggskin ggskin_image';
		this._image_74__img['ondragstart']=function() { return false; };
		me.player.checkLoaded.push(this._image_74__img);
		this._image_74.appendChild(this._image_74__img);
		this._image_74.onclick=function () {
			me._loading.style[domTransition]='none';
			me._loading.style.visibility='hidden';
			me._loading.ggVisible=false;
		}
		this._loading.appendChild(this._image_74);
		this.divSkin.appendChild(this._loading);
		this._saatyonu=document.createElement('div');
		this._saatyonu__text=document.createElement('div');
		this._saatyonu.className='ggskin ggskin_textdiv';
		this._saatyonu.ggTextDiv=this._saatyonu__text;
		this._saatyonu.ggId="saat-yonu";
		this._saatyonu.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._saatyonu.ggVisible=true;
		this._saatyonu.className='ggskin ggskin_text';
		this._saatyonu.ggType='text';
		this._saatyonu.ggUpdatePosition=function() {
			this.style[domTransition]='none';
			this.style.width=this.ggTextDiv.offsetWidth + 'px';
			this.style.height=this.ggTextDiv.offsetHeight + 'px';
			if (this.parentNode) {
				w=this.parentNode.offsetWidth;
				this.style.left=(-145 + w/2) + 'px';
				h=this.parentNode.offsetHeight;
				this.style.top=(-73 + h) + 'px';
			}
		}
		hs ='position:absolute;';
		hs+='left: -145px;';
		hs+='top:  -73px;';
		hs+='width: 292px;';
		hs+='height: 26px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='opacity: 0;';
		hs+='visibility: hidden;';
		this._saatyonu.setAttribute('style',hs);
		hs ='position:absolute;';
		hs+='left: 0px;';
		hs+='top:  0px;';
		hs+='width: 292px;';
		hs+='height: 26px;';
		hs+='border: 0px solid #000000;';
		hs+='color: #000000;';
		hs+='text-align: center;';
		hs+='white-space: nowrap;';
		hs+='padding: 0px 1px 0px 1px;';
		hs+='overflow: hidden;';
		this._saatyonu__text.setAttribute('style',hs);
		this._saatyonu__text.innerHTML="Saat y\xf6n\xfcnde d\xf6nd\xfcr";
		this._saatyonu.appendChild(this._saatyonu__text);
		this.divSkin.appendChild(this._saatyonu);
		this._saattersi=document.createElement('div');
		this._saattersi__text=document.createElement('div');
		this._saattersi.className='ggskin ggskin_textdiv';
		this._saattersi.ggTextDiv=this._saattersi__text;
		this._saattersi.ggId="saat-tersi";
		this._saattersi.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._saattersi.ggVisible=true;
		this._saattersi.className='ggskin ggskin_text';
		this._saattersi.ggType='text';
		this._saattersi.ggUpdatePosition=function() {
			this.style[domTransition]='none';
			this.style.width=this.ggTextDiv.offsetWidth + 'px';
			this.style.height=this.ggTextDiv.offsetHeight + 'px';
			if (this.parentNode) {
				w=this.parentNode.offsetWidth;
				this.style.left=(-145 + w/2) + 'px';
				h=this.parentNode.offsetHeight;
				this.style.top=(-73 + h) + 'px';
			}
		}
		hs ='position:absolute;';
		hs+='left: -145px;';
		hs+='top:  -73px;';
		hs+='width: 292px;';
		hs+='height: 25px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='opacity: 0;';
		hs+='visibility: hidden;';
		this._saattersi.setAttribute('style',hs);
		hs ='position:absolute;';
		hs+='left: 0px;';
		hs+='top:  0px;';
		hs+='width: 292px;';
		hs+='height: 25px;';
		hs+='border: 0px solid #000000;';
		hs+='color: #000000;';
		hs+='text-align: center;';
		hs+='white-space: nowrap;';
		hs+='padding: 0px 1px 0px 1px;';
		hs+='overflow: hidden;';
		this._saattersi__text.setAttribute('style',hs);
		this._saattersi__text.innerHTML="Saat tersi y\xf6n\xfcnde d\xf6nd\xfcr";
		this._saattersi.appendChild(this._saattersi__text);
		this.divSkin.appendChild(this._saattersi);
		this._yaklas=document.createElement('div');
		this._yaklas__text=document.createElement('div');
		this._yaklas.className='ggskin ggskin_textdiv';
		this._yaklas.ggTextDiv=this._yaklas__text;
		this._yaklas.ggId="yaklas";
		this._yaklas.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._yaklas.ggVisible=true;
		this._yaklas.className='ggskin ggskin_text';
		this._yaklas.ggType='text';
		this._yaklas.ggUpdatePosition=function() {
			this.style[domTransition]='none';
			this.style.width=this.ggTextDiv.offsetWidth + 'px';
			this.style.height=this.ggTextDiv.offsetHeight + 'px';
			if (this.parentNode) {
				w=this.parentNode.offsetWidth;
				this.style.left=(-145 + w/2) + 'px';
				h=this.parentNode.offsetHeight;
				this.style.top=(-73 + h) + 'px';
			}
		}
		hs ='position:absolute;';
		hs+='left: -145px;';
		hs+='top:  -73px;';
		hs+='width: 292px;';
		hs+='height: 25px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='opacity: 0;';
		hs+='visibility: hidden;';
		this._yaklas.setAttribute('style',hs);
		hs ='position:absolute;';
		hs+='left: 0px;';
		hs+='top:  0px;';
		hs+='width: 292px;';
		hs+='height: 25px;';
		hs+='border: 0px solid #000000;';
		hs+='color: #000000;';
		hs+='text-align: center;';
		hs+='white-space: nowrap;';
		hs+='padding: 0px 1px 0px 1px;';
		hs+='overflow: hidden;';
		this._yaklas__text.setAttribute('style',hs);
		this._yaklas__text.innerHTML="Yak\u0131nla\u015f";
		this._yaklas.appendChild(this._yaklas__text);
		this.divSkin.appendChild(this._yaklas);
		this._uzaklas=document.createElement('div');
		this._uzaklas__text=document.createElement('div');
		this._uzaklas.className='ggskin ggskin_textdiv';
		this._uzaklas.ggTextDiv=this._uzaklas__text;
		this._uzaklas.ggId="uzaklas";
		this._uzaklas.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._uzaklas.ggVisible=true;
		this._uzaklas.className='ggskin ggskin_text';
		this._uzaklas.ggType='text';
		this._uzaklas.ggUpdatePosition=function() {
			this.style[domTransition]='none';
			this.style.width=this.ggTextDiv.offsetWidth + 'px';
			this.style.height=this.ggTextDiv.offsetHeight + 'px';
			if (this.parentNode) {
				w=this.parentNode.offsetWidth;
				this.style.left=(-145 + w/2) + 'px';
				h=this.parentNode.offsetHeight;
				this.style.top=(-73 + h) + 'px';
			}
		}
		hs ='position:absolute;';
		hs+='left: -145px;';
		hs+='top:  -73px;';
		hs+='width: 292px;';
		hs+='height: 24px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='opacity: 0;';
		hs+='visibility: hidden;';
		this._uzaklas.setAttribute('style',hs);
		hs ='position:absolute;';
		hs+='left: 0px;';
		hs+='top:  0px;';
		hs+='width: 292px;';
		hs+='height: 24px;';
		hs+='border: 0px solid #000000;';
		hs+='color: #000000;';
		hs+='text-align: center;';
		hs+='white-space: nowrap;';
		hs+='padding: 0px 1px 0px 1px;';
		hs+='overflow: hidden;';
		this._uzaklas__text.setAttribute('style',hs);
		this._uzaklas__text.innerHTML="Uzakla\u015f";
		this._uzaklas.appendChild(this._uzaklas__text);
		this.divSkin.appendChild(this._uzaklas);
		this._dondurdurdur=document.createElement('div');
		this._dondurdurdur__text=document.createElement('div');
		this._dondurdurdur.className='ggskin ggskin_textdiv';
		this._dondurdurdur.ggTextDiv=this._dondurdurdur__text;
		this._dondurdurdur.ggId="dondur-durdur";
		this._dondurdurdur.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._dondurdurdur.ggVisible=true;
		this._dondurdurdur.className='ggskin ggskin_text';
		this._dondurdurdur.ggType='text';
		this._dondurdurdur.ggUpdatePosition=function() {
			this.style[domTransition]='none';
			this.style.width=this.ggTextDiv.offsetWidth + 'px';
			this.style.height=this.ggTextDiv.offsetHeight + 'px';
			if (this.parentNode) {
				w=this.parentNode.offsetWidth;
				this.style.left=(-145 + w/2) + 'px';
				h=this.parentNode.offsetHeight;
				this.style.top=(-73 + h) + 'px';
			}
		}
		hs ='position:absolute;';
		hs+='left: -145px;';
		hs+='top:  -73px;';
		hs+='width: 292px;';
		hs+='height: 25px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='opacity: 0;';
		hs+='visibility: hidden;';
		this._dondurdurdur.setAttribute('style',hs);
		hs ='position:absolute;';
		hs+='left: 0px;';
		hs+='top:  0px;';
		hs+='width: 292px;';
		hs+='height: 25px;';
		hs+='border: 0px solid #000000;';
		hs+='color: #000000;';
		hs+='text-align: center;';
		hs+='white-space: nowrap;';
		hs+='padding: 0px 1px 0px 1px;';
		hs+='overflow: hidden;';
		this._dondurdurdur__text.setAttribute('style',hs);
		this._dondurdurdur__text.innerHTML="D\xf6nd\xfcr \/ Durdur";
		this._dondurdurdur.appendChild(this._dondurdurdur__text);
		this.divSkin.appendChild(this._dondurdurdur);
		this._info=document.createElement('div');
		this._info__text=document.createElement('div');
		this._info.className='ggskin ggskin_textdiv';
		this._info.ggTextDiv=this._info__text;
		this._info.ggId="info";
		this._info.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._info.ggVisible=true;
		this._info.className='ggskin ggskin_text';
		this._info.ggType='text';
		this._info.ggUpdatePosition=function() {
			this.style[domTransition]='none';
			this.style.width=this.ggTextDiv.offsetWidth + 'px';
			this.style.height=this.ggTextDiv.offsetHeight + 'px';
			if (this.parentNode) {
				w=this.parentNode.offsetWidth;
				this.style.left=(-145 + w/2) + 'px';
				h=this.parentNode.offsetHeight;
				this.style.top=(-73 + h) + 'px';
			}
		}
		hs ='position:absolute;';
		hs+='left: -145px;';
		hs+='top:  -73px;';
		hs+='width: 292px;';
		hs+='height: 25px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='opacity: 0;';
		hs+='visibility: hidden;';
		this._info.setAttribute('style',hs);
		hs ='position:absolute;';
		hs+='left: 0px;';
		hs+='top:  0px;';
		hs+='width: 292px;';
		hs+='height: 25px;';
		hs+='border: 0px solid #000000;';
		hs+='color: #000000;';
		hs+='text-align: center;';
		hs+='white-space: nowrap;';
		hs+='padding: 0px 1px 0px 1px;';
		hs+='overflow: hidden;';
		this._info__text.setAttribute('style',hs);
		this._info__text.innerHTML="Kullan\u0131m hakk\u0131nda bilgi";
		this._info.appendChild(this._info__text);
		this.divSkin.appendChild(this._info);
		this._infor=document.createElement('div');
		this._infor.ggId="infor";
		this._infor.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._infor.ggVisible=false;
		this._infor.className='ggskin ggskin_image';
		this._infor.ggType='image';
		this._infor.ggUpdatePosition=function() {
			this.style[domTransition]='none';
			if (this.parentNode) {
				w=this.parentNode.offsetWidth;
				this.style.left=(-150 + w/2) + 'px';
			}
		}
		hs ='position:absolute;';
		hs+='left: -150px;';
		hs+='top:  70px;';
		hs+='width: 300px;';
		hs+='height: 127px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: hidden;';
		this._infor.setAttribute('style',hs);
		this._infor__img=document.createElement('img');
		this._infor__img.className='ggskin ggskin_image';
		this._infor__img.setAttribute('src',basePath + 'buton/infor.jpg');
		this._infor__img.setAttribute('style','position: absolute;top: 0px;left: 0px;-webkit-user-drag:none;');
		this._infor__img.className='ggskin ggskin_image';
		this._infor__img['ondragstart']=function() { return false; };
		me.player.checkLoaded.push(this._infor__img);
		this._infor.appendChild(this._infor__img);
		this._infor.onclick=function () {
			me._infor.style[domTransition]='none';
			me._infor.style.visibility='hidden';
			me._infor.ggVisible=false;
		}
		this.divSkin.appendChild(this._infor);
		this.preloadImages();
		this.divSkin.ggUpdateSize=function(w,h) {
			me.updateSize(me.divSkin);
		}
		this.divSkin.ggViewerInit=function() {
		}
		this.divSkin.ggLoaded=function() {
			me._loading.style[domTransition]='none';
			me._loading.style.visibility='hidden';
			me._loading.ggVisible=false;
			me._loading_text.style[domTransition]='none';
			me._loading_text.style.visibility='hidden';
			me._loading_text.ggVisible=false;
		}
		this.divSkin.ggReLoaded=function() {
			me._loading_text.style[domTransition]='none';
			me._loading_text.style.visibility='inherit';
			me._loading_text.ggVisible=true;
		}
		this.divSkin.ggLoadedLevels=function() {
		}
		this.divSkin.ggReLoadedLevels=function() {
		}
		this.divSkin.ggEnterFullscreen=function() {
		}
		this.divSkin.ggExitFullscreen=function() {
		}
		this.skinTimerEvent();
	};
	this.hotspotProxyClick=function(id) {
	}
	this.hotspotProxyOver=function(id) {
	}
	this.hotspotProxyOut=function(id) {
	}
	this.changeActiveNode=function(id) {
		var newMarker=new Array();
		var i,j;
		var tags=me.player.userdata.tags;
		for (i=0;i<nodeMarker.length;i++) {
			var match=false;
			if ((nodeMarker[i].ggMarkerNodeId==id) && (id!='')) match=true;
			for(j=0;j<tags.length;j++) {
				if (nodeMarker[i].ggMarkerNodeId==tags[j]) match=true;
			}
			if (match) {
				newMarker.push(nodeMarker[i]);
			}
		}
		for(i=0;i<activeNodeMarker.length;i++) {
			if (newMarker.indexOf(activeNodeMarker[i])<0) {
				if (activeNodeMarker[i].ggMarkerNormal) {
					activeNodeMarker[i].ggMarkerNormal.style.visibility='inherit';
				}
				if (activeNodeMarker[i].ggMarkerActive) {
					activeNodeMarker[i].ggMarkerActive.style.visibility='hidden';
				}
				if (activeNodeMarker[i].ggDeactivate) {
					activeNodeMarker[i].ggDeactivate();
				}
			}
		}
		for(i=0;i<newMarker.length;i++) {
			if (activeNodeMarker.indexOf(newMarker[i])<0) {
				if (newMarker[i].ggMarkerNormal) {
					newMarker[i].ggMarkerNormal.style.visibility='hidden';
				}
				if (newMarker[i].ggMarkerActive) {
					newMarker[i].ggMarkerActive.style.visibility='inherit';
				}
				if (newMarker[i].ggActivate) {
					newMarker[i].ggActivate();
				}
			}
		}
		activeNodeMarker=newMarker;
	}
	this.skinTimerEvent=function() {
		setTimeout(function() { me.skinTimerEvent(); }, 10);
		if (me.elementMouseDown['sol_fotometrik360']) {
			me.player.changePanLog(0.1,true);
		}
		if (me.elementMouseDown['sag_fotometrik360']) {
			me.player.changePanLog(-0.1,true);
		}
		if (me.elementMouseDown['yakinlas_fotometrik360']) {
			me.player.changeFovLog(-1,true);
		}
		if (me.elementMouseDown['uzaklas_fotometrik360']) {
			me.player.changeFovLog(11,true);
		}
		this._loading_text.ggUpdateText();
	};
	this.addSkin();
};