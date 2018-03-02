<%-- 
    Document   : Pen_Up_Working
    Created on : 28 Feb, 2018, 7:57:30 PM
    Author     : Shivanshu Gupta
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Pen Up</h1>
        <%
        String first_name=request.getParameter("first_name_field_penUp");
        String last_name=request.getParameter("last_name_field_penUp");
        String user_name=request.getParameter("user_name_field_penUp");
        String email=request.getParameter("email_field_penUp");
        String dateOfBirth=request.getParameter("dateOfBirth_field_penUp");
        String country=request.getParameter("country_selection_penUp");
        String password=request.getParameter("password_field_penUp");
        
        
        // --------------------------------------------------------------------------------------------------------------------------
        // This code is for the Mongodb 
        Mongo mg = new Mongo("Localhost",27017);
        DB db = mg.getDB("Serve_me_database");
        DBCollection collection = db.getCollection("User_Pen_Up_Data");
        BasicDBObject doc = new BasicDBObject();
        doc = new BasicDBObject();
        doc.append("First_Name",request.getParameter("first_name_field_penUp"));
        doc.append("Last_Name",request.getParameter("last_name_field_penUp"));
        doc.append("User_Name",request.getParameter("user_name_field_penUp"));
        Date cdate=new Date();
        doc.append("User_Pen_Ip_At:",cdate);
        collection.insert(doc);
        mg.close();
        // --------------------------------------------------------------------------------------------------------------------------
        
        // --------------------------------------------------------------------------------------------------------------------------
        // This code is for MySQL
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/serve_me","root","");
            Statement stmt=con.createStatement();
            stmt.executeUpdate("INSERT INTO Pen_Up(First_Name,Last_Name,User_Name,Email,Date_of_Birth,Country,Password)"+" values('"+first_name+"','"+last_name+"','"+user_name+"','"+email+"','"+dateOfBirth+"','"+country+"','"+password+"');");
            out.println("Pen Up Sucessfully");
            %>
            <jsp:forward page="index.jsp"/>
        <%    
        }catch (Exception e){
        out.println(e);
        }
         // --------------------------------------------------------------------------------------------------------------------------
        %>
        
    </body>
</html>
