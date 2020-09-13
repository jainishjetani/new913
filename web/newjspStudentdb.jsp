<%-- 
    Document   : newjspStudentdb
    Created on : Sep 13, 2020, 1:47:18 PM
    Author     : Jetani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <%@ page import="java.sql.*" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
  
        
       
        
     
<%
 
 Class.forName("com.mysql.jdbc.Driver");

  try {    System.out.println("Loading driver...=====================================");
   
    Connection conn = DriverManager.getConnection("jdbc:mysql://database-1.c6jevgf51ssc.us-east-1.rds.amazonaws.com:3306/StudentDB","admin","admin123");
   out.print(conn);
    Statement readStatement = conn.createStatement();
      ResultSet resultSet = readStatement.executeQuery("SELECT * from studenttable;");
 %>
   

 <table border=1 align=center style="text-align:center">
      <thead>
          <tr>
             <th>ID</th>
             <th>NAME</th>
             <th>Email</th>
             <th>city</th>
             <th>phone</th>
             <th>department</th>
          </tr>
      </thead>
      <tbody>
        <% while(resultSet.next())
        {
            %>
            <tr>
                <td><%=resultSet.getString("id") %></td>
                <td><%=resultSet.getString("name") %></td>
                <td><%=resultSet.getString("email") %></td>
                <td><%=resultSet.getString("city") %></td>
                <td><%=resultSet.getString("phone") %></td>
                <td><%=resultSet.getString("department") %></td>
            </tr>
            <%}%>
           </tbody>
        </table><br>
    <%
    
   
    
    resultSet.close();
    readStatement.close();
    conn.close();

  } catch (SQLException ex) {

    %>
    <h1> catch</h1>
        <%
    // Handle any errors
    System.out.println("SQLException: " + ex.getMessage());
    System.out.println("SQLState: " + ex.getSQLState());
    System.out.println("VendorError: " + ex.getErrorCode());
  } finally {
       System.out.println("Closing the connection.");
    
  }
%>
        
        
        
        
        
        
        
        
        
        
        
        
        
    </body>
</html>
