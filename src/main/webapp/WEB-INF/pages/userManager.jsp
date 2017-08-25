<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link  href="<%=request.getContextPath()%>/static/css/header.css" rel="stylesheet">
<link  href="<%=request.getContextPath()%>/static/css/bottom.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/userManager.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery/jquery-2.1.4.js">  </script>
<script type="text/javascript">
	$(function(){
		$("#submitUser1").children("a").click(function(){
			url="<%=request.getContextPath()%>/user/modify";
			var name = $("#name").val();
			var tel = $("#tel").val();
			var sex = $("#sex").val();
			var add = $("#add").val();
			
			$.get(url,{name:name,tel:tel,sex:sex,add:add},function(data){
	        	if(data!=null){
	        		alert("修改成功！")
	        	}else{
	        		alert("修改失败！")
	        	}
	          },'json');
			
			
		})
		
		
		
		
	})
	

</script>
</head>
<body>
<jsp:include page="/header.jsp" ></jsp:include>
    <div id="userManagerContian">
        <div id="managerList">
            <ul>
                <li><a href="<%=request.getContextPath()%>/user/userInfo">我的资料</a></li>
                <li><a href="<%=request.getContextPath()%>/Order/entry">我的订单</a></li>
                <li><a href="<%=request.getContextPath()%>/shoppingCar/entryCar">购物车</a></li>
                <li><a href="<%=request.getContextPath()%>/modifyPassword">修改密码</a></li>
            </ul>
        </div>
        <div id="userInfoContian">
                <div id="title">
                    <span>个人资料</span>
                </div>
                <div id="userImg">
                    <span>用户头像：</span>
                    <img src="<%=request.getContextPath()%>/static/images/title.png" style="width: 150px ;height: 180px">
                </div>
                <div class="userInput">
                    <span>名称：</span>
                   
                    <input type="text"  readonly  value="${userInfo.userName}">
                </div>
                <div class="userInput">
                 <span>昵称：</span>
                 <input id="name" type="text" placeholder="点击输入昵称" value="${userInfo.nickName}">
                </div>
                <div class="userInput">
                    <span>性别：</span>
                    <input id="sex" type="text" placeholder="点击输入性别"  value="${userInfo.sex}">
                </div>
                <div class="userInput">
                    <span>电话：</span>
                    <input id="tel" type="text" placeholder="点击输入电话" value="${userInfo.userTel}">
                </div>
                 <div class="userInput">
                <span>住址：</span>
                <input id="add" type="text" placeholder="点击输入住址" value="${userInfo.school}">
                </div>
                <div id="submitUser">
                    <div id="submitUser1">
                        <a href="#">保存</a>
                    </div>
                </div>
        </div>

    </div>
<jsp:include page="/bottom.jsp"></jsp:include>
</body>
</html>