// JavaScript Document
//瀵艰埅鍥哄畾
	var FixedBox=function(el){
		this.element=el;
		this.BoxY=getXY(this.element).y;
	}
	FixedBox.prototype={
		setCss:function(){
			var windowST=(document.compatMode && document.compatMode!="CSS1Compat")? document.body.scrollTop:document.documentElement.scrollTop||window.pageYOffset;
			if(windowST>this.BoxY){
				this.element.style.cssText=" position:fixed; top:0px; width:100%; z-index:150; left:0px; padding-bottom:0px;  margin-top:0; padding:0; background:rgba(0,0,0,0.7); ";
			}else{
				this.element.style.cssText="";
			}
		}
	};
	//娣诲姞浜嬩欢
	function addEvent(elm, evType, fn, useCapture) {
		if (elm.addEventListener) {
			elm.addEventListener(evType, fn, useCapture);
		return true;
		}else if (elm.attachEvent) {
			var r = elm.attachEvent('on' + evType, fn);
			return r;
		}
		else {
			elm['on' + evType] = fn;
		}
	}
	//鑾峰彇鍏冪礌鐨刋Y鍧愭爣锛�
	function getXY(el) {
        return document.documentElement.getBoundingClientRect && (function() {//鍙栧厓绱犲潗鏍囷紝濡傚厓绱犳垨鍏朵笂灞傚厓绱犺缃畃osition relative
            var pos = el.getBoundingClientRect();
            return { x: pos.left + document.documentElement.scrollLeft, y: pos.top + document.documentElement.scrollTop };
        })() || (function() {
            var _x = 0, _y = 0;
            do {
                _x += el.offsetLeft;
                _y += el.offsetTop;
            } while (el = el.offsetParent);
            return { x: _x, y: _y };
        })();
    }
	//瀹炰緥鍖栵紱
	var divA=new FixedBox(document.getElementById("nexheader"));
   	addEvent(window,"scroll",function(){
		divA.setCss();
	});
	