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
<body>
<%@include file="headSide.html" %>
	<%  int i=1; %>
	<div class=" container pagecontent">
        
        <h3>Publish Announcement:</h3>
        <form class="aform" id="event-form" method="post" action="acadd.jsp">
            <input type="text" placeholder="Announcement Title" name="atitle" required>
            <input type="date"  required name="adate">
            <input type="time"  required name="atime">
            <textarea placeholder="Content" rows="5" name="acon" required></textarea>
            <input type="text" placeholder="Place" required name="aauthor">
            
            <input type="submit" value="Submit">
        </form>
        <h2>Recent Announcements:</h2>
        <table class="alist ">
  <thead>
    <tr>
      <th scope="col" >S.No</th>
      <th scope="col" class="ttitle">Title</th>
      <th scope="col"  class="adate">Date</th>
      <th scope="col"  class="atime">Time</th>     
      <th scope="col" class="aloc">Author</th>
      <th scope="col">Operations</th>
    </tr>
  </thead>
  <tbody>
	<% 
  	ResultSet rs=null;%>
  	<% 
  	rs= AnnouncementDAO.ViewAnnouncement();
  	
  	while(rs.next()){
  		int aid=rs.getInt("aid");
  		String atitle= rs.getString("atitle");
  		String adate= rs.getString("adate");
  		String atime=rs.getString("atime");
  		String aauthor= rs.getString("aauthor");

  	
  	%>
  	<tr>	<td><%= i %></td>
            <td><%= atitle %></td>
            <td><%= adate %></td> 
            <td><%=atime %></td>
            <td><%= aauthor %></td>   
     
            <td>
            <button class="Updateaction" ><a href='updateAnnouncement.jsp?aid=<%= aid %>' > Update </a></button>
            <button class="Deleteaction"><a href='deleteAnnouncement.jsp?aid=<%= aid %>' >Delete</a></button> 
            
        </td> 
     </tr>
  	<% 
  	i++;
  	}
  	%>
  </tbody>
</table>
      </div>
           <%@ include file="foot.html" %>
      
</body>
</html>