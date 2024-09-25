<%@page import="com.net.DAO.NewsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>News Details</title>
    <link rel="stylesheet" type="text/css" href="../Css/style.css">
    <style>
        /* Container styling */
        .container {
            max-width: 800px;
            margin: 20px auto;
            background: #e7f5e7;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Page content styling */
        .pagecontent {
            padding: 20px;
        }

        /* Headings */
        h1 {
            text-align: center;
            font-size: 2.5rem;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        h2 {
            font-size: 2rem;
            color: #4CAF50;
            margin-bottom: 10px;
        }

        /* Image styling */
        .news-image {
            width: 100%;
            height: auto;
            max-height: 400px;
            margin-bottom: 20px;
            border-radius: 10px;
            object-fit: cover;
        }

        /* Form input styling */
        input[type="text"],
        input[type="file"],
        textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #4CAF50;
            border-radius: 5px;
            background-color: #fff;
        }

        /* Button styling */
        button {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
        }

        button:hover {
            background-color: #45a049;
        }

    </style>
</head>
<body class="bg-info">
<%@ include file="headSide.html" %>

<div class="container">
   <%
   int id = Integer.parseInt(request.getParameter("nid"));

   ResultSet rs = NewsDAO.ShowNews(id);
   rs.next();
   		int nid = rs.getInt("nid");
		String ntitle = rs.getString("ntitle");
		String nimage = rs.getString("nimage");
		String ncon = rs.getString("ncon");
		String nauthor = rs.getString("nauthor");
   %>    
  
  <div class="container pagecontent">
      <h1>News Details</h1>
      <h2><%= ntitle %></h2>
      <img src="../eventimg/<%= nimage %>" alt="News Image" class="news-image">
      <p><strong>Content:</strong></p>
      <p><%= ncon %></p>
      <p><strong>Author:</strong> <%= nauthor %></p>
  </div>
</div>

<%@ include file="foot.html" %>

</body>
</html>
