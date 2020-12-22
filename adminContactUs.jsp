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
            document.myForm.FormId.value=id;
            document.myForm.Name.value=childrens[0].innerHTML;
            document.myForm.Email.value=childrens[1].innerHTML;
            document.myForm.City.value=childrens[2].innerHTML;
            document.myForm.Query.value=childrens[3].innerHTML;
            document.myForm.Status.value=childrens[4].innerHTML;
            window.location.href="#editForm";
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
                    String query="update contact_us_form set status=? where form_id=?";
                    PreparedStatement stmt=con.prepareStatement(query);
                    stmt.setString(1,request.getParameter("Status"));
                    stmt.setInt(2,Integer.parseInt(request.getParameter("FormId")));
                    
                    int rs=stmt.executeUpdate();
                    if(rs!=0)
                    {
                        out.println("<script> alert('Updated Successfully !!'); window.location.href = 'adminContactUs.jsp';</script>");
//                        response.sendRedirect("adminContactUs.jsp");
                    }
                    else
                    {
                        out.println("<script> alert('Error Updating Data !!'); window.location.href = 'adminContactUs.jsp'; </script>");
//                        response.sendRedirect("adminContactUs.jsp");
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
            <h1>Contact Us Details</h1>
            <hr>
            <br>
            <form method="POST" id="editForm" name="myForm" action="adminContactUs.jsp">
                <div class="FormRow">
                    <label>Form ID :</label><br>
                    <input type="text" name="FormId" value="" readonly>
                </div>
                <div class="FormRow">
                    <label>Name :</label><br>
                    <input type="text" name="Name" value="" style="width:50%;padding:10px;" required readonly required>
                </div>
                <div class="FormRow">
                    <label>Email :</label><br>
                    <input type="text" name="Email" value="" style="width:50%;padding:10px;" required readonly >
                </div>
                <div class="FormRow">
                    <label>City :</label><br>
                    <input type="text" name="City" value="" style="width:50%;padding:10px;" required readonly >
                </div>
                <div class="FormRow">
                    <label>Query :</label><br>
                    <textarea name="Query" style="width:50%;padding:10px;" required readonly ></textarea>
                </div>
                <div class="FormRow">
                    <label>Status :</label><br>
                    <select name="Status" style="width:52.5%;padding:10px;" required>
                        <option value="">Select</option>
                        <option value="Unread">Unread</option>
                        <option value="Read">Read</option>
                        <option value="Resolved">Resolved</option>
                    </select>
                </div>
                <div class="FormRow" style="display: flex; justify-content: center;width: 50%;">
                   <input type="submit" name="update" value="Update" class="btn" style="width: 100px;">
                   <input type= "reset" value="Reset" class="btn" style="width: 100px;margin-left: 20px;">
                </div>
            </form>
            <br>
            <hr><hr>
            <br>
            <table class="CityTable">
                <tr>
                    <th>
                        Name
                    </th>
                    <th>
                        Email
                    </th>
                    <th>
                        City
                    </th>
                    <th>
                        Query
                    </th>
                    <th>
                        Status
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
                                            String query="select name,email,city,query,form_id,status from contact_us_form order by form_id desc";
                                            ResultSet rs=stmt.executeQuery(query); 
                                            while(rs.next())
                                            {
                                                out.println("<tr>");
                                                    out.println("<td>"+rs.getString(1)+"</td>");
                                                    out.println("<td>"+rs.getString(2)+"</td>");
                                                    out.println("<td>"+rs.getString(3)+"</td>");
                                                    out.println("<td style=\"width: 390px;padding: 0px 5px;\">"+rs.getString(4)+"</td>");
                                                    out.println("<td>"+rs.getString(6)+"</td>");
                                                    out.println("<td><button onclick=\"editRow(this,"+rs.getInt(5)+")\">Edit</button></td>");
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
