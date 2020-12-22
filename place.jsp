<%-- 
    Document   : place.jsp
    Created on : 12 Nov, 2020, 9:24:53 PM
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
	<title>Place</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<jsp:include page="Header.jsp" />

	
	<div class="container">
		<div class="place-body">\
			
                            <%
                                String name="";
                                String destination_id=request.getParameter("destination");
                                    try
                                    {
                                        Connection con= new DataBaseConnection().returnConnection();
                                        if(con!= null)
                                        {
                                            Statement stmt=con.createStatement();
                                            String query="select name,state,starting_budget,best_time_to_visit,ideal_duration,weather,nearest_airport,rating,tourism_desc from destination where destination_id="+destination_id+";";
                                            ResultSet rs=stmt.executeQuery(query);
                                            while(rs.next())
                                            {
                                                name=rs.getString(1);
                            %>
                                                <%="<img alt=\""+rs.getString(4)+" Image\" src=\"images/destination/"+(Integer.parseInt(destination_id)-1)+". "+rs.getString(1)+".jpg\">"%>
                                            <%="<div class=\"place-info\">"%>
                                                <%="<h1>"+rs.getString(1)+"</h1>"%>
                                                <%="<p class=\"fa fa-map-marker\">"+rs.getString(2).replace(",",", ")+"</p>"%>
                                                <%="<p><span>&#x20B9; "+rs.getString(3)+"</span> onwards</p>"%>
                                                <button>View Hotels</button>
                                                <div class="info-box">
                                                    <%="<div style=\"width: 50%;float: left;\"><p><b>Ideal Duration:</b> "+rs.getString(5)+"</p></div>"%>
                                                    <%="<div style=\"width: 50%;float: left;\"><p><b>Best Time:</b> "+rs.getString(4)+"</p></div>"%>
                                                    <%="<div style=\"width: 50%;float: left;\"><p><b>Weather:</b> "+rs.getString(6)+"&deg; C</p></div>"%>
                                                    <%="<div style=\"width: 50%;float: left;\"><p><b>Nearest Airport:</b> "+rs.getString(7)+"</p></div>"%>
                                                </div>
                                                <p><b>Rating: </b>
                                                <%
                                                    for(int i=0;i<rs.getInt(8);i++)
                                                    {%>
                                                        <%="<span class=\"fa fa-star checked\"></span>"%>
                                                    <%}
                                                     for(int i=1;i<=(5-rs.getInt(8));i++)
                                                            {%>
                                                                <%="<span class=\"fa fa-star\"></span>"%>
                                                            <% } %>
                                            
                                                </p>
			</div>
		</div>
		<div class="place-body-2">
                    <%="<h1>"+rs.getString(1)+" Tourism</h1>"%>
			
                    <%
                        for(String x:rs.getString(9).split("<br>"))
                        {%>
                          <%="<p>"+x+"</p>"%>  
                      <%}
                    %>
                    
                    
                    
<!--                    <p>Nestled in between the snow-capped slopes of the Pir Panjal and the Dhauladhar ranges, Manali is one of the most popular hill stations in the country. With jaw-dropping views, lush green forests, sprawling meadows carpeted with flowers, gushing blue streams, a perpetual fairy-tale like mist lingering in the air, and a persistent fragrance of pines - Manali has been blessed with extraordinary scenic beauty. From museums to temples, from quaint little hippie villages to bustling upscale streets, river adventures to trekking trails, Manali has every reason to be the tourist magnet it is, all year round.</p>

			<p>Swaying eucalyptus trees, endearing little eateries, small kitschy local market places, and cafes which serve delicious local food at unbelievable prices, Old Manali is a serene, tranquil place, whose lingering silence is broken only by the twittering of the birds and the sound of the roaring waters of the Kullu River.</p>

			<p>Solang Valley is the of the most visited places in Manali, with the drive up to Solang being as picturesque as the valley itself. Not only does Solang Valley offer some breathtaking views of the surrounding landscape, but its slopes are also a very popular skiing destination, especially during the winters. In summers, the place turns into a paragliding haven. If you're an adventure enthusiast, Solang Valley has adrenaline-pumping activities such as zorbing and horse-riding available.</p>

			<p>With more than 25 lakh visitors every year, Rohtang Pass easily stands out as one of the most famous scenic spots to visit in Manali. Connecting the Lahaul and Kullu valleys, the Rohtang Pass is famous among nature lovers, photographers and adventure seekers alike. Mountain biking or skiing whilst surrounded by the awe-inspiring glaciers and snow-capped peaks on all sides is an exhilarating experience.</p>

			<p>Manali is also home to a tiny slice of history, in the form of the Naggar castle. Located among the breathtaking forests in Naggar town, the Naggar Castle is a stunning historical edifice. Once used as the residence of Raja Sidh Singh of Kullu, the castle is a fine blend of traditional Himalayan and European architecture. With majestic fireplaces, beautifully built staircases, and meticulous wood and stone works, the Naggar Castle is a must-visit when you're in Manali.</p>-->
		</div>
	</div>
                                  <%}
                                        }
                                    }catch(Exception e){}
                                                            %>
	
        <jsp:include page="newsLetter.jsp" />
        
	<div class="top-places">
			<div class="container">
				<h1>Top Places To Visit In <%=name%></h1>
				<%
                                    try
                                    {
                                        Connection con= new DataBaseConnection().returnConnection();
                                        if(con!= null)
                                        {
                                            Statement stmt=con.createStatement();
                                            String query="select place_name,ptv.rating,place_desc,name from place_to_visit ptv inner join destination ds on ptv.destination_id=ds.destination_id where ds.destination_id="+destination_id+" order by ptv.rating desc";
                                            ResultSet rs=stmt.executeQuery(query);
                                            while(rs.next())
                                            {
                                                %>
                                                <%--<%= "<a href=\"place.jsp?destination="+rs.getInt(5)+"\">" %>--%>
                                                    <%="<div class=\"place\">"%>
                                                    <%="<img alt=\""+rs.getString(1)+" Image\" src=\"images/places_to_visit/"+rs.getString(4)+" ("+rs.getString(1).replace("'","_")+").jpg\">"%>
                                                        <%="<h2>"+rs.getString(1)+"</h2>"%>
                                                        <%int rating=rs.getInt(2);
                                                        for(int i=1;i<=rating;i++)
                                                        {%>
                                                            <%="<span class=\"fa fa-star checked\"></span>"%>
                                                        <%}
                                                            for(int i=1;i<=(5-rating);i++)
                                                            {%>
                                                                <%="<span class=\"fa fa-star\"></span>"%>
                                                            <% } %>
                                                       <%="</div>"%>
                                                    <%--<%="</a>"%>--%>
                                            <% } 
                                            con.close();
                                        }
                                    }catch(Exception e)
                                    {

                                    }  
                                    
                                %>
			</div>
		</div>
	<!-- </div> -->
        
	<jsp:include page="thingsToKnow.jsp" />
        
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
                                            String query="select hotel_name,h.starting_budget,city_center,h.rating from hotels h inner join destination ds on h.destination_id=ds.destination_id where ds.destination_id="+destination_id+" order by h.rating desc";
                                            ResultSet rs=stmt.executeQuery(query);
                                            while(rs.next())
                                            {
                                                %>
                                                <%--<%= "<a href=\"place.jsp?destination="+rs.getInt(5)+"\">" %>--%>
                                                    <%="<div class=\"place\">"%>
                                                    <%--<%="<img src=\"images/bestPlace0"+rs.getInt(2)+".jpg\">"%>--%>
                                                    <%="<img src=\"images/img001.jpg\">"%>
                                                        <%="<h3>"+rs.getString(3)+" km from city center</h3>"%>
                                                        <%="<h2>"+rs.getString(1)+"</h2>"%>
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