<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<div class="footer" >
<c:if  test="${!empty sessionScope.indexuser}">
	<div>
		<a href="">${sessionScope.indexuser.loginname}</a> , <a href="${path}/user/logout.do" title="退出" class="dialog">退出</a>
	</div>
</c:if>
<c:if  test="${empty sessionScope.indexuser}">
	<div>
		<a href="${path}/login/index.do" title="登录">登录</a> | 
		<a href="${path}/zhuc/index.do" title="立即注册">注册</a>
	</div>
</c:if>
    <div>
<a href="${path}/common/topcorm.do?ismobile=1&pathlocation=${requestScope['javax.servlet.forward.request_uri']}" style="color:#D7D7D7;">触屏版</a> |
<a href="${path}/common/topcorm.do?ismobile=0&pathlocation=${requestScope['javax.servlet.forward.request_uri']}">电脑版</a> 
    </div>
</div>
<%@ include file="/WEB-INF/inc/commonfoot.jsp"%>