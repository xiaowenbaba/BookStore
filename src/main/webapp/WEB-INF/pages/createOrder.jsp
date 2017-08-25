<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link  href="<%=request.getContextPath()%>/static/css/ShoppingCar.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/static/css/createOrder.css" rel="stylesheet">
<link  href="<%=request.getContextPath()%>/static/css/header.css" rel="stylesheet">
<link  href="<%=request.getContextPath()%>/static/css/bottom.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery/jquery-2.1.4.js">  </script>
 <script type="text/javascript">
        $(function(){
        	  $("#address1").children("a").click(function(){
                  $("#addressFormContian").css("display","block");
                  $("#addressForm").css("display","block");
              })
          $("#addressBottom2").children("a").click(function(){
              $("#addressFormContian").css("display","none");
              $("#addressForm").css("display","none");
          });
           $("#addressBottom5").children("a").click(function(){
                  $("#addressFormContian").css("display","none");
                  $("#addressForm1").css("display","none");
           });
          
          var url="<%=request.getContextPath()%>/city/getCity";
          $.get(url,{},function(data){
        	  $.each(data,function(index,item){
        		  $("#province").append("<option value="+item.addressId+">"+item.addressName+"</option>")
        	  });
          },'json');
          $("#province").change(function(){
        	  var fatherId = $(this).val();
        	  if(fatherId!=""){
        		  $("#city").children().each(function(index){
        			 	if(index>0){	
        			 		$(this).remove();
        			 	} 
        		  });
        		  $.get(url,{fatherId:fatherId},function(data){
                	  $.each(data,function(index,item){
                		  $("#city").append("<option value="+item.addressId+">"+item.addressName+"</option>")
                	  });
                  },'json');
        	  }
          });
          $("#city").change(function(){
        	  var fatherId = $(this).val();
        	  if(fatherId!=""){
        		  $("#area").children().each(function(index){
        			 	if(index>0){	
        			 		$(this).remove();
        			 	} 
        		  });
        		  $.get(url,{fatherId:fatherId},function(data){
                	  $.each(data,function(index,item){
                		  $("#area").append("<option value="+item.addressId+">"+item.addressName+"</option>")
                	  });
                  },'json');
        	  }
          });
          
          
          
          
          
          
          $(".addUpdate>a:first-child").click(function(){
        	  var url="<%=request.getContextPath()%>/address/select"
        	  var addId = $(this).parent("div").parent("div").children("input").val();
        	  $.get(url,{goodsAddressId:addId},function(data){
        		  $("#addressFormContian").css("display","block");
                  $("#addressForm1").css("display","block");
                  	$("#name1").val(data.goodsName);
                  	$("#phone1").val(data.goodsTel);
                 	$("#detialAdd1").val(data.detaAddress);
                 	$("#post1").val(data.postId);
                 	$("#addressBottom4").parent("div").children("input").val(data.goodsAddressId)
                 	 var addressFatherId = parseInt(data.addressFatherName)
                     $("#area1").append("<option value="+data.addressId+">"+data.addressName+"</option>")
                     var url1="<%=request.getContextPath()%>/city/getFatherCity";
                     $.get(url1,{addressFatherId:addressFatherId},function(data1){
                    	 $("#city1").append("<option value="+data1.addressId+">"+data1.addressName+"</option>")
                    	 $.get(url1,{addressFatherId:data1.addressFatherName},function(data2){
                        	 $("#province1").append("<option value="+data2.addressId+">"+data2.addressName+"</option>")
                    	 },'json');
                     },'json');
        	  },'json');
          })
          
          
          var url="<%=request.getContextPath()%>/city/getCity";
          $.get(url,{},function(data){
        	  $.each(data,function(index,item){
        		  $("#province1").append("<option value="+item.addressId+">"+item.addressName+"</option>")
        	  });
          },'json');
          $("#province1").change(function(){
        	  var fatherId = $(this).val();
        	  if(fatherId!=""){
        		  $("#city1").children().each(function(index){
        			 	if(index>0){	
        			 		$(this).remove();
        			 	} 
        		  });
        		  $.get(url,{fatherId:fatherId},function(data){
                	  $.each(data,function(index,item){
                		  $("#city1").append("<option value="+item.addressId+">"+item.addressName+"</option>")
                	  });
                  },'json');
        	  }
          });
          
          $("#city1").change(function(){
        	  var fatherId = $(this).val();
        	  if(fatherId!=""){
        		  $("#area1").children().each(function(index){
        			 	if(index>0){	
        			 		$(this).remove();
        			 	} 
        		  });
        		  $.get(url,{fatherId:fatherId},function(data){
                	  $.each(data,function(index,item){
                		  $("#area1").append("<option value="+item.addressId+">"+item.addressName+"</option>")
                	  });
                  },'json');
        	  }
          });
          $("#addressBottom1").children("a").click(function(){
        	  var url="<%=request.getContextPath()%>/address/insert";
        	  var name=$("#name").val();
        	  var phone=$("#phone").val();
        	  var detialAdd=$("#detialAdd").val();
        	  var post=$("#post").val();
        	  var province=$("#province option:selected")
        	  var city = $("#city option:selected")
        	  var area = $("#area option:selected")
        	  var proviceId= province.val();
        	  var proviceVal= province.text();
        	  var cityId= city.val();
        	  var cityVal= city.text();
        	  var areaId= area.val();
        	  var areaVal= area.text();
        	  $.get(url,{name:name,post:post,phone:phone
        		  ,detialAdd:detialAdd,proviceId:proviceId
        		  ,proviceVal:proviceVal,cityId:cityId,cityVal:cityVal
     			  ,areaId:areaId,areaVal:areaVal
        		  },function(data){
                  	if(data!=null){
                  		$("#addressFormContian").css("display","none");
                  		$("#addressForm").css("display","none");
                  		$("#addressShow").append("<div class='address' ><a href='javaScript:;' style=' display: inline-block; width: 200px ;height: 75px ;float: left; position: absolute; '></a><input class='addId' type='hidden' value="+data.goodsAddressId+"><b id='spanNmae'>"+data.goodsName+"</b><span id='spanTel'>"+data.goodsTel+"</span><p id='spanAdd'>"+data.detaAddress+"</p><div class='addUpdate' style=' margin-top: 20px'><a href='javaScript:;'>编辑</a><a href='javaScript:;'>删除</a></div></div>");
                  		window.location.reload();
					}else{
                  		alert("输入不合规范")
                  	}
              },'json');
          
          })
          
          $("#addressBottom4").children("a").click(function(){
        	  var url2="<%=request.getContextPath()%>/address/update";
        	  var name=$("#name1").val();
        	  var phone=$("#phone1").val();
        	  var detialAdd=$("#detialAdd1").val();
        	  var post=$("#post1").val();
        	  var goodsAddressId=$(this).parent("div").parent("div").children("input").val();
        	  var province=$("#province1 option:selected")
        	  var city = $("#city1 option:selected")
        	  var area = $("#area1 option:selected")
        	  var proviceId= province.val();
        	  var proviceVal= province.text();
        	  var cityId= city.val();
        	  var cityVal= city.text();
        	  var areaId= area.val();
        	  var areaVal= area.text();
        	  $.get(url2,{name:name,post:post,phone:phone
        		  ,detialAdd:detialAdd,proviceId:proviceId
        		  ,proviceVal:proviceVal,cityId:cityId,cityVal:cityVal
     			  ,areaId:areaId,areaVal:areaVal,goodsAddressId:goodsAddressId,
        		  },function(data){
                  	if(data!=null){
                  		$("#addressFormContian").css("display","none");
                  		$("#addressForm1").css("display","none");
                  	   	$(".address input").each(function(){
                  		   if($(this).val()==data.goodsAddressId){
                  			  	$(this).parent("div").children("b").html(data.goodsName)
                  			  	$(this).parent("div").children("span").html(data.goodsTel)
                  			  	$(this).parent("div").children("p").html(data.detaAddress)
                  		   }
                  	   })
					}else{
                  		alert("输入不合规范")
                  	}
              },'json');
          });
          $(".addUpdate>a:last-child").click(function(){
          	var url="<%=request.getContextPath()%>/address/delete";
          	var addId = $(this).parent("div").parent("div").children("input").val();
          	$.get(url,{goodsAddressId:addId},function(data){
          				alert(data)
          				window.location.reload();
          			
          	});
          })
          
          $("#addressShow>div:first-child").each(function(){
        	  $(this).css("border","solid 1px red")
        	  $(this).siblings("div").each(function(){
        		  $(this).css("border","solid 1px gainsboro");
        	  })
        	  var goodsName=$(this).children("b").html()
				var goodsTel=$(this).children("span").html()
				var detaAddress=$(this).children("p").html()
				$("#goodsNameVal").val(goodsName)
				$("#goodsTelVal").val(goodsTel)
				$("#detaAddressVal").val(detaAddress)
          })
          
          
          $(".address").click(function(){
        	  $(this).css("border","solid 1px red")
        	  $(this).siblings("div").each(function(){
        		  $(this).css("border","solid 1px gainsboro");
        	  })
				var goodsName=$(this).children("b").html()
				var goodsTel=$(this).children("span").html()
				var detaAddress=$(this).children("p").html()
				$("#goodsNameVal").val(goodsName)
				$("#goodsTelVal").val(goodsTel)
				$("#detaAddressVal").val(detaAddress)
        	  
          })
        });
		 
     
        
    </script>
