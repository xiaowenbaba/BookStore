<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link  href="<%=request.getContextPath()%>/static/css/backLeft.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery/jquery-2.1.4.js">  </script>
<script type="text/javascript">
	$(function(){
		
        $(".click").each(function(index,v){
            $(v).click(function(){
                $(this).siblings("ul").toggle()
            })
        })
		
		
	})
	

</script>
</head>
<body>
    <div id="leftContain">
        <ul>
            <li><a href="javaScript:" class="click">用户管理</a>
                <ul style="display: none">
                    <a href="<%=request.getContextPath()%>/user/backUserQuery" style="color: gray;font-size: 15px;" target="center"> <li>查看用户信息</li></a>
                </ul>
            </li>
            <li><a href="javaScript:" class="click">图书管理</a>
                <ul style="display: none">
                    <a href="<%=request.getContextPath()%>/shopping/backBookQuery" style="color: gray;font-size: 15px;" target="center"><li>查看书籍信息</li></a>
                    <a href="<%=request.getContextPath()%>/shopping/backBookTypeQuery" style="color: gray;font-size: 15px;" target="center"><li>查看书籍类别</li></a>
                </ul>
            </li>
            <li><a href="javaScript:" class="click">订单管理</a>
                <ul style="display: none">
                    <a href="<%=request.getContextPath()%>/back/userOrderQuery" style="color: gray;font-size: 15px;" target="center"><li>查看用户订单信息</li></a>
                </ul>
            </li>
        </ul>
    </div>
</body>
</html>