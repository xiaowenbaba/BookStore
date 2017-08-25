<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
    <link href="<%=request.getContextPath()%>/static/css/backUserModify.css" rel="stylesheet">
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery/jquery-2.1.4.js">  </script>
<script type="text/javascript">
	$(function(){
		$("#save").click(function(){
			$("#saveUser").submit();
		})
	})

</script>
<body>
    <div id="modifyContain">
        <div id="modifyTitle">
            <span>修改书籍信息</span>
        </div>
        <div id="modify">
        <form id="saveUser" action="<%=request.getContextPath()%>/shopping/backBookModify">
            <div class="modifyDiv">
                <span>书籍名称:</span>
                <input type="hidden" name="bookId" value="${book.bookId}">
                <input type="text"  name="bookName" value="${book.bookName }">
            </div>
            <div class="modifyDiv">
                <span>图书类型:</span>
                <input type="text"  name="bookProperty" value="${book.bookProperty }">
            </div>
               <div class="modifyDiv">
                <span style="display: inline-block ;margin-left: 32px">作者:</span>
                <input type="text"   name="bookAuthor" value="${book.bookAuthor }">
            </div>
            <div class="modifyDiv">
                <span style="display: inline-block ;margin-left: 32px">价格:</span>
                <input type="text" name="bookSelling" placeholder="请输入用户名" value="${book.bookSelling }" >
            </div>
             <div class="modifyDiv">
                <span style="display: inline-block ;margin-left: 32px">库存:</span>
                <input type="text"  name="bookStorage" placeholder="请输入电话"  value="${book.bookStorage }">
            </div>
            <div class="modifyDiv">
                <span style="display: inline-block ;margin-left: 14px">出版社:</span>
                <input type="text"   name="bookPublish" value="${book.bookPublish }">
            </div>
        </form>
 
            <div class="modifyDiv">
                <a id="save" href="#" style="margin-left: 110px">保存</a>
                <a href="<%=request.getContextPath()%>/shopping/backBookQuery">返回</a>
            </div>
        </div>
    </div>
</body>
</html>