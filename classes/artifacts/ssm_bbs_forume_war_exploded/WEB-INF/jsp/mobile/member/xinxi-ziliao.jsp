<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>${user.loginname}的个人资料--${applicationScope.bbsinfo.name}</title>
<meta name="keywords" content="${user.loginname}的个人资料" /> 
<meta name="description" content="${user.loginname}的个人资料" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="${path}/public/mobile/css/style.css" type="text/css" media="all">
<script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<body class="bg" id="wrap">
<%@ include file="/WEB-INF/inc/mobiletop.jsp"%>
<div id="sb-site" class="sb_site bg">
<header class="header">
    <div class="nav">
<a href="javascript:;" onclick="history.go(-1);" class="z"><img src="${path}/public/mobile/images/icon_back.png" /></a>
<span>${user.loginname}的资料</span>
    </div>
</header>
<div class="userinfo">
<div class="user_avatar">
<div class="avatar_m"><span><img src="<%=request.getContextPath()%>/file/${user.img}" /></span></div>
<h2 class="name">${user.loginname}</h2>
</div>
<div class="user_box">
<ul>
<li><span>${user.name}</span>真实姓名</li>
<li><span>
<c:if test="${user.sex==0}">保密</c:if> 
<c:if test="${user.sex==1}">男</c:if> 
<c:if test="${user.sex==2}">女</c:if> 
</span>性别</li>
<li><span>${user.birthday}</span>生日</li>
<li><span>${user.email}</span>邮箱</li>
</ul>
</div>
</div>
<%@ include file="/WEB-INF/inc/mobilefoot.jsp"%>
</div>
</body>
</html>

