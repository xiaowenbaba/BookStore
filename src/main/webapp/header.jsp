<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath(); 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
    <link href="<%=request.getContextPath() %>/static/css/header.css" rel="stylesheet">
     <script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery/jquery-2.1.4.js">  </script>
    <script type="text/javascript">
    $(function(){
    $("#botoomOneDivsInput").children("a").click(function(){
    	$("#serach").submit();
    })

});
</script>
</head>
<body >
<div id="headerContain">
<div id="top" style="background-color: burlywood;width: 100%;height: 50px">
    <div id="topContain" style=" width: 1024px ;height: 50px;margin: auto ;">
        <div id="topDivOne">
            <a href="#">关注本网站</a></div>
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
                    <li><a href="<%=request.getContextPath()%>/register">注册用户</a></li>
                    <li><a href="#">客户服务</a></li>
                </ul>
        </div>
         </c:otherwise>
         </c:choose>
    </div>
</div>
<div id="botoom">
    <div id="botoomOne">
        <div id ="botoomOneDiv">
            <a href="<%=request.getContextPath()%>"> Book Shared 二手书店</a>
        </div>
        <div id="botoomOneDiv2">
            <ul>
                <li> <a href="<%=request.getContextPath()%>">首页</a></li>
                <li><a href="<%=request.getContextPath()%>/shopping">图书商城</a></li>
                <li><a href="<%=request.getContextPath()%>/Order/entry">个人中心</a></li>
                <li><a href="<%=request.getContextPath()%>/evaluation/entry">我的收藏</a></li>
            </ul>
        </div>
    </div>
    <div id="botoomTwo">
        <div id="botoomTwoDiv">
         <c:choose>
          <c:when test="${ not empty totalNumber}">
         <div id="shoppingCar" style=" width: 120px ;height: 50px  ;float: right ;margin-left: 10px;">
                <a href="<%=request.getContextPath()%>/shoppingCar/entryCar"> <div id="image" style="width: 33px ;height:37px ;float: left">
                    <img src="<%=request.getContextPath()%>/static/images/shoppingCar.png">
                </div>
                <div id="Car" style="background-color: #FF2832 ;width: 80px ;height: 36px ;float: left">
                      <span style="color: white ;line-height: 36px ;"> 购物车</span>
                    <span id="carSpan" style="color: white ;line-height: 36px">${totalNumber}</span>
                </div>
            </div></a>
            </c:when>
            <c:when test="${  empty totalNumber}">
         <div id="shoppingCar" style=" width: 120px ;height: 50px  ;float: right ;margin-left: 10px;">
                <a href="<%=request.getContextPath()%>/shoppingCar/entryCar"> <div id="image" style="width: 33px ;height:37px ;float: left">
                    <img src="<%=request.getContextPath()%>/static/images/shoppingCar.png">
                </div>
                <div id="Car" style="background-color: #FF2832 ;width: 80px ;height: 36px ;float: left">
                      <span style="color: white ;line-height: 36px ;"> 购物车</span>
                    <span id="carSpan" style="color: white ;line-height: 36px">0</span>
                </div>
            </div></a>
             </c:when>
            </c:choose>
          	<form id="serach" action="<%=request.getContextPath()%>/shopping">
            <div id="botoomOneDivsInput">
                <input placeholder="搜索图书" type="text" name="bookName">
                <a href="#">搜索</a>
            </div>
            </form>
        </div>
    </div>
	</div>
</div>
</body>
</html>