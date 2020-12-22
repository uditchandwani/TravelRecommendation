<%-- 
    Document   : ReadCSV
    Created on : 20 Nov, 2020, 2:50:48 PM
    Author     : uditc
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Scanner"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            try
    	{
	    	String csvFilePath = "D:/Udit/Projects/Hotels.csv";
                BufferedReader lineReader = new BufferedReader(new FileReader(csvFilePath));
	        String lineText = null;
//	        int count = 0;
	 
	        lineReader.readLine(); // skip header line
                Connection con= new DataBaseConnection().returnConnection();
                if(con!= null)
                {
                    int i=0;
                    int j=0;
                    String name="";
                    while ((lineText = lineReader.readLine()) != null) 
                    {
                        j++;
                        String[] data = lineText.split("\t");
                        if(!name.equals(data[0]))
                        {
                            i++;
                            name=data[0];
                        }
                        String query="insert into hotels(hotel_id,destination_id,hotel_name,starting_budget,city_center,rating) values(?,?,?,?,?,?);";
                        PreparedStatement stmt=con.prepareStatement(query);
                        stmt.setInt(1,j);
                        stmt.setInt(2,i);
                        stmt.setString(3,data[1]);
                        stmt.setString(4,data[2]);
                        stmt.setString(5,data[3]);
                        int endIndex=data[4].indexOf(".");
                        stmt.setInt(6,(Integer.parseInt(data[4].substring(0,endIndex))/2));
                        int rs = stmt.executeUpdate();
                        if(rs!=0)
                        out.println("<p>"+data[0]+" : "+data[1]+" entered</p>");
//                        out.println("<p>"+data[0]+"</p>");  //destination
//                        out.println("<p>"+data[1]+"</p>");  //hotel name
//                        out.println("<p>"+data[2]+"</p>");  //Starting Budget
//                        out.println("<p>"+data[3]+"</p>");  //distance from city center
//                        int endIndex=data[4].indexOf(".");
//                        out.println("<p>"+(Integer.parseInt(data[4].substring(0,endIndex))/2)+"</p>");  //rating
//                        out.println("<p>----------------------------------------</p>");

                    }
                }
	        lineReader.close();
	    }
	    catch(Exception e)
	    {
	    	out.println(e);
	    }


        %>
    </body>
</html>
