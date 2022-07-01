<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
    <link rel="stylesheet" href="${path }/admin/css/pintuer.css"/>
    <link rel="stylesheet" href="${path }/admin/css/admin.css"/>
    <script src="${path }/public/js/jquery-1.8.2.min.js"></script>
    <script src="${path }/admin/js/pintuer.js"></script>  
</head>
<body>
<form method="post" action="${path}/admin/user/index.do" id="form">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 用户管理</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
        <input type="text" name="loginname" class="input" value="${quser.loginname}" placeholder="登录名"/>
        </li>
        <li>
        <input type="text" name="name" class="input" value="${quser.name}" placeholder="名称"/>
        </li>
        <li>
        <select name="flag" class="input" >
          <option value="1" <c:if test="${quser.flag eq '1' }">selected="selected"</c:if> >正常</option>
          <option value="0" <c:if test="${quser.flag eq '0' }">selected="selected"</c:if>>禁用</option>
        </select>
        
        </li>
        <li>
          <a class="button border-green" href="javascript:;" onclick="submitform();" ><span class="icon-search"></span> 查询</a>
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="10%">登录名</th>       
        <th width="10%">名称</th>       
        <th width="10%">头像</th>       
        <th width="10%">发帖数量</th>       
        <th width="10%">回复数量</th>       
        <th width="10%">组别</th>       
        <th width="10%">最后登录时间</th>       
        <th width="10%">注册时间</th>       
        <th width="10%">是否启用</th>
        <th width="10%">操作</th>       
      </tr>      
      <c:forEach items="${page.list}" var="user" >
        <tr>
          <td>${user.loginname}</td>
          <td>${user.name}</td>
          <td><c:if test="${user.img!=''}">
          	<img src="${path}/file/${user.img}" width="50px;" alt="${user.name}" />
          </c:if></td>
          <td>${user.tiezicount}</td>
          <td>${user.huifucount}</td>
          <td>${user.groupname}</td>
          <td>${user.lastlogintime}</td>
          <td>${user.createtime}</td>
          <td>
          <c:if test="${user.flag==0}">禁用</c:if>
          <c:if test="${user.flag==1}">正常</c:if>
          </td>
          <td>
          <div class="button-group"> 
          <a class="button border-red" href="${path}/admin/user/tooptions.do?id=${user.id}" ><span class="icon-edit"></span>管理</a> 
          </div></td>
        </tr>
      </c:forEach>
      <tr>
        <td colspan="8">
			<jsp:include page="/WEB-INF/inc/page.jsp" flush="true"/>		
		</td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">


function gotopage(url){
	window.location.href=url;
}

function submitform(){
	$("#form").submit();
}
</script>
</body></html>