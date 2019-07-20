<%-- 
    Document   : insert
    Created on : 20 Mar, 2018, 6:40:49 PM
    Author     : A$troboy
--%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>data insertion</title>
    </head>
    <body>
     
        <%!
            public class User{
                String URL="jdbc:mysql://localhost:3306/jacky";
                String USERNAME="root";
                String PASSWORD="1001";
                Connection connection=null;
                PreparedStatement insertusers =null;
                ResultSet resultset=null;
                public User(){
                    
                try{
                    connection =DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        insertusers=connection.prepareStatement(
                        "INSERT INTO user(username,first_name,last_name,email,password,phone,acad_year)"+
                            "VALUES(?,?,?,?,?,?,?)");
                   }catch(SQLException e){
                        e.printStackTrace();}

}
                    public ResultSet getActors(){
                        try{
                            resultset =insertusers.executeQuery();


                        }catch(SQLException e){
                        e.printStackTrace();}
                            return resultset;
                        
}
                    public int setusers(String first,String last,String em,String p,String u,int year, String phone){
                                                int result=0;
                                                try{
                                                    insertusers.setString(1,u);
                                                    insertusers.setString(2,first);
                                                    insertusers.setString(3,last);
                                                    insertusers.setString(4,em);
                                                    insertusers.setString(5,p);
                                                    insertusers.setInt(7, year);
                                                    insertusers.setString(6,phone);
                                                    
                                                    result = insertusers.executeUpdate();
                                                    if(result!=0){
                                                        connection.commit();
                                                    }
                                                    
                                                            

                }catch(SQLException e){ e.printStackTrace();}
                                                return result;
                                        
                                            }
}
            %>
            <%
                int result=0;
                String first_name= new String();
                String last_name = new String();
                String email = new String(request.getParameter("email"));
                String password = new String(request.getParameter("pass"));
                String username = new String(request.getParameter("id"));
                int acad_year = Integer.parseInt(request.getParameter("year"));
                String phone = new String(request.getParameter("mobile"));
               
                if(request.getParameter("fname")!=null){
                    first_name=request.getParameter("fname");
                }
                if(request.getParameter("lname")!=null){
                    last_name=request.getParameter("lname");
                }
              //  Timestamp timestamp= new Timestamp(new Date().getTime());
                result = new User().setusers(first_name, last_name,email,password,username,acad_year,phone /*timestamp*/);
                
                
            %>
            <% if(result==0){
             
            %>
            <script> alert("Username already exists please select some other username");</script>
            <%@include  file="sign.jsp" %>
            <%
            }
            else
            { %>
            <script> alert("you are registered now log in with your username and password");</script>
            <%@include file="index.jsp" %>
            <%
}%>
            
            
            
    </body>
</html>
