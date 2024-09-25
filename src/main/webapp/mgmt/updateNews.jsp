<%@page import="com.net.DAO.NewsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../Css/style.css">

</head>
<body class="bg-info">
<%@ include file="headSide.html" %>
<div class="container">
   <%
   
   int id = Integer.parseInt(request.getParameter("nid"));

//out.print(un);
   ResultSet rs = NewsDAO.ShowNews(id);
   rs.next();
   		int nid=rs.getInt("nid");
		String ntitle= rs.getString("ntitle");
		String nimage= rs.getString("nimage");
		String ncon= rs.getString("ncon");
		String nauthor= rs.getString("nauthor");
		
   %>    
  
  <div class="container pagecontent">
  
  <h1 class="">Update Event Page</h1>
 
   
        
        
        <form class="aform" id="event-form" method="post" action="updtNews.jsp">
        	<input type="number"  name="nid" value="<%= nid %>" readonly>    	
            <input type="text" placeholder="News Title" name="ntitle" value="<%=ntitle %>" required>
            <input type="file" placeholder="Media" required name="nimage" value="<%=nimage %>">
            <textarea placeholder="content" rows="5" name="ncon" required ><%= ncon %></textarea>
            <input type="text" placeholder="author" required name="nauthor" value="<%= nauthor %>">
            
            <input type="submit" value="Update Record">
        </form>
   </div>

</div>


<%@ include file="foot.html" %>

</body>
</html>