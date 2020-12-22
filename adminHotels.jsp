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
    <title>Hotels</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="script.js"></script>
</head>
<body>
    <script>
        function editRow(e,id,dId)
        {
            var childrens=e.parentElement.parentElement.children;
            document.myForm.HotelId.value=childrens[0].innerHTML;
            document.myForm.Name.value=childrens[1].innerHTML;
            document.myForm.DestinationId.value=dId;
            document.myForm.StartingBudget.value=childrens[3].innerHTML;
            document.myForm.CityCenter.value=childrens[4].innerHTML;
            document.myForm.Rating.value=childrens[5].innerHTML;
            document.getElementById("hotelImg").src="images/hotels/hotel00.jpg"; //(id-1)+". "+(childrens[1].innerHTML)+".jpg";
            document.myForm.save.name="update";
            document.myForm.save.value="Update";
            window.location.href="#editForm";
        }
        function refresh1()
        {
            document.myForm.save.name="save";
            document.myForm.save.value="Save";
            document.getElementById("hotelImg").src="";
            
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
                        String query="select ranking from top_hotels where hotel_id=?";
                        PreparedStatement stmt=con.prepareStatement(query);
                        stmt.setInt(1, Integer.parseInt(del));
                        ResultSet rs1=stmt.executeQuery();
                        if(rs1.next())
                        {
                            
                        }
                        else
                        {
                            String NAME="";
                            int ID=Integer.parseInt(del);
                            String query1="select hotel_name from hotels where hotel_id=?";
                            stmt=con.prepareStatement(query1);
                            stmt.setInt(1,Integer.parseInt(del));
                            rs1=stmt.executeQuery();
                            if(rs1.next())
                            {
                                NAME=rs1.getString(1);
                            }
                            query="delete from hotels where hotel_id=?";
                            stmt=con.prepareStatement(query);
                            stmt.setInt(1,Integer.parseInt(del));
                            int rs=stmt.executeUpdate();
                            if(rs!=0)
                            {
/*                                File file = new File("D:/Udit/Projects/NetBeans Projects/Travelo/web/images/hotels/"+(ID-1)+". "+NAME+".jpg"); 
                                if(file.delete())
                                {
                                out.println("<script> alert('Record Deleted !!'); window.location.href = 'adminPlaces.jsp';</script>");
                                }
                                else
                                {
                                    out.println("<script> alert('Img Not deleted :- "+(ID-1)+". "+NAME+".jpg !!'); window.location.href = 'adminPlaces.jsp';</script>");
                                }
*/
                                
                                out.println("<script> alert('Record Deleted !!'); window.location.href = 'adminHotels.jsp';</script>");
                            }
                            else
                            {
                                out.println("<script> alert('Error deleting Data !!'); window.location.href = 'adminHotels.jsp'; </script>");
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
            <h1>Hotels</h1>
            <hr>
            <br>
            <form method="POST" id="editForm" name="myForm" action="AdminHotelsResponse" enctype="multipart/form-data">
                <div class="FormRow">
                    <label>Hotel ID :</label><br>
                    <input type="text" name="HotelId" value="" readonly>
                </div>
                <div class="FormRow">
                    <label>Name :</label><br>
                    <input type="text" name="Name" value="" required>
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
                <div class="FormRow">
                    <label>Starting Budget (in Rs) :</label><br>
                    <input type="text" name="StartingBudget" value="" required>
                </div>

                <div class="FormRow">
                    <label>Distance From City Center (in km) :</label><br>
                    <input type="text" name="CityCenter" value="" required>
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
                    <img src="" id="hotelImg" style="height: 250px;" alt="HotelImage"><br>
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
                        Hotel Id.
                    </th>
                    <th>
                        Name
                    </th>
                    <th>
                        Destination
                    </th>
                    <th>
                        Starting Budget
                    </th>
                    <th>
                        Distance From City Center
                    </th>
                    <th>
                        Rating
                    </th>
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
                                            String query="select hotel_id,hotel_name,name,h.starting_budget,city_center,h.rating,h.destination_id from hotels h inner join destination d on h.destination_id=d.destination_id order by h.destination_id,hotel_id";
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
                                                    out.println("<td><button onclick=\"editRow(this,"+rs.getInt(1)+","+rs.getInt(7)+")\">Edit</button></td>");
                                                    out.println("<td><button onclick=\"del("+rs.getInt(1)+",'adminHotels.jsp')\">Delete</button></td>");
                                                out.println("</tr>");
                                                
                                            }
                                            con.close();
                                        }
                                    }
                                    catch(Exception e)
                                    {
                                        out.println(e);
                                    }
                %>
                
            </table>
            </div>
        </div>
    </div>

<jsp:include page="footer.jsp" />
</body>
</html>
