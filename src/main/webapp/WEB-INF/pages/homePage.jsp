<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath(); 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title> 官网主页</title>
    <link href="<%=request.getContextPath()%>/static/css/mianPage.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/css/bottom.css" rel="stylesheet">
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery/jquery-2.1.4.js">  </script>
    <script type="text/javascript">
        $(function(){
            //加载页面执行动画并拿到句柄
            handller=setInterval(function(){
                //图片的最后一个DIV往后右移并把该图片置前
                $("#scroll1>div:last").animate({left:-1350},"slow",function(){
                    $(this).prependTo("#scroll1").css({"display":"block","left":"0"});
                });
                
            }, 4000);
            //鼠标移入后清除动画.
            $("#scroll").mouseenter(function(){
                clearInterval(handller);
                clearInterval(handller1);
            });
            //点击后执行图片的最后一个DIV偏移产生动画
            $("#Util2>a").click(function(){
                $("#scroll1>div:last").animate({left:1350},"slow",function(){
                    $(this).prependTo("#scroll1").css({"display":"block","left":"0"});
                });
            });
            $("#Util1>a").click(function(){
                $("#scroll1>div:last").animate({left:-1350},"slow",function(){
                    $(this).prependTo("#scroll1").css({"display":"block","left":"0"});
                });
            });
            //鼠标离开后开始自动动画
            $("#scroll").mouseleave(function(){
                handller1=setInterval(function(){
                    $("#scroll1>div:last").animate({left:-1350},"slow",function(){
                        $(this).prependTo("#scroll1").css({"display":"block","left":"0"});
                    });
                }, 4000);
            });
           
            
            $("#botoomOneDivsInput").children("a").click(function(){
            	$("#serach").submit();
            })

        });
    </script>
</head>
<body >
<div id="headerContain">
<div id="top" style="background-color: burlywood;width: 100%;height: 50px">
    <div id="topContain" style=" width: 1024px ;height: 50px;margin: auto ;">
        <div id="topDivOne">
            <a href="#">关注本网站</a></div>
         <c:choose>
         <c:when test="${not empty user }">
        <div id="topDivRight" style="float: right ">
                    <ul>
                    <li><a style="color: ">欢迎 ${user.userName} </a><a href="<%=request.getContextPath()%>/user/loginOut" style="color: blue;">注销</a></li>
                    <li><a href="<%=request.getContextPath()%>/register">注册用户</a></li>
                    <li><a href="#">客户服务</a></li>
                </ul>
        </div>
         </c:when>
         <c:otherwise>
         <div id="topDivRight" style="float: right ">
                    <ul>
                    <li><a>你好,请</a><a href="<%=request.getContextPath()%>/login">登陆</a></li>
                    <li><a href="<%=request.getContextPath()%>/register">注册用户</a></li>
                    <li><a href="#">客户服务</a></li>
                </ul>
        </div>
         </c:otherwise>
         </c:choose>
    </div>
</div>
<div id="botoom">
    <div id="botoomOne">
        <div id ="botoomOneDiv">
            <a href="#"> Book Shared 二手书店</a>
        </div>
        <div id="botoomOneDiv2">
            <ul>
                <li> <a href="#">首页</a></li>
                <li><a href="<%=request.getContextPath()%>/shopping">图书商城</a></li>
                <li><a href="<%=request.getContextPath()%>/Order/entry">个人中心</a></li>
                <li><a href="<%=request.getContextPath()%>/evaluation/entry">我的收藏</a></li>
            </ul>
        </div>
    </div>
    <div id="botoomTwo">
        <div id="botoomTwoDiv">
          <c:choose>
          <c:when test="${ not empty totalNumber}">
         <div id="shoppingCar" style=" width: 120px ;height: 50px  ;float: right ;margin-left: 10px;">
                <a href="<%=request.getContextPath()%>/shoppingCar/entryCar"> <div id="image" style="width: 33px ;height:37px ;float: left">
                    <img src="<%=request.getContextPath()%>/static/images/shoppingCar.png">
                </div>
                <div id="Car" style="background-color: #FF2832 ;width: 80px ;height: 36px ;float: left">
                      <span style="color: white ;line-height: 36px ;"> 购物车</span>
                    <span id="carSpan" style="color: white ;line-height: 36px">${totalNumber}</span>
                </div>
            </div></a>
            </c:when>
            <c:when test="${  empty totalNumber}">
         <div id="shoppingCar" style=" width: 120px ;height: 50px  ;float: right ;margin-left: 10px;">
                <a href="<%=request.getContextPath()%>/shoppingCar/entryCar"> <div id="image" style="width: 33px ;height:37px ;float: left">
                    <img src="<%=request.getContextPath()%>/static/images/shoppingCar.png">
                </div>
                <div id="Car" style="background-color: #FF2832 ;width: 80px ;height: 36px ;float: left">
                      <span style="color: white ;line-height: 36px ;"> 购物车</span>
                    <span id="carSpan" style="color: white ;line-height: 36px">0</span>
                </div>
            </div></a>
             </c:when>
            </c:choose>
            <form id="serach" action="<%=request.getContextPath()%>/shopping">
            <div id="botoomOneDivsInput">
                <input placeholder="搜索图书" type="text" name="bookName">
                <a href="#">搜索</a>
            </div>
            </form>
        </div>
    </div>
