<%@page import="com.net.DAO.NewsDAO"%>
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
int updateStatus = NewsDAO.Update(obj);
     out.print(updateStatus);
   if(updateStatus == 1)
   {
  out.print("<script> alert('Record Updated Successfully..');"  
   + "window.open('news.jsp','_self');</script>");

   }
   else if(updateStatus == 0){
	   out.print("<script> alert('Record Updation failed..');"  
			   + "window.open('news.jsp','_self');</script>");
   }
   %>

</body>
</html>
