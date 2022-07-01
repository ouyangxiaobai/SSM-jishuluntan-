var clickX;  
var clickY;  
//获取事件  
function getEvent() {  
    if (document.all) {  
        return window.event;// 如果是ie  
    }  
    func = getEvent.caller;  
    while (func != null) {  
        var arg0 = func.arguments[0];  
        if (arg0) {  
            if ((arg0.constructor == Event || arg0.constructor == MouseEvent)  
                    || (typeof(arg0) == "object" && arg0.preventDefault && arg0.stopPropagation)) {  
                return arg0;  
            }  
        }  
        func = func.caller;  
    }  
    return null;  
}  
//在此函数中给clickX和clickY赋值  
function getClickPosition(){  
    var evt=getEvent();  
    if(null!=evt){  
        var el=evt.target||evt.srcElement;  
        var top=0;  
        var left=0;  
        while(el){//递归求元素所在页面的位置  
            top+=el.offsetTop;//el.offsetTop的值是el元素的上起始位置相对于父元素的上起始位置的差值，所以需要递归相加  
            left+=el.offsetLeft;  
            el=el.offsetParent;  
        }  
        clickX=left;  
        clickY=top;  
    }else{  
        }  
}

function tzczshoworhide(id){
	getClickPosition();
    $("#"+id).css("left",clickX);	
    $("#"+id).css("top",clickY+15);
	$("#"+id).slideToggle('fast');	
}

//设置精华
function szjh(tieziid,jh){
	var param={};
	 param.id=tieziid;
	 param.jinghua=jh;
	 $.ajax({
		   type: "POST",
		   url: javaeepath+"/moderator/common/shezhijinghua.do",
		   data: param,
		   dataType: "json", 
		   async: false,
		   success: function(data){
			   window.location.reload();
		   }
	 });
}
//取消精华
function qxszjh(tieziid){
	var param={};
	 param.id=tieziid;
	 $.ajax({
		   type: "POST",
		   url: javaeepath+"/moderator/common/qxshezhijinghua.do",
		   data: param,
		   dataType: "json", 
		   async: false,
		   success: function(data){
			   window.location.reload();
		   }
	 });
}


//全局置顶
function qjzd(tieziid){
	var param={};
	 param.id=tieziid;
	 $.ajax({
		   type: "POST",
		   url: javaeepath+"/admin/common/updateallzhiding.do",
		   data: param,
		   dataType: "json", 
		   async: false,
		   success: function(data){
			   window.location.reload();
		   }
	 });
}
//取消置顶
function qxqjzd(tieziid){
	var param={};
	 param.id=tieziid;
	 $.ajax({
		   type: "POST",
		   url: javaeepath+"/admin/common/updateallqxzhiding.do",
		   data: param,
		   dataType: "json", 
		   async: false,
		   success: function(data){
			   window.location.reload();
		   }
	 });
}

function bkzd(tieziid){
	var param={};
	 param.id=tieziid;
	 $.ajax({
		   type: "POST",
		   url: javaeepath+"/moderator/common/updatebankuaizhiding.do",
		   data: param,
		   dataType: "json", 
		   async: false,
		   success: function(data){
			   window.location.reload();
		   }
	 });
}
function qxbkzd(tieziid){
	var param={};
	 param.id=tieziid;
	 $.ajax({
		   type: "POST",
		   url: javaeepath+"/moderator/common/updatebankuaiqxzhiding.do",
		   data: param,
		   dataType: "json", 
		   async: false,
		   success: function(data){
			   window.location.reload();
		   }
	 });
}


function delhuifu(huifuid){
	if(confirm("确认删除此回复吗?")){
		var param={};
		 param.id=huifuid;
		 $.ajax({
			   type: "POST",
			   url: javaeepath+"/moderator/common/delhuifu.do",
			   data: param,
			   dataType: "json", 
			   success: function(data){
				   window.location.reload();
			   }
		 });
	}
}

function updatetiezi(tieziid){
	window.location.href=javaeepath+'/tz/toupdate.do?tieziid='+tieziid;
}