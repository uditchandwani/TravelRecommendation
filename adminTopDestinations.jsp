<%-- 
    Document   : adminIndex
    Created on : 28 Nov, 2020, 3:32:39 PM
    Author     : uditc
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Top Destinations</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="script.js"></script>
</head>
<body>
    <script>
        function editRow(e,id,dId)
        {
            document.myForm.Ranking.value=id;
            document.myForm.DestinationId.value=dId;
        }
    </script>
    <jsp:include page="HeaderAdmin.jsp" />
    <%
        try
        {
            if(request.getParameter("update")!=null)
            {
                Connection con= new DataBaseConnection().returnConnection();
                if(con!=null)
                {
                    String query="update top_destinations set destination_id=? where ranking=?";
                    PreparedStatement stmt=con.prepareStatement(query);
                    stmt.setInt(1,Integer.parseInt(request.getParameter("DestinationId")));
                    stmt.setInt(2,Integer.parseInt(request.getParameter("Ranking")));
                    
                    int rs=stmt.executeUpdate();
                    if(rs!=0)
                    {
                        out.println("<script> alert('Updated Successfully !!'); window.location.href = 'adminTopDestinations.jsp';</script>");
//                        response.sendRedirect("adminTopDestinations.jsp");
                    }
                    else
                    {
                        out.println("<script> alert('Error Updating Data !!'); window.location.href = 'adminTopDestinations.jsp'; </script>");
//                        response.sendRedirect("adminTopDestinations.jsp");
                    }
                    con.close();
                }
            }
        }
        catch(Exception e)
        {
            
        }
    %>
<div class="AdminContainer">
    <jsp:include page="adminSidebar.jsp" />
        <div class="AdminMain">
            <h1>Top Destinations</h1>
            <hr>
            <br>
            
            <form method="POST" name="myForm" action="adminTopDestinations.jsp">
                <div class="FormRow">
                    <label>Ranking :</label><br>
                    <input type="text" name="Ranking" value="" readonly>
                </div>
                <div class="FormRow">
                    <label>Destination :</label><br>
                    <select name="DestinationId" style="width:52.5%;padding:10px;" required>
                        <option value="">Select</option>
                        <%
                            try
                            {
                                Connection con= new DataBaseConnection().returnConnection();
                                if(con!=null)
                                {
                                    String query="select destination_id,name from destination";
                                    PreparedStatement stmt=con.prepareStatement(query);
                                    ResultSet rs=stmt.executeQuery();
                                    while(rs.next())
                                    {%>
                                    <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                                    <%}
                                    con.close(); 
                                }
                            }
                            catch(Exception e)
                            {
                                out.println(e);
                            }
                            
                        %>
                       
                    </select>
                </div>
                <div class="FormRow" style="display: flex; justify-content: center;width: 50%;">
                    <input type="submit" name="update" value="Update" class="btn" style="width: 100px;">
                    <input type="reset" value="Reset" onclick="refresh()"  class="btn" style="width: 100px;margin-left: 20px;">
                </div>
            </form>
            <br>
            <hr><hr>
            <br>
            <table class="CityTable">
                <tr>
                    <th>
                        Ranking
                    </th>
                    <th>
                        Destination
                    </th>
                    <th>
                        Edit
                    </th>
                </tr>
                <%
                                    try
                                    {
                                        Connection con= new DataBaseConnection().returnConnection();
                                        if(con!= null)
                                        {
                                            Statement stmt=con.createStatement();  
                                            String query="select ranking,name,td.destination_id from top_destinations td inner join destination d on td.destination_id=d.destination_id order by ranking";
                                            ResultSet rs=stmt.executeQuery(query); 
                                            while(rs.next())
                                            {
                                                out.println("<tr>");
                                                    out.println("<td>"+rs.getInt(1)+"</td>");
                                                    out.println("<td>"+rs.getString(2)+"</td>");
                                                    out.println("<td><button onclick=\"editRow(this,"+rs.getInt(1)+","+rs.getInt(3)+")\">Edit</button></td>");
                                                out.println("</tr>");
                                                
                                            }
                                            con.close();
                                        }
                                    }
                                    catch(Exception e)
                                    {
                                        
                                    }
                %>
                
            </table>
        </div>
    </div>

<jsp:include page="footer.jsp" />
</body>
</html>
