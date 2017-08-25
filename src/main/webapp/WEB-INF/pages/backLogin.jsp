<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台登录界面
</title>
<link  href="<%=request.getContextPath()%>/static/css/backLogin.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery/jquery-2.1.4.js">  </script>
<script type="text/javascript">
	$(function(){
		
		$("#bottom").children("a").click(function(){
			url="<%=request.getContextPath()%>/user/loginBack";
			var sysUserName=$("#sysUserName").val();
			var sysUserPassword=$("#sysUserPassword").val();
			$.get(url,{sysUserName:sysUserName,sysUserPassword:sysUserPassword},function(data){
				
				alert(data)
				if(data=="登陆成功！"){
					window.location.replace("<%=request.getContextPath()%>/backMainPage");
				}
				
			},'json');
		})
		
		
	})
	

</script>
</head>
<body>
 <div id="loginContain" style="background-image: url('<%=request.getContextPath()%>/static/images/back5.jpg');">
        <div id="title">
            <span>二手书店网站后台登陆界面</span>
        </div>
        <div id="Messege">
            <div id="login">
                <div id="top">
                    <span>用户账号:</span>
                    <input type="text" placeholder="请输入用户名" id="sysUserName">
                </div>
                <div id="middle">
                    <span>用户密码:</span>
                    <input type="password" placeholder="请输入用户密码" id="sysUserPassword">
                </div>
                <div id="bottom">
                    <a href="javaSript:">登陆</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>