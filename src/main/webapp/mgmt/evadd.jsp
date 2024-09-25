<%@page import="com.net.DAO.EventDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="obj" class="com.net.Bean.EventBean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj"/>
	
	
	<%
	
	int Status= EventDAO.AddEvent(obj);
	if(Status>0){
		out.print("<script> alert('Event Added Successfully');window.open('event.jsp','-self');</script>");
		
		
	}
	else if(Status==0){
		
		out.print("<script> alert('Event add failed');window.open('event.jsp','-self');</script>");
		
	}
	%>
</body>
</html>