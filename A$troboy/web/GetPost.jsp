<%-- 
    Document   : forum
    Created on : 24 Mar, 2018, 3:57:56 PM
    Author     : A$troboy
--%>
<%@page import="java.util.ListIterator"%>
<%@page import="javaFile.Posts" %>
<%@page import="java.util.ArrayList"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="java.sql.*"%>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <%!
            public class Thpost
                {
                String URL="jdbc:mysql://localhost:3306/jacky";
                String USERNAME="root";
                String PASSWORD="1001";
                Connection connection=null;
                PreparedStatement selectThread =null;
                ResultSet resultset=null;
                public Thpost(){
                try{
                    connection =DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        selectThread=connection.prepareStatement(
                        "SELECT id,username,Idthread,time FROM posts");
                   }catch(SQLException e){
                        e.printStackTrace();}

}
                    public ResultSet getActors(){
                        try{
                            resultset = selectThread.executeQuery();
                           //  connection.commit(); 


                        }catch(SQLException e){
                        e.printStackTrace();
                            }
                            return resultset;
                            
                        
}
}
        %><%
            Thpost po = new Thpost();
            ResultSet rtp=po.getActors();
            ArrayList <Posts> posts= new ArrayList<>();
            
        while(rtp.next()) {
         Posts pop =new Posts();
        pop.setId(rtp.getInt("id"));
         pop.setId_ofthread(rtp.getInt("Idthread"));
         pop.setTime(rtp.getString("time")); 
         pop.setUsername(rtp.getString("username"));
          posts.add(pop);
         
 
     }

        %>
    </body>
</html>