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
            <span>书籍类别信息查询</span>
        </div>
        <form id="queryUser" action="<%=request.getContextPath()%>/shopping/backBookTypeQuery">
        
        <div id="queryCondition">
                    图书类别ID查询:<input type="text" name ="bookTypeId"  placeholder="请输入图书类别ID"  value="${bookTypeId }">
                    图书类别名称查询:<input type="text" name = "bookTypeName"  placeholder="请输入 图书类别名称  " value="${bookTypeName}">
               <a href="#" style="background-color: brown;color: white ;padding :5px ; font-size: 15px"> 查询 </a>
        </div>
        <div id="insert" style=" height: 30px  ;width: 1024px;" >
         <a href="<%=request.getContextPath()%>/backBookTypeInsert" style="background-color:blue; color: white ;padding :5px ; font-size: 15px;"> 插入数据 </a>
        </div>
        
        </form>
        <div id="queryTable">
         <c:choose>
                <c:when test="${not empty page.data }">
            <table>
            
               
                <tr>
                    <th> 图书类别ID查询</th>
                    <th>图书类别名称查询</th>
                    
                    <th>操作</th>
                </tr>
                <c:forEach items="${page.data}" var="book">
                <tr>
                    <td>${book.bookTypeId}</td>
                    <td>${book.bookTypeName}</td>
                   
                    <td><a href="<%=request.getContextPath()%>/shopping/backBookTypeModify?bookTypeId=${book.bookTypeId}">修改</a>
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
                <div id="pageUtilCenter" style="margin-left: 100px;">
                        <a href="<%=request.getContextPath()%>/shopping/backBookTypeQuery?currentPage=${page.currentPage-1}&bookTypeId=${bookTypeId}&bookTypeName=${bookTypeName}">上一页</a>
                        <input id="input1" type="hidden" value="${page.currentPage}" >
                        <c:forEach begin="1" end="${page.totalPage}" var="i">
                            <a href="<%=request.getContextPath()%>/shopping/backBookTypeQuery?currentPage=${i}&bookTypeId=${bookTypeId}&bookTypeName=${bookTypeName}">${i}</a>
                        </c:forEach>
                        <input id="input2" type="hidden"value="${page.totalPage}" >
                        <a href="<%=request.getContextPath()%>/shopping/backBookTypeQuery?currentPage=${page.currentPage+1}&bookTypeId=${bookTypeId}&bookTypeName=${bookTypeName}">下一页</a>
                </div>
            </c:if>	
        </div>
    </div>
    </div>
</body>
</html>