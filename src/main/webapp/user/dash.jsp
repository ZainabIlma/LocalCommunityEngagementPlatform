<%@page import="com.net.DAO.LocalbsnsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.net.DAO.AnnouncementDAO"%>
<%@page import="com.net.DAO.ThreadDAO"%>
<%@page import="com.net.DAO.NewsDAO"%>
<%@page import="com.net.DAO.EventDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="../Css/style.css">

</head>
<body>
	<%@include file="headSide.html" %>
    <main class="main-content user-content">
     </div>
        <div class="carousel-container">
    <div class="carousel-slide">
        <img src="../eventimg/OIP (3).jpg" alt="Image 1">
        <img src="../eventimg/download (6).jpg" alt="Image 2">
        <img src="../eventimg/th (1).jpg" alt="Image 3">
    </div>
</div>

        
        
        <section class="summary">
            
            <div class="cards">
                <div class="card">
                    <h3 class="card-title">Upcoming Events</h3>
                    <p class="card-value"><%=EventDAO.count() %></p>
                </div>
                <div class="card">
                    <h3 class="card-title">Latest News</h3>
                    <p class="card-value"><%=NewsDAO.count() %></p>
                </div>
                <div class="card">
                    <h3 class="card-title">Active Threads</h3>
                    <p class="card-value"><%=ThreadDAO.count() %></p>
                </div>
                <div class="card">
                    <h3 class="card-title">Recent Announcements</h3>
                    <p class="card-value"><%=AnnouncementDAO.count() %></p>
                </div>
            </div>
        </section>
    </section>
    <div id="update-section">
    <section class="upcoming-events">
        <h2 class="section-title">Quick catchup</h2>
        <div class="uevents">
        	<a href="event.jsp" class="no-underline">
            	<div class="uevent">
	                <h3 class="uevent-title">New Event:<%=EventDAO.recent() %></h3>
	                <p class="uevent-content"><%=EventDAO.recentcon() %>...</p>
            	</div>
            </a>
            <a href="thread.jsp" class="no-underline">
            <div class="uevent">
                <h3 class="uevent-title">New Thread <%=ThreadDAO.recent() %></h3>
                <p class="uevent-content"><%=ThreadDAO.recentcon() %>...</p>
            </div>
            </a>
            
        </div>
    </section>
    <section class="latest-updates">
        <h2 class="section-title">Latest Updates</h2>
        <div class="updates">
        <a href="announcement.jsp" class="no-underline">
            <div class="update">
                <h3 class="update-title">New Announcement: <%=AnnouncementDAO.recent() %></h3>
                <p class="update-content"><%=AnnouncementDAO.recentcon() %>...</p>
            </div>
            </a>
            <a href="news.jsp" class="no-underline">
            <div class="update">
                <h3 class="update-title">News:<%=NewsDAO.recent() %> </h3>
                <p class="update-content"><%=NewsDAO.recentcon() %>...</p>
            </div>
            </a>
        </div>
    </section>
</div>

<div class="business-spotlight">
    <h2 class="section-title">Local Business Spotlight</h2>
    <% 
  	ResultSet rs;
  	int i=0;%>
  	<%
  	rs= LocalbsnsDAO.ShowBusnsSpotlight();
  	
  	while(rs.next() && i<3){
  		int lid=rs.getInt("lid");
  		String ltitle = rs.getString("ltitle");
  		String ldate= rs.getString("ldate");
  		String lloc= rs.getString("lloc");
  		String limage=rs.getString("limage");
  		

  	
  	%>
    <div class="business-cards">
        <div class="business-card">
            <img src="../eventimg/<%=limage %>" alt="Business 1">
            <div class="business-info">
                <h3 class="business-name"><%=ltitle %></h3>
                <p class="business-address"><%= lloc %></p>
            </div>
        </div>    
    </div>
</div>
<%}i++; %>
    </main>
    <%@ include file="foot.html" %>
    <script>
        
        
        const slide = document.querySelector('.carousel-slide');
        const images = document.querySelectorAll('.carousel-slide img');

        let counter = 0;
        const size = images[0].clientWidth;

        function moveCarousel() {
            counter++;
            if (counter >= images.length) {
                slide.style.transition = 'none'; // Disable transition for instant jump
                counter = 0; // Reset counter to start
                slide.style.transform = `translateX(0)`; // Move back to the first image
            } else {
                slide.style.transition = 'transform 0.5s ease-in-out'; // Re-enable smooth transition
                slide.style.transform = `translateX(${-size * counter}px)`; // Move to the next image
            }
        }

        // Start the carousel movement every 3 seconds
        setInterval(moveCarousel, 3000);

        // Optional: Adjust size if the window is resized
        window.addEventListener('resize', () => {
            size = images[0].clientWidth;
        });



    

    </script>
</body>
</html>