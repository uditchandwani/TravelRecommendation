<%-- 
    Document   : destination
    Created on : 12 Nov, 2020, 9:28:26 PM
    Author     : uditc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Destinations</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<jsp:include page="Header.jsp" />
        <div class="top-places">
			<div class="container">
				<h1>Best Places To Visit</h1>
				<!--<h3>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</h3>-->
				
                                
                                <%
                                    try
                                    {
                                        Connection con= new DataBaseConnection().returnConnection();
                                        if(con!= null)
                                        {
                                            Statement stmt=con.createStatement();
                                            String query="select ideal_duration,state,rating,name,destination_id from destination order by rating desc;";
                                            ResultSet rs=stmt.executeQuery(query);
                                            while(rs.next())
                                            {
                                                %>
                                                <%= "<a href=\"place.jsp?destination="+rs.getInt(5)+"\">" %>
                                                    <%="<div class=\"place\">"%>
                                                    <%--<%="<img src=\"images/bestPlace0"+rs.getInt(2)+".jpg\">"%>--%>
                                                    <%="<img alt=\""+rs.getString(4)+" Image\" src=\"images/destination/"+(rs.getInt(5)-1)+". "+rs.getString(4)+".jpg\">"%>
                                                        <%="<h3>"+rs.getString(1)+" Tour</h3>"%>
                                                        <%="<h2>"+rs.getString(4)+", "+rs.getString(2).replace(",",", ")+"</h2>"%>
                                                        <%int rating=rs.getInt(3);
                                                        for(int i=1;i<=rating;i++)
                                                        {%>
                                                            <%="<span class=\"fa fa-star checked\"></span>"%>
                                                        <%}
                                                            for(int i=1;i<=(5-rating);i++)
                                                            {%>
                                                                <%="<span class=\"fa fa-star\"></span>"%>
                                                            <% } %>
                                                       <%="</div>"%>
                                                    <%="</a>"%>
                                            <% } 
                                            con.close();
                                        }
                                    }catch(Exception e)
                                    {
                                        out.println(e);
                                    }  
                                    
                                %>
                               
			</div>
		</div>
        
        
        
<!--		<div class="top-places">
		<div class="container">
			<h1>Best Places to Travel</h1>
			<h3>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</h3>
			<a href="place.jsp">
				<div class="place">
					<img src="images/img001.jpg">
					<h3>15 Days Tour</h3>
					<h2>Gurtnellen, Swetzerland</h2>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
				</div>
			</a>
			<a href="place.jsp">
				<div class="place">
					<img src="images/img001.jpg">
					<h3>15 Days Tour</h3>
					<h2>Gurtnellen, Swetzerland</h2>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
				</div>
			</a>
			<a href="place.html">
				<div class="place">
					<img src="images/img001.jpg">
					<h3>15 Days Tour</h3>
					<h2>Gurtnellen, Swetzerland</h2>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
				</div>
			</a>
			<a href="place.html">
				<div class="place" style="float: none;">
					<img src="images/img001.jpg">
					<h3>15 Days Tour</h3>
					<h2>Gurtnellen, Swetzerland</h2>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
				</div>
			</a>

			<a href="place.html">
				<div class="place">
					<img src="images/img001.jpg">
					<h3>15 Days Tour</h3>
					<h2>Gurtnellen, Swetzerland</h2>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
				</div>
			</a>
			<a href="place.html">
				<div class="place">
					<img src="images/img001.jpg">
					<h3>15 Days Tour</h3>
					<h2>Gurtnellen, Swetzerland</h2>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
				</div>
			</a>
			<a href="place.html">
				<div class="place">
					<img src="images/img001.jpg">
					<h3>15 Days Tour</h3>
					<h2>Gurtnellen, Swetzerland</h2>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
				</div>
			</a>
			<a href="">
				<div class="place" style="float: none;">
					<img src="images/img001.jpg">
					<h3>15 Days Tour</h3>
					<h2>Gurtnellen, Swetzerland</h2>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
				</div>
			</a>

			<a href="place.html">
				<div class="place">
					<img src="images/img001.jpg">
					<h3>15 Days Tour</h3>
					<h2>Gurtnellen, Swetzerland</h2>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
				</div>
			</a>
			<a href="">
				<div class="place">
					<img src="images/img001.jpg">
					<h3>15 Days Tour</h3>
					<h2>Gurtnellen, Swetzerland</h2>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
				</div>
			</a>
			<a href="">
				<div class="place">
					<img src="images/img001.jpg">
					<h3>15 Days Tour</h3>
					<h2>Gurtnellen, Swetzerland</h2>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
				</div>
			</a>
			<a href="">
				<div class="place" style="float: none;">
					<img src="images/img001.jpg">
					<h3>15 Days Tour</h3>
					<h2>Gurtnellen, Swetzerland</h2>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
				</div>
			</a>
		</div>
		</div>-->
		<jsp:include page="footer.jsp" />
</body>
</html>