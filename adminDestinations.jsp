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
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Destinations</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="script.js"></script>
</head>
<body>
    <script>
        function editRow(e,id)
        {
            var childrens=e.parentElement.parentElement.children;
            document.myForm.DestinationId.value=childrens[0].innerHTML;
            document.myForm.Name.value=childrens[1].innerHTML;
            document.myForm.State.value=childrens[2].innerHTML;
            document.myForm.StartingBudget.value=childrens[3].innerHTML;
            document.myForm.TimeToVisit.value=childrens[4].innerHTML;
            document.myForm.IdealDuration.value=childrens[5].innerHTML;
            document.myForm.Weather.value=childrens[6].innerHTML;
            document.myForm.NearestAirport.value=childrens[7].innerHTML;
            document.myForm.Rating.value=childrens[8].innerHTML;
            document.myForm.Desc.innerHTML=childrens[9].innerHTML;
            document.getElementById("destinationImg").src="images/destination/"+(id-1)+". "+(childrens[1].innerHTML)+".jpg";
            document.myForm.save.name="update";
            document.myForm.save.value="Update";
            window.location.href="#editForm";
        }
        function refresh1()
        {
            document.myForm.save.name="save";
            document.myForm.save.value="Save";
            document.getElementById("destinationImg").src="";
            
        }
    </script>
    
    
    <jsp:include page="HeaderAdmin.jsp" />
    <%
        try
        {
            String del=request.getParameter("del");
                if(del!=null)
                {
                    Connection con= new DataBaseConnection().returnConnection();
                    if(con!=null)
                    {
                        String query="select ranking from top_destinations where destination_id=?";
                        PreparedStatement stmt=con.prepareStatement(query);
                        stmt.setInt(1,Integer.parseInt(del));
                        ResultSet rs1=stmt.executeQuery();
                        if(rs1.next())
                        {
                            out.println("<script> alert('Cannot delete destination since it is a top destination !!'); window.location.href = 'adminDestinations.jsp';</script>");
                        }
                        else
                        {
                            String NAME="";
                            int ID=Integer.parseInt(del);
                            query="select name from destination where destination_id=?";
                            stmt=con.prepareStatement(query);
                            stmt.setInt(1,Integer.parseInt(del));
                            rs1=stmt.executeQuery();
                            if(rs1.next())
                            {
                                NAME=rs1.getString(1);
                            }
                            query="delete from destination where destination_id=?";
                            stmt=con.prepareStatement(query);
                            stmt.setInt(1,Integer.parseInt(del));
                            int rs=stmt.executeUpdate();
                            if(rs!=0)
                            {
                                File file = new File("D:/Udit/Projects/NetBeans Projects/Travelo/web/images/destination/"+(ID-1)+". "+NAME+".jpg"); 
                                if(file.delete())
                                {
                                out.println("<script> alert('Record Deleted !!'); window.location.href = 'adminDestinations.jsp';</script>");
                                }
                                else
                                {
                                    out.println("<script> alert('Img Not deleted :- "+(ID-1)+". "+NAME+".jpg !!'); window.location.href = 'adminDestinations.jsp';</script>");
                                }
                            }
                            else
                            {
                                out.println("<script> alert('Error deleting Data !!'); window.location.href = 'adminDestinations.jsp'; </script>");
        //                        response.sendRedirect("adminUserDetails.jsp");
                            }
                        }
                    }
                    con.close();
                }
        }
        catch(Exception e)
        {
            out.println(e);
        }
    %>
