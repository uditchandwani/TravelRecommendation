<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="header-image">
    <header class="container">
        <div class="header-logo"><a href="index.jsp" class="header-logo">Travelo</a></div>
        <div class="header-nav">
            <a href="index.jsp">Home</a>
            <a href="destinations.jsp">Destinations</a>
            <a href="hotels.jsp">Hotels</a>
            <a href="survey.jsp">Recommendation</a>
            <a href="aboutUs.jsp">About Us</a>
            <a href="contactUs.jsp">Contact Us</a>
            
            <%
            Cookie ck[]=request.getCookies();
            String var="";
            int flag=0;
            
            if(ck!=null)
            {
                for(int i=0;i<ck.length;i++)
                    if(ck[i].getName().equals("traveloName"))
                    {
                        flag=1;
                        var=ck[i].getValue().split(" ")[0];
                        out.print("<a id=\"login\" href=\"personalInfo.jsp\">"+var+"</a>");
                    }
            }
            if(flag==0)
            out.print("<a id=\"login\" href=\"login.jsp\">Log In</a>");
    %>
            
            
        </div>
    </header>
    <!-- <div class="header-slogan">
        <h1>Be a Traveler not a Tourist</h1>
        <h3>Travel to the any corner of the world, without going around in circles</h3>
    </div> -->
</div>