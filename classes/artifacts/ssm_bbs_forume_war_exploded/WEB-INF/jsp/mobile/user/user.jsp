<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>个人资料-${applicationScope.bbsinfo.name}</title>
<meta name="keywords" content="个人资料" /> 
<meta name="description" content="个人资料" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="${path}/public/mobile/css/style.css" type="text/css" media="all">
<script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<body class="bg" id="wrap">
<%@ include file="/WEB-INF/inc/mobiletop.jsp"%>
<div id="sb-site" class="sb_site bg">
<div class="userinfo">
<div class="user_avatar">
<div class="avatar_m"><span><img src="<%=request.getContextPath()%>/file/${sessionScope.indexuser.img}" /></span></div>
<h2 class="name">${sessionScope.indexuser.loginname}</h2>
</div>
<div class="myinfo_list cl">
<ul>
<li><a href="${path}/user/ziliao.do">我的资料</a></li>
<li><a href="${path}/tz/index.do">我的帖子</a></li>
<li><a href="${path}/user/message/index.do">我的消息</a></li>
<li><a href="${path}/user/jifen/index.do">我的积分</a></li>
</ul>
</div>
</div>
<%@ include file="/WEB-INF/inc/mobilefoot.jsp"%>
</div>
</body>
</html>

