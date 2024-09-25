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

<%
int id = Integer.parseInt(request.getParameter("tid"));

   int delStatus = ThreadDAO.Delete(id);

   if(delStatus == 1)
   {
  out.print("<script> alert('Thread Deleted Successfully..');"  
   + "window.open('thread.jsp','_self');</script>");

   }
   else if(delStatus == 0){
	   out.print("<script> alert('Thread Deletion failed..');"  
			   + "window.open('thread.jsp','_self');</script>");
   }
%>
</body>
</html>