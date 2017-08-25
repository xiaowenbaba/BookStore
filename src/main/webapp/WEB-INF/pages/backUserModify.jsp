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
            <span>修改用户信息</span>
        </div>
        <div id="modify">
        <form id="saveUser" action="<%=request.getContextPath()%>/user/backModify">
            <div class="modifyDiv">
                <span>用户帐号:</span>
                <input type="hidden" name="userId" value="${commom.userId}">
                <input type="text" readonly value="${commom.userName }">
            </div>
            <div class="modifyDiv">
                <span>用户密码:</span>
                <input type="text" readonly value="${commom.userPassword }">
            </div>
            <div class="modifyDiv">
                <span style="display: inline-block ;margin-left: 15px">用户名:</span>
                <input type="text" name="name" placeholder="请输入用户名" value="${commom.nickName }" >
            </div>
            <div class="modifyDiv">
                <span style="display: inline-block ;margin-left: 32px">电话:</span>
                <input type="text"  name="tel" placeholder="请输入电话"  value="${commom.userTel }">
            </div>
            <div class="modifyDiv">
                <span>用户状态:</span>
                <input type="text"  readonly value="${commom.userState }">
            </div>

        </form>
 
            <div class="modifyDiv">
                <a id="save" href="#" style="margin-left: 110px">保存</a>
                <a href="<%=request.getContextPath()%>/user/backUserQuery">返回</a>
            </div>
        </div>
    </div>
</body>
</html>