<%@page import="com.net.DAO.LocalbsnsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="obj" class="com.net.Bean.LocalbsnsBean"></jsp:useBean>
<jsp:setProperty property="*" name="obj"/>
<jsp:getProperty property="lid" name="obj"/>
<jsp:getProperty property="ltitle" name="obj"/>
<jsp:getProperty property="ldate" name="obj"/>


<jsp:getProperty property="limage" name="obj"/>



<jsp:getProperty property="lloc" name="obj"/>
<% 
int updateStatus = LocalbsnsDAO.Update(obj);
     out.print(updateStatus);
   if(updateStatus == 1)
   {
  out.print("<script> alert('Record Update Success..');"  
   + "window.open('localbsns.jsp','_self');</script>");

   }
   else if(updateStatus == 0){
	   out.print("<script> alert('Record Update failed..'); </script>");
			   //+ "window.open('localbsns.jsp','_self');
   }
   %>

</body>
</html>