</div>
</div>
<div id="middle">
    <div id="middleContain">
        <div id="scroll">
            <div id="Util2">
                <a href="javaScript:;" style="background-image: url('<%=request.getContextPath()%>/static/images/sprite-icons.svg');
                background-position: 0px -65px;display: inline-block; width: 50px;height: 80px;"> </a>
            </div>
            <div id="Util1">
                <a href="javaScript:;" style="background-image: url('<%=request.getContextPath()%>/static/images/sprite-icons.svg');
                background-position: 0px  -145px;display: inline-block; width: 50px;height: 80px;"></a>
            </div>
            <div id="scroll1">
                <div id="scrollImg4">
                    <a href="javaScript:;"><img src="<%=request.getContextPath()%>/static/images/4.jpg" width="100%" height="450px"></a>
                </div>
                <div id="scrollImg3">
                    <a href="javaScript:;"><img src="<%=request.getContextPath()%>/static/images/3.png" width="100%" height="450px"></a>
                </div>
                <div id="scrollImg2">
                    <a href="javaScript:;"><img src="<%=request.getContextPath()%>/static/images/2.jpg" width="100%" height="450px"></a>
                </div>
                <div id="scrollImg1">
                    <a href="javaScript:;"><img src="<%=request.getContextPath()%>/static/images/1.jpg" width="100%" height="450px"></a>
                </div>
            </div>
        </div>
    </div>
    <div id="hotBook">
        <div id="title">
            <p>热销书籍</p>
        </div>
        <div class="book">
            <div class="bookTop">
                <a href="<%=request.getContextPath()%>/shopping/book?bookId=1"><img src="<%=request.getContextPath()%>/static/images/book1.jpg"></a>
            </div>
            <div class="bookBottom">
                <div class="bookBottomTop">
                    <a href="<%=request.getContextPath()%>/shopping/book?bookId=1">恋情的终结（精装典藏版）（21次诺贝尔文学奖提名的</a>
                </div>
                <div class="bookBottomDiv1"> <div><p>¥41.00 </p> <a> ¥48.00</a> <span>新旧程度:</span> <span>全新</span></div> </div>
                <div class="bookBottomDiv2"><a href="<%=request.getContextPath()%>/shopping/book?bookId=1">购买</a></div>
            </div>
        </div>
        <div class="book">
            <div class="bookTop">
                <a href="<%=request.getContextPath()%>/shopping/book?bookId=2"><img src="<%=request.getContextPath()%>/static/images/book2.jpg"></a>
            </div>
            <div class="bookBottom">
                <div class="bookBottomTop">
                    <a href="<%=request.getContextPath()%>/shopping/book?bookId=2">孤独深处（本书收录郝景芳2016年雨果奖获奖作品）</a>
                </div>
                <div class="bookBottomDiv1"> <div><p>¥48.00 </p> <a> ¥50.00</a> <span>新旧程度:</span> <span>九成</span></div> </div>
                <div class="bookBottomDiv2"><a href="<%=request.getContextPath()%>/shopping/book?bookId=2">购买</a></div>
            </div>
        </div>
        <div class="book">
            <div class="bookTop">
                <a href=<%=request.getContextPath()%>/shopping/book?bookId=3><img src="<%=request.getContextPath()%>/static/images/book3.jpg"></a>
            </div>
            <div class="bookBottom">
                <div class="bookBottomTop">
                    <a href="<%=request.getContextPath()%>/shopping/book?bookId=3 ">一个人的朝圣</a>
                </div>
                <div class="bookBottomDiv1"> <div><p>¥23.00 </p> <a> ¥30.00</a> <span>新旧程度:</span> <span>九成</span></div> </div>
                <div class="bookBottomDiv2"><a href="<%=request.getContextPath()%>/shopping/book?bookId=3">购买</a></div>
            </div>
        </div>
        <div class="book">
            <div class="bookTop">
                <a href="<%=request.getContextPath()%>/shopping/book?bookId=4"><img src="<%=request.getContextPath()%>/static/images/book4.jpg"></a>
            </div>
            <div class="bookBottom">
                <div class="bookBottomTop">
                    <a href="<%=request.getContextPath()%>/shopping/book?bookId=4">一个叫欧维的男人决定去死（看哭全北欧的瑞典冠军小</a>
                </div>
                <div class="bookBottomDiv1"> <div><p>¥23.80 </p> <a> ¥30.00</a> <span>新旧程度:</span> <span>九成</span></div> </div>
                <div class="bookBottomDiv2"><a href="<%=request.getContextPath()%>/shopping/book?bookId=4">购买</a></div>
            </div>
        </div>
        <div class="book">
            <div class="bookTop">
                <a href="<%=request.getContextPath()%>/shopping/book?bookId=5"><img src="<%=request.getContextPath()%>/static/images/book5.jpg"></a>
            </div>
            <div class="bookBottom">
                <div class="bookBottomTop">
                    <a href="<%=request.getContextPath()%>/shopping/book?bookId=5">余华短篇小说全集：我没有自己的名字（珍藏版）</a>
                </div>
                <div class="bookBottomDiv1"> <div><p>¥25.80 </p> <a> ¥30.00</a> <span>新旧程度:</span> <span>九成</span></div> </div>
                <div class="bookBottomDiv2"><a href="<%=request.getContextPath()%>/shopping/book?bookId=5">购买</a></div>
            </div>
        </div>
        <div class="book">
            <div class="bookTop">
                <a href="<%=request.getContextPath()%>/shopping/book?bookId=6"><img src="<%=request.getContextPath()%>/static/images/book6.jpg"></a>
            </div>
            <div class="bookBottom">
                <div class="bookBottomTop">
                    <a href="<%=request.getContextPath()%>/shopping/book?bookId=6">东野圭吾畅销经典套装（共4册）</a>
                </div>
                <div class="bookBottomDiv1"> <div><p>¥28.00 </p> <a> ¥40.00</a> <span>新旧程度:</span> <span>全新</span></div> </div>
                <div class="bookBottomDiv2"><a href="<%=request.getContextPath()%>/shopping/book?bookId=6">购买</a></div>
            </div>
        </div>
        <div class="book">
            <div class="bookTop">
                <a href="<%=request.getContextPath()%>/shopping/book?bookId=7"><img src="<%=request.getContextPath()%>/static/images/book7.jpg"></a>
            </div>
            <div class="bookBottom">
                <div class="bookBottomTop">
                    <a href="<%=request.getContextPath()%>/shopping/book?bookId=7">那不勒斯四部曲：新名字的故事</a>
                </div>
                <div class="bookBottomDiv1"> <div><p>¥27.00 </p> <a> ¥50.00</a> <span>新旧程度:</span> <span>全新</span></div> </div>
                <div class="bookBottomDiv2"><a href="<%=request.getContextPath()%>/shopping/book?bookId=7">购买</a></div>
            </div>
        </div>
        <div class="book">
            <div class="bookTop">
                <a href="<%=request.getContextPath()%>/shopping/book?bookId=8"><img src="<%=request.getContextPath()%>/static/images/book8.jpg"></a>
            </div>
            <div class="bookBottom">
                <div class="bookBottomTop">
                    <a href="<%=request.getContextPath()%>/shopping/book?bookId=8">假面饭店（东野圭吾出道25周年纪念珍藏版）</a>
                </div>
                <div class="bookBottomDiv1"> <div><p>¥38.00 </p> <a> ¥40.00</a> <span>新旧程度:</span> <span>全新</span></div> </div>
                <div class="bookBottomDiv2"><a href="<%=request.getContextPath()%>/shopping/book?bookId=8">购买</a></div>
            </div>
        </div>
        <div class="book">
            <div class="bookTop">
                <a href="<%=request.getContextPath()%>/shopping/book?bookId=9"><img src="<%=request.getContextPath()%>/static/images/book9.jpg"></a>
            </div>
            <div class="bookBottom">
                <div class="bookBottomTop">
                    <a href="<%=request.getContextPath()%>/shopping/book?bookId=9">现当代长篇小说经典系列：白鹿原</a>
                </div>
                <div class="bookBottomDiv1"> <div><p>¥36.00 </p> <a> ¥40.00</a> <span>新旧程度:</span> <span>九成</span></div> </div>
                <div class="bookBottomDiv2"><a href="<%=request.getContextPath()%>/shopping/book?bookId=9">购买</a></div>
            </div>
        </div>
        <div class="book">
            <div class="bookTop">
                <a href="<%=request.getContextPath()%>/shopping/book?bookId=10"><img src="<%=request.getContextPath()%>/static/images/book10.jpg"></a>
            </div>
            <div class="bookBottom">
                <div class="bookBottomTop">
                    <a href="<%=request.getContextPath()%>/shopping/book?bookId=10">王小波文集八卷本</a>
                </div>
                <div class="bookBottomDiv1"> <div><p>¥32.00 </p> <a> ¥48.00</a> <span>新旧程度:</span> <span>全新</span></div> </div>
                <div class="bookBottomDiv2"><a href="<%=request.getContextPath()%>/shopping/book?bookId=10">购买</a></div>
            </div>
        </div>

    </div>
