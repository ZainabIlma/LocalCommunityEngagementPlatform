<%@page import="com.net.DAO.ThreadDAO"%>
<%@page import="com.net.DAO.EventDAO"%>
<%@page import="com.net.DAO.NewsDAO"%>
<%@page import="com.net.DAO.AnnouncementDAO"%>
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
<%@ include file="headSide.html" %>
<main class="main-content admin-content">
        <section class="summary">
            
            <div class="cards">
                <div class="card">
                    <h3 class="card-title">Total Events</h3>
                    <p class="card-value"><%=EventDAO.count() %></p>
                </div>
                <div class="card">
                    <h3 class="card-title">Total News</h3>
                    <p class="card-value"><%=NewsDAO.count() %></p>
                </div>
                <div class="card">
                    <h3 class="card-title">Total Threads</h3>
                    <p class="card-value"><%=ThreadDAO.count() %></p>
                </div>
                <div class="card">
                    <h3 class="card-title">Total Announcements</h3>
                    <p class="card-value"><%=AnnouncementDAO.count() %></p>
                </div>
            </div>
        </section>
        <section class="latest-updates">
            <h2 class="section-title">Latest Updates</h2>
            <div class="updates">
                <a href="announcement.jsp" class="no-underline">
                <div class="update">
                    <h3 class="update-title">Recent Announcement : <%=AnnouncementDAO.recent() %></h3>
                    <p class="update-content">  <%=AnnouncementDAO.recentcon() %>...</p>
                </div></a>
                <a href="news.jsp" class="no-underline"><div class="update">
                    <h3 class="update-title">Latest News : <%=NewsDAO.recent()%></h3>
                    <p class="update-content">  <%=NewsDAO.recentcon() %>...</p>
                </div></a>
            </div>
        </section>
       </main> 
     <%@ include file="foot.html" %>
     
</body>
</html>