
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>

<%
String fullName=request.getParameter("fNm");    
String email=request.getParameter("email");    
String password=request.getParameter("pass");
String Rpassword=request.getParameter("rPass");
String contact=request.getParameter("cont");       
String location=request.getParameter("loc");    
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","utkarsh");
PreparedStatement st=con.prepareStatement(
   "insert   into   user_details(user_name, user_email, user_phone, city, pwd) values(?,?,?,?,?)");
st.setString(1,fullName); 
st.setString(2,email);
st.setString(5,password);
st.setString(3,contact);
st.setString(4,location);
int rs=st.executeUpdate();

                if(rs!=0)
                {
                    out.println("<h1>Account created Successfully</h1>");
                    out.println("<a href=\"login.jsp\">Login</a>");
                }
con.close();

//response.sendRedirect("accountcreated.jsp");


%>
