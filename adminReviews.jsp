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
    <title>Reviews Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="script.js"></script>
</head>
<body>
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
                    String query="delete from reviews where review_id=?";
                    PreparedStatement stmt=con.prepareStatement(query);
                    stmt.setInt(1,Integer.parseInt(del));
                    int rs=stmt.executeUpdate();
                    if(rs!=0)
                    {
                        out.println("<script> alert('Record Deleted !!'); window.location.href = 'adminReviews.jsp';</script>");
//                        response.sendRedirect("adminReviews.jsp");
                    }
                    else
                    {
                        out.println("<script> alert('Error deleting Data !!'); window.location.href = 'adminReviews.jsp'; </script>");
//                        response.sendRedirect("adminReviews.jsp");
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
                    String query="select max(review_id) from reviews;";
                    PreparedStatement stmt=con.prepareStatement(query);
                    ResultSet rs=stmt.executeQuery(query);
                    if(rs.next())
                        max=rs.getInt(1);
                    query="insert into reviews(review_id,name,rating,review) values(?,?,?,?)";
                    stmt=con.prepareStatement(query);
                    stmt.setInt(1,max+1);
                    stmt.setString(2,request.getParameter("Name"));
                    stmt.setInt(3,Integer.parseInt(request.getParameter("Rating")));
                    stmt.setString(4,request.getParameter("Review"));
                    int rs1=stmt.executeUpdate();
                    if(rs1!=0)
                    {
                        out.println("<script> alert('Saved Successfully !!'); window.location.href = 'adminReviews.jsp';</script>");
//                        response.sendRedirect("adminReviews.jsp");
                    }
                    else
                    {
                        out.println("<script> alert('Error Saving Data !!'); window.location.href = 'adminReviews.jsp'; </script>");
//                        response.sendRedirect("adminReviews.jsp");
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
            <h1>Reviews</h1>
            <hr>
            <br>
            <form method="POST" action="adminReviews.jsp">
                <div class="FormRow">
                    <label>Review ID :</label><br>
                    <input type="text" name="ReviewId"  readonly>
                </div>
                <div class="FormRow">
                    <label>Name :</label><br>
                    <input type="text" name="Name"  required>
                </div>
                <div class="FormRow">
                    <label>Rating :</label><br>
                    <select name="Rating" style="width: 52.5%" class="contact-us-input" required>
                        <option>Select</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                </div>

                <div class="FormRow">
                    <label>Review :</label><br>
                    <textarea name="Review" style="width:50%;padding:10px;" required></textarea>    
                </div>
                <div class="FormRow" style="display: flex; justify-content: center;width: 50%;">
                    <input type="submit" name="save" value="Save" class="btn" style="width: 100px;">
                    <input type= "reset" value="Reset" onclick="refresh(adminReviews.jsp)"  class="btn" style="width: 100px;margin-left: 20px;">
                </div>
            </form>
            <br>
            <hr><hr>
            <br>
            <table class="CityTable">
                <tr>
                    <th>
                        Review Id.
                    </th>
                    <th>
                        Name
                    </th>
                    <th>
                        Rating
                    </th>
                    <th>
                        Review
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
                                            String query="select review_id,name,rating,review from reviews";
                                            ResultSet rs=stmt.executeQuery(query); 
                                            while(rs.next())
                                            {
                                                out.println("<tr>");
                                                    out.println("<td>"+rs.getInt(1)+"</td>");
                                                    out.println("<td>"+rs.getString(2)+"</td>");
                                                    out.println("<td>"+rs.getInt(3)+"</td>");
                                                    out.println("<td style=\"width: 400px;\">"+rs.getString(4)+"</td>");
                                                    out.println("<td><button onclick=\"del("+rs.getInt(1)+",'adminReviews.jsp')\">Delete</button></td>");
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

<jsp:include page="footer.jsp" />
</body>
</html>
