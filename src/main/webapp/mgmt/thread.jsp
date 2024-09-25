<%@page import="com.net.DAO.ThreadDAO"%>
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
        
        <h3>Create Thread:</h3>
        <form class="aform" id="event-form" method="post" action="thadd.jsp">
            <input type="text" placeholder="Thread Title" name="ttitle" required>
            <input type="text" placeholder="Author" required name="tauthor">
            <input type="file" placeholder="image" name="timage">
            <input type="submit" value="Submit">
        </form>
        <h2>Recent Threads:</h2>
        <table class="alist ">
  <thead>
    <tr>
      <th scope="col" >S.No</th>
      <th scope="col" class="ttitle">Title</th>
      <th scope="col"  class="adate">Date and time</th>
      <th scope="col" class="aloc">Author</th>
      <th scope="col">Operations</th>
    </tr>
  </thead>
  <tbody>
	<% 
  	ResultSet rs=null;%>
  	<% 
  	rs= ThreadDAO.ViewThreads();
  	
  	while(rs.next()){
  		int tid=rs.getInt("tid");
  		String ttitle= rs.getString("ttitle");
  		String tdate= rs.getString("ttimestamp");
  		String tauthor= rs.getString("tauthor");

  	
  	%>
  	<tr>	<td><%= i %></td>
            <td><%= ttitle %></td>
            <td><%= tdate %></td> 
            <td><%= tauthor %></td>   
     
            <td>
            <button class="Updateaction" ><a href='ViewThread.jsp?tid=<%= tid %>' > View </a></button>
            <button class="Deleteaction"><a href='deleteThread.jsp?tid=<%= tid %>' >Delete</a></button> 
            
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