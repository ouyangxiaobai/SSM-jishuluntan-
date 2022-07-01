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
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/js/ajaxfileupload.js"></script>
    
    <script type="text/javascript">
    function yanzheng(){
    	var name=$("#name").val();
    	var innerlink=$("#innerlink").val();
    	if($.trim(name)==""){
    		alert("名称不能为空");
    		return;
    	}
    	if($.trim(innerlink)==""){
    		alert("链接不能为空");
    		return;
    	}
    	$("#form").submit();
    }
    </script> 
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 内部链接添加</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="${path}/admin/innerlink/updateoradd.do" id="form">
      <div class="form-group">
        <div class="label">
          <label>关键字：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="name" value="${innerLink.name}" size="100" id="name"/>
          <input type="hidden" name="id" value="${innerLink.id}"/>
          <div class="tips">添加关键字请谨慎，请勿使用标签当关键字,关键字套关键字</div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>链接：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="innerlink" value="${innerLink.innerlink}" size="100" id="innerlink" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button border-main icon-check-square-o" type="button" onclick="yanzheng();"> 提交</button>
          <button class="button border-red icon-tags" type="button" onclick="window.history.go(-1);"> 返回</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>