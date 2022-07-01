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
       <a href="" class="z"><img src="images/icon_back.png" /></a>
   <span>我的主题</span>
   </div>
</header>
<div class="threadlist">
<ul>
<li>
<a href="" target="_blank" >
电影网出租横幅广告位置，全站</a>
<span class="num">31</span>
</li>
<li>
<a href="" target="_blank" >
电影网出租广告 每月100元</a>
<span class="num">0</span>
</li>
</ul>
<div class="page">
<a href="javascript:;" class="grey">上一页</a>
<a href="">下一页</a>
</div>
</div>
<%@ include file="/public/mobile/inc/mobilefoot.jsp"%>
</div>
</body>
</html>

