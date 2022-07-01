<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>${map.tiezi.name}-${applicationScope.bbsinfo.name}</title>
<meta name="keywords" content="${map.tiezi.name}" /> 
<meta name="description" content="${map.tiezi.contenttxt}" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="${path}/public/mobile/css/style.css" type="text/css" media="all">
<script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<body class="bg" id="wrap">
<%@ include file="/WEB-INF/inc/mobiletop.jsp"%>
<div id="sb-site" class="sb_site bg">
<div  class="g_mbx cl">
<div class="z">
<a href="${path}/">首页</a>
     <em>&rsaquo;</em> 
     <a href="${path}/${map.tiezi.fbankuaiid}.html">${map.tiezi.fbankuainame}</a> 
     <em>&rsaquo;</em> 
     <a href="${path}/${map.tiezi.zyuming}/">${map.tiezi.zbankuainame}</a> 
</div>
</div>
<div class="postlist">
<h2>
[${map.tiezi.zhutiname}]${map.tiezi.name}
<span class="s_tshow">查看:${map.tiezi.findcount}&nbsp;&nbsp;回复:${map.tiezi.huifucount}</span>
</h2>
<div id="ajaxlist">
   <div class="plc cl">
   <span class="avatar"><img src="${path}/file/${map.tiezi.userimg}" style="width:32px;height:32px;" /></span>
       <div class="display pi">
   <ul class="authi">
<li class="grey">
<em>
楼主
</em><b>
<a href="${path}/member/${map.tiezi.userid}_1.html" class="blue"> ${map.tiezi.loginname}</a></b>
</li>
<li class="grey rela">
${map.tiezi.createtime}
</li>
</ul>
<div class="message">
${map.tiezi.lastupdate}
${map.tiezi.contenthtml}
</div>
<div style="float: right;margin-top: 10px;margin-right: 10px;margin-bottom: 10px;">
<c:if test="${not empty last}">
<p>上一篇：<a href="${path}/post/${last.id}_1_1.html" style="color:#3399CC">${last.name}</a></p>
</c:if>
<c:if test="${not empty next}">
<p>下一篇：<a href="${path}/post/${next.id}_1_1.html" style="color:#3399CC">${next.name}</a></p>
</c:if>
</div>
</div>
</div>

<c:if test="${!empty huifumap.list}">
 <c:forEach items="${huifumap.list}" var="huifumap">
   <div class="plc cl" <c:if test="${ huifumap.isdel eq '0'}"> onclick="huifushoworhide('${huifumap.id}');" </c:if> >
   <span class="avatar"><img src="${path}/file/${huifumap.userimg}" style="width:32px;height:32px;" /></span>
       <div class="display pi">
   <ul class="authi">
<li class="grey">
<em>
${huifumap.orderby}楼
</em><b>
<a href="${path}/member/${huifumap.userid}_1.html" class="blue">${huifumap.loginname}</a></b>
</li>
<li class="grey rela">
${huifumap.createtime}
</li>
            </ul>
<div class="message">
<c:if test="${not empty  huifumap.huifuid and huifumap.isdel eq '0'}">
	<div class="quote">
	             <blockquote>
	             <font size="2"><font color="#999999">${huifumap.ploginname} 发表于 ${huifumap.pcreatetime}</font>
	             <font style="float:right;">${huifumap.porderby}楼 </font>
	<br>${huifumap.pcontenthtml}</blockquote>
	</div>
</c:if>
${huifumap.contenthtml}
</div>
<div  class="replybtn" id="replybtn${huifumap.id}"  style="display:none;position:absolute;right:0px;top:5px;">
<input type="button" class="redirect button" value="回复" onclick="huifubutton('${map.tiezi.id}','${huifumap.id}')" >
</div>
</div>
   </div>
   </c:forEach>
