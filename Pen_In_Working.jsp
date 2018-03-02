<%-- 
    Document   : Pen_In_Working
    Created on : 1 Mar, 2018, 5:44:32 AM
    Author     : Shivanshu Gupta
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.mongodb.DB"
    import="com.mongodb.DBCollection"
    import="com.mongodb.DBCursor"
    import="com.mongodb.ServerAddress"
    import="com.mongodb.DBObject"
    import="com.mongodb.BasicDBObject"
    import="com.mongodb.WriteConcern"
    import="com.mongodb.Mongo"
    import="com.mongodb.MongoException"
    import="java.util.Arrays"
    import="java.util.*"
%>
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
        
        // --------------------------------------------------------------------------------------------------------------------------
        // This code is for the Mongodb 
        Mongo mg = new Mongo("Localhost",27017);
        DB db = mg.getDB("Serve_me_database");
        DBCollection collection = db.getCollection("User_Pen_In_Data");
        BasicDBObject doc = new BasicDBObject();
        doc = new BasicDBObject();
        doc.append("User_Name:",request.getParameter("username_penIn_field"));
        doc.append("User_Password:",request.getParameter("password_penIn_field"));
        Date cdate=new Date();
        doc.append("User_Pen_In_At:",cdate);
        collection.insert(doc);
        mg.close();
        // --------------------------------------------------------------------------------------------------------------------------
        
        // --------------------------------------------------------------------------------------------------------------------------
        // This code is for MySQL
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
        // --------------------------------------------------------------------------------------------------------------------------
        
        %>
    </body>
</html>
