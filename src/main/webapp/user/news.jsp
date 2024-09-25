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
<body>
<%@include file="headSide.html" %>
	<%  int i=1; %>
	<div class=" container pagecontent">
        
        
        <h2>latest news</h2>
        <table class="alist ">
  <thead>
    <tr>
      <th scope="col" >S.No</th>
      <th scope="col" class="ttitle">Title</th>
      <th scope="col"  class="adate">Date</th>
      <th scope="col"  class="atime">Time</th>
      <th scope="col"  class="eimg">Media</th>
      <th scope="col" class="aloc">Author</th>
      <th scope="col">Operations</th>
    </tr>
  </thead>
  <tbody>
	<% 
  	ResultSet rs=null;%>
  	<% 
  	rs= NewsDAO.ViewNews();
  	
  	while(rs.next()){
  		int nid=rs.getInt("nid");
  		String ntitle= rs.getString("ntitle");
  		String ndate= rs.getString("ndate");
  		String ntime= rs.getString("ntime");
  		String nimg=rs.getString("nimage");
  		String nauthor= rs.getString("nauthor");

  	
  	%>
  	<tr>	<td><%= i %></td>
            <td><%= ntitle %></td>
            <td><%= ndate %></td> 
            <td><%= ntime %></td> 
            <td><img src="../eventimg/<%=nimg %>" ></td>
            <td><%= nauthor %></td>   
     
            <td>
            <button class="Updateaction" ><a href='ViewNews.jsp?nid=<%= nid %>' > View </a></button>
            
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