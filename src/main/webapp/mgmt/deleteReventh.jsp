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

<%
int id = Integer.parseInt(request.getParameter("rehid"));

   int delStatus = ReventhDAO.Delete(id);

   if(delStatus == 1)
   {
  out.print("<script> alert('Request Resolved..');"  
   + "window.open('resources.jsp','_self');</script>");

   }
   else if(delStatus == 0){
	   out.print("<script> alert('failed..');"  
			   + "window.open('resources.jsp','_self');</script>");
   }
%>
</body>
</html>