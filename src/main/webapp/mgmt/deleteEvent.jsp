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

<%
int id = Integer.parseInt(request.getParameter("eid"));

   int delStatus = EventDAO.Delete(id);

   if(delStatus == 1)
   {
  out.print("<script> alert('Record Delete Success..');"  
   + "window.open('event.jsp','_self');</script>");

   }
   else if(delStatus == 0){
	   out.print("<script> alert('Record Delete failed..');"  
			   + "window.open('event.jsp','_self');</script>");
   }
%>
</body>
</html>