</c:if>
</div>
<div class="plc cl">

 <c:if test="${sessionScope.indexuser!=null}">
	<span class="avatar"><img style="height:32px;width:32px;" src="${path}/file/${sessionScope.indexuser.img}" /></span>
 </c:if>
 <c:if test="${sessionScope.indexuser==null}">
	<span class="avatar"><img style="height:32px;width:32px;" src="${path}/file/touxiang.jpg" /></span>
 </c:if>
<div class="pi">
<ul class="fastpost">
 <c:if test="${sessionScope.indexuser!=null}">
	<li><input type="text" value="我也说一句" class="input grey" color="gray" name="message" id="fastpostmessage"></li>
	<li id="fastpostsubmitline" style="display:none;"><input type="button" value="回复" class="button2" name="replysubmit" id="fastpostsubmit"><a href="" class="y" style="height:30px;width:30px;margin-top:7px;background:url(static/image/mobile/images/icon_photo.png) no-repeat"><span class="none">回复</span></a></li>
 </c:if>
 <c:if test="${sessionScope.indexuser==null}">
	<li><input type="text" value="我也说一句" class="input grey"  onclick="alert('请登录后操作');"></li>
 </c:if>
</ul>
</div>
</div>
<c:if test="${!empty huifumap.list}">
     <div class="page"> 
     <span>当前第${huifumap.pagestart}页/总${huifumap.totalPages}页</span>
        <c:if test="${huifumap.pagestart!=1}">
        <a href="${path}/post/${map.tiezi.id}_1_${orderby}.html" >首页</a>
        <a href="${path}/post/${map.tiezi.id}_${huifumap.pagestart-1}_${orderby}.html" >上一页</a>
        </c:if>
         <c:if test="${huifumap.pagestart!=huifumap.totalPages}">
          <a href="${path}/post/${map.tiezi.id}_${huifumap.pagestart+1}_${orderby}.html" >下一页</a>
        <a href="${path}/post/${map.tiezi.id}_${huifumap.totalPages}_${orderby}.html" >末页</a>
         </c:if>
      </div>
</c:if>



<script type="text/javascript">
$(function() {
	$('#fastpostmessage').on('focus', function() {
		var obj = $(this);
		if(obj.attr('color') == 'gray') {
			obj.attr('value', '');
			obj.removeClass('grey');
			obj.attr('color', 'black');
			$('#fastpostsubmitline').css('display', 'block');
		}
	}).on('blur', function() {
		var obj = $(this);
		if(obj.attr('value') == '') {
			obj.addClass('grey');
			obj.attr('value', '我也说一句');
			obj.attr('color', 'gray');
		}
	});
	
$('#fastpostsubmit').on('click', function() {
	var msgobj = $('#fastpostmessage');
	if(msgobj.val() == '我也说一句') {
		msgobj.attr('value', '');
	}
	var msg=msgobj.val();
	if($.trim(msg)==""){
		alert("回复内容不能为空");
		return;
	}
	var param={};
	 param.editorhtml=msg;
	 param.editortxt=msg;
	 param.id=${map.tiezi.id};
	 $.ajax({
		   type: "POST",
		   url: "${path}/tz/addhuifu.do",
		   data: param,
		   dataType: "json", 
		   async: false,
		   success: function(data){
			   if(data==1){
				   window.location.href="${path}/post/${map.tiezi.id}_1_1.html";					   
			   }else if(data==0){
				   alert("该板块不允许发表回复");
			   }else{
				   alert("系统错误");
			   }
		   }
	 });
});

});

function huifushoworhide(id){
	$(".replybtn").each(function(){
		$(this).hide();
	});
	$('#replybtn'+id).show();
}

function huifubutton(id,huifuid){
   window.location.href='${path}/tz/toaddhuifu.do?id='+ id+'&huifuid='+huifuid;					   
}
</script>
</div>
<%@ include file="/WEB-INF/inc/mobilefoot.jsp"%>
</div>
</body>
</html>

