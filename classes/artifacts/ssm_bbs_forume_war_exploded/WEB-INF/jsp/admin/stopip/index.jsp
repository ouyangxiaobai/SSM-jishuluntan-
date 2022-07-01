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
<form method="post" action="${path}/admin/stopip/index.do">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 访问管理</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
          <a class="button border-green" href="${path}/admin/stopip/toupdateoradd.do" ><span class="icon-edit"></span> 添加</a>
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="120">开始ip</th>       
        <th>结束ip</th>       
        <th>限制类型</th>       
        <th>创建时间</th>       
        <th>创建人</th>       
        <th>是否生效</th>       
        <th>备注</th>
      </tr>      
      <c:forEach items="${page.list}" var="stopip" >
        <tr>
          <td>  ${stopip.startip}</td>
          <td>${stopip.endip}</td>
          <td>
          <c:if test="${fn:contains(stopip.type, '-1,')}" >访问</c:if>
          <c:if test="${fn:contains(stopip.type, '-2,')}" >注册</c:if>
          <c:if test="${fn:contains(stopip.type, '-3,')}" >登录</c:if>
          <c:if test="${fn:contains(stopip.type, '-4,')}" >发帖</c:if>
          <c:if test="${fn:contains(stopip.type, '-5,')}" >回复</c:if>
          </td>
          <td>${stopip.createtime}</td>
          <td>${stopip.loginname}</td>
          <td>
          <c:if test="${stopip.isuse==0}" >不生效</c:if>
          <c:if test="${stopip.isuse==1}" >生效</c:if>
          </td>
          <td>${stopip.remarks}</td>
          <td><div class="button-group"> 
          <c:if test="${stopip.isuse==0}" >
          <a class="button border-red" href="javascript:void(0)" onclick="isuse(${stopip.id},1)"><span class="icon-trash-o"></span> 生效</a> 
          </c:if>
          <c:if test="${stopip.isuse==1}" >
          <a class="button border-red" href="javascript:void(0)" onclick="isuse(${stopip.id},0)"><span class="icon-trash-o"></span> 不生效</a> 
          </c:if>
          <a class="button border-main" href="${path}/admin/stopip/toupdateoradd.do?id=${stopip.id}"><span class="icon-edit"></span> 修改</a>
          <a class="button border-red" href="javascript:void(0)" onclick="del(${stopip.id})"><span class="icon-trash-o"></span> 删除</a> </div></td>
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
			url :'${path}/admin/stopip/del.do',
			data : param,
			dataType : 'json',
			success : function(datas) {
				if(datas==1){
					alert("删除成功");
					window.location.href='${path}/admin/stopip/index.do';
				}else if(datas==2){
					alert("该版块有帖子，建议移出后再删除");
				}else{
					alert("该版块有子板块禁止删除");
				}
			}
		});
	}
}

function isuse(id,isuse){
	if(confirm("您确定要修改生效吗?")){
		var param = {};
		param.id=id;
		param.isuse=isuse;
		$.ajax({
			type : "post",
			url :'${path}/admin/stopip/updateuse.do',
			data : param,
			dataType : 'json',
			success : function(datas) {
				window.location.href='${path}/admin/stopip/index.do';
			}
		});
	}
}

</script>
</body></html>