<div class="AdminContainer">
    <jsp:include page="adminSidebar.jsp" />
        <div class="AdminMain">
            <h1>Destinations</h1>
            <hr>
            <br>
            <form method="POST" id="editForm" name="myForm" action="AdminDestinationsResponse" enctype="multipart/form-data">
                <div class="FormRow">
                    <label>Destination ID :</label><br>
                    <input type="text" name="DestinationId" value="" readonly>
                </div>
                <div class="FormRow">
                    <label>Name :</label><br>
                    <input type="text" name="Name" value="" required>
                </div>
                <div class="FormRow">
                    <label>State :</label><br>
                    <input type="text" name="State" value="" required>
                </div>
                <div class="FormRow">
                    <label>Starting Budget :</label><br>
                    <input type="number" name="StartingBudget" value="" required>
                </div>

                <div class="FormRow">
                    <label>Best Time To Visit :</label><br>
                    <input type="text" name="TimeToVisit" value="" required>
                </div>

                <div class="FormRow">
                    <label>Ideal Duration :</label><br>
                    <input type="text" name="IdealDuration" value="" required>
                </div>
                
                <div class="FormRow">
                    <label>Weather :</label><br>
                    <input type="number" name="Weather" value="" required>
                </div>
                
                <div class="FormRow">
                    <label>Nearest Airport :</label><br>
                    <input type="text" name="NearestAirport" value="" required>
                </div>
                
                <div class="FormRow">
                    <label>Rating :</label><br>
                    <select name="Rating" style="width:52.5%;padding:10px;" required>
                        <option value="">Select</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                
                <div class="FormRow">
                    <label>Tourism Description :</label><br>
                    <textarea name="Desc" required></textarea>
                </div>
                
                <div class="FormRow">
                    <img src="" id="destinationImg" style="height: 250px;" alt="DestinationImage"><br>
                    <input type="file" name="Image" >
                </div>
                
                <div class="FormRow" style="display: flex; justify-content: center;width: 50%;">
                    <input type="submit" name="save" value="Save" class="btn" style="width: 100px;">
                    <input type= "reset" value="Reset" onclick="refresh1()"  class="btn" style="width: 100px;margin-left: 20px;">
                </div>
            </form>
            <br>
            <hr><hr>
            <br>
            <div>
            <table class="CityTable">
                <tr>
                    <th>
                        Destination Id.
                    </th>
                    <th>
                        Name
                    </th>
                    <th>
                        State
                    </th>
                    <th>
                        Starting Budget
                    </th>
                    <th>
                        Best Time To Visit
                    </th>
                    <th>
                        Ideal Duration
                    </th>
                    <th>
                        Weather
                    </th>
                    <th>
                        Nearest Airport
                    </th>
                    <th>
                        Rating
                    </th>
<!--                    <th>
                        Tourism Description
                    </th>-->
                    <th>
                        Edit
                    </th>
                    <th>
                        Delete
                    </th>
                </tr>
                <%
                                    try
                                    {
                                        Connection con= new DataBaseConnection().returnConnection();
                                        if(con!= null)
                                        {
                                            Statement stmt=con.createStatement();  
                                            String query="select destination_id,name,state,starting_budget,best_time_to_visit,ideal_duration,weather,nearest_airport,rating,tourism_desc from destination order by destination_id";
                                            ResultSet rs=stmt.executeQuery(query); 
                                            while(rs.next())
                                            {
                                                out.println("<tr>");
                                                    out.println("<td>"+rs.getInt(1)+"</td>");
                                                    out.println("<td>"+rs.getString(2)+"</td>");
                                                    out.println("<td>"+rs.getString(3)+"</td>");
                                                    out.println("<td>"+rs.getString(4)+"</td>");
                                                    out.println("<td>"+rs.getString(5)+"</td>");
                                                    out.println("<td>"+rs.getString(6)+"</td>");
                                                    out.println("<td>"+rs.getString(7)+"</td>");
                                                    out.println("<td>"+rs.getString(8)+"</td>");
                                                    out.println("<td>"+rs.getInt(9)+"</td>");
                                                    out.println("<td style=\"display: none;\">"+rs.getString(10)+"</td>");
                                                    out.println("<td><button onclick=\"editRow(this,"+rs.getInt(1)+")\">Edit</button></td>");
                                                    out.println("<td><button onclick=\"del("+rs.getInt(1)+",'adminDestinations.jsp')\">Delete</button></td>");
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
    </div>

<jsp:include page="footer.jsp" />
</body>
</html>
