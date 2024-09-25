<%@page import="com.net.DAO.LocalbsnsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="obj" class="com.net.Bean.LocalbsnsBean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj"/>
	<jsp:getProperty property="lid" name="obj"/>
	<jsp:getProperty property="ltitle" name="obj"/>
	<jsp:getProperty property="ldate" name="obj"/>
	<jsp:getProperty property="lloc" name="obj"/>
	<jsp:getProperty property="limage" name="obj"/>
	
	<%
	
	int Status= LocalbsnsDAO.AddLocalbsns(obj);
	if(Status>0){
		out.print("<script> alert('Business Added to Spotlight');window.open('localbsns.jsp','-self');</script>");
		
		
	}
	else if(Status==0){
		
		out.print("<script> alert('failed')</script>");
		
	}
	%>
</body>
</html>