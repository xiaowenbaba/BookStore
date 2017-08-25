<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
    <link href="<%=request.getContextPath()%>/static/css/backUserModify.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/userManager.css">
    <link href="<%=request.getContextPath()%>/static/css/createOrder.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/css/ShoppingCar.css" rel="stylesheet">
</head>
<body>
	<div id="modifyContain">
		<div id="modifyTitle">
			<span>订单详细信息</span>
			<a href="<%=request.getContextPath()%>/back/userOrderQuery" style="color:white; float: right; display: inline-block; background-color:red; padding: 10px">返回</a>
		</div>
		<div id="cars_title">
			<ul>
				<li id="cars_title_first" style="font-size: 20px;">订单清单：</li>
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
							<img src="<%=request.getContextPath()%>${book.bookPicture}"
								width="150px" height="150px">
						</div>
						<div class="goodListImg">
							<a> ${book.bookName }</a>
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
</body>
</html>