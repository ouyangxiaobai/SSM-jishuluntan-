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
    
    <script type="text/javascript">
    
    function f_check_IP(id)      
    {  var ip = document.getElementById(id).value;  
       var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/;//正则表达式     
       if(re.test(ip))     
       {     
           if( RegExp.$1<256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256)   
           return true;     
       }     
       return false;      
    } 
    
    function typealla(){
    	$("input[name='typeall']").each(function(){   
	    	if(this.checked==true){
	    		 $("input[name='typecheckbox']").each(function(){   
	                 this.checked=true;  
	             });
	    	}else{
	    		$("input[name='typecheckbox']").each(function(){   
	                 this.checked=false;  
	             });
	    	}
        });
    }
    
    function yanzheng(){
    	if(!f_check_IP('startip')){
    		alert("开始ip输入错误");
    		return;
    	}
    	if(!f_check_IP('endip')){
    		alert("结束ip输入错误");
    		return;
    	}
    	
    	var type ="";    
    	  $('input[name="typecheckbox"]:checked').each(function(){
    		  type+='-'+$(this).val()+',';
    	  });  
    	  $("#type").val(type);
    	$("#form").submit();
    }
    
    
  $(function(){
	var type=$("#type").val();
	 $("input[name='typecheckbox']").each(function(){   
         if (type.indexOf('-'+$(this).val()+',') >-1) {  
             this.checked=true;
         }   
     });
	 var id=$("#id").val();
	 if(id==""){
		 $("#startip").val('0.0.0.0');
		 $("#endip").val('0.0.0.0');
	 }
  });
  
    </script> 
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>禁用ip信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="${path}/admin/stopip/updateoradd.do" id="form">
      <div class="form-group">
        <div class="label">
          <label>开始IP：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="startip" value="${stopip.startip}" size="100" id="startip"/>
          <input type="hidden" name="id" value="${stopip.id}" id="id"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>结束IP：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="endip" value="${stopip.endip}" size="100" id="endip" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>是否生效：</label>
        </div>
        <div class="field">
	        <select class="input" name="isuse">
	        	<option value="0" <c:if test="${stopip.isuse== 0}">selected="selected"</c:if>>不生效</option>
	        	<option value="1"  <c:if test="${stopip.isuse== 1}">selected="selected"</c:if> >生效</option>
	        </select>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>发帖限制：</label>
        </div>
        <div class="field">
		  <input type="checkbox" name="typeall" onclick="typealla();"/>全选
		  <input type="checkbox" name="typecheckbox" value="1"/>访问
		  <input type="checkbox" name="typecheckbox" value="2"/>注册
		  <input type="checkbox" name="typecheckbox" value="3"/>登录
		  <input type="checkbox" name="typecheckbox" value="4"/>发帖
		  <input type="checkbox" name="typecheckbox" value="5"/>回复
        <input type="hidden" name="type" id="type" value="${stopip.type}"/>
          <div class="tips">如为空则不生效</div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field">
          <textarea name="remarks" class="input" style="height:120px;">${stopip.remarks}</textarea>
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