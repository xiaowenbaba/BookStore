<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/static/css/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/static/css/UserLogin.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery/jquery-2.1.4.js">  </script>
<script type="text/javascript">
	$(function(){
		
		 
		
		
	})
	

</script>
</head>
<body>
<div id="top" style="background-color: burlywood;width: 100%;height: 50px">
    <div id="topContain" style=" width: 1024px ;height: 50px;margin: auto ;">
        <div id="topDivOne">
            <a href="<%=request.getContextPath()%>">首页</a></div>
           <c:choose>
         <c:when test="${not empty user }">
        <div id="topDivRight" style="float: right ">
                    <ul>
                    <li><a style="color: ">欢迎 ${user.userName} </a><a href="<%=request.getContextPath()%>/user/loginOut" style="color: blue;">注销</a></li>
                    <li><a href="<%=request.getContextPath()%>/register">注册用户</a></li>
                    <li><a href="#">客户服务</a></li>
                </ul>
        </div>
         </c:when>
         <c:otherwise>
         <div id="topDivRight" style="float: right ">
                    <ul>
                    <li><a>你好,请</a><a href="<%=request.getContextPath()%>/login">登陆</a></li>
                    <li><a href="#">客户服务</a></li>
                </ul>
        </div>
         </c:otherwise>
         </c:choose>
       
    </div>
</div>
<div id="login">
    <div id="loginContian">
        <div id="loginTop">
            <a>欢迎注册二手书店网站</a>
        </div>
        <div id="loginMiddle">
            <form action="<%=request.getContextPath()%>/user/register" >
                <div id="loginForm">
                    <a>用户账号 :</a> <input   type="text"  name="userName" placeholder="请输入账号">
                <div id="loginMassge" style=" width: 500px;height: 20px;"><span style="color: red; font-size: 15px">${info}</span></div>
                    
                </div>
                <div id="loginForm1">
                    <a>用户密码 :</a>   <input type="password"  name="passWord" placeholder="请输入密码">
                </div>
                <div id="loginForm3">
                    <a>确认密码 :</a>  <input type="password" name="rePassWord"placeholder="请输入密码">
                </div>
                <div id="register_bottom_text">
                    <input type="checkbox" id="checkbox" checked="checked">
                    <a >已阅读并同意<span>《二手书帐号注册协议》</span></a>
                </div>
                <div id="loginForm2">
                    <input type="submit" value="注册" style=" margin-left:20px">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>