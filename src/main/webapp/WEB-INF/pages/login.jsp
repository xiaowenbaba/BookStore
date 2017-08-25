<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href=" <%=request.getContextPath()%>/static/css/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/static/css/UserLogin.css" rel="stylesheet">
</head>
<body>
<div id="top" style="background-color: burlywood;width: 100%;height: 50px">
    <div id="topContain" style=" width: 1024px ;height: 50px;margin: auto ;">
        <div id="topDivOne">
            <a href="<%=request.getContextPath()%>/homePage">首页</a></div>
        <div id="topDivRight" style="float: right ">
            <ul>
                <li><a href="<%=request.getContextPath()%>/register">注册用户</a></li>
                <li><a href="#">客户服务</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="login">
    <div id="loginContian">
        <div id="loginTop">
            <a>欢迎登陆二手书店网站</a>
        </div>
        <div id="loginMiddle">
            <form action="<%=request.getContextPath()%>/user/login" >
                <div id="loginForm">
                  <a>账号 :</a> <input type="text"  name="userName" placeholder="请输入账号" >
                  <div id="loginMassge" style=" width: 500px;height: 20px;"><span style="color: red; font-size: 15px">${info}</span></div>
                </div>
                <div id="loginForm1">
                    <a>密码 :</a>   <input type="password" name="passWord"  placeholder="请输入密码">
                </div>
                <div id="loginForm2">
                      <input type="submit" value="登陆">
                        <a href="<%=request.getContextPath()%>/register">注册</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>