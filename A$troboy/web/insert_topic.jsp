<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@include file="GetList.jsp" %>
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
            public class Topic{
                String URL="jdbc:mysql://localhost:3306/jacky";
                String USERNAME="root";
                String PASSWORD="1001";
                Connection connection=null;
                PreparedStatement insertthread =null;
                ResultSet resultset=null;
                public Topic(){
                    
                try{
                    connection =DriverManager.getConnection(URL,USERNAME,PASSWORD);
                         insertthread=connection.prepareStatement(
                        "INSERT INTO thread(topic,created_by)"+
                            "VALUES(?,?)");
                   }catch(SQLException e){
                        e.printStackTrace();}

}
                    public ResultSet setTopic(){
                        try{
                            resultset =insertthread.executeQuery();


                        }catch(SQLException e){
                        e.printStackTrace();}
                            return resultset;
                        
}
                    public int setusers(String  t, String u){
                                                int result=0;
                                                try{
                                                    insertthread.setString(1,t);
                                                    insertthread.setString(2,u);
                                                    
                                                    
                                                    result = insertthread.executeUpdate();
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
                String tp = new String();
                String up=session.getAttribute("logged_username").toString();
                String mm= new String();
       
                if(request.getParameter("topic").trim().length()==0){
                    session.setAttribute("mn","empty cannot be added");
                   
                    
                }else{
                    tp=request.getParameter("topic");
                    result = new Topic().setusers(tp,up);
            

                
              //  Timestamp timestamp= new Timestamp(new Date().getTime());
                
                
                
            
            if(result==0){
             mm="POST NOT ADDED MAYBE ALREADY EXISTS";
          
            }
            else
            {
                                     int i=0;


                mm="POST ADDED";
            }
        session.setAttribute("msg",mm);
        }
        
        response.sendRedirect("index-1.jsp");
        %>
            
            
            
    </body>
</html>