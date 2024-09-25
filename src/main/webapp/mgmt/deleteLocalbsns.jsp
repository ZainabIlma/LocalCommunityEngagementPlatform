<%@page import="com.net.DAO.LocalbsnsDAO"%>
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
int id = Integer.parseInt(request.getParameter("lid"));

   int delStatus = LocalbsnsDAO.Delete(id);

   if(delStatus == 1)
   {
  out.print("<script> alert('Spotlight Deleted Success..');"  
   + "window.open('localbsns.jsp','_self');</script>");

   }
   else if(delStatus == 0){
	   out.print("<script> alert('Deletion failed..');"  
			   + "window.open('localbsns.jsp','_self');</script>");
   }
%>
</body>
</html>