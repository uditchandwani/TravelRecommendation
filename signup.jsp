<html>
    <head>
        <title>Sign Up</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
        </head>
    <body>
        <jsp:include page="Header.jsp" />
<!--        <img src="0.jpg" alt="top image" height="300" width="1660">-->
        
<!--        <table align="center" class="mytheme" style="margin-top:-200px">
            <tr><td class="mytheme">TRS</td></tr>
        </table>-->
        <!--<table align="center" style="margin-top:150px;margin-left: 850px">
         <tr style="background-color:rgb(245, 208, 24); border-radius: 25px">
                    <td class="mytheme2">LOGIN</td>
                </tr>
        </table> -->
    <center><img  src="images/signupicon.png" alt="login icon" style="height: 300px"></center>>
       
       <!--<img style="margin-left:350px;margin-top:40px" src="ticketing.png" alt="login image" height="800" width="950">-->
       
       <center><div align="center" id="loginForm" style="width:800px;height:630px;">
            <form action="signupDB.jsp">
        <table cellpadding="20">
           
        
        <tr>
            <td class="mytheme1">Name</td>
            <td><input type=text name="fNm" required></td>
        </tr>
        <tr>
            <td class="mytheme1">Email</td>
            <td><input type=email name="email" required></td>
        </tr>
        <tr>
            <td class="mytheme1" style="">Contact No.</td>
            <td><input type=number name="cont" required></td>
        </tr>
        <tr>
            <td class="mytheme1">Location</td>
            <td ><input type=text name="loc" required></td>
        </tr>
        <tr>
            <td class="mytheme1">Password</td>
            <td><input type=password name="pass" required></td>
        </tr>
        <tr>
            <td class="mytheme1">Retype Password</td>
            <td><input type=password name="rPass" required></td>
        </tr>
        <tr>
            <td><button type="submit" value="Signup" ">Signup</button></td>
            <!--<td><input type="submit" value="New User" style="border-radius: 30px; 
                       height: 50px;width: 250px; background-color: rgb(245, 208, 24); 
                       color: whitesmoke;font-size: 40px; border-color: rgb(245, 208, 24)"></td> -->
            
        </tr>
        
    </table>
        </div></center>
       </form>
       <footer>
		<div class="footer-heading">
			<h1>Travelo</h1>
			<a href="#" class="fa fa-facebook" ></a>
			<a href="#" class="fa fa-twitter"></a>
			<a href="#" class="fa fa-youtube-play" ></a>
			<a href="#" class="fa fa-instagram"></a>
			<a href="#" class="fa fa-linkedin"></a>
		</div>
		<div class="footer-col-2">
			<span class="col-2-heading">Contact</span>
				<p><span class="fa fa-map-marker" style="font-size: 20px;"></span>    127, Sundram Complex , Above Canara Bank, Bhawarkua Main Rd, Tower Square, Indore, Madhya Pradesh 452003</p>
				<p><span class="fa fa-phone" style="font-size: 20px;">   +91 98765 43210</span></p>
		</div>
		<div class="footer-col-2" style="padding-left: 42px;">
			<span class="col-2-heading">Web Links</span>
			<ul>
				<li>Home Page</li>
				<li>Destinations</li>
				<li>About Us</li>
				<li>Contact Us</li>
			</ul>
		</div>
		<div class="footer-col-3">
			<span class="col-2-heading">Subscribe to our Newsletter</span>
			<form>
				<input type="text" name="" placeholder="Enter your e-mail address here">
				<input type="submit" name="">
			</form>
			
		</div>
	</footer>
    </body>
</html>