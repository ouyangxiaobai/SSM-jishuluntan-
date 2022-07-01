<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
<title>我的帖子-${applicationScope.bbsinfo.name} </title>
<meta name="keywords" content="我的帖子" />
<meta name="description" content="我的帖子" />
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_common.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_home_usercp.css" /> 
<link rel="stylesheet" href="${path }/admin/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${path}/public/css/tubiao.css" />
<script src="${path}/public/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="${path}/public/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/public/layer/layer.js"></script>
</head>
 <body id="nv_forum" class="pg_index">
 <%@ include file="/WEB-INF/inc/top.jsp"%>

  <div id="wp" class="wp">
   <div id="pt" class="bm cl"> 
    <div class="z"> 
     <a href="${path}/" class="nvhm" title="首页">首页</a> 
     <em>›</em> 
     <a href="${path}/user/index.do">设置</a> 
     <em>›</em>我的帖子
    </div> 
   </div> 
   <div id="ct" class="ct2_a wp cl"> 
    <div class="mn"> 
     <div class="bm bw0"> 
      <h1 class="mt">帖子</h1> 
      <ul class="tb cl"> 
       <li class="a"><a href="">发帖记录</a></li> 
      </ul>
      <form method="post" action="${path}/tz/index.do"> 
       <div class="exfm" style="margin-top: 10;"> 
        <table cellspacing="0" cellpadding="0"> 
         <tbody>
         <tr>
         </tr>
          <tr> 
           <th>操作时间:</th> 
           <td> 
             <input type="text" name="starttime" value="${tiezi.starttime}"  onfocus="WdatePicker({skin:'YcloudRed',dateFmt:'yyyy-MM-dd'})"  class="Wdate"   readonly="readonly" />
            	至
             <input type="text" name="endtime" value="${tiezi.endtime}" onfocus="WdatePicker({skin:'YcloudRed',dateFmt:'yyyy-MM-dd'})"  class="Wdate"  readonly="readonly"  /> </td> 
          </tr> 
          <tr> 
           <th>&nbsp;</th> 
           <td><button type="submit" class="pn"><strong>查询</strong></button></td> 
          </tr> 
         </tbody>
        </table> 
       </div> 
       <table cellspacing="0" cellpadding="0" class="dt"> 
        <tbody>
         <tr> 
          <th width="23%">标题</th> 
          <th width="15%">操作时间</th> 
          <!-- <th width="5%">操作</th>  -->
         </tr>
         <c:forEach items="${page.list}" var="tiezi">
         <tr>
          <td ><a href="${path}/post/${tiezi.id}_1_1.html" target="_blank" >${tiezi.name}</a></td> 
          <td>${tiezi.createtime}</td> 
          <!-- <td>查看</td>  -->
         </tr> 
         </c:forEach>
         <tr>
        <td colspan="8">
			<jsp:include page="/WEB-INF/inc/page.jsp" flush="true"/>		
		</td>
      </tr>
        </tbody>
       </table> 
      </form> 
     </div> 
    </div> 
    <div class="appl">
     <div class="tbn"> 
      <h2 class="mt bbda">设置</h2> 
      <ul> 
       <li><a href="${path}/user/index.do">个人资料</a></li> 
       <li><a href="${path}/user/topwd.do">密码安全</a></li> 
       <li><a href="${path}/user/jifen/index.do">我的积分</a></li>  
       <li><a href="${path}/user/message/index.do">我的消息</a></li> 
       <li class="a"><a href="${path}/tz/index.do">我的帖子</a></li> 
      </ul> 
     </div>
    </div> 
   </div> 
  </div>


<%@ include file="/WEB-INF/inc/foot.jsp"%>
 </body>
</html>