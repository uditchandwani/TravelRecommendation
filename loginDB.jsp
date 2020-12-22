<%@page import="Database.DataBaseConnection"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>

<%
    Cookie ck[]=request.getCookies();
    String var="";
            
            if(ck!=null)
            {
                for(int i=0;i<ck.length;i++)
                    if(ck[i].getName().equals("pack"))
                        var=ck[i].getValue();
            }
    %>


<%
    String uid=request.getParameter("uName");
    String password=request.getParameter("pass");
    
     
    Connection con= new DataBaseConnection().returnConnection();
    String query="select admin_id, admin_name from admin where admin_email=? and pwd=?";
    PreparedStatement st=con.prepareStatement(query);
    st.setString(1,uid);
    st.setString(2,password);
     ResultSet rs=st.executeQuery();
    if(rs.next())
    {
        Cookie ckk=new Cookie("traveloID",Integer.toString(rs.getInt(1)));
        ckk.setMaxAge(100000);
        Cookie ckk1=new Cookie("traveloName",rs.getString(2));
        ckk1.setMaxAge(100000);
        Cookie ckk2=new Cookie("traveloDesignation","Admin");
        ckk2.setMaxAge(100000);
        response.addCookie(ckk);
        response.addCookie(ckk1);
        response.addCookie(ckk2);
        session.setAttribute("CALL",uid);
        response.sendRedirect("index.jsp");
    }
    else
    {
        query="select user_id, user_name from user_details where user_email=? and pwd=?";
        st=con.prepareStatement(query);
        st.setString(1,uid);
        st.setString(2,password);
        rs=st.executeQuery();
        if(rs.next())
        {
            Cookie ckk=new Cookie("traveloID",Integer.toString(rs.getInt(1)));
            ckk.setMaxAge(100000);
            Cookie ckk1=new Cookie("traveloName",rs.getString(2));
            ckk1.setMaxAge(100000);
            Cookie ckk2=new Cookie("traveloDesignation","User");
            ckk2.setMaxAge(100000);
            response.addCookie(ckk);
            response.addCookie(ckk1);
            response.addCookie(ckk2);
            session.setAttribute("CALL",uid);
            response.sendRedirect("index.jsp");
        }
        else
        {
            out.println("<script>alert('Invalid Id or Password'); window.location.href='login.jsp';</script>");
        }
    }
    %>