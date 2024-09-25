<%@page import="com.net.DAO.EventDAO"%>
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
   
   int id = Integer.parseInt(request.getParameter("eid"));

//out.print(un);
   ResultSet rs = EventDAO.ShowEvent(id);
   rs.next();
   		int eid=rs.getInt("eid");
		String ename= rs.getString("ename");
		String edate= rs.getString("edate");
		String etime= rs.getString("etime");
		String eimage= rs.getString("eimage");
		String edesc= rs.getString("edesc");
		String eplace= rs.getString("eplace");
		String eorg= rs.getString("eorg");
		
    	
       
   %>    
  
  <div class=" container pagecontent">
  
  <h1 class="">Update Event Page</h1>
 
   
        
        
        <form class="aform" id="event-form" method="post" action="updtEvent.jsp">
        	<input type="number"  name="eid" value="<%= eid %>" readonly>    	
            <input type="text" placeholder="Event Name" name="ename" value="<%=ename %>" required>
            <input type="date"  required name="edate" value="<%=edate %>">
            <input type="time"  required name="etime" value="<%=etime %>"> 
            <input type="file" placeholder="Media" required name="eimage" value="<%=eimage %>">
            <textarea placeholder="Discription" rows="5" name="edesc" required ><%=edesc %></textarea>
            <input type="text" placeholder="Place" required name="eplace" value="<%=eplace %>">
            <input type="text" placeholder="Organiser" required name="eorg" value="<%=eorg %>">
            
            <input type="submit" value="Update Record">
        </form>
   </div>

</div>


<%@ include file="foot.html" %>

</body>
</html>