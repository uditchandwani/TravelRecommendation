<%-- 
    Document   : hotels
    Created on : 12 Nov, 2020, 9:39:14 PM
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
	<title>Hotels & Restaurant</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<jsp:include page="Header.jsp" />
		<div class="top-places">
		<div class="container">
			<h1>Best Hotels & Restaurant</h1>
			<!--<h3>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</h3>-->
			<%
                                    try
                                    {
                                        Connection con= new DataBaseConnection().returnConnection();
                                        if(con!= null)
                                        {
                                            Statement stmt=con.createStatement(); 
                                            String query="select h.hotel_name,h.starting_budget,h.city_center,h.rating,name from hotels h inner join destination ds on h.destination_id=ds.destination_id order by rating desc";
                                            ResultSet rs=stmt.executeQuery(query);
                                            int img=0;
                                            while(rs.next())
                                            {
                                                img++;
                                                %>
                                                <%--<%= "<a href=\"place.jsp?destination="+rs.getInt(5)+"\">" %>--%>
                                                    <%="<div class=\"place\">"%>
                                                    <%--<%="<img src=\"images/bestPlace0"+rs.getInt(2)+".jpg\">"%>--%>
                                                    <%="<img src=\"images/hotels/hotel0"+img%6+".jpg\">"%>
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

                                    }  
                                    
                                %>
		</div>
		</div>
		<jsp:include page="footer.jsp" />
</body>
</html>
