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
<script type="text/javascript">
(function() {
	$('.sub_forum').css('display', 'block');
	$('.subforumshow').on('click', function() {
	var obj = $(this);
	var subobj = $(obj.attr('href'));
	if(subobj.css('display') == 'none') {
	subobj.css('display', 'block');
	obj.find('img').attr('src', 'images/collapsed_yes.png');
	} else {
	subobj.css('display', 'none');
	obj.find('img').attr('src', 'images/collapsed_no.png');
	}
	});
	 })();

</script>
<%@ include file="/public/mobile/inc/mobiletop.jsp"%>


<div id="sb-site" class="sb_site bg"  >
<!-- main forumlist start -->
<div class="wp wm " id="wp">
<div class=" bmw fl">
<div class="subforumshow bm_h cl" href="#sub_forum_318">
<span class="o"><img src="images/collapsed_yes.png"></span>
<h2><a href="javascript:;">交易</a></h2>
</div>
<div id="sub_forum_318" class="sub_foruml bm_c">
<ul>
<li>
<div class="subipc"><a href=""><img src="images/common_266_icon.png" align="left" alt="" /></a></div>
<a href="forum.php?mod=forumdisplay&amp;fid=534&amp;mobile=2" >
<div class="subblock">
<h3>A5中介<span class="num">63</span></h3>
<p>a5 在线担保交易频道新上线&nbsp; &nbsp;买卖双方 快速 在线即可 自助交易。</p>

</div>

</a></li>
</ul>
</div>
</div>
<div class=" bmw fl">
<div class="subforumshow bm_h cl" href="#sub_forum_616">
<span class="o"><img src="images/collapsed_yes.png"></span>
<h2><a href="javascript:;">电商</a></h2>
</div>
<div id="sub_forum_616" class="sub_foruml bm_c">
<ul>
<li>
<div class="subipc"><a href=""><img src="images/common_266_icon.png" align="left" alt="" /></a></div>
<a href="forum.php?mod=forumdisplay&amp;fid=176&amp;mobile=2" >
<div class="subblock">
<h3>广告位买卖<span class="num">6514</span></h3>
<p>专业的网络广告交易平台，提供网站广告位买卖、出售、求购服务</p>

</div>

</a></li>
</ul>
</div>
</div>
<div class=" bmw fl">
<div class="subforumshow bm_h cl" href="#sub_forum_447">
<span class="o"><img src="images/collapsed_yes.png"></span>
<h2><a href="javascript:;">任务与源码</a></h2>
</div>
<div id="sub_forum_447" class="sub_foruml bm_c">
<ul>
<li>
<div class="subipc"><a href=""><img src="images/common_266_icon.png" align="left" alt="" /></a></div>
<a href="forum.php?mod=forumdisplay&amp;fid=446&amp;mobile=2" >
<div class="subblock">
<h3>任务大厅</h3>
<p>建站、美工、维护、</p>
</div>
</a>
</li>
</ul>
</div>
</div>
</div>
<%@ include file="/public/mobile/inc/mobilefoot.jsp"%>
</div>
</body>
</html>

