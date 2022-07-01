<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<script type="text/javascript">

function do_go(){	
$("#g_menu").slideToggle();	
}
</script>
<div id="g_menu" style="display:none;">
<ul>
    	<li>
        	<a href="">杂谈活动</a>
            <a href="">IT招聘</a>
            <a href="">淘宝客</a>
            <a href="">公众号</a>
        </li>
        <li>
        	<a href="">网站交易</a>
            <a href="">域名交易</a>
            <a href="">APP</a>
            <a href="">账户交易</a>
        </li>
		<li>
        	<a href="">网店交易</a>
            <a href="">源码集市</a>            
            <a href="">我的主题</a>            
            <a href="javascript:;" onclick="do_go();">收起↑</a>
        </li>
    </ul>
</div>

<div  class="s-daohang s-center " >
<div class=" s-daohang-title ">
<a href="${path}/" ><img src="${path}/file/${applicationScope.bbsinfo.logoimg}" /></a>
</div>
<%-- <div class="s-width-50 s-float-right" onclick="do_go();">
        <a href="javascript:;" class="sb-toggle-left s-width-50 "><img src="${path}/public/mobile/images/s_cbl.png" /></a>
</div> --%>
<div class="s-width-50 s-float-right">
<c:if  test="${!empty sessionScope.indexuser}">
	<a href="${path}/user/index.do" class="s-width-50 "> <img src="${path}/public/mobile/images/s_user.png" /></a>
</c:if>
<c:if  test="${empty sessionScope.indexuser}">
	<a href="${path}/login/index.do" class="s-width-50 "> <img src="${path}/public/mobile/images/s_user.png" /></a>
</c:if>

</div>			
</div>  