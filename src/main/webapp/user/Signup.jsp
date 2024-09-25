<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.net.DAO.UserDAO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="obj" class="com.net.Bean.UserBean"></jsp:useBean>
<jsp:setProperty property="*" name="obj"/>
<%
	out.print("hello in bean page");
%>
<%
	int status=UserDAO.Register(obj);
	if(status>0){
		// out.print("<br> Registration Success");
		out.print("<script> alert('Registration Success'); window.open('index.html','_self')</script>");
		
		
	}
	else{
		//out.print("<br> Registration failed");
		out.print("<script> alert('Registration Failed'); window.open('index.html','_self') </script>");

	}
%>
</body>
</html>