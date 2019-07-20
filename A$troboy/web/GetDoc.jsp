<%-- 
    Document   : forum
    Created on : 24 Mar, 2018, 3:57:56 PM
    Author     : A$troboy
--%>
<%@page import="java.util.ListIterator"%>
<%@page import="javaFile.Documents" %>
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
            public class DOC
                {
                String URL="jdbc:mysql://localhost:3306/jacky";
                String USERNAME="root";
                String PASSWORD="1001";
                Connection connection=null;
                PreparedStatement selectThread =null;
                ResultSet resultset=null;
                public DOC(){
                try{
                    connection =DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        selectThread=connection.prepareStatement(
                        "SELECT id,created_by FROM image_table ORDER BY id DESC");
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
            DOC ta = new DOC();
            ResultSet dta =ta.getActors();
            ArrayList <Documents>d= new ArrayList<>();
            
        while(dta.next()) {
         Documents a =new Documents();
         a.setId(dta.getInt("id"));
         a.setCreated_by(dta.getString("created_by"));
          d.add(a);
         
 
     }

        %>
    </body>
</html>