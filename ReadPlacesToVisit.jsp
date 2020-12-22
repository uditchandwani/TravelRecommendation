<%-- 
    Document   : ReadCSV
    Created on : 20 Nov, 2020, 2:50:48 PM
    Author     : uditc
--%>

<%@page import="java.sql.ResultSet"%>
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
	    	String csvFilePath = "D:/Udit/Projects/PlacesToVisitFinal.csv";
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
                    String query1="select destination_id,name from destination;";
                        PreparedStatement stmt1=con.prepareStatement(query1);
                        ResultSet rs1 = stmt1.executeQuery();
                        rs1.next();
                    while ((lineText = lineReader.readLine()) != null) 
                    {
                        j++;
                        String[] data = lineText.split("\t");                        
                        while(!rs1.getString(2).equals(data[0]))
                                        {
                                            rs1.next();
                                        }                                    
                        String query="insert into place_to_visit(place_id,place_name,destination_id,rating,place_desc) values(?,?,?,?,?);";
                        PreparedStatement stmt=con.prepareStatement(query);
                        stmt.setInt(1,j);
                        stmt.setString(2,data[1]);
                        stmt.setInt(3,rs1.getInt(1));
                        stmt.setInt(4,Integer.parseInt(data[2].substring(0, 1)));
                        stmt.setString(5,data[3]);
                        int rs = stmt.executeUpdate();
                        if(rs!=0)
                        out.println("<p>"+rs1.getInt(1)+" : "+rs1.getString(2)+" : "+data[1]+" entered</p>");
//                        out.println("<p>"+data[0]+"</p>");  //destination
//                        out.println("<p>"+data[1]+"</p>");  //place to visit
//                        out.println("<p>"+data[2]+"</p>");  //rating
//                        out.println("<p>"+data[3]+"</p>");  //desc
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
