<%@page import="com.net.DAO.RmaintenanceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="obj" class="com.net.Bean.RmaintenanceBean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj"/>
	
	
	<%
	
	int Status= RmaintenanceDAO.Add(obj);
	if(Status>0){
		out.print("<script> alert('Maintenance Request sent');window.open('resources.jsp','-self');</script>");
		
		
	}
	else if(Status==0){
		
		out.print("<script> alert('Maintenance Request failed');window.open('resources.jsp','-self');</script>");
		
	}
	%>
</body>
</html>