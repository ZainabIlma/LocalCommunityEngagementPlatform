<%@page import="com.net.DAO.AnnouncementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="obj" class="com.net.Bean.AnnouncementBean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj"/>
	
	<%
	
	int Status= AnnouncementDAO.AddAnnouncement(obj);
	if(Status>0){
		out.print("<script> alert('Announcement published Successfully');window.open('announcement.jsp','-self');</script>");
		
		
	}
	else if(Status==0){
		
		out.print("<script> alert('Announcement publishing failed');</script>");
		
	}
	%>
</body>
</html>