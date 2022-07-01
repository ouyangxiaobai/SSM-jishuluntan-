<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head> 
  <title>${applicationScope.bbsinfo.indextitle}-${applicationScope.bbsinfo.name} </title> 
  <meta name="keywords" content="${applicationScope.bbsinfo.keywords}" /> 
  <meta name="description" content="${applicationScope.bbsinfo.description} " />
  <style type="text/css">
  a:link,a:visited {color:#000;text-decoration:none;}
  a:hover,a:active {color:#000;text-decoration:underline;}</style> 
 </head> 
 <body>
 
 <div style="text-align: center;margin-top: 200px;">
 <p>抱歉，您的IP被禁止，请联系管理员</p>
<p><a href="javascript:history.back()">[ 点击这里返回上一页  ]</a></p>
 </div>
 </body>
</html>