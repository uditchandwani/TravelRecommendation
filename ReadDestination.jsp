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
	    	String csvFilePath = "D:/Udit/Projects/DestinationsNew.csv";
                BufferedReader lineReader = new BufferedReader(new FileReader(csvFilePath));
	        String lineText = null;
	        int count = 0;
	 
	        lineReader.readLine(); // skip header line
                Connection con= new DataBaseConnection().returnConnection();
                if(con!= null)
                {
                    int i=0;
                    while ((lineText = lineReader.readLine()) != null) 
                    {
                        i++;
                        String[] data = lineText.split("\t");
                        String query="insert into destination(destination_id,name,state,starting_budget,best_time_to_visit,ideal_duration,nearest_airport,tourism_desc,rating) values(?,?,?,?,?,?,?,?,?);";
                        PreparedStatement stmt=con.prepareStatement(query);
                        stmt.setInt(1,i);
                        stmt.setString(2,data[0]);
                        stmt.setString(3,data[1]);
                        stmt.setString(4,data[6]);
                        stmt.setString(5,data[3]);
                        stmt.setString(6,data[4].replace("day","Day"));
                        stmt.setString(7,data[5]);
                        stmt.setString(8,data[7]);
                        stmt.setInt(9,Integer.parseInt(data[2].substring(0, 1)));
                        int rs = stmt.executeUpdate();
                        if(rs!=0)
                        out.println("<p>"+data[0]+" entered</p>");
//                        out.println("<p>"+data[0]+"</p>");  //place
//                        out.println("<p>"+data[1]+"</p>");  //state
//                        out.println("<p>"+data[2]+"</p>");  //rating
//                        out.println("<p>"+data[3]+"</p>");  //ideal time to visit
//                        out.println("<p>"+data[4].replace("days","Days")+"</p>");   //ideal duration
//                        out.println("<p>"+data[5]+"</p>");  //nearesy airport
//                        out.println("<p>"+data[6]+"</p>"); //Starting Budget       
    //                    String abc[]=data[7].split("\n");
    //                    for(String x:abc)
    //                        out.println("<p>"+x.replace("\"","")+"</p>");
//                        out.println("<p>"+data[7]+"</p>"); //about 
//                        out.println("<p>"+data[7]+"</p>"); //about
//    	            out.println("<p>"+data[8]+"</p>");  //top places
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
