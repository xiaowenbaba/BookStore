<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/static/css/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/static/css/bottom.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/userManager.css">
<link href="<%=request.getContextPath()%>/static/css/UserLogin.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery/jquery-2.1.4.js">  </script>
<script type="text/javascript">
	$(function(){
		$("#loginForm2").children("input").click(function(){
			url="<%=request.getContextPath()%>/user/modifyPassword";
			var passWord = $("#passWord").val();
			var newPassWord = $("#newPassWord").val();
			var renewPassWord = $("#renewPassWord").val();
			
			$.get(url,{passWord:passWord,newPassWord:newPassWord,renewPassWord:renewPassWord},function(data){
				if(data==1){
					alert("修改密码成功！")
					window.location.replace("<%=request.getContextPath()%>/login");
				}else if (data==0) {
					alert("输入密码错误或两次输入有误！")
				}
	          },'json');
			
			
		})
		
		
		
		
	})
	

</script>
</head>
<body>
<jsp:include page="/header.jsp" ></jsp:include>

<div id="login">

<div id="managerList" style="margin: auto;">
            <ul>
                <li><a href="<%=request.getContextPath()%>/user/userInfo">我的资料</a></li>
                <li><a href="<%=request.getContextPath()%>/Order/entry">我的订单</a></li>
                <li><a href="<%=request.getContextPath()%>/shoppingCar/entryCar">购物车</a></li>
                <li><a href="<%=request.getContextPath()%>/modifyPassword">修改密码</a></li>
            </ul>
        </div>
    <div id="loginContian">
        <div id="loginTop">
            <a>修改密码</a>
        </div>
        <div id="loginMiddle">
            <form action="<%=request.getContextPath()%>/user/modifyPassword" >
                <div id="loginForm">
                    <a>输入旧密码 :</a> <input type="password"  id="passWord" placeholder="请输入旧密码">
                </div>
                <div id="loginForm1">
                    <a>输入新密码 :</a>   <input type="password"  id="newPassWord" placeholder="请输入新密码">
                <div id="loginMassge" style=" width: 500px;height: 20px;"><span style="color: red; font-size: 15px">${info}</span></div>
                    
                </div>
                <div id="loginForm3">
                    <a >确认新密码 :</a>  <input type="password" id="renewPassWord"placeholder="请输入新密码">
                </div>
                <div id="loginForm2">
                    <input type="button" value="修改" style=" margin-left:20px">
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="/bottom.jsp"></jsp:include>

</body>
</html>