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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/searchGoods.css">
    
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery/jquery-2.1.4.js">  </script>
<script type="text/javascript">
	$(function(){
		
			$(".delete").click(function(){
			var id=	$(this).parent("div").children("input").val();
			var url="<%=request.getContextPath()%>/evaluation/deleteGoods"	
			
			$.get(url,{id:id},function(data){
				alert(data)
				if(data="删除成功！"){
					window.location.reload();
				}
			},'json');
			})

		
		
	})
	

</script>
    
</head>
<body>
<jsp:include page="/header.jsp" ></jsp:include>
   <c:choose>
   <c:when test="${not empty page.data }">
   <c:forEach items="${page.data }" var="book" >
    <div class="showGoods">
        <div class="showGoodsMiddle">
            <div class="showGoodsRight">
                <img src="<%=request.getContextPath()%>/${book.bookPicture}" style="width: 200px;height:200px;margin-left: 30px;margin-top: 10px">
            </div>
            <div class="showGoodsLeft">
                <div class="showGoodsName">
                    <a>${book.bookName}</a>
                </div>
                <div class="showGoodsAuthor">
                    <a>作者:${book.bookAuthor}</a>
                    <a>出版社:${book.bookPublish }</a>
                    <a>出版时间:2017年5月9日</a>
                </div>
                <div class="showGoodsE">
                    <a>图书评价:9分</a>
                </div>
                <div class="showGoodsPrice">
                    <div class="showGoodsPrice1">
                        <a style="color: gray;font-size: 15px">价格</a>
                    </div>
                    <dic class="showGoodsPrice2">
                        <a style=" color:red; font-size: 25px ;margin-left: 10px" >¥${book.bookSelling }.00</a>
                        <a style="color: gray;font-size: 15px ;text-decoration: line-through; ">原价:¥${book.bookPrice }.00</a>
                    </dic>
                    <div class="showGoodsBuy">
                        <div class="showGoodsBuyLeft">
                       	 	<input type="hidden" value="${book.bookId}">
                            <a href="<%=request.getContextPath()%>/shopping/book?bookId=${book.bookId}" style="color: red;">点击查看详细 </a>
                            <a class="delete" href="#" style="color: red;">删除 </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
   </c:forEach>
   </c:when>
        <c:otherwise>
        	<div style="width: 1024px;height: 300px; text-align: center;">
        		<span style="font-size: 25px ;display: inline-block;margin-top: 100px">没有任何收藏物品</span>
        		<a href="<%=request.getContextPath()%>/shopping"style="font-size: 25px ">去商店逛逛吧</a>
        	</div>
        </c:otherwise>
   </c:choose>
    <div style="clear :both"> </div>
            <div id="pageUtil">
            <c:if test="${page.totalPage>1}">
                <div id="pageUtilCenter">
                        <a href="<%=request.getContextPath()%>/shopping?currentPage=${page.currentPage-1}">上一页</a>
                        <input id="input1" type="hidden" value="${page.currentPage}" >
                        <c:forEach begin="1" end="${page.totalPage}" var="i">
                            <a href="<%=request.getContextPath()%>/shopping?currentPage=${i}">${i}</a>
                        </c:forEach>
                        <input id="input2" type="hidden"value="${page.totalPage}" >
                        <a href="<%=request.getContextPath()%>/shopping?currentPage=${page.currentPage+1}">下一页</a>
                </div>
            </c:if>
            </div>
<jsp:include page="/bottom.jsp"></jsp:include>
</body>
</html>