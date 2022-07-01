<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>登录-${applicationScope.bbsinfo.name}</title>
<meta name="keywords" content="登录" /> 
<meta name="description" content="登录" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="${path}/public/mobile/css/style.css" type="text/css" media="all">
<script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
 <script type="text/javascript">
 
 document.onkeydown=function(e){
	 var keycode=document.all?event.keyCode:e.which;
	 if(keycode==13)submitlogin();
};
 
 function isusername(){
	 var name=$.trim($("#name").val());
	 $("#name").val(name);
	 if(name==""){
		 alert("用户不能为空");
		 return false;
	 }else{
		 return true;
	 }
 }
 function ispwd(){
	 var pwd=$.trim($("#pwd").val());
	 $("#pwd").val(pwd);
	 if(pwd.length<6){
		 alert("密码长度不能小于6位");
		 return false;
	 }else{
		 return true;
	 }
 }
 
 function isyanzhengma(){
	 var flag=false;
	 var yanzhengma=$.trim($("#yanzhengma").val());
	 $("#yanzhengma").val(yanzhengma);
	 if(yanzhengma.length<1){
		 alert("验证码不能为空");
		 return flag;
	 }
	 var param={};
	 param.yanzhengma=yanzhengma;
	 $.ajax({
		   type: "POST",
		   url: "${path}/yanzhengma/isyanzhengma.do",
		   data: param,
		   dataType:"json",
		   async: false,
		   success: function(data){
			   if(data=="0"){
				   alert("验证码错误");
					flag=false;
			   }else{
					flag=true;
			   }
		   }
	 });
	 return flag;
 }
 
 function submitlogin(){
	 if(isusername()&&ispwd()&&isyanzhengma()){
		 var name=$.trim($("#name").val());
		 var pwd=$.trim($("#pwd").val());
		 var yanzhengma=$.trim($("#yanzhengma").val());
		 var param={};
		 param.loginname=name;
		 param.pwd=pwd;
		 param.yanzhengma=yanzhengma;
		 param.isremember=$("#isremember").is(':checked');
		 param.pathlocation='${pathlocation}';
		 $.ajax({
			   type: "POST",
			   url: "${path}/login/login.do",
			   data: param,
			   dataType: "json", 
			   async: false,
			   success: function(data){
				   var flag=data.flag;
				   var pathlocation=data.pathlocation;
				   if(flag==99){
					   alert("用户名错误");
				   }else if(flag==88){
					   alert("密码错误");
				   }else if(flag==77){
					   alert("验证码错误");
				   }else if(flag==0){
					   alert("用户名限制登录");
				   }else if(flag==1){
					   window.location.href=pathlocation;					   
				   }else{
					   alert("系统错误");
				   }
			   }
		 });
	 }
 }
 
 function updateyanzhengma(){
     document.getElementById('yanzhengmaimg').src= '${path}/yanzhengma/index.do?t='+new Date().getTime();
	 
 }
 </script>
</head>
<body class="bg">
<%@ include file="/WEB-INF/inc/mobiletop.jsp"%>
<div id="sb-site" class="sb_site bg">
<header class="header">
    <div class="nav">
        <a href="javascript:;" onclick="history.go(-1)" class="z"><img src="${path}/public/mobile/images/icon_back.png" /></a>
<span>登录</span>
    </div>
</header>
<div class="loginbox ">
<form id="loginform" method="post" id="form" >
<div class="login_from">
<ul>
<li><input type="text" class="px p_fre" size="30" name="name" id="name" placeholder="请输入用户名" ></li>
<li><input type="password" class="px p_fre" size="30"  name="password" placeholder="密码"  id="pwd"></li>
<li><input type="text" class="px p_fre" size="6" name="yanzhengma" id="yanzhengma" placeholder="验证码" >
 <img src="${path}/yanzhengma/index.do" alt="验证码" height="30px;" id="yanzhengmaimg" onclick="updateyanzhengma();" />
</li>
<li><input type="checkbox" name="isremember" id="isremember" />记住我的登录状态</li>
</ul>
</div>
<div class="btn_login"><button class="formdialog pn pnc" type="button" onclick="submitlogin();"><span>登录</span></button></div>
</form>
</div>
<%@ include file="/WEB-INF/inc/mobilefoot.jsp"%>
</div>
</body>
</html>

