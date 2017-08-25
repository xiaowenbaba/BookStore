<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台系统主页</title>
</head>
  <frameset rows="100px,*" border="2px" >
    	<frame src="backTop.jsp" name="top">
    	<frameset cols="220px,*" border="2px">
    		<frame  name="left" src="backLeft.jsp" noresize="noresize"/>
    		<frame  name="center" src="backCenter.jsp">
    	</frameset>
    </frameset>
</html>