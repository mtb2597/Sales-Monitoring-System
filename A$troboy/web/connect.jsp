<%-- 
    Document   : connect
    Created on : 20 Mar, 2018, 5:41:19 PM
    Author     : A$troboy
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.HashMap" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            public class Actor{
                String URL="jdbc:mysql://localhost:3306/jacky";
                String USERNAME="root";
                String PASSWORD="1001";
                Connection connection=null;
                PreparedStatement selectActors =null;
                ResultSet resultset=null;
                public Actor(int f){
                try{
                    connection =DriverManager.getConnection(URL,USERNAME,PASSWORD);
                    if(f==0){
                    selectActors=connection.prepareStatement(
                        "SELECT username,password FROM login");
}
else{
    selectActors=connection.prepareStatement(
                        "SELECT username,password FROM faculty");
}
                        
                   }catch(SQLException e){
                        e.printStackTrace();
                        }

}
                    public ResultSet getActors(){
                        try{
                            resultset =selectActors.executeQuery();
                           // connection.commit();


                        }catch(SQLException e){
                        e.printStackTrace();}
                            return resultset;
                        
}
}
            %>
            <%
                int heel=0;
                if(request.getParameter("who").equals("user")){
                  heel=0;
                }else{
                    heel=1;
                }
                 Actor a= new Actor(heel); 
                ResultSet rs= a.getActors();
                
                String usr_form =request.getParameter("uname");
                String psw_form =request.getParameter("psw");
                if(usr_form.equals("chintu")&& psw_form.equals("cool")){
                    session.setAttribute("logged_username",usr_form);
                    response.sendRedirect("dummy.jsp");
                
                
                }
                else{
                HashMap<String,String> login=new HashMap<>();
            %>
            
                    <%while(rs.next()) {%>
                    
                        <% login.put(rs.getString("username"), rs.getString("password")); %>
                        
                    
                    <% } 
                        int flag=0;
                       if(login.containsKey(usr_form)){
                                if(login.get(usr_form).equals(psw_form)){
                                String sid=request.getParameter("uname");
                                session.setAttribute("logged_username",sid);
                                if(heel==1){
                                response.sendRedirect("faculty_in.jsp");

}else{
                                response.sendRedirect("index-1.jsp");}
                                 flag=1;}
                                    else{ %>
                                    <script>alert("INCORRECT PASSWORD");</script>
        <%
                                            }
                        }
                        else{
                               %>
                                    <script>alert("PLEASE SIGN UP FIRST/ WRONG USERNAME");</script>
        <%
                            }
                        if(flag==0) { 
%>
<%@include file="index.jsp" %>
        <%
                        
; }
        
        
}  %>     
                    

    </body>
</html>
