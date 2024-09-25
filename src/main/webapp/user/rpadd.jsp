<%@page import="com.net.DAO.RparkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="obj" class="com.net.Bean.RparkBean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj"/>
	
	
	<%
	
	int Status= RparkDAO.Add(obj);
	if(Status>0){
		out.print("<script> alert('Extra Parking Request sent');window.open('resources.jsp','-self');</script>");
		
		
	}
	else if(Status==0){
		
		out.print("<script> alert('Extra parking Request failed');window.open('resources.jsp','-self');</script>");
		
	}
	%>
</body>
</html>