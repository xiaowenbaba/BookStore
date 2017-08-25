<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link  href="<%=request.getContextPath()%>/static/css/ShoppingCar.css" rel="stylesheet">
<link  href="<%=request.getContextPath()%>/static/css/header.css" rel="stylesheet">
<link  href="<%=request.getContextPath()%>/static/css/bottom.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery/jquery-2.1.4.js">  </script>
 <script type="text/javascript">
        $(function(){
            //$("#fnum").html($("#num").val());
            getPrice();

            //var totalprice = ($("#num").val())*($("#phoneprice").val());
            //$("#totalprice").html(totalprice);

            $(".top").each(function(index,v){
                $(v).click(function(){
                    var num=$(v).siblings("div").children("input").val();
                    if(parseInt(num)!=1){
                        var url="<%=request.getContextPath()%>/shoppingCar/update";
                        var num1=$(v).siblings("div").children("input").val(parseInt(num)-1);
                        var goods_id=$(v).parent(".goods_count_box").parent(".goods_count").children("input").val();
                        //alert(num1.val());
                        //alert(goods_id);
                        $.get(url,{carNo:num1.val(),bookId:goods_id},function(data){
                            if(data>0){
                            }
                        },'json');
                        var price=$(v).parent(".goods_count_box").parent(".goods_count").siblings(".goods_price").children("input").val();

                        var priceNum=$(v).parent(".goods_count_box").parent(".goods_count").parent(".goodsInfo").siblings("span").children(".priceAndNum").val(parseInt(num1.val())*parseInt(price));
                        //alert(price);
                        //alert(parseInt(num1.val())*parseInt(price));
                        getPrice();
                    }
                });
            });

            //$("#allCheck").click(function(){
            //if($(this).checked==true){
            //alert("0000");
            //}
            //});

            $(".top2").each(function(index,v){
                $(v).click(function(){
                    var url="<%=request.getContextPath()%>/shoppingCar/update";
                    var num = $(v).siblings("div").children("input").val();
                    var num1=$(v).siblings("div").children("input").val(parseInt(num)+1);
                    var goods_id=$(v).parent(".goods_count_box").parent(".goods_count").children("input").val();
                    //alert(goods_id);
                    $.get(url,{carNo:num1.val(),bookId:goods_id},function(data){
                        if(data>0){
                        }
                    },'json');
                    var price=$(v).parent(".goods_count_box").parent(".goods_count").siblings(".goods_price").children("input").val();
                    //alert(price);
                    //alert(parseInt(num1.val())*parseInt(price));
                    //alert(total=parseInt(num1.val())*parseInt(price));
                    var priceNum=$(v).parent(".goods_count_box").parent(".goods_count").parent(".goodsInfo").siblings("span").children(".priceAndNum").val(parseInt(num1.val())*parseInt(price));
                    //alert(priceNum.val());
                    //var priceNum=$(v).parent(".goods_count_box").parent(".goods_count").parent(".goodsInfo").siblings("span").children(".priceAndNum").val();
                    getPrice();
                });

            });



            if($("#input1").val()==1){
                $("#pageUtilCenter>a:first-child").removeAttr("href");
            }else if($("#input1").val()==$("#input2").val()){
                $("#pageUtilCenter>a:last-child").removeAttr("href");
            };




        });


        function allchkced(){
            var check=window.document.getElementById("allCheck");
            if(check.checked==true){
                var check1=window.document.getElementsByClassName("check");
                for(var i=0; i<check1.length;i++){
                    check1[i].checked=true;
                    getPrice()
                }
            }
        }
        function getMassage(){
            check1=window.document.getElementsByClassName("check");
            for(var i = 0; i<check1.length; i++){
                //var sum=0;
                if(check1[i].checked==true){
                    //获得下一个兄弟节点
                    var check2=check1[i];
                    check2.name="bookId";
                    //input=check2.next("input");
                    //swindow.document.getElementById("totalprice").html(sum);
                }
            }
        }
        function getPrice(){
            var sum=0;
            $(".check").each(function(index ,c){
                if($(c)[0].checked==true){
                    sum=sum+parseInt($(c).next("input").val());
                }
            });
            $("#totalprice").html(sum);
            $("#totalprice1").val(sum);
        }
    </script>
