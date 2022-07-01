<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>${applicationScope.bbsinfo.name}</title>
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_common.css" />
<link rel="stylesheet" type="text/css" href="${path}/public/css/tubiao.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_viewthread.css" /> 
<script type="text/javascript">

</script>
</head>
 <body>
      <table cellspacing="0" cellpadding="0" style="width: 100%;height: 100%;"> 
       <tbody>
       <!-- 允许回复 -->
        <tr> 
         <td class="plc"> 
          </br>
          <div class="cl"> 
           <div class="hasfsl" id="fastposteditor"> 
             <div class="tedt"> 
				<div  style="width:800px;height:18px;">${message.title }</div>
            </div> 
           </div> 
          </div> 
          </br>
          <div class="cl"> 
           <div class="hasfsl" id="fastposteditor"> 
             <div class="tedt"> 
				<div  style="width:800px;height:260px;">${message.content }</div>
            </div> 
           </div> 
          </div> 
          </td> 
        </tr>
       </tbody>
      </table> 
 </body>
</html>