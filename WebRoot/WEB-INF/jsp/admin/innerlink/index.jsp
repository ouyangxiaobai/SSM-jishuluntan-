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
<form method="post" action="${path}/admin/innerlink/index.do" id="from1">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内部链接管理</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
          <a class="button border-green" href="${path}/admin/innerlink/toupdateoradd.do" ><span class="icon-edit"></span> 添加</a>
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="120">关键字</th>       
        <th>链接</th>     
        <th>操作时间</th>       
        <th>创建人</th>
        <th>使用状态</th>       
        <th>操作</th>       
      </tr>      
      <c:forEach items="${page.list}" var="innerLink" >
        <tr>
          <td>  ${innerLink.name}</td>
          <td>${innerLink.innerlink}</td>
          <td>${innerLink.createtime}</td>
          <td>${innerLink.loginname}</td>
          <td>
          <c:if test="${innerLink.isuse==1}">
			使用
          </c:if>
          <c:if test="${innerLink.isuse!=1}">
			禁止
          </c:if>
          </td>
          <td><div class="button-group"> 
          <c:if test="${innerLink.isuse==1}">
          <a class="button border-red" href="javascript:void(0)" onclick="updateuse(${innerLink.id},'0')"><span class="icon-trash-o"></span> 禁止使用</a> 
          </c:if>
          <c:if test="${innerLink.isuse!=1}">
          <a class="button border-red" href="javascript:void(0)" onclick="updateuse(${innerLink.id},'1')"><span class="icon-trash-o"></span> 使用</a>
          </c:if>
          <a class="button border-main" href="${path}/admin/innerlink/toupdateoradd.do?id=${innerLink.id}"><span class="icon-edit"></span> 修改</a>
          <a class="button border-red" href="javascript:void(0)" onclick="del(${innerLink.id})"><span class="icon-trash-o"></span> 删除</a> </div></td>
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

function del(id){
	if(confirm("您确定要删除吗?")){
		var param = {};
		param.id=id;
		$.ajax({
			type : "post",
			url :'${path}/admin/innerlink/del.do',
			data : param,
			dataType : 'json',
			success : function(data) {
				if(data==1){
					$("#from1").submit();
				}
			}
		});
	}
}
function updateuse(id,use){
		var param = {};
		param.id=id;
		param.use=use;
		$.ajax({
			type : "post",
			url :'${path}/admin/innerlink/updateuse.do',
			data : param,
			dataType : 'json',
			success : function(data) {
					$("#from1").submit();
			}
		});
}

</script>
</body></html>