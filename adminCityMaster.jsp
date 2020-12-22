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
    <title>City Master</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="script.js"></script>
</head>
<body>
    <script>
        function editRow(e,id)
        {
            var childrens=e.parentElement.parentElement.children;
            document.myForm.CityId.value=childrens[0].innerHTML;
            document.myForm.City.value=childrens[1].innerHTML;
            document.myForm.save.name="update";
            document.myForm.save.value="Update";
            window.location.href="#editForm";
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
                    String query="delete from city_master where city_id=?";
                    PreparedStatement stmt=con.prepareStatement(query);
                    stmt.setInt(1,Integer.parseInt(del));
                    int rs=stmt.executeUpdate();
                    if(rs!=0)
                    {
                        out.println("<script> alert('Record Deleted !!'); window.location.href = 'adminCityMaster.jsp';</script>");
//                        response.sendRedirect("adminCityMaster.jsp");
                    }
                    else
                    {
                        out.println("<script> alert('Error deleting Data !!'); window.location.href = 'adminCityMaster.jsp';</script>");
//                        response.sendRedirect("adminCityMaster.jsp");
                    }
                    con.close();
                }
            }
            if(request.getParameter("save")!=null)
            {
                Connection con= new DataBaseConnection().returnConnection();
                if(con!=null)
                {
                    int max=0;
                    String query="select max(city_id) from city_master;";
                    PreparedStatement stmt=con.prepareStatement(query);
                    ResultSet rs=stmt.executeQuery(query);
                    if(rs.next())
                        max=rs.getInt(1);
                    query="insert into city_master(city,city_id) values(?,?)";
                    stmt=con.prepareStatement(query);
                    stmt.setString(1,request.getParameter("City"));
                    stmt.setInt(2,max+1);
                    
                    int rs1=stmt.executeUpdate();
                    if(rs1!=0)
                    {
                        out.println("<script> alert('Saved Successfully !!'); window.location.href = 'adminCityMaster.jsp';</script>");
//                        response.sendRedirect("adminCityMaster.jsp");
                    }
                    else
                    {
                        out.println("<script> alert('Error Saving Data !!'); window.location.href = 'adminCityMaster.jsp';</script>");
//                        response.sendRedirect("adminCityMaster.jsp");
                    }
                    con.close();
                }
            }
            if(request.getParameter("update")!=null)
            {
                Connection con= new DataBaseConnection().returnConnection();
                if(con!=null)
                {
                    String query="update city_master set city=? where city_id=?";
                    PreparedStatement stmt=con.prepareStatement(query);
                    stmt.setString(1,request.getParameter("City"));
                    stmt.setInt(2,Integer.parseInt(request.getParameter("CityId")));
                    
                    int rs=stmt.executeUpdate();
                    if(rs!=0)
                    {
                        out.println("<script> alert('Updated Successfully !!'); window.location.href = 'adminCityMaster.jsp';</script>");
//                        response.sendRedirect("adminCityMaster.jsp");
                    }
                    else
                    {
                        out.println("<script> alert('Error Updating Data !!'); window.location.href = 'adminCityMaster.jsp'; </script>");
//                        response.sendRedirect("adminCityMaster.jsp");
                    }
                    con.close();
                }
            }
        }
        catch(Exception e)
        {
            out.println("<h1>"+e+"</h1>");
        }
    %>
<div class="AdminContainer">
    <jsp:include page="adminSidebar.jsp" />
        <div class="AdminMain">
            <h1>City Master</h1>
            <hr>
            <br>
            <form method="POST" id="editForm" name="myForm" action="adminCityMaster.jsp">
                <div class="FormRow" >
                    <label>City ID :</label><br>
                    <input type="text" name="CityId" value="" readonly>
                </div>
                <div class="FormRow">
                    <label>City :</label><br>
                    <input type="text" name="City" value="" style="width:50%;padding:10px;" required>
                </div>
                <div class="FormRow" style="display: flex; justify-content: center;width: 50%;">
                    <input type="submit" name="save" value="Save" class="btn" style="width: 100px;">                   
                    <input type= "reset" value="Reset" onclick="refresh()"  class="btn" style="width: 100px;margin-left: 20px;">
                </div>
            </form>
            <br>
            <hr><hr>
            <br>
            <table class="CityTable">
                <tr>
                    <th>
                        City Id.
                    </th>
                    <th>
                        City
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
                                            String query="select city_id,city from city_master order by city_id";
                                            ResultSet rs=stmt.executeQuery(query); 
                                            while(rs.next())
                                            {
                                                out.println("<tr>");
                                                    out.println("<td>"+rs.getInt(1)+"</td>");
                                                    out.println("<td>"+rs.getString(2)+"</td>");
                                                    out.println("<td><button onclick=\"editRow(this,"+rs.getInt(1)+")\">Edit</button></td>");
                                                    out.println("<td><button onclick=\"del("+rs.getInt(1)+",'adminCityMaster.jsp')\">Delete</button></td>");
                                                out.println("</tr>");
                                                
                                            }
                                            con.close();
                                        }
                                    }
                                    catch(Exception e)
                                    {
                                        
                                    }
                %>
                <!-- While loop for td -->
            </table>
        </div>
    </div>

<jsp:include page="footer.jsp" />
</body>
</html>
