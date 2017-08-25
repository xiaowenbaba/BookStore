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
			$("#saveUser").submit();
		})
	})

</script>
<body>
    <div id="modifyContain">
        <div id="modifyTitle">
            <span>修改书籍类型信息</span>
        </div>
        <div id="modify">
        <form id="saveUser" action="<%=request.getContextPath()%>/shopping/backBookTypeSave">
        <div class="modifyDiv">
                <span>书籍类型名称:</span>
                <input type="text"  name="bookTypeId"  readonly="readonly" value="${bookType.bookTypeId }">
            </div>
            <div class="modifyDiv">
                <span>书籍类型名称:</span>
                <input type="text"  name="bookTypeName" value="${bookType.bookTypeName }">
            </div>
            
        </form>
 
            <div class="modifyDiv">
                <a id="save" href="#" style="margin-left: 110px">保存</a>
                <a href="<%=request.getContextPath()%>/shopping/backBookTypeQuery">返回</a>
            </div>
        </div>
    </div>
</body>
</html>