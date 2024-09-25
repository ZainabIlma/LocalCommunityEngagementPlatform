<%@page import="com.net.DAO.ThreadDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="obj" class="com.net.Bean.ThreadBean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj"/>
	<jsp:getProperty property="tid" name="obj"/>
	<jsp:getProperty property="ttitle" name="obj"/>
	<jsp:getProperty property="timage" name="obj"/>
	
	<%
	
	int Status= ThreadDAO.AddThread(obj);
	if(Status>0){
		out.print("<script> alert('Thread created Successfully');window.open('thread.jsp','-self');</script>");
		
		
	}
	else if(Status==0){
		
		out.print("<script> alert('Thread creation failed'); window.open('thread.jsp','-self');</script>");
		
	}
	%>
</body>
</html>