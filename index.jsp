<%-- 
    Document   : index
    Created on : 12 Nov, 2020, 9:19:11 PM
    Author     : uditc
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DataBaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <jsp:include page="Header.jsp" />
		<!-- <div><img style="width:100%" src="images/img01.jpg"></div> -->
<!--                <div>
                    <%--<%
                        PrintWriter ps=response.getWriter();
                        try
                        {
                        Connection con= new DataBaseConnection().returnConnection();
                        if(con!= null)
                        {
                            Statement stmt=con.createStatement();  
                            ResultSet rs=stmt.executeQuery("select * from user_table"); 
                            while(rs.next())
                            {
                                ps.println("<h1>"+rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+""+rs.getString(4)+""+rs.getInt(5)+""+rs.getString(6)+"</h1>");   
                            } 
                            con.close();
                        }
                        }catch(Exception e)
                        {
                            
                        }
                    %>--%>
                </div>-->
		<div class="top-places">
			<div class="container">
				<h1>Top Places Of The Week</h1>
				<h3>Some Of The Popular Destinations For You</h3>
				
                                
                                <%
                                    try
                                    {
                                        Connection con= new DataBaseConnection().returnConnection();
                                        if(con!= null)
                                        {
                                            Statement stmt=con.createStatement();  
                                            String query="select ideal_duration,state,rating,name,ds.destination_id from top_destinations tp inner join destination ds on tp.destination_id=ds.destination_id;";
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
                                
                                
<!--                                <a href="">
					<div class="place">
						<img src="images/bestPlace01.jpg">
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
						<img src="images/bestPlace02.jpg">
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
						<img src="images/bestPlace03.jpg">
						<h3>15 Days Tour</h3>
						<h2>Gurtnellen, Swetzerland</h2>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
					</div>
				</a>-->
<!--				<a href="">
					<div class="place">
						<img src="images/bestPlace04.jpg">
						<h3>15 Days Tour</h3>
						<h2>Gurtnellen, Swetzerland</h2>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
					</div>
				</a>-->
			</div>
		</div>

        <jsp:include page="newsLetter.jsp" />

	<div class="top-places">
		<div class="container">
			<h1>Top Hotels</h1>
			<h3>Some Of The Popular Hotels For You</h3>
			<%
                                    try
                                    {
                                        Connection con= new DataBaseConnection().returnConnection();
                                        if(con!= null)
                                        {
                                            Statement stmt=con.createStatement(); 
                                            String query="select hotel_name,et.starting_budget,city_center,et.rating,name from (select hotel_name,h.starting_budget,city_center,h.rating,destination_id from top_hotels th inner join hotels h on th.hotel_id=h.hotel_id limit 3) et inner join destination ds on et.destination_id=ds.destination_id";
//                                            String query="select ideal_duration,state,rating,name,ds.destination_id from top_destinations tp inner join destination ds on tp.destination_id=ds.destination_id;";
                                            ResultSet rs=stmt.executeQuery(query);
                                            int img=0;
                                            while(rs.next())
                                            {
                                                img++;
                                                %>
                                                <%--<%= "<a href=\"place.jsp?destination="+rs.getInt(5)+"\">" %>--%>
                                                    <%="<div class=\"place\">"%>
                                                    <%--<%="<img src=\"images/bestPlace0"+rs.getInt(2)+".jpg\">"%>--%>
                                                    <%="<img src=\"images/hotels/top0"+img%3+".jpg\">"%>
                                                        <%="<h3>"+rs.getString(3)+" km from city center</h3>"%>
                                                        <%="<h2>"+rs.getString(1)+", "+rs.getString(5)+"</h2>"%>
                                                        <%="<h3>Starting from &#x20B9; "+rs.getString(2)+"</h3>"%>
                                                        <%int rating=rs.getInt(4);
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

        <jsp:include page="thingsToKnow.jsp" />

	<div class="top-places">
		<div class="container">
			<h1>Top Tours</h1>
			<h3>Some Of The Popular Tours For You</h3>
			<%
                                    try
                                    {
                                        Connection con= new DataBaseConnection().returnConnection();
                                        if(con!= null)
                                        {
                                            Statement stmt=con.createStatement();
                                            String query="select ideal_duration,state,rating,name,ds.destination_id from top_destinations tp inner join destination ds on tp.destination_id=ds.destination_id;";
                                            ResultSet rs=stmt.executeQuery(query);
                                            while(rs.next())
                                            {
                                                %>
                                                <%= "<a href=\"place.jsp?destination="+rs.getInt(5)+"\">" %>
                                                    <%="<div class=\"place\">"%>
                                                    <%--<%="<img src=\"images/bestPlace0"+rs.getInt(2)+".jpg\">"%>--%>
                                                    <%="<img src=\"images/img001.jpg\">"%>
                                                        <%="<h3>"+rs.getString(1)+" Tour</h3>"%>
                                                        <%="<h2>"+rs.getString(4)+", Madhya Pradesh</h2>"%>
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

                                    }  
                                    
                                %>
		</div>
	</div>
                
        <jsp:include page="customerReview.jsp" />
                
	<jsp:include page="footer.jsp" />
</body>
</html>