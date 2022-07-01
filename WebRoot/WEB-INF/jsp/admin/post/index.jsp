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
<form method="post" action="${path}/admin/post/index.do" id="form">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 帖子管理</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
        <input type="text" name="name" class="input" value="${qtiezi.name}" placeholder="标题"/>
        </li>
        <li>
        <select name="isuse" class="input" >
          <option value="0" <c:if test="${qtiezi.isuse eq '0' }">selected="selected"</c:if>>未审核</option>
          <option value="1" <c:if test="${qtiezi.isuse eq '1' }">selected="selected"</c:if> >通过</option>
          <option value="2" <c:if test="${qtiezi.isuse eq '2' }">selected="selected"</c:if> >不通过</option>
        </select>
        </li>
        <li>
          <a class="button border-green" href="javascript:;" onclick="submitform();" ><span class="icon-search"></span> 查询</a>
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="5%">发帖用户</th>       
        <th width="5%">板块</th>       
        <th width="15%">帖子标题</th>       
        <th width="5%">发帖时间</th>       
        <th width="5%">状态</th>
        <th width="8%">通过</th>
        <th width="15%">不通过或删除</th>
      </tr>      
      <c:forEach items="${page.list}" var="post" >
        <tr>
          <td>${post.tieziusername}</td>
          <td>${post.bankuainame}</td>
          <td>
          <a href="${path}/post/${post.id}_1_1.html" target="_blank">${post.name}</a>
          </td>
          <td>${post.createtime}</td>
          <td>
          <c:if test="${post.isuse eq '0'}">未审核</c:if>
          <c:if test="${post.isuse eq '1'}">通过</c:if>
          <c:if test="${post.isuse eq '2'}">不通过</c:if>
          </td>
          <td>
	          <div class="button-group"> 
		          <a class="button border-red" href="${path}/admin/post/updatepost.do?id=${post.id}&isuse=1" onclick="return queren('${post.name}');"><span class="icon-edit"></span>通过</a> 
	          </div>
          </td>
          <td>
	          <div class="button-group"> 
		          <a class="button border-red" href="${path}/admin/post/updatepost.do?id=${post.id}&isuse=2" onclick="return notqueren('${post.name}');"><span class="icon-trash-o"></span>不通过</a> 
		          <a class="button border-red" href="${path}/admin/post/delpost.do?id=${post.id}" onclick="return del('${post.name}');"><span class="icon-trash-o"></span>删除</a> 
	          </div>
          </td>
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
function queren(name){
	 if(confirm('确定审核通过('+name+')?')){
		 return true;
	 }else{
		 return false;
	 }
}
function notqueren(name){
	 if(confirm('确定审核不通过('+name+')?')){
		 return true;
	 }else{
		 return false;
	 }
}
function del(name){
	 if(confirm('确定删除('+name+')?')){
		 return true;
	 }else{
		 return false;
	 }
}

function submitform(){
	$("#form").submit();
}
</script>
</body></html>