</div>
<div id="BottomIntroduction">
    <div id="BottomIntroductionCon">
        <div id="bottomIntroductionMiddle">
            <div class="bottomMiddle">
                <ul class="bottomMiddleUL">
                    <li ><a href="#" class="bottomMiddleULA">商家服务</a>
                        <ul class="bottomMiddleUL1">
                            <li>
                                <a href="#">商家中心</a>
                            </li>
                            <li>
                                <a href="#">运营服务</a>
                            </li>
                            <li>
                                <a href="#">运营中心</a>
                            </li>
                            <li>
                                <a href="#">运营维护</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="bottomMiddle">
                <ul class="bottomMiddleUL">
                    <li ><a href="#" class="bottomMiddleULA">在线购买</a>
                        <ul class="bottomMiddleUL1">
                            <li>
                                <a href="#">书籍</a>
                            </li>
                            <li>
                                <a href="#">出售</a>
                            </li>
                            <li>
                                <a href="#">购买指南</a>
                            </li>
                            <li>
                                <a href="#">购买保障服务</a>
                            </li>
                            <li>
                                <a href="#">官网授权网店</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="bottomMiddle">
                <ul class="bottomMiddleUL">
                    <li ><a  class="bottomMiddleULA" href="#">服务</a>
                        <ul class="bottomMiddleUL1">
                            <li>
                                <a href="#">购买流程</a>
                            </li>
                            <li>
                                <a href="#">物流查询</a>
                            </li>
                            <li>
                                <a href="#">产品相关</a>
                            </li>
                            <li>
                                <a href="#">服务政策</a>
                            </li>
                            <li>
                                <a href="#">服务网点查询</a>
                            </li>

                        </ul>
                    </li>
                </ul>
            </div>
            <div class="bottomMiddle">
                <ul class="bottomMiddleUL">
                    <li ><a class="bottomMiddleULA" href="#">会员</a>
                        <ul class="bottomMiddleUL1">
                            <li>
                                <a href="#">会员注册</a>
                            </li>
                            <li>
                                <a href="#">会员登陆</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>

        </div>
       
</div>
</body>
</html>