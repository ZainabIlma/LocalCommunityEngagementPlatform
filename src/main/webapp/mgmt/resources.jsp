<%@page import="com.net.DAO.RparkDAO"%>
<%@page import="com.net.DAO.ReventhDAO"%>
<%@page import="com.net.DAO.RmaintenanceDAO"%>
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
        
        <h3>Maintenance Requests:</h3>
        
        <table class="table-container">
  <thead>
    <tr>
      <th scope="col" >S.No</th>
      <th scope="col"  class="adate">Date</th>
      <th scope="col"  class="atime">Time</th> 
      <th scope="col" class="ttitle">Service</th>    
      <th scope="col" class="aloc">Contact</th>
      <th scope="col">Operations</th>
    </tr>
  </thead>
  <tbody>
	<% 
  	ResultSet rs=null;%>
  	<% 
  	rs= RmaintenanceDAO.View();
  	
  	while(rs.next()){
  		int rmid=rs.getInt("rmid");
  		String rmdate= rs.getString("rmdate");
  		String rmtime=rs.getString("rmtime");
  		String rmservice= rs.getString("rmservice");
  		String rmcontact= rs.getString("rmcontact");

  	
  	%>
  	<tr>	<td><%= i %></td>
            <td><%= rmdate %></td> 
            <td><%=rmtime %></td>
            <td><%= rmservice %></td>
            <td><%= rmcontact %></td>   
     
            <td>
            <button class="Deleteaction"><a href='deleteRmaintenance.jsp?rmid=<%= rmid %>' >Done</a></button> 
            
        </td> 
     </tr>
  	<% 
  	i++;
  	}
  	%>
  </tbody>
</table>
      
      
      <h3>Event Hall Requests:</h3>
        
        <table class="table-container">
  <thead>
    <tr>
      <th scope="col" >S.No</th>
      <th scope="col"  class="adate">Date</th>
      <th scope="col"  class="atime">Time</th> 
      <th scope="col" class="ttitle">Program</th>    
      <th scope="col" class="aloc">Contact</th>
      <th scope="col">Operations</th>
    </tr>
  </thead>
  <tbody>
	<% 
  	ResultSet rs1=null;%>
  	<% 
  	rs1= ReventhDAO.View();
  	
  	while(rs1.next()){
  		int rehid=rs1.getInt("rehid");
  		String rehdate= rs1.getString("rehdate");
  		String rehtime=rs1.getString("rehtime");
  		String rehprogram= rs1.getString("rehprogram");
  		String rehcontact= rs1.getString("rehcontact");	
  	%>
  	<tr>	<td><%= i %></td>
            <td><%= rehdate %></td> 
            <td><%=rehtime %></td>
            <td><%= rehprogram %></td>
            <td><%= rehcontact %></td>        
            <td>
            <button class="Deleteaction">
            <a href='deleteReventh.jsp?rehid=<%= rehid %>' >
            Done</a></button>            
        </td> 
     </tr>
  	<% 
  	i++;
  	}
  	%>
  </tbody>
</table>
    <h3>Parking Requests:</h3>
        
        <table class="table-container">
  <thead>
    <tr>
      <th scope="col" >S.No</th>
      <th scope="col"  class="adate">Date</th>
      <th scope="col"  class="atime">Time</th> 
      <th scope="col" class="ttitle">No. of parkings</th>    
      <th scope="col" class="aloc">Contact</th>
      <th scope="col">Operations</th>
    </tr>
  </thead>
  <tbody>
	<% 
  	ResultSet rs2=null;%>
  	<% 
  	rs2= RparkDAO.View();
  	
  	while(rs2.next()){
  		int rpid=rs2.getInt("rpid");
  		String rpdate= rs2.getString("rpdate");
  		String rptime=rs2.getString("rptime");
  		String rpnum= rs2.getString("rpnum");
  		String rpcontact= rs2.getString("rpcontact");

  	
  	%>
  	<tr>	<td><%= i %></td>
            <td><%= rpdate %></td> 
            <td><%=rptime %></td>
            <td><%= rpnum %></td>
            <td><%= rpcontact %></td>   
     
            <td>
            <button class="Deleteaction"><a href='deleteRpark.jsp?rpid=<%= rpid %>' >Done</a></button> 
            
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