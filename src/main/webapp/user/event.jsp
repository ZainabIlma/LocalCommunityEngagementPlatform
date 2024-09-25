<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.*"%>
<%@page import="com.net.DAO.EventDAO"%>

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
        
        <h2>Upcoming Events:</h2>
        <table class="alist ">
  <thead>
    <tr>
      <th scope="col" >EVENT ID</th>
      <th scope="col" class="ttitle">Name</th>
      <th scope="col"  class="adate">Date</th>
      <th scope="col"  class="eimg">Poster</th>
      <th scope="col" class="aloc">Place</th>
      <th scope="col" class="aauthor">Organizer</th>
      <th scope="col">Operations</th>
    </tr>
  </thead>
  <tbody>
  	<% 
  	ResultSet rs=null;%>
  	<% 
  	rs= EventDAO.ViewEvent();
  	
  	while(rs.next()){
  		int eid=rs.getInt("eid");
  		String ename= rs.getString("ename");
  		String edate= rs.getString("edate");
  		String eimg=rs.getString("eimage");
  		String eplace= rs.getString("eplace");
  		String eorg= rs.getString("eorg");

  	
  	%>
  	<tr>	<td><%= eid %></td>
            <td><%= ename %></td>
            <td><%= edate %></td> 
            <td><img src="../eventimg/<%=eimg %>" ></td>
            <td><%= eplace %></td>   
            <td><%= eorg %></td>  
     
            <td>
            <button class="registeraction">
            <a href='ViewEvent.jsp?eid=<%= eid %>' >
            View</a></button> 
            
        </td> 
     </tr>
  	<% 
  	
  	}
  	%>
  </tbody>
</table>
      </div>
           <%@ include file="foot.html" %>
      
</body>
</html>