<%-- 
    Document   : contactUs
    Created on : 12 Nov, 2020, 9:30:56 PM
    Author     : uditc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Database.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
	<title>Contact Us</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<jsp:include page="Header.jsp" />
	<div style="padding-bottom: 20px;">
		<div class="container">
			<div class="contact-us-heading">
				<h1>Contact Us</h1>
				<p>Drop us your queries and we would love to solve them.</p>
			</div>
			<div class="contact-us-poster">
				<img src="images/contact-us-image.jpg" alt="Poster">
			</div>
			<div class="contact-us-form">
                            <form action="ContactUs" method="post">
				<p>Name:</p>
				<input class="contact-us-input" type="text" name="Name" placeholder="Your Name...">
				<p>Email:</p>
				<input class="contact-us-input" type="email" name="Email" placeholder="Your Email Id...">
				<p>City:</p>
                                <select class="contact-us-input" name="City" style="width:98%;" required>
                        <%
                            try
                            {
                                Connection con= new DataBaseConnection().returnConnection();
                                if(con!=null)
                                {
                                    String query="select city from city_master";
                                    PreparedStatement stmt=con.prepareStatement(query);
                                    ResultSet rs=stmt.executeQuery();
                                    while(rs.next())
                                    {%>
                                    <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
                                    <%}
                                    con.close(); 
                                }
                            }
                            catch(Exception e)
                            {

                            }
                            
                        %>
                       
                    </select>
				<p>Query:</p>
				<textarea class="contact-us-input" name="TextArea" placeholder="Please enter your query." style="height: 125px;"></textarea>
				<input type="submit" name="" value="Submit">
                            </form>
                        </div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
