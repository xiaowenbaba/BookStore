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
		
		$(".orderState").each(function(){
			$(this).change(function(x,index){
				
				 var orderId= $(this).val();
				 var orderState=$(this).find("option:selected").text();
				var url="<%=request.getContextPath()%>/back/updateOrderState"
				 $.get(url,{orderId:orderId,orderState:orderState},function(data){
					  alert(data)
                 },'json');
			})
		})
		
		
	})

</script>
<body>
    <div id="queryContain">
        <div id="queryTitle">
            <span>用户订单信息查询</span>
        </div>
        <form id="queryUser" action="<%=request.getContextPath()%>/back/userOrderQuery">
        
        <div id="queryCondition">
                    订单号查询:<input type="text" name = "orderId" placeholder="请输入订单号" value="${orderId}">
                    订单状态查询:<input type="text" name = "orderState" placeholder="请输入 订单状态 " value="${orderState}">
               <a href="#" style="background-color: brown;color: white ;padding :5px ; font-size: 15px"> 查询 </a>
               
        </div>
        </form>
        <div id="queryTable">
         <c:choose>
                <c:when test="${not empty page.data }">
            <table>
            
               
                <tr>
                    <th>订单号</th>
                    <th>前台用户ID</th>
                    <th>订单创建时间</th>
                    <th>订单地址</th>
                    <th>电话</th>
                    <th>总价格</th>
                    <th>订单状态</th>
                    <th>收货人</th>
                    <th>订单数量</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${page.data}" var="order">
                <tr>
                    <td>${order.orderId}</td>
                    <td>${order.userId}</td>
                    <td> ${order.orderDate }</td>
                   
                     <td>${order.orderAddress }</td>
                   
                      <td>${order.tel }</td>
                     <td>¥${order.totalMoney}.00 </td>
                  
                   
                   
                  <c:if test="${order.orderState == '已付款，正在派送！'}">
                    <td>
                    <select class="orderState" style="width: 150px"> 
                    	<option value="${order.orderId}" selected="selected">${order.orderState}</option>
                    	<option value="${order.orderId}">未付款</option>
                    	<option value="${order.orderId}">取消订单</option>
                    	<option value="${order.orderId}">已收货</option>
                    </select>
                    </td>
              
                  </c:if>
                  <c:if test="${order.orderState == '未付款'}">
                    <td>
                    <select class="orderState" style="width: 150px"> 
                    	<option value="${order.orderId}" selected="selected">${order.orderState}</option>
                    	<option value="${order.orderId}" >已付款，正在派送！</option>
                    	<option value="${order.orderId}">取消订单</option>
                    	<option value="${order.orderId}">已收货</option>
                    </select>
                    </td>
              
                  </c:if>
                  <c:if test="${order.orderState == '取消订单'}">
                    <td>
                    <select class="orderState" style="width: 150px"> 
                    	<option value="${order.orderId}" selected="selected">${order.orderState}</option>
                    	<option value="${order.orderId}">已付款，正在派送！</option>
                    	<option value="${order.orderId}">未付款</option>
                    	<option value="${order.orderId}">已收货</option>
                    </select>
                    </td>
              
                  </c:if>
                  <c:if test="${order.orderState == '已收货'}">
                    <td>
                    <select class="orderState" style="width: 150px"> 
                     <option value="${order.orderId}" selected="selected">${order.orderState}</option>
                    
                    	<option value="${order.orderId}">已付款，正在派送！</option>
                    	<option value="${order.orderId}">未付款</option>
                    	<option value="${order.orderId}">取消订单</option>
                    </select>
                    </td>
              
                  </c:if>
                    
                    
                    <td>${order.name }</td>
                    <td>${order.goodsNo }</td>
                    
                    
                    <td><a href="<%=request.getContextPath()%>/back/orderDetialed?id=${order.orderId}">查看订单详细信息</a>
                   </td>
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
                        <a href="<%=request.getContextPath()%>/back/userOrderQuery?currentPage=${page.currentPage-1}&orderId=${orderId}&orderState=${orderState}">上一页</a>
                        <input id="input1" type="hidden" value="${page.currentPage}" >
                        <c:forEach begin="1" end="${page.totalPage}" var="i">
                            <a href="<%=request.getContextPath()%>/back/userOrderQuery?currentPage=${i}&orderId=${orderId}&orderState=${orderState}">${i}</a>
                        </c:forEach>
                        <input id="input2" type="hidden"value="${page.totalPage}" >
                        <a href="<%=request.getContextPath()%>/back/userOrderQuery?currentPage=${page.currentPage+1}&orderId=${orderId}&orderState=${orderState}">下一页</a>
                </div>
            </c:if>	
        </div>
    </div>
    </div>
</body>
</html>