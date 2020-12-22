<%-- 
    Document   : contactUs
    Created on : 12 Nov, 2020, 9:30:56 PM
    Author     : uditc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
	<title>Review Us</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<jsp:include page="Header.jsp" />
	<div style="padding-bottom: 20px;">
		<div class="container">
			<div class="contact-us-heading">
				<h1>Review Us</h1>
				<p>Your review can help us improve our services and we would love to do that.</p>
			</div>
                    <div>
			<div class="contact-us-poster">
				<img src="images/contact-us-image.jpg" style="height: 375px;" alt="Poster">
			</div>
			<div class="contact-us-form">
                            <form action="reviewUS" method="post">
				<p>Name:</p>
				<input class="contact-us-input" type="text" name="Name" placeholder="Your Name...">
				<p>Rating:</p>
                                <select name="rating" style="width: 97.8%" class="contact-us-input">
                                    <option>Select</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
				<p>Review:</p>
				<textarea class="contact-us-input" name="TextArea" placeholder="Please enter your review." style="height: 125px;"></textarea>
				<input type="submit" name="" value="Submit">
                            </form>
                        </div>
                    </div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
