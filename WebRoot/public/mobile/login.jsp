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



<!-- header start -->
<header class="header">
    <div class="nav">
        <a href="javascript:;" onclick="history.go(-1)" class="z"><img src="images/icon_back.png" /></a>
<span>登录</span>
    </div>
</header>
<div class="loginbox ">
<form id="loginform" method="post" action="" onsubmit="" >
<div class="login_from">
<ul>
<li><input type="text" value="" tabindex="1" class="px p_fre" size="30" autocomplete="off" value="" name="username" placeholder="请输入用户名" fwin="login"></li>
<li><input type="password" tabindex="2" class="px p_fre" size="30" value="" name="password" placeholder="密码" fwin="login"></li>
</ul>
</div>
<div class="btn_login"><button tabindex="3" value="true" name="submit" type="submit" class="formdialog pn pnc"><span>登录</span></button></div>
</form>
</div>
<!-- userinfo end -->

<%@ include file="/public/mobile/inc/mobilefoot.jsp"%>
</div>
</body>
</html>

