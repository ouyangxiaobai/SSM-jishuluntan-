<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>${applicationScope.bbsinfo.indextitle}-${applicationScope.bbsinfo.name} </title>
<meta name="keywords" content="${applicationScope.bbsinfo.keywords}" />
<meta name="description" content="${applicationScope.bbsinfo.description}" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="${path}/public/mobile/css/style.css" type="text/css" media="all">
<script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script> 
<body class="bg" id="wrap">
<script type="text/javascript">
function showorhide(id){
	if($("#divz_"+id).is(':visible')){
		$("#img_"+id).attr("src","${path}/public/mobile/images/collapsed_no.png");
	}else{
		$("#img_"+id).attr("src","${path}/public/mobile/images/collapsed_yes.png");
	}
	$("#divz_"+id).slideToggle();
}
</script>
<%@ include file="/WEB-INF/inc/mobiletop.jsp"%>
<div id="sb-site" class="sb_site bg">
<div class="wp wm" >
 <c:forEach items="${bankuailist}" var="pbankuai">
    <c:if test="${pbankuai.parentId==0}">
		<div class=" bmw fl">
		<div class="subforumshow bm_h cl" onclick="showorhide('${pbankuai.id}')">
		<span class="o" ><img src="${path}/public/mobile/images/collapsed_yes.png" id="img_${pbankuai.id}"></span>
		<h2><a href="javascript:;"  >${pbankuai.name}</a></h2>
		</div>
		<div id="divz_${pbankuai.id}" class="sub_foruml bm_c">
		<ul>
		 <c:forEach items="${bankuailist}" var="zbankuai">
		         <c:if test="${zbankuai.parentId==pbankuai.id}">
					<li>
					<div class="subipc"><a href="${path}/${zbankuai.yuming}/"><img src="${path}/file/${zbankuai.img}" align="left" alt="${zbankuai.name}" /></a></div>
					<a href="${path}/${zbankuai.yuming}/" >
					<div class="subblock">
					<h3>${zbankuai.name}<span class="num">${zbankuai.zhuticount}</span></h3>
					<p>${zbankuai.descs}</p>
					</div>
					</a></li>
		 		</c:if>
		 </c:forEach>
		</ul>
		</div>
		</div>
	</c:if>
</c:forEach> 
</div>
<%@ include file="/WEB-INF/inc/mobilefoot.jsp"%>
</div>
</body>
</html>

