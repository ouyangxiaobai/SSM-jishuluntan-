<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>发帖-${applicationScope.bbsinfo.name}</title>
<meta name="keywords" content="发帖" /> 
<meta name="description" content="发帖" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="${path}/public/mobile/css/style.css" type="text/css" media="all">
<script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
function geteditorhtml(){
	 var zhutiid=$("#zhutiid").val();
	 if(zhutiid=="0"){
		 alert("请选择主题");
		 $("#zhutiid").focus();
		 return;
	 }
	 var name=$.trim($("#tzname").val());
	 if(name==""){
		 alert("请输入标题");
		 $("#tzname").focus();
		 return;
	 }
	 var editorhtml=$.trim($("#editorhtml").val());
	 if(editorhtml==""){
		 alert("请输入内容");
		 return;
	 }
	 $("#editortxt").val(editorhtml);
	 $("#form").submit();
}

</script>
</head>
<body class="bg" id="wrap">
<%@ include file="/WEB-INF/inc/mobiletop.jsp"%>

<div id="sb-site" class="sb_site bg">
<form method="post" id="form" action="${path}/tz/add.do"> 
<header class="header">
    <div class="nav">
<span class="y"></span>
<input type="hidden" name="topicsubmit" value="yes">
<a href="javascript:;" onclick="history.go(-1);"  class="z"><img src="${path}/public/mobile/images/icon_back.png" /></a>
<span>发帖</span>
    </div>
</header>

<div class="wp">
<div class="post_from">
<ul class="cl">
<li class="bl_line">
<select id="zhutiid" name="zhutiid" class="sort_sel">
<option value="0" selected="selected">选择主题分类</option>
<c:forEach items="${zhutilist}" var="zhuti">
	<option value="${zhuti.id}">${zhuti.name}</option>
</c:forEach>
</select>
</li>
<li class="bl_line">
<input type="text"  class="px" id="tzname" maxlength="80" size="30"  name="name" placeholder="标题" >
</li>
<li class="bl_none area">
<textarea class="pt"  id="editorhtml" name="contenthtml" cols="80" rows="2"  placeholder="内容" ></textarea>
<input type="hidden" name="editortxt" id="contenttxt" >
 <input type="hidden" name="bankuaiId" value="${bankuaiId}"/>
</li>
</ul>
<button  type="button" style="width:96%;display:block;margin:auto;" class="btn_pn btn_pn_grey" onclick="geteditorhtml();"><span>发表</span></button>
<ul id="imglist" class="post_imglist cl bl_line">
</ul>
</div>
</div>
</form>
<%@ include file="/WEB-INF/inc/mobilefoot.jsp"%>
</div>
</body>
</html>

