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
<body class="bg-info">
<%@ include file="headSide.html" %>
<div class="container">
   <%
   
   int id = Integer.parseInt(request.getParameter("lid"));

//out.print(un);
   ResultSet rs = LocalbsnsDAO.ShowLocalbsns(id);
   rs.next();
   		int lid=rs.getInt("lid");
		String ltitle= rs.getString("ltitle");
		String ldate= rs.getString("ldate");	
		String lloc= rs.getString("lloc");
		String limage= rs.getString("limage");
	  
   %>    
  
  <div class=" container pagecontent">
  
  <h1 class="">Update Business Spotlight </h1>
     
     <form class="aform" id="localbsns-form" method="post" action="updtLocalbsns.jsp">
        	<input type="number"  name="lid" value="<%= lid %>" readonly>    	
            <input type="text" placeholder="Business Name" name="ltitle" value="<%=ltitle %>" required>
            <input type="date"  required name="ldate" value="<%=ldate %>">
            <textarea placeholder="Discription" rows="5" name="lloc" required ><%=lloc %></textarea>
            <input type="file" placeholder="Media" required name="limage" value="<%=limage %>">
            
            <input type="submit" value="Update Record">
        </form>
   </div>

</div>


<%@ include file="foot.html" %>

</body>
</html>