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
<div  class="g_mbx cl">
<div class="z">
<a href="">首页</a> <em>&rsaquo;</em> 
<a href="">交易</a><em>&rsaquo;</em> 
<a href="">网站交易</a></div>
</div>
<div class="forumlistnve postbutton">
<a href="" class="post" title="发帖">发帖</a>
<a href="#" id="fenleiid"  class="qt"></a>
</div>
<script>
$(document).ready(function(){
   	$("#fenleiid").click(function(){
  		$("#fenlei").fadeToggle("slow");
  		$("#subnamelist").hide();
  	});
});
</script>
<script>
$(document).ready(function(){
$(".top_navs li").click(function(){
dis = $(this).find(".tnav_menu").css("display");
if(dis == 'none') {
$(".tnav_menu").hide();
$(this).find(".tnav_menu").show();
}else{
$(this).find(".tnav_menu").hide();
}
  });
}); 

</script>
<div class="forumthreadtypes" id="fenlei" style="display:none;">
<ul id="thread_types" class="threads_types">
<li id="ttp_all" ><a href="">全部</a></li>
<li class="xw1 a"><a href="">网站交易</a></li>
</ul>

</div>

<div class="top_navs">
<ul>

<li><a href="javascript:vote(0);">类型</a><i class="iconfont"></i>
<div class="tnav_menu" style="display:none;">
<ul>
<li><a href="" class="xi2">不限</a></li>
<li><a href="" class="xi2">行业门户</a></li>
<li><a href="" class="xi2">音乐影视</a></li>
<li><a href="" class="xi2">游戏小说</a></li>
<li><a href="" class="xi2">女性时尚</a></li>
<li><a href="" class="xi2">QQ/娱乐</a></li>
<li><a href="" class="xi2">商城购物</a></li>
<li><a href="" class="xi2">地方网站</a></li>
<li><a href="" class="xi2">其他网站</a></li>
</ul>
</div>
</li>

<li><a href="javascript:vote(0);">流量</a><i class="iconfont"></i>
<div class="tnav_menu" style="display:none;">
<ul>
<li><a href="" class="xi2">不限</a></li>
<li><a href="" class="xi2">≦ 100 IP</a></li>
<li><a href="" class="xi2">≦1000 IP</a></li>
<li><a href="" class="xi2">≦5000  IP</a></li>
<li><a href="" class="xi2">＞5000 IP</a></li>

</ul>
</div>
</li>

<li><a href="javascript:vote(0);">PR值</a><i class="iconfont"></i>
<div class="tnav_menu" style="display:none;">
<ul>
<li><a href="" class="xi2">不限</a></li>
<li><a href="" class="xi2">≦1</a></li>
<li><a href="" class="xi2">2</a></li>
<li><a href="" class="xi2">3</a></li>
<li><a href="" class="xi2">4</a></li>
<li><a href="" class="xi2">5</a></li>
<li><a href="" class="xi2">≧ 6</a></li>
</ul>
</div>
</li>
<li><a href="javascript:vote(0);">价格</a><i class="iconfont"></i>
<div class="tnav_menu" style="display:none;">
<ul>
<li><a href="" class="xi2">不限</a></li>
<li><a href="" class="xi2">≦100 元</a></li>
<li><a href="" class="xi2">≦ 1000元</a></li>
<li><a href="" class="xi2">≦ 5000元</a></li>
<li><a href="" class="xi2">> 5000元</a></li>
</ul>
</div>
</li>
</ul>
</div>
</div>
<!-- main threadlist start -->
<div class="threadlist ">
<ul>
<li>
<a href=""  >
<img src="images/icon_top.png">
A5官方长期代购代售高质量稳定网站，方便快捷<span class="by">流星&nbsp;&nbsp;2017-4-24 15:33</span>
</a>
</li>
<li>
<a href=""  >
百度权重1地方网站<span class="by">tang888&nbsp;&nbsp;2017-7-18 16:14</span>
</a>
</li>
</ul>
</div>

<div class="ajaxload">
<a href="javascript:;" >
<div class="more">
<span class="gomore" style="font-size: 1em;">点击查看更多</span>
</div>
</a>
</div>
<%@ include file="/public/mobile/inc/mobilefoot.jsp"%>
</div>
</body>
</html>