</head>
<body>
<div id="addressFormContian" style="display: none">
</div>
<jsp:include page="/header.jsp" ></jsp:include>
    <div id="shoppingCar">
        <div id="top">
            <ul>
                <div class="top1" ><li><span >我的购物车</span></li></div>
                <div class="top1 " style="background-color: red "><li><span style="color: white">填写订单</span></li></div>
                <div class="top1"><li><span>支付</span></li></div>
            </ul>
        </div>
        <div id="addressContian">
        <c:choose>
        <c:when test="${not empty addList}">
		<div id="addressShow">
		<c:forEach items="${addList}" var="add">
        <div class="address" >
        	<a href="javaScript:;" style=" display: inline-block; width: 200px ;height: 75px ;float: left; position: absolute; "></a>
        	<input class="addId" type="hidden" value="${add.goodsAddressId}">
            <b id="spanNmae">${add.goodsName}</b>
            <span id="spanTel">${add.goodsTel}</span>
           <p id="spanAdd"> ${add.detaAddress}</p>
            <div class="addUpdate" style=" margin-top: 20px"><a href="javaScript:;">编辑</a><a href="javaScript:;">删除</a></div>
        </div>
		</c:forEach>
		</div>
        </c:when>
        </c:choose>
        </div>
        <div id="address1">
            <a href="javaScript:;" >填写收货地址+</a>
        </div>
        
        <div id="addressForm1" style="display: none">
            <div id="addressTitle1">
                <span>更新地址： </span>
            </div>
            <div class="addressName">
                <span>收货人名</span>
                <input id="name1" type="text" name="name" placeholder="请输入收货人名称">
            </div>
            <div class="addressName">
                <span>电话号码</span>
                <input id="phone1" type="text" name="phone" placeholder="请输入电话号码">
            </div>
            <div id="addressCity1">
                <span>城市信息</span>
                <select id="province1">
                </select>
                <select id="city1" >
                </select>
                <select id="area1" >
                </select>
            </div>
            <div class="addressName">
                <span>详细地址</span>
                <input id="detialAdd1" type="text" name="detialAdd" placeholder="请输入详细地址">
            </div>
            <div class="addressName">
                <span>邮政编码</span>
                <input id="post1" type="text" name="post" placeholder="请输入邮政编码">
            </div>
                <div id="addressBottom3">
                	<input class="addId" type="hidden" >
                    <div id="addressBottom4"><a href="javaScript:;">点击确认更新地址</a></div>
                    <div id="addressBottom5"><a href="javaScript:;">取消</a></div>
                </div>
            </div>
       
        <div id="addressForm" style="display: none">
            <div id="addressTitle">
                <span>新增地址： </span>
            </div>
            <div class="addressName">
                <span>收货人名</span>
                <input id="name" type="text" name="name" placeholder="请输入收货人名称">
            </div>
            <div class="addressName">
                <span>电话号码</span>
                <input id="phone" type="text" name="phone" placeholder="请输入电话号码">
            </div>
            <div id="addressCity">
                <span>城市信息</span>
                <select id="province">
                    <option>请选择</option>
                </select>
                <select id="city" >
                    <option>请选择</option>
                </select>
                <select id="area" >
                    <option>请选择</option>
                </select>
            </div>
            <div class="addressName">
                <span>详细地址</span>
                <input id="detialAdd" type="text" name="detialAdd" placeholder="请输入详细地址">
            </div>
            <div class="addressName">
                <span>邮政编码</span>
                <input id="post" type="text" name="post" placeholder="请输入邮政编码">
            </div>
                <div id="addressBottom">
                    <div id="addressBottom1"><a href="javaScript:;">点击确认新增地址</a></div>
                    <div id="addressBottom2"><a href="javaScript:;">取消</a></div>
                </div>
            </div>
        <div id="cars_title">
            <ul>
                <li id="cars_title_first" style="font-size: 20px ;">
                    订单清单：
                </li>
                <li id="cars_title_second">产品</li>
                <li id="cars_title_third">数量</li>
                <li id="cars_title_fouth">单价</li>
                <li id="cars_title_fivth">总价</li>
            </ul>
        </div>
        <form action="<%=request.getContextPath()%>/Order/submit">
        <c:forEach items="${list}" var="book">
        <div class="goodsList">
            <div class="goodListImg">
                <img src="<%=request.getContextPath()%>${book.bookPicture}" width="150px" height="150px">
            </div>
            <div class="goodListImg">
                    <a href="#">${book.bookName}</a>
            </div>
            <input type="hidden" value="${book.bookId}" name="bookId">
            <div class="goodListImg1">
                <a>${book.bookSelling*book.carNo}.00</a>
            </div>
            <div class="goodListImg1">
                <a>${book.bookSelling}.00</a>
            </div>
            <input type="hidden" value="${book.bookSelling}"name="bookSelling">
            <input type="hidden" value="${book.carNo}" name="carNo">
            <div class="goodListImg1">
                <a>${book.carNo}</a>
            </div>
        </div>
        </c:forEach>
        <div id="cars_total">
            <div id="cars_total_wrap">
                <ul>
                <input type="hidden" value="${totalnum}" name="totalnum">
                    <div class="total"><li id="total_first"><a>商品数量:</a><span id="fnum">${totalnum}</span></li>
                    <div class="total"><li id="total_second"><a>商品金额:￥</a><span id="totalprice">${totalMoney}.00</span></li></div>
                </ul>
            </div>
            </div>
        <div id="cars_bottom">
          <div id="orderMoney">
            <div id="orderMoneyDiv">
                <ul>
                    <li><a>商品金额：￥${totalMoney }.00</a></li>
                    <li><a>优惠：￥0</a></li>
                    <li><a> 运费:￥0</a></li>
                    <li>应付：<span>￥${totalMoney }.00</span></li>
                </ul>
            </div>
          </div>
         <div id="cars_bottom_right">
                <input type="hidden" value="${totalMoney }" name="totalMoney">
                <input type="hidden" name="goodsName" id="goodsNameVal">
                <input type="hidden"  name="goodsTel" id="goodsTelVal">
                <input type="hidden" name="detaAddress" id="detaAddressVal">
                    <input type="submit" value="提交订单" ">
           </div>
        </div>
        </form>
    </div>
<jsp:include page="/bottom.jsp"></jsp:include>
</body>
</html>