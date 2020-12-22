<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="reviews">
		<div class="container">
			<div class="reviews-head">
				<h1>Happy Traveler Says</h1>
			</div>
			<div class="review-div">

<%
                                    try
                                    {
                                        Connection con= new DataBaseConnection().returnConnection();
                                        if(con!= null)
                                        {
                                            Statement stmt=con.createStatement();  
                                            ResultSet rs=stmt.executeQuery("select name,rating,review from reviews order by rating desc"); 
                                            while(rs.next())
                                            {
                                                %>
                                                <%= "<div class=\"review\">" %>
                                                
                                                <%int rating=rs.getInt(2);
                                                        for(int i=1;i<=rating;i++)
                                                        {   
                                                %>
                                                            <%="<span class=\"fa fa-star checked\"></span>"%>
                                                    <%  }
                                                            for(int i=1;i<=(5-rating);i++)
                                                            {
                                                    %>
                                                                <%="<span class=\"fa fa-star\"></span>"%>
                                                    <%      }       %>
                                                    
                                                    <%= "<p class=\"review_para\">"+rs.getString(3)+"</p>"%>
                                                    <%= "<p>- "+rs.getString(1)+"</p>"%>
                                                    <%= "</div>"    %>
                                                <%
                                            }
                                        }
                                    }
                                    catch( Exception e)
                                    {
                                        
                                    }
                                        
                            %>
                            
                </div>
            </div>
	</div>