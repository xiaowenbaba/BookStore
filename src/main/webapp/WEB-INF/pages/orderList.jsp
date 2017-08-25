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
    <link href="<%=request.getContextPath()%>/static/css/createOrder.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/css/ShoppingCar.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/header.jsp" ></jsp:include>
<div style=" width: 1024px ; height: 800px ; margin: auto">
    <div id="managerList">
        <ul>
            <li><a href="<%=request.getContextPath()%>/user/userInfo">我的资料</a></li>
            <li><a href="<%=request.getContextPath()%>/Order/entry">我的订单</a></li>
            <li><a href="<%=request.getContextPath()%>/shoppingCar/entryCar">购物车</a></li>
            <li><a href="<%=request.getContextPath()%>/modifyPassword">修改密码</a></li>
            
        </ul>
    </div>
    <div id="title">
        <span>订单详细</span>
    </div>

    <div id="cars_title">

    <ul>
        <li id="cars_title_first" style="font-size: 20px ;">
            订单清单：
        </li>
        <li id="cars_title_second">产品</li>
        <li id="cars_title_third">数量</li>
        <li id="cars_title_fouth">单价</li>
        <li id="cars_title_fivth">总价</li>
    </ul>
</div>
<c:choose>
<c:when test="${not empty list }">
<c:forEach items="${list}" var="book">
<div class="goodsList">
    <div class="goodListImg">
        <img src="<%=request.getContextPath()%>${book.bookPicture}" width="150px" height="150px">
    </div>
    <div class="goodListImg">
        <a > ${book.bookName }</a>
    </div>
    <div class="goodListImg1">
        <a>¥${book.orderNum * book.bookSelling}.00</a>
    </div>
    <div class="goodListImg1">
        <a>¥${book.bookSelling }.00</a>
    </div>
    <div class="goodListImg1">
        <a>${book.orderNum}</a>
    </div>
</div>
</c:forEach>
</c:when>
</c:choose>
</div>
<jsp:include page="/bottom.jsp"></jsp:include>
</body>
</html>