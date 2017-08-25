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
<link href="<%=request.getContextPath()%>/static/css/orderPay.css" rel="stylesheet">
</head>
<body>
<div id="addressFormContian" style="display: none">
</div>
<jsp:include page="/header.jsp" ></jsp:include>
   <div id="OrderPay">
        <div id="top">
            <ul>
                <div class="top1" ><li><span >我的购物车</span></li></div>
                <div class="top1 " ><li><span>填写订单</span></li></div>
                <div class="top1" style="background-color: red "><li><span style="color: white">支付</span></li></div>
            </ul>
        </div>
        <div id="orderMessage">
            <div id="orderId">
                <span>您的订单编号为:${id}</span>
                <a href="<%=request.getContextPath()%>/Order/entry">点击查看我的订单</a>
            </div>
            <div id="payFor">
                <span>支付方式:在线</span>
                <div id="payOnline"><a href="<%=request.getContextPath()%>/Order/pay?id=${id}">点击支付</a></div>
            </div>
        </div>
    </div>
<jsp:include page="/bottom.jsp"></jsp:include>
</body>
</html>