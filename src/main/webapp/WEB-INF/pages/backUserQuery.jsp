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
            <span>用户信息查询</span>
        </div>
        <form id="queryUser" action="<%=request.getContextPath()%>/user/backUserQuery">
        
        <div id="queryCondition">
                    用户Id查询:<input type="text" name = "userId" placeholder="请输入用户ID" value="${userId }">
                    用户名查询:<input type="text" name = "userName" placeholder="请输入用户名" value="${userName}">
               <a href="#" style="background-color: brown;color: white ;padding :5px ; font-size: 15px"> 查询 </a>
        </div>
        
        </form>
        <div id="queryTable">
            <table>
            
                <c:choose>
                <c:when test="${not empty page.data }">
                <tr>
                    <th>用户编号</th>
                    <th>用户账号</th>
                    <th>用户密码</th>
                    <th>用户名</th>
                    <th>电话</th>
                    <th>用户状态</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${page.data}" var="user">
                <tr>
                    <td>${user.userId}</td>
                    <td>${user.userName}</td>
                    <td>${user.userPassword }</td>
                    <c:if test="${not empty user.nickName }">
                    <td>${user.nickName }</td>
                    </c:if>
                    <c:if test="${ empty user.nickName }">
                    <td>空值 </td>
                    </c:if>
                     <c:if test="${not empty user.userTel }">
                     <td>${user.userTel }</td>
                    </c:if>
                    <c:if test="${ empty user.userTel  }">
                    <td>空值</td>
                    </c:if>
                   <c:if test="${not empty user.userState  }">
                    <td>${user.userState }</td>
                    </c:if>
                    <c:if test="${ empty user.userState   }">
                    <td>空值 </td>
                    </c:if>
                    
                    <td><a href="<%=request.getContextPath()%>/user/backUserQueryById?userId=${user.userId}">修改</a>
                    <a class="deleteUser" href="#">删除</a></td>
                </tr>
                </c:forEach>
                </c:when>
                <c:otherwise>
                	<div >
                		<span style="display: inline-block; margin-left: 200px;font-size: 20px;color: red;">查询错误，没有该数据 ！</span>
                	</div>
                </c:otherwise>
                </c:choose>
            </table>
        </div>
    </div>
</body>
</html>