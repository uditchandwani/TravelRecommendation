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
    <title>Contact Us Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="script.js"></script>
</head>
<body>
    <script>
        function editRow(e,id)
        {
            var childrens=e.parentElement.parentElement.children;
            document.myForm.SubId.value=childrens[0].innerHTML;
            document.myForm.Email.value=childrens[1].innerHTML;
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
                    String query="delete from news_letter where sub_id=?";
                    PreparedStatement stmt=con.prepareStatement(query);
                    stmt.setInt(1,Integer.parseInt(del));
                    int rs=stmt.executeUpdate();
                    if(rs!=0)
                    {
                        out.println("<script> alert('Record Deleted !!'); window.location.href = 'adminNewsLetter.jsp';</script>");
//                        response.sendRedirect("adminNewsLetter.jsp");
                    }
                    else
                    {
                        out.println("<script> alert('Error deleting Data !!'); window.location.href = 'adminNewsLetter.jsp'; </script>");
//                        response.sendRedirect("adminNewsLetter.jsp");
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
                    String query="select max(sub_id) from news_letter;";
                    PreparedStatement stmt=con.prepareStatement(query);
                    ResultSet rs=stmt.executeQuery(query);
                    if(rs.next())
                        max=rs.getInt(1);
                    query="insert into news_letter(user_email,sub_id) values(?,?)";
                    stmt=con.prepareStatement(query);
                    stmt.setString(1,request.getParameter("Email"));
                    stmt.setInt(2,max+1);
                    
                    int rs1=stmt.executeUpdate();
                    if(rs1!=0)
                    {
                        out.println("<script> alert('Saved Successfully !!'); window.location.href = 'adminNewsLetter.jsp';</script>");
//                        response.sendRedirect("adminNewsLetter.jsp");
                    }
                    else
                    {
                        out.println("<script> alert('Error Saving Data !!'); window.location.href = 'adminNewsLetter.jsp'; </script>");
//                        response.sendRedirect("adminNewsLetter.jsp");
                    }
                    con.close();
                }
            }
            if(request.getParameter("update")!=null)
            {
                Connection con= new DataBaseConnection().returnConnection();
                if(con!=null)
                {
                    String query="update news_letter set user_email=? where sub_id=?";
                    PreparedStatement stmt=con.prepareStatement(query);
                    stmt.setString(1,request.getParameter("Email"));
                    stmt.setInt(2,Integer.parseInt(request.getParameter("SubId")));
                    
                    int rs=stmt.executeUpdate();
                    if(rs!=0)
                    {
                        out.println("<script> alert('Updated Successfully !!'); window.location.href = 'adminNewsLetter.jsp';</script>");
//                        response.sendRedirect("adminNewsLetter.jsp");
                    }
                    else
                    {
                        out.println("<script> alert('Error Updating Data !!'); window.location.href = 'adminNewsLetter.jsp'; </script>");
//                        response.sendRedirect("adminNewsLetter.jsp");
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
            <h1>News Letter Subscribers</h1>
            <hr>
            <br>
            <form method="POST" id="editForm" name="myForm" action="adminNewsLetter.jsp">
                <div class="FormRow">
                    <label>Sub ID :</label><br>
                    <input type="text" name="SubId" value="" readonly>
                </div>
                <div class="FormRow">
                    <label>Email :</label><br>
                    <input type="text" name="Email" value="" style="width:50%;padding:10px;" required>
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
                        Sub ID
                    </th>
                    <th>
                        Email
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
                                            String query="select sub_id,user_email from news_letter order by sub_id";
                                            ResultSet rs=stmt.executeQuery(query); 
                                            while(rs.next())
                                            {
                                                out.println("<tr>");
                                                    out.println("<td>"+rs.getInt(1)+"</td>");
                                                    out.println("<td>"+rs.getString(2)+"</td>");
                                                    out.println("<td><button onclick=\"editRow(this,"+rs.getInt(1)+")\">Edit</button></td>");
                                                    out.println("<td><button onclick=\"del("+rs.getInt(1)+",'adminNewsLetter.jsp')\">Delete</button></td>");
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
