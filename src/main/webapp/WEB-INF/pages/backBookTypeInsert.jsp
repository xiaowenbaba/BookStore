<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
    <link href="<%=request.getContextPath()%>/static/css/backUserModify.css" rel="stylesheet">
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery/jquery-2.1.4.js">  </script>
<script type="text/javascript">
	$(function(){
		$("#save").click(function(){
			var url="<%=request.getContextPath()%>/shopping/backBookTypeSave";
			 var bookTypeName=$("#bookTypeName").val()
			 $.get(url,{bookTypeName:bookTypeName},function(data){
	        	 alert(data)
	        	if(data=="插入成功！"){
	        		window.location.replace("<%=request.getContextPath()%>/shopping/backBookTypeQuery")
	        	}
	          },'json');
			
		})
		
		
		
		
		
		 
		
	})
</script>
<body>
    <div id="modifyContain">
        <div id="modifyTitle">
            <span>插入书籍类型</span>
        </div>
        <div id="modify">
            <div class="modifyDiv">
                <span>书籍类型名称:</span>
                <input id="bookTypeName" type="text"  name="bookTypeName" placeholder="请输入书籍类型名称">
            </div>
            <div class="modifyDiv">
                <a id="save" href="#" style="margin-left: 110px">插入数据</a>
                <a href="<%=request.getContextPath()%>/shopping/backBookTypeQuery">返回</a>
            </div>
        </div>
    </div>
</body>
</html>