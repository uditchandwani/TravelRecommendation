<%-- 
    Document   : personalInfo
    Created on : 19 Dec, 2020, 5:56:14 PM
    Author     : uditc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Info</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
         <jsp:include page="Header.jsp" />
             <div class="container">
		<h1>Personal Information</h1>
                <hr>
                <form>
                    <div>
                        <label>Name</label>
                        <input type="text" name="Name">
                    </div>
                    <div>
                        <label>Email</label>
                        <input type="email" name="Name">
                    </div>
                    <div>
                        <label>Phone No.</label>
                        <input type="number" name="Name">
                    </div>
                    <div>
                        <label>City</label>
                        <input type="text" name="Name">
                    </div>
                    <div>
                        <label>Password</label>
                        <input type="password" name="Name">
                    </div>
                </form>
             </div>         
         
         
         <jsp:include page="footer.jsp" />
    </body>
</html>
