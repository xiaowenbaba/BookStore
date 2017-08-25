<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/static/css/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/static/css/UserLogin.css" rel="stylesheet">
</head>
<body>
<div id="top" style="background-color: burlywood;width: 100%;height: 50px">
    <div id="topContain" style=" width: 1024px ;height: 50px;margin: auto ;">
        <div id="topDivOne">
            <a href="<%=request.getContextPath()%>">首页</a></div>
        <div id="topDivRight" style="float: right ">
            <ul>
                <li><a>你好,请</a><a href="#">登陆</a></li>
                <li><a href="#">注册用户</a></li>
                <li><a href="#">客户服务</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="login">
    <div id="loginContian">
        <div id="loginTop">
            <a>注册信息</a>
        </div>
        <div id="loginMiddle">
            <div id="loginSuccess">
                <a href="<%=request.getContextPath()%>/login">
                    	注册成功！请点击回到登陆界面登陆用户！
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>