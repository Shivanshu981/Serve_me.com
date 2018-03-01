<%-- 
    Document   : Pen_In_Working
    Created on : 1 Mar, 2018, 5:44:32 AM
    Author     : Shivanshu Gupta
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pen In</title>
    </head>
    <body>
        <%
        String username=request.getParameter("username_penIn_field");
        String password=request.getParameter("password_penIn_field");
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/serve_me","root","");
            Statement stmt=con.createStatement();
            String query="SELECT *FROM pen_up WHERE User_Name='"+username+"'OR EMAIL='"+username+"';";
            ResultSet rs=stmt.executeQuery(query);
            
            if(rs.next()){
            String pass=rs.getString("Password");
            if(password.equals(pass)){
                %>
                <jsp:forward page="Serve_me_Welcome.jsp"/>
                <%
            }
            else{
                out.println("Wrong Password or Username");
            }
            }
            
        }catch (Exception e){
        out.println(e);
        }
        
        %>
    </body>
</html>
