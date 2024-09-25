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
	String username = obj.getUname();
	session.setAttribute("username", username);
%>
<%
	int status=UserDAO.Login(obj);
	if(status>0){
		// out.print("<br> Registration Success");
		out.print("<script> alert('Login Success');" + "window.open('dash.jsp','_self');</script>");
		
		
	}
	else if (status==0){
		//out.print("<br> Registration failed");
		out.print("<script> alert('Login Failed, Invalid Credentials');window.open('index.html','_self') </script>");

	}
%>
</body>
</html>