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
    <title>Top Places</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="script.js"></script>
</head>
<body>
    <script>
        function editRow(e,id,dId)
        {
            var childrens=e.parentElement.parentElement.children;
            document.myForm.PlaceId.value=childrens[0].innerHTML;
            document.myForm.Name.value=childrens[1].innerHTML;
            document.myForm.DestinationId.value=dId;
            document.myForm.Rating.value=childrens[3].innerHTML;
            document.getElementById("placeImg").src="images/places_to_visit/"+childrens[2].innerHTML+" ("+childrens[1].innerHTML+").jpg"; //(id-1)+". "+(childrens[1].innerHTML)+".jpg";
            document.myForm.save.name="update";
            document.myForm.save.value="Update";
            window.location.href="#editForm";
        }
        function refresh1()
        {
            document.myForm.save.name="save";
            document.myForm.save.value="Save";
            document.getElementById("placeImg").src="";
            
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
//                        String query="select ranking from top_hotels where hotel_id=?";
//                        PreparedStatement stmt=con.prepareStatement(query);
//                        stmt.setInt(1, Integer.parseInt(del));
//                        ResultSet rs1=stmt.executeQuery();
//                        if(rs1.next())
//                        {
//                            
//                        }
//                        else
//                        {
                            String DesName="";
                            String PlaceName="";
                            String query1="select name,place_name from destination d inner join place_to_visit p on d.destination_id=p.destination_id where place_id=?";
                            PreparedStatement stmt=con.prepareStatement(query1);
                            stmt.setInt(1,Integer.parseInt(del));
                            ResultSet rs1=stmt.executeQuery();
                            if(rs1.next())
                            {
                                DesName=rs1.getString(1);
                                PlaceName=rs1.getString(2);
                            }
                            String query="delete from place_to_visit where place_id=?";
                            stmt=con.prepareStatement(query);
                            stmt.setInt(1,Integer.parseInt(del));
                            int rs=stmt.executeUpdate();
                            if(rs!=0)
                            {
                                File file = new File("D:/Udit/Projects/NetBeans Projects/Travelo/web/images/places_to_visit/"+DesName+" ("+PlaceName+").jpg"); 
                                if(file.delete())
                                {
                                out.println("<script> alert('Record Deleted !!'); window.location.href = 'adminPlaces.jsp';</script>");
                                }
                                else
                                {
                                    out.println("<script> alert('Img Not deleted :- "+DesName+" ("+PlaceName+").jpg !!'); window.location.href = 'adminPlaces.jsp';</script>");
                                }
                            }
                            else
                            {
                                out.println("<script> alert('Error deleting Data !!'); window.location.href = 'adminPlaces.jsp'; </script>");
                            }
//                        }
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
            <h1>Top Places</h1>
            <hr>
            <br>
            <form method="POST" id="editForm" name="myForm" action="AdminPlacesResponse" enctype="multipart/form-data">
                <div class="FormRow">
                    <label>Place ID :</label><br>
                    <input type="text" name="PlaceId" value="" readonly>
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
                    <img src="" id="placeImg" style="height: 250px;" alt="PlaceImage"><br>
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
                        Place Id.
                    </th>
                    <th>
                        Name
                    </th>
                    <th>
                        Destination
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
                                            String query="select place_id,place_name,name,p.rating,p.destination_id from place_to_visit p inner join destination d on p.destination_id=d.destination_id order by p.destination_id,place_id";
                                            ResultSet rs=stmt.executeQuery(query); 
                                            while(rs.next())
                                            {
                                                out.println("<tr>");
                                                    out.println("<td>"+rs.getInt(1)+"</td>");
                                                    out.println("<td>"+rs.getString(2)+"</td>");
                                                    out.println("<td>"+rs.getString(3)+"</td>");
                                                    out.println("<td>"+rs.getInt(4)+"</td>");
                                                    out.println("<td><button onclick=\"editRow(this,"+rs.getInt(1)+","+rs.getInt(5)+")\">Edit</button></td>");
                                                    out.println("<td><button onclick=\"del("+rs.getInt(1)+",'adminPlaces.jsp')\">Delete</button></td>");
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
