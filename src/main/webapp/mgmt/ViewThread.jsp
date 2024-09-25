<%@page import="com.net.DAO.ThreadDAO"%>
<%@page import="com.net.DAO.ReplyDAO"%>
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
<%int tid=Integer.parseInt(request.getParameter("tid"));%>	
	<div class=" container pagecontent">
        <div class="threadhead">
        	<h3>Thread: <%=ThreadDAO.getThreadtitle(tid) %></h3>
        	<h4>Replies: <%= ReplyDAO.count(tid) %></h4>
        </div>
        <h1>Thread Replies</h1>
    <% ResultSet rs=null;
    int i=0;
    int replyCount= ReplyDAO.count(tid);
    while (i<replyCount) {  // Iterate through the ResultSet
    	
        String replyText = ReplyDAO.getReplyText(tid);  // Adjust column name as per your DB schema
        String replyTime = ReplyDAO.getReplyTime(tid);  // Adjust column name as per your DB schema
%>
        <div class="reply-container">
            <div class="reply">
                <p><strong>Reply:</strong> <%= replyText %></p>
                <p><em>Posted on: <%= replyTime %></em></p>
            </div>
        </div>
    <%
        }
    %>
    </div>    
           <%@ include file="foot.html" %>
      
</body>
</html>