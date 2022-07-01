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
<a href="" class="nvhm" title="首页">首页</a> <em>&rsaquo;</em> 
<a href="">电商</a> <em>&rsaquo;</em> 
<a href="">广告位买卖</a></div>
</div>
<!-- main postlist start -->
<div class="postlist">
<h2>
[出售]精准获客 高转化 全国投放
<span class="s_tshow">查看:338&nbsp;&nbsp;回复:169</span>
</h2>
<div id="ajaxlist">
   <div class="plc cl" id="pid140191259">
   <span class="avatar"><img src="http://www.a5.net/uc_server/avatar.php?uid=981413&size=small" style="width:32px;height:32px;" /></span>
       <div class="display pi" href="#replybtn_140191259">
   <ul class="authi">
<li class="grey">
<em>
楼主
</em><b>
<a href="" class="blue">tou200</a></b>
</li>
<li class="grey rela">
2017-7-17 16:18
</li>
</ul>
<div class="message">
<i class="pstatus"> 本帖最后由 tou200 于 2017-7-17 16:24 编辑 </i><br />
帖子内容
</div>
</div>
</div>
   <div class="plc cl" id="pid140191417">
   <span class="avatar"><img src="http://www.a5.net/uc_server/avatar.php?uid=111328&size=small" style="width:32px;height:32px;" /></span>
       <div class="display pi" href="#replybtn_140191417">
   <ul class="authi">
<li class="grey">
<em>
2楼
</em><b>
<a href="" class="blue">wshkwps940</a></b>
</li>
<li class="grey rela">
2017-7-17 16:46
</li>
            </ul>
<div class="message">
回复内容
</div>
<div id="replybtn_140191417" class="replybtn" display="true" style="display:none;position:absolute;right:0px;top:5px;">
<input type="button" class="redirect button" href="" value="回复">
</div>
</div>
   </div>
<div class="plc cl" id="pid140191523">
   <span class="avatar"><img src="http://www.a5.net/uc_server/avatar.php?uid=125799&size=small" style="width:32px;height:32px;" /></span>
       <div class="display pi" href="#replybtn_140191523">
   <ul class="authi">
<li class="grey">
<em>
3楼
</em><b>
<a href="home.php?mod=space&amp;uid=125799&amp;mobile=2" class="blue">小朋</a></b>
</li>
<li class="grey rela">
2017-7-17 16:59
</li>
            </ul>
<div class="message">
  <div class="grey quote">此帖仅作者可见</div>
</div>
<div id="replybtn_140191523" class="replybtn" display="true" style="display:none;position:absolute;right:0px;top:5px;">
<input type="button" class="redirect button" href="forum.php?mod=post&amp;action=reply&amp;fid=176&amp;tid=25961284&amp;repquote=140191523&amp;extra=page%3D1&amp;page=1&amp;mobile=2" value="回复">
</div>
       </div>
</div>
</div>

<div class="plc cl">
<form method="post" autocomplete="off" id="fastpostform" action="forum.php?mod=post&amp;action=reply&amp;fid=176&amp;tid=25961284&amp;extra=page%3D1&amp;replysubmit=yes&amp;mobile=2">
<span class="avatar">
<img style="height:32px;width:32px;" src="http://www.a5.net/uc_server/avatar.php?uid=880658&size=small" /></span>
<div class="pi">
<ul class="fastpost">
<li><input type="text" value="我也说一句" class="input grey" color="gray" name="message" id="fastpostmessage"></li>
<li id="fastpostsubmitline" style="display:none;"><input type="button" value="回复" class="button2" name="replysubmit" id="fastpostsubmit"><a href="" class="y" style="height:30px;width:30px;margin-top:7px;background:url(static/image/mobile/images/icon_photo.png) no-repeat"><span class="none">回复</span></a></li>
</ul>
</div>
    </form>
</div>
<script type="text/javascript">
(function() {
var form = $('#fastpostform');
$('#fastpostmessage').on('focus', function() {
var obj = $(this);
if(obj.attr('color') == 'gray') {
obj.attr('value', '');
obj.removeClass('grey');
obj.attr('color', 'black');
$('#fastpostsubmitline').css('display', 'block');
}
})
.on('blur', function() {
var obj = $(this);
if(obj.attr('value') == '') {
obj.addClass('grey');
obj.attr('value', '我也说一句');
obj.attr('color', 'gray');
}
});
$('#fastpostsubmit').on('click', function() {
var msgobj = $('#fastpostmessage');
if(msgobj.val() == '我也说一句') {
msgobj.attr('value', '');
}
$.ajax({
type:'POST',
url:form.attr('action') + '&handlekey=fastpost&loc=1&inajax=1',
data:form.serialize(),
dataType:'xml'
})
.success(function(s) {
evalscript(s.lastChild.firstChild.nodeValue);
})
.error(function() {
window.location.href = obj.attr('href');
popup.close();
});
return false;
});

$('#replyid').on('click', function() {
$(document).scrollTop($(document).height());
$('#fastpostmessage')[0].focus();
});

})();

function succeedhandle_fastpost(locationhref, message, param) {
var pid = param['pid'];
var tid = param['tid'];
if(pid) {
$.ajax({
type:'POST',
url:'forum.php?mod=viewthread&tid=' + tid + '&viewpid=' + pid + '&mobile=2',
dataType:'xml'
})
.success(function(s) {
$('#post_new').append(s.lastChild.firstChild.nodeValue);
})
.error(function() {
window.location.href = 'forum.php?mod=viewthread&tid=' + tid;
popup.close();
});
} else {
if(!message) {
message = '本版回帖需要审核，您的帖子将在通过审核后显示';
}
popup.open(message, 'alert');
}
$('#fastpostmessage').attr('value', '');
if(param['sechash']) {
$('.seccodeimg').click();
}
}

function errorhandle_fastpost(message, param) {
popup.open(message, 'alert');
}
</script>
</div>
<%@ include file="/public/mobile/inc/mobilefoot.jsp"%>
</div>


</body>
</html>

