<%@page import="com.net.DAO.AnnouncementDAO"%>
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
   
   int id = Integer.parseInt(request.getParameter("aid"));

//out.print(un);
   ResultSet rs = AnnouncementDAO.ShowAnnoncement(id);
   rs.next();
   		int aid=rs.getInt("aid");
		String atitle= rs.getString("atitle");
		String adate= rs.getString("adate");
		String atime= rs.getString("atime");
		String acon= rs.getString("acon");
		String aauthor= rs.getString("aauthor");	
   %>    
  <div class="container pagecontent">
  <h1 class="">Update Announcement Page</h1>
        <form class="aform" id="announcement-form" method="post" action="updtAnnouncement.jsp">
        	<input type="number"  name="aid" value="<%= aid %>" readonly>    	
            <input type="text" placeholder="Announcement Title" name="atitle" value="<%=atitle %>" required>
            <input type="date"  required name="adate" value="<%=adate %>">
            <input type="time"  required name="atime" value="<%=atime %>"> 
            <textarea placeholder="content" rows="5" name="acon" required ><%= acon %></textarea>
            <input type="text" placeholder="author" required name="aauthor" value="<%= aauthor %>">
            <input type="submit" value="Update Record">
        </form>
   </div>

</div>


<%@ include file="foot.html" %>

</body>
</html>