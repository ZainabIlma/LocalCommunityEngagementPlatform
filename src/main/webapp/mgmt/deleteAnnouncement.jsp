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

<%
int id = Integer.parseInt(request.getParameter("aid"));

   int delStatus = AnnouncementDAO.Delete(id);

   if(delStatus == 1)
   {
  out.print("<script> alert('Record Deleted Successfully..');"  
   + "window.open('announcement.jsp','_self');</script>");

   }
   else if(delStatus == 0){
	   out.print("<script> alert('Record Deletion failed..');"  
			   + "window.open('announcement.jsp','_self');</script>");
   }
%>
</body>
</html>