</head>
<body>
<jsp:include page="/header.jsp" ></jsp:include>
    <div id="shoppingCar">
        <div id="top">
            <ul>
                <div class="top1" style="background-color: red "><li><span style="color: white">我的购物车</span></li></div>
                <div class="top1"><li><span>填写订单</span></li></div>
                <div class="top1"><li><span>支付</span></li></div>
            </ul>
        </div>
        <c:choose>
        <c:when test="${not empty page.data }">
        <form action="<%=request.getContextPath()%>/Order/create">
        <div id="cars_title">
            <ul>
                <li id="cars_title_first">
                    <label style="cursor:pointer">
                        <input  id="allCheck"type="checkbox" checked="checked"   onClick="allchkced()">
                        <span>全选</span>
                    </label>
                </li>
                <li id="cars_title_second">产品</li>
                <li id="cars_title_third">数量</li>
                <li id="cars_title_fouth">单价</li>
                <li id="cars_title_fivth">操作</li>
            </ul>
        </div>
        
        <c:forEach items="${ page.data}" var="book">
        <div id="cars_content">
            <div id="cars_content_body">
                <div id="cars_content_body_box">
                            <span id="goodspicture" class="goodspicture">
                                <input class="check" id="check1" type="checkbox" checked="checked"  value="${book.bookId}" onClick="getPrice()">
                                <input type="hidden" class="priceAndNum" value="${book.bookSelling*book.carNo}">
                                <img src="<%=request.getContextPath()%>${book.bookPicture}" width="104px" height="120px">
                            </span>
                    <div id="goodsInfo" class="goodsInfo">
                        <div id="goodsInfo_introduce">
                            ${book.bookName }
                        </div>
                        <div id="goods_count" class="goods_count" >
                            <input  type="hidden" class="goods_id" value="${book.bookId}">
                            <div id="goods_count_box" class="goods_count_box">
                                <a href="javaScript:;" id="minus" class="top">-</a>
                                <div><input name="goodsNo" type="text" class="top1" value="${book.carNo}" id="num"></div>
                                <a href="javaScript:;" class="top2" id="plus">+</a>
                            </div>
                        </div>
                        <div id="goods_price" class="goods_price" >
							<c:set var="count" value="${count+(book.bookSelling*book.carNo)}"></c:set>
                            <input type="hidden" id="phoneprice" value='${book.bookSelling}'>
							
                            ￥<span>${book.bookSelling}.00</span>
                        </div>
                     
                        <div id="goods_delete">
                            <a href="<%=request.getContextPath()%>/shoppingCar/delete?carId=${book.carId}">删除</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
        <div id="cars_total">
            <div id="cars_total_wrap">
            
                <ul>
                    <input type="hidden" name="totalnum" value="${page.totalNumber}">
                    <div class="total"><li id="total_first"><a>商品数量:</a><span id="fnum">${page.totalNumber}</span></li>
                    <input id="totalprice1" type="hidden" name="totalMoney" value="${count}">
                    <div class="total"><li id="total_second"><a>总计:￥</a><span id="totalprice">${count}</span></li></div>
                </ul>
            </div>
        </div>

        <div id="cars_bottom">
         <div id="cars_bottom_right">
         <input type="submit" value="结算" onClick="getMassage()">
           </div>
        </div>
        </form>
        </c:when>
        <c:otherwise>
        	<div style="width: 1024px;height: 300px; text-align: center;">
        		<span style="font-size: 25px ;display: inline-block;margin-top: 100px">购物车没有任何商品</span>
        		<a href="<%=request.getContextPath()%>/shopping"style="font-size: 25px ">去商店逛逛吧</a>
        	</div>
        </c:otherwise>
         </c:choose>
    </div>
  
<jsp:include page="/bottom.jsp"></jsp:include>
</body>
</html>