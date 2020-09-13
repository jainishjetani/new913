<%-- 
    Document   : showdata
    Created on : Sep 12, 2020, 10:47:04 AM
    Author     : Jetani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
    <title>Jsp Sample</title>
    <%@page import="java.sql.*;"%>
</head>
<html>
    <%
        String jdbcUrl0="jdbc:mysql://database-1.c6jevgf51ssc.us-east-1.rds.amazonaws.com:3306/dbname?user=admin&password=admin123";
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(jdbcUrl0);
        Statement st=con.createStatement();
   try
    {        
        ResultSet rs=st.executeQuery("select * from studenttable;");
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
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("id") %></td>
                <td><%=rs.getString("name") %></td>
                <td><%=rs.getString("email") %></td>
                <td><%=rs.getString("city") %></td>
                <td><%=rs.getString("phone") %></td>
                <td><%=rs.getString("department") %></td>
            </tr>
            <%}%>
           </tbody>
        </table><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    finally{
       st.close();
       con.close();
    }
    %>
</html>
