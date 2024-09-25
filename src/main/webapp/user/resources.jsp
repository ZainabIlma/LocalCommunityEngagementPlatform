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
	<%@ include file="headSide.html" %>
	
        
        <div class=" container pagecontent">
        <section class="btnsec">
            <button id="mainbtn" class="rbtn" class="hidden">Maintenance</button>
            <button id="evntbtn" class="rbtn" class="hidden">Event Halls</button>
            <button id="exparkbtn" class="rbtn" class="hidden">Extra Parking</button>
        </section>
        <section>
            <form id="maintenance-form" class="hidden aform" method="post" action="rmadd.jsp">
                <input type="text" placeholder="Service Required" required name="rmservice">
                <input type="date" placeholder="Date" name="rmdate" required>
                <input type="time" placeholder="Time" name="rmtime" required>
                <input type="text" placeholder="Contact" name="rmcontact" required>
                <input type="submit" value="Submit">
            </form>
        
            <form id="eventHall-form" class="hidden aform" method="post" action="rehadd.jsp">
                <input type="text" placeholder="Event Name" name="rehprogram" required>
                <input type="date" placeholder="Date" name="rehdate" required>
                <input type="time" placeholder="Time" name="rehtime" required>
                <input type="number" placeholder="Contact" name="rehcontact" required>
                <input type="submit" value="Submit">
            </form>
        
            <form id="extraParking-form" class="hidden aform" method="post" action="rpadd.jsp">
                <input type="number" placeholder="Number of parking" name="rpnum" required>
                <input type="date" placeholder="Date" name="rpdate" required>
                <input type="time" placeholder="Time" name="rptime" required>
                <input type="number" placeholder="Contact" name="rpcontact"required>
                <input type="submit" value="Submit">
            </form>
        </section>
        </div>
        <script>
            const mainbtn = document.getElementById('mainbtn');
            const evntbtn = document.getElementById('evntbtn');
            const exparkbtn = document.getElementById('exparkbtn');
            const maintenanceform = document.getElementById('maintenance-form');
            const eventhallform = document.getElementById('eventHall-form');
            const extraparkingform = document.getElementById('extraParking-form');
            mainbtn.addEventListener('click', () => {
                maintenanceform.classList.remove('hidden');
                eventhallform.classList.add('hidden');
                extraparkingform.classList.add('hidden'); 
            });
    
            evntbtn.addEventListener('click', () => {
                maintenanceform.classList.add('hidden');
                eventhallform.classList.remove('hidden');
                extraparkingform.classList.add('hidden');
            });
    
            exparkbtn.addEventListener('click', () => {
                maintenanceform.classList.add('hidden');
                eventhallform.classList.add('hidden');
                extraparkingform.classList.remove('hidden');
            });
        </script>
        <%@ include file="foot.html" %>
        
</body>
</html>