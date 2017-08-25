<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/static/css/bookType.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery/jquery-2.1.4.js">  </script>
<script type="text/javascript" >
	$(function(){
		$(function(){
			if($("#input1").val()==1){
				$("#pageUtilCenter>a:first-child").removeAttr("href");
			}else if($("#input1").val()==$("#input2").val()){
				$("#pageUtilCenter>a:last-child").removeAttr("href");
			};
		});
	})
</script>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<div id="middle">
    <div id="middleContain">
        <div id="list">
            <ul>
                <li><a href="<%=request.getContextPath()%>/shopping">全部</a></li>
                <li><a href="<%=request.getContextPath()%>/shopping?bookTypeId=1">小说</a></li>
                <li><a href="<%=request.getContextPath()%>/shopping?bookTypeId=2">科技</a></li>
                <li><a href="<%=request.getContextPath()%>/shopping?bookTypeId=3">文学</a></li>
                <li><a href="<%=request.getContextPath()%>/shopping?bookTypeId=4">学习教材</a></li>
                <li><a href="<%=request.getContextPath()%>/shopping?bookTypeId=5">动漫</a></li>
            </ul>
        </div>
        <div id="hotBook">
                <c:choose>
                <c:when test="${not empty page.data}">
                <c:forEach items="${page.data}" var="book">
            <div class="book">
                <div class="bookTop">
                    <a href="<%=request.getContextPath()%>/shopping/book?bookId=${book.bookId}"><img src="<%=request.getContextPath()%>${book.bookPicture}"></a>
                </div>
                <div class="bookBottom">
                    <div class="bookBottomTop">
                        <a href="<%=request.getContextPath()%>/shopping/book?bookId=${book.bookId}">${book.bookName}</a>
                    </div>
                    <div class="bookBottomDiv1"> <div><p>¥${book.bookSelling}.00</p> <a> ¥${book.bookPrice}.00</a> <span>新旧程度:</span> <span>${book.bookDegree}</span></div> </div>
                    <div class="bookBottomDiv2"> <a href="<%=request.getContextPath()%>/shopping/book?bookId=${book.bookId}"> 购买</a></div>
                </div>
            </div>
            </c:forEach>
                </c:when>
                <c:otherwise>
                	<div style="width: 1024px;height: 300px; text-align: center;">
        		<span style="font-size: 25px ;display: inline-block;margin-top: 100px">没有任何该类型商品！</span>
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
        </div>
    </div>
</div>
<jsp:include page="/bottom.jsp"></jsp:include>
</body>
</html>