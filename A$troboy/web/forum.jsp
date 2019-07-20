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
<%@include file="GetPost.jsp" %>
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
        <ul  style="margin: inherit;padding: inherit;">
        <%while(rt.next()) {
         Threads a =new Threads();
         a.setId(rt.getInt("Idthread"));
         a.setTopic(rt.getString("topic"));
         a.setTime(rt.getString("created")); 
         a.setCreatedby(rt.getString("created_by"));
         l.add(a);
         int flag=0;
         for(Posts poo:posts){
             if(poo.getId_ofthread()==rt.getInt("Idthread")){
                 flag=1;
             }else{
                 
             }
         }
        
        %>
        <li>
        <div name="display_topic">
            <%if(flag==0){%>
            <a href="thread.jsp?threadid=<%=  rt.getString("Idthread")%>" style="color:red;"><%= rt.getString("topic") %></a><br>
            <%
            }else{%>
            <a href="thread.jsp?threadid=<%=  rt.getString("Idthread")%>" style="color:greenyellow;"><%= rt.getString("topic") %></a><br>
            <%
}%>
            
        </div>
        </li>
        <% }

        %>
        </ul>
    </body>
    <script src="js/myscript.js">
    
    </script>
</html>
