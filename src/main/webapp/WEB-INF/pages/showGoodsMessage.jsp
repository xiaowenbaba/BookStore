<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link  href="<%=request.getContextPath()%>/static/css/showGoods.css" rel="stylesheet">
<link  href="<%=request.getContextPath()%>/static/css/header.css" rel="stylesheet">
<link  href="<%=request.getContextPath()%>/static/css/bottom.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery/jquery-2.1.4.js">  </script>
<script type="text/javascript" >
		$(function(){
			$("#numAdd").click(function(){
				var num = $("#showGoodsBuyRightInput").val();
				$("#showGoodsBuyRightInput").val(parseInt(num)+1);
			});
			
				$("#numSub").click(function(){
					var num = $("#showGoodsBuyRightInput").val();
					if(parseInt(num)!=1){						
					$("#showGoodsBuyRightInput").val(parseInt(num)-1);
					}
				});
				$("#showGoodsBuyMiddle").children("a").click(function(){
					var num = $("#showGoodsBuyRightInput").val();
					var href = $("#showGoodsBuyMiddle").children("a").attr("href");
					href = href.toString()+num;
					$("#showGoodsBuyMiddle").children("a").attr("href",href);
				});
				$("#showGoodsBuyLeft").children("a").click(function(){
					var num = $("#showGoodsBuyRightInput").val();
					var href = $("#showGoodsBuyLeft").children("a").attr("href");
					href = href.toString()+num;
					$("#showGoodsBuyLeft").children("a").attr("href",href);
				});
			
				
				
		});
</script>
</head>
<body>
<jsp:include page="/header.jsp" ></jsp:include>
  <div id="showGoods">
        <div id="showGoodsTop">
            <ul>
                <li><a href="<%=request.getContextPath()%>/shopping">图书 </a></li>
                <li><a> > </a></li>
                <li><a>${book.bookName}</a></li>
            </ul>
        </div>
        <div id="showGoodsMiddle">
            <div id="showGoodsRight">
                <img src="<%=request.getContextPath()%>${book.bookPicture}" style="width: 250px;height: 300px;margin-left: 30px;margin-top: 50px">
            </div>
            <div id="showGoodsLeft">
                <div id="showGoodsName">
                    <a>${book.bookName}</a>
                </div>
                <div id="showGoodsAuthor">
                    <a>作者:${book.bookAuthor}</a>
                    <a>出版社:${book.bookPublish}</a>
                    <a>出版时间:2017年5月9日</a>
                </div>
                <div id="showGoodsE">
                    <a>新旧程度:${book.bookDegree}</a>
                </div>
                <div id="showGoodsPrice">
                    <div id="showGoodsPrice1">
                        <a style="color: gray;font-size: 15px">价格</a>
                    </div>
                    <dic id="showGoodsPrice2">
                        <a style=" color:red; font-size: 25px ;margin-left: 10px" >¥${book.bookSelling}.00</a>
                        <a style="color: gray;font-size: 15px ;text-decoration: line-through; ">原价:¥${book.bookPrice}.00</a>
                    </dic>
                    <div id="showGoodsBuy">
                        <div id="showGoodsBuyRight">
                            <a href="javaScript:;" id="numSub">-</a><input id="showGoodsBuyRightInput" type="text" value="1"><a  href="javaScript:;" id="numAdd">+</a>
                        </div>
                        <div id="showGoodsBuyMiddle">
                            <a href="<%=request.getContextPath()%>/shoppingCar/insert?bookId=${book.bookId}&carNo="><img src="<%=request.getContextPath()%>/static/images/addShopping.png"></a>
                        </div>
                        <div id="showGoodsBuyLeft">
                            <a href="<%=request.getContextPath()%>/shoppingCar/insert?bookId=${book.bookId}&carNo="> <img src="<%=request.getContextPath()%>/static/images/buy.png"></a>
                        </div>
                        <div id="showGoodsBuyLeft3" style=" width: 90px;height:35px ;float: left;margin-right: 10px;background-color: red;text-align: center;border-radius: 5px;margin-top: 50px;">
                       
                            <a href="<%=request.getContextPath()%>/evaluation/add?id=${book.bookId}" style="display: inline-block;color: white;padding: 10px;"> 点击收藏</a>
                        </div>
                    </div>
                    <div id="showGoodsMessage">
                            <a>欢迎登陆并购买商品，该货由二手书店发货并且提供售后服务</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="/bottom.jsp"></jsp:include>
</body>
</html>