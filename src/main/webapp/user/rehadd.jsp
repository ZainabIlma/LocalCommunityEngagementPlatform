<%@page import="com.net.DAO.ReventhDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="obj" class="com.net.Bean.ReventhBean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj"/>
	
	
	<%
	
	int Status= ReventhDAO.Add(obj);
	if(Status>0){
		out.print("<script> alert('Event Hall Request sent');"+
		"window.open('resources.jsp','-self');</script>");
		
		
	}
	else if(Status==0){
		
		out.print("<script> alert('Event Hall Request failed');"+
		"window.open('resources.jsp','-self');</script>");
		
	}
	%>
</body>
</html>