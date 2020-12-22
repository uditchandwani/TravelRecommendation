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
    <title>Admin Index</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="script.js"></script>
</head>
<body>
    <script>
        function editRow(e,id,pwd)
        {
            var childrens=e.parentElement.parentElement.children;
            document.myForm.AdminId.value=childrens[0].innerHTML;
            document.myForm.Name.value=childrens[1].innerHTML;
            document.myForm.Email.value=childrens[2].innerHTML;
            document.myForm.Phone.value=childrens[3].innerHTML;
            document.myForm.City.value=childrens[4].innerHTML;
            document.myForm.pwd.value=pwd;
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
                    String query="delete from admin where admin_id=?";
                    PreparedStatement stmt=con.prepareStatement(query);
                    stmt.setInt(1,Integer.parseInt(del));
                    int rs=stmt.executeUpdate();
                    if(rs!=0)
                    {
                        out.println("<script> alert('Record Deleted !!'); window.location.href = 'adminIndex.jsp';</script>");
//                        response.sendRedirect("adminIndex.jsp");
                    }
                    else
                    {
                        out.println("<script> alert('Error deleting Data !!'); window.location.href = 'adminIndex.jsp';</script>");
//                        response.sendRedirect("adminIndex.jsp");
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
                    String query="select max(admin_id) from admin;";
                    PreparedStatement stmt=con.prepareStatement(query);
                    ResultSet rs=stmt.executeQuery(query);
                    if(rs.next())
                        max=rs.getInt(1);
                    query="insert into admin(admin_name,admin_email,city,admin_phone,pwd,admin_id) values(?,?,?,?,?,?)";
                    stmt=con.prepareStatement(query);
                    stmt.setString(1,request.getParameter("Name"));
                    stmt.setString(2,request.getParameter("Email"));
                    stmt.setString(3,request.getParameter("City"));
                    stmt.setString(4,request.getParameter("Phone"));
                    stmt.setString(5,request.getParameter("pwd"));
                    stmt.setInt(6,max+1);
                    
                    int rs1=stmt.executeUpdate();
                    if(rs1!=0)
                    {
                        out.println("<script> alert('Saved Successfully !!'); window.location.href = 'adminIndex.jsp';</script>");
//                        response.sendRedirect("adminIndex.jsp");
                    }
                    else
                    {
                        out.println("<script> alert('Error Saving Data !!'); window.location.href = 'adminIndex.jsp'; </script>");
//                        response.sendRedirect("adminIndex.jsp");
                    }
                    con.close();
                }
            }
            if(request.getParameter("update")!=null)
            {
                Connection con= new DataBaseConnection().returnConnection();
                if(con!=null)
                {
                    String query="update admin set admin_name=?,admin_email=?,city=?,admin_phone=?,pwd=? where admin_id=?";
                    PreparedStatement stmt=con.prepareStatement(query);
                    stmt.setString(1,request.getParameter("Name"));
                    stmt.setString(2,request.getParameter("Email"));
                    stmt.setString(3,request.getParameter("City"));
                    stmt.setString(4,request.getParameter("Phone"));
                    stmt.setString(5,request.getParameter("pwd"));
                    stmt.setInt(6, Integer.parseInt(request.getParameter("AdminId")));
                    
                    int rs=stmt.executeUpdate();
                    if(rs!=0)
                    {
                        out.println("<script> alert('Updated Successfully !!'); window.location.href = 'adminIndex.jsp';</script>");
//                        response.sendRedirect("adminIndex.jsp");
                    }
                    else
                    {
                        out.println("<script> alert('Error Updating Data !!'); window.location.href = 'adminIndex.jsp'; </script>");
//                        response.sendRedirect("adminIndex.jsp");
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
            <h1>Admin Details</h1>
            <hr>
            <br>
            <form method="POST" id="editForm" name="myForm" action="adminIndex.jsp">
                <div class="FormRow">
                    <label>Admin ID :</label><br>
                    <input type="text" name="AdminId" value="" readonly>
                </div>
                <div class="FormRow">
                    <label>Name :</label><br>
                    <input type="text" name="Name" value="" required>
                </div>
                <div class="FormRow">
                    <label>Email :</label><br>
                    <input type="text" name="Email" value="" required>
                </div>

                <div class="FormRow">
                    <label>City :</label><br>
                    <select name="City" style="width:52.2%;padding:10px;" required>
                        <option value="">Select</option>
                        <%
                            try
                            {
                                Connection con= new DataBaseConnection().returnConnection();
                                if(con!=null)
                                {
                                    String query="select city from city_master";
                                    PreparedStatement stmt=con.prepareStatement(query);
                                    ResultSet rs=stmt.executeQuery();
                                    while(rs.next())
                                    {%>
                                    <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
                                    <%}
                                    con.close(); 
                                }
                            }
                            catch(Exception e)
                            {

                            }
                            
                        %>
                       
                    </select>
                </div>

                <div class="FormRow">
                    <label>Phone :</label><br>
                    <input type="text" name="Phone" value="" required>
                </div>

                <div class="FormRow">
                    <label>Password :</label><br>
                    <input type="Password" name="pwd" value="" required>
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
                        Admin Id.
                    </th>
                    <th>
                        Name
                    </th>
                    <th>
                        Email
                    </th>
                    <th>
                        Phone
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
                                            String query="select admin_id,admin_name,admin_email,admin_phone,city,pwd from admin order by admin_id";
                                            ResultSet rs=stmt.executeQuery(query); 
                                            while(rs.next())
                                            {
                                                out.println("<tr>");
                                                    out.println("<td>"+rs.getInt(1)+"</td>");
                                                    out.println("<td>"+rs.getString(2)+"</td>");
                                                    out.println("<td>"+rs.getString(3)+"</td>");
                                                    out.println("<td>"+rs.getString(4)+"</td>");
                                                    out.println("<td>"+rs.getString(5)+"</td>");
                                                    out.println("<td><button onclick=\"editRow(this,"+rs.getInt(1)+",'"+rs.getString(6)+"')\">Edit</button></td>");
                                                    out.println("<td><button onclick=\"del("+rs.getInt(1)+",'adminIndex.jsp')\">Delete</button></td>");
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
