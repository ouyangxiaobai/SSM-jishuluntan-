<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>${applicationScope.bbsinfo.indextitle}-${applicationScope.bbsinfo.name} </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<meta name="keywords" content="${applicationScope.bbsinfo.keywords}" />
<meta name="description" content="${applicationScope.bbsinfo.description}" />
<link rel="stylesheet" href="${path}/public/mobile/css/style.css" type="text/css" media="all">
<script src="${path}/public/mobile/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<body class="bg" id="wrap">
<%@ include file="/public/mobile/inc/mobiletop.jsp"%>
<div id="sb-site" class="sb_site bg" name="sb-site" class="bg">
<header class="header">
    <div class="nav">
<a href="javascript:;" onclick="history.go(-1);" class="z"><img src="images/icon_back.png" /></a>
<span>我的资料</span>
    </div>
</header>
<div class="userinfo">
<div class="user_avatar">
<div class="avatar_m"><span><img src="http://www.a5.net/uc_server/avatar.php?uid=880658&size=small" /></span></div>
<h2 class="name">ejufang</h2>
</div>
<div class="user_box">
<ul>
<li><span>352</span>积分</li><li><span>352 </span>A5积分</li>
<li><span>1 笔</span>交易</li>
<li><span>5000 元</span>交易额</li>
</ul>
</div>
<div class="btn_exit"><a href="">退出登录</a></div>
</div>

<%@ include file="/public/mobile/inc/mobilefoot.jsp"%>
</div>
</body>
</html>

