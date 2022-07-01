<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>注册-${applicationScope.bbsinfo.name}</title>
<meta name="keywords" content="注册" /> 
<meta name="description" content="注册" />  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="${path}/public/mobile/css/style.css" type="text/css" media="all">
<script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
 <script type="text/javascript">
 document.onkeydown=function(e){
	 var keycode=document.all?event.keyCode:e.which;
	 if(keycode==13)
		 submitzhuc();
};
 function isusername(){
	 var flag=false;
	 var name=$.trim($("#name").val());
	 $("#name").val(name);
	 if(name.length<6){
		 alert("用户长度不能小于6位");
		 return flag;
	 }
	 var param={};
	 param.loginname=name;
	 $.ajax({
		   type: "POST",
		   url: "${path}/zhuc/isusername.do",
		   data: param,
		   dataType:"json",
		   async: false,
		   success: function(data){
			   if(data==0){
				   alert("用户名重复");
					flag=false;
			   }else{
					flag=true;
			   }
		   }
	 });
	 return flag;
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
 
 function isqpwd(){
	 var pwd=$.trim($("#pwd").val());
	 var qpwd=$.trim($("#qpwd").val());
	 if(pwd!=qpwd){
		 alert("两次密码不一致");
		 return false;
	 }else{
		 return true;
	 }
 }
 
 function submitzhuc(){
	 if(isusername()&&ispwd()&&isqpwd()&&isyanzhengma()){
		 var param={};
		 param.loginname=$.trim($("#name").val());
		 param.pwd=$.trim($("#qpwd").val());
		 param.email=$.trim($("#email").val());
		 param.yanzhengma=$.trim($("#yanzhengma").val());
		 $.ajax({
			   type: "POST",
			   url: "${path}/zhuc/add.do",
			   data: param,
			   dataType:"json",
			   async: false,
			   success: function(data){
				   var flag=data.flag;
				   var msg=data.msg;
				   if(flag=="1"){
					   alert(msg);
					   window.location.href='${path}/login/index.do';
				   }else{
					   alert(msg);
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
<span>注册</span>
    </div>
</header>
<div class="loginbox ">
<form id="loginform" method="post" id="form" action="${path}/zhuc/add.do">
<div class="login_from">
<ul>
<li><input type="text" class="px p_fre" size="30" name="loginname" id="name" placeholder="用户名" ></li>
<li><input type="password" class="px p_fre" size="30"  name="password" id="pwd" placeholder="密码"  ></li>
<li><input type="password" class="px p_fre" size="30"  name="pwd" id="qpwd" placeholder="确认密码" ></li>
<li><input type="password" class="px p_fre" size="30"  name="pwd" id="qpwd" placeholder="邮箱" ></li>
<li><input type="text" class="px p_fre" size="6"  name="yanzhengma" id="yanzhengma" placeholder="验证码" >
 <img src="${path}/yanzhengma/index.do" alt="验证码" height="30px;" id="yanzhengmaimg" onclick="updateyanzhengma();"/>
</li>
</ul>
</div>
<div class="btn_login"><button class="formdialog pn pnc" type="button" onclick="submitzhuc();"><span>立即注册</span></button></div>
</form>
</div>
<%@ include file="/WEB-INF/inc/mobilefoot.jsp"%>
</div>
</body>
</html>

