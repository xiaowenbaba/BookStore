<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
    <link href="<%=request.getContextPath()%>/static/css/backUserQuery.css" rel="stylesheet">
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery/jquery-2.1.4.js">  </script>
<script type="text/javascript">
	$(function(){
		if($("#input1").val()==1){
			$("#pageUtilCenter>a:first-child").removeAttr("href");
		}else if($("#input1").val()==$("#input2").val()){
			$("#pageUtilCenter>a:last-child").removeAttr("href");
		};
		$("#queryCondition").children("a").click(function(){
 			$("#queryUser").submit();
		})
		$(".deleteUser").each(function(){
			$(this).click(function(){
				if(window.confirm("确定删除不可恢复的数据吗？")){
					alert("该数据不可删除！")
					return true;
				}else {
					return false;
				}
			})
		})
			
		
	})

</script>
<body>
    <div id="queryContain">
        <div id="queryTitle">
            <span>书籍信息查询</span>
        </div>
        <form id="queryUser" action="<%=request.getContextPath()%>/shopping/backBookQuery">
        
        <div id="queryCondition">
                    图书名查询:<input type="text" name = "bookName" placeholder="请输入图书名" value="${bookName }">
                    图书类别查询:<input type="text" name = "bookProperty" placeholder="请输入 图书类别  " value="${bookProperty}">
               <a href="#" style="background-color: brown;color: white ;padding :5px ; font-size: 15px"> 查询 </a>
               
        </div>
        <div id="insert" style=" height: 30px  ;width: 1024px;" >
         <a href="<%=request.getContextPath()%>/backBookInsert" style="background-color:blue; color: white ;padding :5px ; font-size: 15px;float: right;"> 插入数据 </a>
        </div>
        
        </form>
        <div id="queryTable">
         <c:choose>
                <c:when test="${not empty page.data }">
            <table>
            
               
                <tr>
                    <th>图书编号</th>
                    <th>图书名</th>
                    <th>作者</th>
                    <th>价格</th>
                    <th>出版社</th>
                    <th>图书类型</th>
                    <th>库存</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${page.data}" var="book">
                <tr>
                    <td>${book.bookId}</td>
                    <td>${book.bookName}</td>
                    <td>${book.bookAuthor }</td>
                   
                     <td>¥${book.bookSelling }.00</td>
                   
                      <td>${book.bookPublish }</td>
                     <td>${book.bookProperty }</td>
                  
                   
                    <td>${book.bookStorage }</td>
                    
                    
                    <td><a href="<%=request.getContextPath()%>/shopping/backBook?bookId=${book.bookId}">修改</a>
                    <a class="deleteUser" href="#">删除</a></td>
                </tr>
                 </c:forEach>
               
            </table>
     			
          
     			
                </c:when>
                <c:otherwise>
                	<div >
                		<span style="display: inline-block; margin-left: 200px;font-size: 20px;color: red;">查询错误，没有该数据 ！</span>
                	</div>
                </c:otherwise>
                </c:choose>
                  <div style="clear :both"> </div>
            <div id="pageUtil">
            <c:if test="${page.totalPage>1}">
                <div id="pageUtilCenter" style="text-align: center;">
                        <a href="<%=request.getContextPath()%>/shopping/backBookQuery?currentPage=${page.currentPage-1}&bookName=${bookName}&bookProperty=${bookProperty}">上一页</a>
                        <input id="input1" type="hidden" value="${page.currentPage}" >
                        <c:forEach begin="1" end="${page.totalPage}" var="i">
                            <a href="<%=request.getContextPath()%>/shopping/backBookQuery?currentPage=${i}&bookName=${bookName}&bookProperty=${bookProperty}">${i}</a>
                        </c:forEach>
                        <input id="input2" type="hidden"value="${page.totalPage}" >
                        <a href="<%=request.getContextPath()%>/shopping/backBookQuery?currentPage=${page.currentPage+1}&bookName=${bookName}&bookProperty=${bookProperty}">下一页</a>
                </div>
            </c:if>	
        </div>
    </div>
    </div>
</body>
</html>