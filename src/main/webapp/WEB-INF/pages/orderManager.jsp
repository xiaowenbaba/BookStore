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
    <link href="<%=request.getContextPath()%>/static/css/orderManager.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/header.jsp" ></jsp:include>
   
    <div id="orderManegerContian">
    
        <div id="managerList">
            <ul>
                <li><a href="<%=request.getContextPath()%>/user/userInfo">我的资料</a></li>
                <li><a href="<%=request.getContextPath()%>/Order/entry">我的订单</a></li>
                <li><a href="<%=request.getContextPath()%>/shoppingCar/entryCar">购物车</a></li>
                <li><a href="<%=request.getContextPath()%>/modifyPassword">修改密码</a></li>
                
            </ul>
        </div>
    <c:choose>
    <c:when test="${not empty list}">
        <div id="orderContian">
                <div id="title">
                    <span>我的订单</span>
                </div>
            <div id="Order_title">
                <ul>
                    <li style="margin-left: 0px">订单号</li>
                    <li >收货地址</li>
                    <li >姓名*电话</li>
                    <li >订单状态</li>
                    <li >订单价格</li>
                    <li >操作</li>
                </ul>
            </div>
            <c:forEach items="${list}" var="order">
            <div class="orderList">
                <div class="orderListDiv">
                        <span>${order.orderId}</span>
                </div>
                <div class="orderListDiv">
                    <span>${order.orderAddress}</span>
                </div>
                <div class="orderListDiv">
                    <span>${order.name}${order.tel}</span>
                </div>
                <div class="orderListDiv">
                    <span>${order.orderState }</span>
                </div>
                <div class="orderListDiv">
                    <span style="color: brown">¥${order.totalMoney}.00</span>
                </div>
                <c:if test="${order.orderState == '未付款'}">
                <div class="orderListDiv">
                    <a href="<%=request.getContextPath()%>/Order/detialed?id=${order.orderId}">查看详细订单</a>
                    <a href="<%=request.getContextPath()%>/Order/entryPay?id=${order.orderId}">点击支付</a>
                </div>
                </c:if>
                <c:if test="${  order.orderState  != '未付款'}">
                <div class="orderListDiv">
                
                <a href="<%=request.getContextPath()%>/Order/detialed?id=${order.orderId}">查看详细订单</a>
                
                </div>
                </c:if>
                
                
            </div>
            </c:forEach>
    </div>
    
    </c:when>
    <c:otherwise>
    <div style="width: 1024px;height: 300px; text-align: center;">
        		<span style="font-size: 25px ;display: inline-block;margin-top: 100px">还没有任何订单哦!</span>
        		<a href="<%=request.getContextPath()%>/shopping"style="font-size: 25px ">去商店下单吧！</a>
        	</div>
    </c:otherwise>
    </c:choose>
        </div>
<jsp:include page="/bottom.jsp"></jsp:include>
</body>
</html>