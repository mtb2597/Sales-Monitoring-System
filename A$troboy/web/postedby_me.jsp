<%-- 
    Document   : forum
    Created on : 24 Mar, 2018, 3:57:56 PM
    Author     : A$troboy
--%>
<%@page import="java.util.ListIterator"%>
<%@page import="javaFile.Threads" %>
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
            public class Threadd
                {
                String URL="jdbc:mysql://localhost:3306/jacky";
                String USERNAME="root";
                String PASSWORD="1001";
                Connection connection=null;
                PreparedStatement selectThread =null;
                ResultSet resultset=null;
                public Threadd(){
                try{
                    connection =DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        selectThread=connection.prepareStatement(
                        "SELECT Idthread,topic,created,created_by FROM thread ORDER BY Idthread DESC");
                   }catch(SQLException e){
                        e.printStackTrace();}

}
                    public ResultSet getActors(){
                        try{
                            resultset = selectThread.executeQuery();
                            //connection.commit();

                        }catch(SQLException e){
                        e.printStackTrace();}
                            return resultset;
                        
}
}
        %><%
            Threadd t = new Threadd();
            ResultSet rt=t.getActors();
           ArrayList<Threads> l= new ArrayList<>();
            
        %>
        <%@include file="header-1.jsp" %>
        <div class="container">
            <h1>Queries Asked by <b><i><% out.print(session.getAttribute("logged_username").toString());%></i></b></h1>
        <ul  style="margin: inherit;padding: inherit;">
        <%while(rt.next()) {
         Threads a =new Threads();
         a.setId(rt.getInt("Idthread"));
         a.setTopic(rt.getString("topic"));
         a.setTime(rt.getString("created")); 
         a.setCreatedby(rt.getString("created_by"));
         l.add(a);
         
        if(rt.getString("created_by").equalsIgnoreCase(session.getAttribute("logged_username").toString()))
        {
        %>
        <li>
        <div name="display_topic">
            
        <a href="thread.jsp?threadid=<%=  rt.getString("Idthread")%>"><%= rt.getString("topic") %></a><br>
        </div>
        </li>
        <% }
}
        %>
        </ul>
        </div>
    </body>
    <script src="js/myscript.js">
    
    </script>
</html>