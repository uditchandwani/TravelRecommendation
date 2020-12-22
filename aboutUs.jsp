<%-- 
    Document   : aboutUs
    Created on : 12 Nov, 2020, 9:29:30 PM
    Author     : uditc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
	<title>About Us</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<jsp:include page="Header.jsp" />

	<div class="what-we-do">
		<div class="container">
			<div class="what-we-do-text">
				<h1>What We Do</h1>
				<p>Travelo.com is a destination discovery website that helps travellers find the right destinations according to their preferences and help them plan their holidays in a hassle free manner.</p>

				<p>At Travelo, we aim to make discovering your next holiday destination as much of an eye-opener as your vacation itself. We help you break out of the monotony of the same vacation spots you have known for years and open in front of you, a world of possibilities. With our interactive map interface and powerful filters, you can plan your vacation like never before.</p>
			</div>
			<div class="what-we-do-pic">
				<img src="images/what-we-do.png">
			</div>
		</div>
	</div>

	<div class="teams-section">
		<div class="container">
			<h1>Team Members</h1>
			<div class="team-member">
				<img src="images/shashwat.jpeg">
				<h2>Shashwat Jyotishi</h2>
				<h2>Co-Founder</h2>
				<!--<p>An Under Graduate in Computer Science, Udit loves to travel and has an unparalleled enthusiasm to explore new places. He is a dreamer who believes in turning all his dreams into reality.</p>-->
			</div>
			<div class="team-member">
				<img src="images/suyash.jpeg">
				<h2>Suyash Goylit</h2>
				<h2>Co-Founder</h2>
				<!--<p>An Under Graduate in Computer Science, Udit loves to travel and has an unparalleled enthusiasm to explore new places. He is a dreamer who believes in turning all his dreams into reality.</p>-->
			</div>
			<div class="team-member">
				<img src="images/udit.jpeg">
				<h2>Udit Chandwani</h2>
				<h2>Co-Founder</h2>
				<!--<p>An Under Graduate in Computer Science, Udit loves to travel and has an unparalleled enthusiasm to explore new places. He is a dreamer who believes in turning all his dreams into reality.</p>-->
			</div>
			<div class="team-member">
				<img src="images/utkarsh.jpeg">
				<h2>Utkarsh Neema</h2>
				<h2>Co-Founder</h2>
				<!--<p>An Under Graduate in Computer Science, Udit loves to travel and has an unparalleled enthusiasm to explore new places. He is a dreamer who believes in turning all his dreams into reality.</p>-->
			</div>
			
		</div>
	</div>
	<div class="gallery">
		<div class="container">
			<h1>Our Gallery</h1>
			<div class="gallery-images" style="padding-right: 0%;">
				<img src="images/gallery01.png">
				<img src="images/gallery03.png">
				
			</div>
			<div class="gallery-images">
				<img src="images/gallery02.png">
				<img src="images/gallery04.png">
				<img src="images/gallery05.png">
				
			</div>
		</div>
	</div>
	
        <jsp:include page="customerReview.jsp" />
	
        <jsp:include page="footer.jsp" />
</body>
</html>