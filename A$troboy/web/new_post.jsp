<%-- 
    Document   : new_post
    Created on : 26 Mar, 2018, 11:06:45 PM
    Author     : A$troboy
--%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <body>
        <%!
            public class NewPost{
            String URL="jdbc:mysql://localhost:3306/jacky";
                String USERNAME="root";
                String PASSWORD="1001";
                Connection connection=null;
                PreparedStatement insertpost =null;
                ResultSet resultset=null;
                public NewPost(){
                try{
                connection= DriverManager.getConnection(URL,USERNAME,PASSWORD);
                insertpost = connection.prepareStatement("INSERT INTO POSTS(username,poston,Idthread)"+
                            "VALUES(?,?,?)");
                }catch(SQLException e){
                 e.printStackTrace();
                }
        }
             public ResultSet SetPosts(){
                        try{
                            resultset =insertpost.executeQuery();
                           }catch(SQLException e){
                        e.printStackTrace();}
                            return resultset;
                        }
public int setusers(String u,String p,String id){
                                                int result=0;
                                                try{
                                                    insertpost.setString(1,u);
                                                    insertpost.setString(2,p);
                                                    insertpost.setString(3,id);
                                                    result = insertpost.executeUpdate();
                                                    if(result!=0){
                                                       // connection.commit();
                                                    }
                                                    
                                                            

                }catch(SQLException e){ e.printStackTrace();}
                                                return result;
                                        
                                            }
            }
        %>
        <%
            int result=0;
            String mm= new String();
            String user=new String();
            String comment=new String();
            String thid=new String(request.getParameter("threadid"));
            user= session.getAttribute("logged_username").toString();
            comment = request.getParameter("answer").toString().replaceAll("\n","<br/>");
            if(request.getParameter("answer").trim().length()==0){
                    session.setAttribute("mn","empty cannot be added");    
                }else{
       
            result = new NewPost().setusers(user,comment,thid);
         if(result==0){
             mm="POST NOT ADDED MAYBE ALREADY EXISTS";
          
            }
            else
            {
                mm="POST ADDED";
            }
         session.setAttribute("msg",mm);
         }
        
        response.sendRedirect("thread.jsp?threadid="+thid);
        %>
    </body>
</html>
