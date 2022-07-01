$(function (){
	$(".edui-upload-video").each(function(i,v){
		var width=$(this).attr("width");
		var height=$(this).attr("height");
		var src=$(this).attr("src");
		var divid="videodiv"+i;
		$(this).before('<div id="'+divid+'" ></div>');
		ckpaly(src,width,height,divid);
		$(this).remove();
	});
});

function ckpaly(url,hight,width,divid){
	var flashvars={
			f:url,
			c:0,
			b:1
			};
	CKobject.embed(javaeepath+'/public/ckplayer/ckplayer/ckplayer.swf',divid,'ckplayer_a1',hight,width,false,flashvars,null);	
}

function test(){
	ckpaly('http://127.0.0.1/bbs/public/ckplayer/1.mp4','600','400','a1');
}