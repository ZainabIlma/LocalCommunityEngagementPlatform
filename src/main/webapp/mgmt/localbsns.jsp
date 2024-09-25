<%@page import="com.net.DAO.LocalbsnsDAO"%>
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
	<div class="container pagecontent">
        
        <h3>Add new Business:</h3>
        <form class="aform" id="localbsns-form" method="post" action="lbadd.jsp">
            <input type="text" placeholder="Business title" name="ltitle" required>
            <input type="date"  required name="ldate">
            <input type="text" placeholder="Place" required name="lloc">
            <input type="file" placeholder="Image" required name="limage">
    
            <input type="submit" value="Submit">
        </form>
        <h2>Current Spotlight:</h2>
        <table class="alist ">
  <thead>
    <tr>
      <th scope="col" >S.No</th>
      <th scope="col" class="ttitle">Title</th>
      <th scope="col"  class="adate">Date</th>
      <th scope="col"  class="atime">Location</th>     
      <th scope="col" class="aloc">Poster</th>
      <th scope="col">Operations</th>
    </tr>
  </thead>
  <tbody>
	<% 
  	ResultSet rs=null;%>
  	<% 
  	rs= LocalbsnsDAO.ViewLocalbsns();
  	
  	while(rs.next()){
  		int lid=rs.getInt("lid");
  		String ltitle= rs.getString("ltitle");
  		String ldate= rs.getString("ldate");
  		String lloc=rs.getString("lloc");
  		String limage= rs.getString("limage");	
  	%>
  	<tr>	<td><%= i %></td>
            <td><%= ltitle %></td>
            <td><%= ldate %></td> 
            <td><%=lloc %></td>
            <td><img src="../eventimg/<%= limage %>" style="height:70px; width:70px;"></td>        
            <td>
            <button class="Updateaction" ><a href='updateLocalbsns.jsp?lid=<%= lid %>' > Update </a></button>
            <button class="Deleteaction"><a href='deleteLocalbsns.jsp?lid=<%= lid %>' >Delete</a></button>       
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