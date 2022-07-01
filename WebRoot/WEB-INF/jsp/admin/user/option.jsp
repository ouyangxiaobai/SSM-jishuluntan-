<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
    <title>网站信息</title>  
    <link rel="stylesheet" href="${path }/admin/css/pintuer.css"/>
    <link rel="stylesheet" href="${path }/admin/css/admin.css"/>
    <script src="${path }/public/js/jquery-1.8.2.min.js"></script>
    <script src="${path }/admin/js/pintuer.js"></script>  
    <script type="text/javascript">
    function updateflag(id,flag){
		var param = {};
		param.id=id;
		param.flag=flag;
		$.ajax({
			type : "post",
			url :'${path}/admin/user/updateflag.do',
			data : param,
			dataType : 'json',
			success : function(datas) {
				if(datas==1){
					window.location.reload();
				}else{
					alert("删除失败");
				}
			}
		});
}
    
    function updategroup(id,groupid){
		var param = {};
		param.id=id;
		param.groupid=groupid;
		$.ajax({
			type : "post",
			url :'${path}/admin/user/updategroup.do',
			data : param,
			dataType : 'json',
			success : function(datas) {
				if(datas==1){
					window.location.reload();
				}else{
					alert("删除失败");
				}
			}
		});
}
    function updatepwd(id){
    	if(confirm("您确定要重置密码吗?")){
    		var param = {};
    		param.id=id;
    		$.ajax({
    			type : "post",
    			url :'${path}/admin/user/updatepwd.do',
    			data : param,
    			dataType : 'json',
    			success : function(datas) {
    				if(datas==1){
    					alert("重置密码成功,新密码为123456!");
    					window.location.reload();
    				}else{
    					alert("删除失败");
    				}
    			}
    		});
    	}
    }
    

    function del(id){
    	if(confirm("您确定要删除吗?")){
    		var param = {};
    		param.id=id;
    		$.ajax({
    			type : "post",
    			url :'${path}/admin/user/del.do',
    			data : param,
    			dataType : 'json',
    			success : function(datas) {
    				if(datas==1){
    					alert("删除成功");
    					window.location.href='${path}/admin/user/index.do';
    				}else{
    					alert("删除失败");
    				}
    			}
    		});
    	}
    }
    function updatestopip(id){
    	if(confirm("您确定要禁用此用户ip吗?")){
    		var param = {};
    		param.id=id;
    		$.ajax({
    			type : "post",
    			url :'${path}/admin/stopip/updatestopid.do',
    			data : param,
    			dataType : 'json',
    			success : function(datas) {
    				alert("操作成功");
    				window.location.reload();
    			}
    		});
    	}
    }

    function delallinfo(id){
    	if(confirm("您确定要删除该用户下所有数据吗?")){
    		var param = {};
    		param.id=id;
    		$.ajax({
    			type : "post",
    			url :'${path}/admin/user/deluserallinfo.do',
    			data : param,
    			dataType : 'json',
    			success : function(datas) {
    				if(datas==1){
    					window.location.reload();
    				}else{
    					alert("删除失败");
    				}
    			}
    		});
    	}
    }


    </script> 
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 用户操作</strong></div>
  <div class="body-content" style="padding-left: 30px;">
      <div class="form-group">
        <div class="field">
          <label>登陆名：${user.loginname}</label>
        </div>
      </div>
      <div class="form-group">
        <div class="field">
          <label>名称：${user.name}</label>
        </div>
      </div>
      <div class="form-group">
        <div class="field">
          <label>头像：<c:if test="${user.img!=''}">
          	<img src="${path}/file/${user.img}" width="50px;" alt="${user.name}" />
          </c:if></label>
        </div>
      </div>
      <div class="form-group">
        <div class="field">
          <label>组别：${user.groupname}</label>
        </div>
      </div>
      <div class="form-group">
        <div class="field">
          <label>最后登录时间：${user.lastlogintime}</label>
        </div>
      </div>
      <div class="form-group">
        <div class="field">
          <label>最后登录ip：${user.loginip}</label>
        </div>
      </div>
      <div class="form-group">
        <div class="field">
          <label>注册时间：${user.createtime}</label>
        </div>
      </div>
      <div class="form-group">
        <div class="field">
          <label>注册ip：${user.zhuceip}</label>
        </div>
      </div>
      <div class="form-group">
        <div class="field">
          <label>是否启用：<c:if test="${user.flag==0}">禁用</c:if>
          <c:if test="${user.flag==1}">正常</c:if></label>
        </div>
      </div>
      <div class="form-group">
        <div class="field">
        <c:if test="${user.flag==0}">
	          <a class="button border-main" href="javascript:void(0)" onclick="updateflag(${user.id},1)"><span class="icon-edit"></span> 启用</a>
          </c:if>
          <c:if test="${user.flag==1}">
	          <a class="button border-main" href="javascript:void(0)" onclick="updateflag(${user.id},0)"><span class="icon-lock"></span> 禁用</a>
          </c:if>
          <c:if test="${user.groupid==1}">
	          <a class="button border-main" href="javascript:void(0)" onclick="updategroup(${user.id},3)"><span class="icon-edit"></span> 取消管理员</a>
          </c:if>
          <c:if test="${user.groupid!=1}">
	          <a class="button border-main" href="javascript:void(0)" onclick="updategroup(${user.id},1)"><span class="icon-edit"></span> 设置管理员</a>
          </c:if>
          
          <a class="button border-main" href="javascript:void(0)" onclick="updatepwd(${user.id})"><span class="icon-edit"></span> 重置密码</a>
          <a class="button border-red" href="javascript:void(0)" onclick="del(${user.id})"><span class="icon-trash-o"></span> 删除</a> 
          <a class="button border-red" href="javascript:void(0)" onclick="delallinfo(${user.id})"><span class="icon-trash-o"></span> 删除所有数据</a> 
          <a class="button border-red" href="javascript:void(0)" onclick="updatestopip(${user.id})"><span class="icon-trash-o"></span> 禁用ip</a>
          <button class="button border-red icon-tags" type="button" onclick="window.history.go(-1);"> 返回</button>
        </div>
      </div>
  </div>
</div>
</body></html>