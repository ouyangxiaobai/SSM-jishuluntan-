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
<form method="post" id="postform" action="">
<header class="header">
    <div class="nav">
<span class="y"></span>
<input type="hidden" name="topicsubmit" value="yes">
<a href="" class="z"><img src="images/icon_back.png" /></a>
<span>发帖</span>
    </div>
</header>

<div class="wp">
<div class="post_from">
<ul class="cl">
<li class="bl_line">
<input type="text" tabindex="1" class="px" id="needsubject" size="30" autocomplete="off" value="" name="subject" placeholder="标题" fwin="login">
</li>
<li class="bl_line">
<select id="typeid" name="typeid" class="sort_sel">
<option value="0" selected="selected">选择主题分类</option>
<option value="12">出售</option>
<option value="337">求购</option>
</select>
</li>
<li class="bl_none area">
<textarea class="pt" id="needmessage" tabindex="3"  id="e_textarea" name="message" cols="80" rows="2"  placeholder="内容" ></textarea>
</li>
</ul>
<button id="postsubmit" style="width:96%;display:block;margin:auto;" class="btn_pn btn_pn_grey" ><span>发表</span></button>
<ul id="imglist" class="post_imglist cl bl_line">
</ul>
</div>
</div>
</form>
<%@ include file="/public/mobile/inc/mobilefoot.jsp"%>
</div>
</body>
</html>

