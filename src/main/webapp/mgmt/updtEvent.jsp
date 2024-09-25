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
<jsp:useBean id="obj" class="com.net.Bean.EventBean"></jsp:useBean>
<jsp:setProperty property="*" name="obj"/>
<jsp:getProperty property="eid" name="obj"/>
<jsp:getProperty property="ename" name="obj"/>
<jsp:getProperty property="edate" name="obj"/>

<jsp:getProperty property="etime" name="obj"/>

<jsp:getProperty property="eimage" name="obj"/>

<jsp:getProperty property="edesc" name="obj"/>

<jsp:getProperty property="eplace" name="obj"/>

<jsp:getProperty property="eorg" name="obj"/>
<% 
int updateStatus = EventDAO.Update(obj);
     out.print(updateStatus);
   if(updateStatus == 1)
   {
  out.print("<script> alert('Record Update Success..');"  
   + "window.open('event.jsp','_self');</script>");

   }
   else if(updateStatus == 0){
	   out.print("<script> alert('Record Update failed..');"  
			   + "window.open('event.jsp','_self');</script>");
   }
   %>

</body>
</html>
