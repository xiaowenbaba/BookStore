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
			var url="<%=request.getContextPath()%>/shopping/backBookInsert";
			 var bookName=$("#bookName").val()
			 var bookAuthor=$("#bookAuthor").val()
			 var bookSelling=$("#bookSelling").val()
			 var bookStorage=$("#bookStorage").val()
			 var isbnId=$("#isbnId").val()
			 var bookPrice=$("#bookPrice").val()
			 var bookDegree=$("#bookDegree").val()
			 var bookProperty=$("#bookProperty").val()
			 var bookPublish= $("#bookPublish").val()
			 var bookType=$("#bookTypeId option:selected")
			 var bookTypeId=bookType.val()
			  if(bookType.val()=="请选择"){
				  bookTypeId=null;
			  }
			 $.get(url,{bookName:bookName,bookAuthor:bookAuthor,bookSelling:bookSelling,bookStorage:bookStorage,
				 isbnId:isbnId,bookPrice:bookPrice,bookDegree:bookDegree,bookProperty:bookProperty,bookPublish:bookPublish,bookTypeId:bookTypeId},function(data){
	        	 alert(data)
	        	if(data=="插入成功！"){
	        		window.location.replace("<%=request.getContextPath()%>/shopping/backBookQuery")
	        	}
	          },'json');
			
		})
		
		var url="<%=request.getContextPath()%>/shopping/selectBookType"
			  $.get(url,{},function(data){
	        	  $.each(data,function(index,item){
	        		  $("#bookTypeId").append("<option value="+item.bookTypeId+">"+item.bookTypeName+"</option>")
	        	  });
	          },'json');
		
		
		
		
		
		
	})
</script>
<body>
    <div id="modifyContain">
        <div id="modifyTitle">
            <span>插入书籍信息</span>
        </div>
        <div id="modify">
            <div class="modifyDiv">
                <span>书籍名称:</span>
                <input id="bookName" type="text"  name="bookName" placeholder="请输入书籍名称">
            </div>
            <div class="modifyDiv">
                <span>图书类型:</span>
                <select id="bookTypeId" name="bookTypeId" style="width: 100px; ">
               		<option >请选择</option>
                </select>
            </div>
               <div class="modifyDiv">
                <span style="display: inline-block ;margin-left: 32px">作者:</span>
                <input id="bookAuthor" type="text"   name="bookAuthor" placeholder="请输入作者">
            </div>
            <div class="modifyDiv">
                <span style="display: inline-block ;margin-left: 32px">价格:</span>
                <input id="bookSelling" type="text" name="bookSelling" placeholder="请输入价格" >
            </div>
             <div class="modifyDiv">
                <span style="display: inline-block ;margin-left: 32px">库存:</span>
                <input id="bookStorage" type="text"  name="bookStorage" placeholder="请输入库存"  ">
            </div>
            <div class="modifyDiv">
                <span style="display: inline-block ;margin-left: ">ISBN_ID:</span>
                <input id="isbnId" type="text"   name="isbnId" placeholder="请输入ISBN编号">
            </div>
            
            <div class="modifyDiv">
                <span style="display: inline-block ;margin-left: 32px">原价:</span>
                <input  id="bookPrice" type="text"   name="bookPrice" placeholder="请输入原价">
            </div>
            
            <div class="modifyDiv">
                <span style="display: inline-block ;margin-left: ">新旧程度:</span>
                <input id="bookDegree" type="text"   name="bookDegree" placeholder="请输入新旧程度">
                
            </div>
            
            <div class="modifyDiv">
                <span style="display: inline-block ;margin-left: ">图书性质:</span>
                <input id="bookProperty" type="text"   name="bookProperty" placeholder="请输入图书性质">
            </div>
            
            <div class="modifyDiv">
                <span style="display: inline-block ;margin-left: 14px">出版社:</span>
                <input id="bookPublish" type="text"   name="bookPublish" placeholder="请输入出版社">
            </div>
            
            <div class="modifyDiv">
                <a id="save" href="#" style="margin-left: 110px">插入数据</a>
                <a href="<%=request.getContextPath()%>/shopping/backBookQuery">返回</a>
            </div>
        </div>
    </div>
</body>
</html>