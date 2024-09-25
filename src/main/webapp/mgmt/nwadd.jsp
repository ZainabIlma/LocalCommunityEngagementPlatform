<%@page import="com.net.DAO.NewsDAO"%>
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
	<jsp:useBean id="obj" class="com.net.Bean.NewsBean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj"/>
	
	
	<%
	
	int Status= NewsDAO.AddNews(obj);
	if(Status>0){
		out.print("<script> alert('News published Successfully');window.open('news.jsp','-self');</script>");
		
		
	}
	else if(Status==0){
		
		out.print("<script> alert('News publishing failed');window.open('news.jsp','-self');</script>");
		
	}
	%>
</body>
</html>