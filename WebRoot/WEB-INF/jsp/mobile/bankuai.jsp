<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>${bankuai.name}-${applicationScope.bbsinfo.name} </title> 
<meta name="keywords" content="${bankuai.name}" /> 
<meta name="description" content="${bankuai.descs}" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="${path}/public/mobile/css/style.css" type="text/css" media="all">
<script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<body class="bg" id="wrap">
<%@ include file="/WEB-INF/inc/mobiletop.jsp"%>
<div id="sb-site" class="sb_site bg">
<div  class="g_mbx cl">
<div class="z">
	<a href="${path}/" class="nvhm" title="首页">首页</a> 
    <em>&rsaquo;</em> 
    <a href="${path}/${bankuai.fid}.html">${bankuai.fname}</a>
    <em>&rsaquo;</em> 
    <a href="${path}/${bankuai.yuming}/">${bankuai.name}</a>
</div>
</div>
<div class="forumlistnve postbutton">
<a href="${path}/tz/toft.do?id=${bankuai.id}" class="post" title="发帖">发帖</a>
<span class="o" onclick="showorhide();"><img src="${path}/public/mobile/images/collapsed_no.png" style="padding-top: 10px;width: 31px;height: 32px;" id="img_1"></span></div>
<script>
function showorhide(){
	if($("#forumthreadtypes").is(':visible')){
		$("#img_1").attr("src","${path}/public/mobile/images/collapsed_no.png");
	}else{
		$("#img_1").attr("src","${path}/public/mobile/images/collapsed_yes.png");
	}
	$("#forumthreadtypes").slideToggle();
}
</script>
<div class="forumthreadtypes" id="forumthreadtypes" style="display: none;">
<ul class="threads_types">
<li <c:if test="${zhutiid==0}">class="xw1 a"</c:if> ><a href="${path}/${bankuai.yuming}/1_0_${orderby}.html">全部</a></li>
 <c:forEach items="${zhutilist}" var="zhuti">
<li <c:if test="${zhutiid==zhuti.id}">class="xw1 a"</c:if>><a href="${path}/${bankuai.yuming}/1_${zhuti.id}_${orderby}.html">${zhuti.name}</a></li>
</c:forEach>
</ul>
</div>

<div class="top_navs">
<ul>
<li><a href="${path}/${bankuai.yuming}/1_${zhutiid}_0.html">最新</a><i class="iconfont"></i></li>
<li><a href="${path}/${bankuai.yuming}/1_${zhutiid}_1.html">最后回复</a><i class="iconfont"></i></li>
<li><a href="${path}/${bankuai.yuming}/1_${zhutiid}_2.html">精华</a><i class="iconfont"></i></li>
<li><a href="${path}/${bankuai.yuming}/1_${zhutiid}_3.html">热门</a><i class="iconfont"></i></li>
</ul>
</div>
</div>
<div class="threadlist ">
<ul>
<c:forEach items="${zhidinglist}" var="zhiding">
<li>
<a href="${path}/post/${zhiding.id}_1_1.html"  >
<img src="${path}/public/mobile/images/icon_top.png">
[${zhiding.zhutiname}]${zhiding.name}<span class="by">${zhiding.tieziusername}&nbsp;&nbsp;${zhiding.createtime}</span>
</a>
</li>
</c:forEach>
<c:forEach items="${page.list}" var="tiezi">
<li>
<a href="${path}/post/${tiezi.id}_1_1.html"  >
[${tiezi.zhutiname}]${tiezi.name}<span class="by">${tiezi.tieziusername}&nbsp;&nbsp;${tiezi.createtime}</span>
</a>
</li>
</c:forEach>
</ul>
<div class="page">
<span>当前第${page.pagestart}页/总${page.totalPages}页</span>
        <c:if test="${page.pagestart!=1}">
        <a href="${path}/${bankuai.yuming}/1_${zhutiid}_${orderby}.html" >首页</a>
        <a href="${path}/${bankuai.yuming}/${page.pagestart-1}_${zhutiid}_${orderby}.html" >上一页</a>
        </c:if>
         <c:if test="${page.pagestart!=page.totalPages}">
         <a href="${path}/${bankuai.yuming}/${page.pagestart+1}_${zhutiid}_${orderby}.html" >下一页</a>
        <a href="${path}/${bankuai.yuming}/${page.totalPages}_${zhutiid}_${orderby}.html" >末页</a>
         </c:if>
</div>
<%@ include file="/WEB-INF/inc/mobilefoot.jsp"%>
</div>
</body>
</html>

