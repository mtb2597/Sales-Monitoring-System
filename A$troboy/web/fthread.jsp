<%-- 
    Document   : thread
    Created on : 24 Mar, 2018, 4:47:40 PM
    Author     : A$troboy
--%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@include file="GetList.jsp" %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    	<link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/logincss.css" rel="stylesheet">
	<script src="js/jquery-2.2.0.js"></script>
	    <script src="js/bootstrap.min.js"></script>
            <link href="css/animate.min.css" rel="stylesheet"/>
		<meta charset="utf-8">
		<meta name="causecode">
		<title>Web Design</title>
		<link rel="stylesheet" href="./css/style.css">
		<meta name="viewport" content="width=device-width">
		<meta name="description" content="web design">
		<meta name="author" content="astroboy">
                <style>
                    .h1 {
			background-color:white;
			
			min-width: 60px;
			min-height:30px;
			margin: 0;
			padding: 0;
		}
		.s1,.s2{
                        background-color:white;
			min-height: 30px;
			min-width: 30px;
			margin: 0;
			padding: 0;


		}
                </style>
	</head>
       
    <body>
         <%@include file="fheader.jsp" %>
    <%!
        public class DThread{
        String URL="jdbc:mysql://localhost:3306/jacky";
                String USERNAME="root";
                String PASSWORD="1001";
                Connection connection=null;
                PreparedStatement selectThread =null;
                ResultSet resultset=null;
                public DThread(){
                 try{
                    connection =DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        selectThread=connection.prepareStatement(
                        "SELECT username,poston,Idthread,id FROM posts");
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
    %>
    
        <%
        DThread d = new DThread();
        ResultSet rp= d.getActors();
        
    %>
                                            <% 
                           
            for(Threads s:l){
                 if(String.valueOf(s.getId()).equals(request.getParameter("threadid"))){
                 
                 %>
                 <div id="newsletter">
                 <div class="container animated lightSpeedIn"><span style="font-family: cursive; text-align: center; color:orange;"><b>Q->"<% out.print(s.getTopic()); %>"</b><br><br></span>
                     posted by-<% out.print(s.getCreatedby()); %><br><br>
                 </div>
                 </div>
                                    <%
                    }
}

                

%>
<br>
    <!-- loop to print  -->
    <%while(rp.next()) {
        if(rp.getString("Idthread").equals(request.getParameter("threadid"))){
    %>
    <div class="container animated slideInUp" style="color: black; background-color: white;">
        <br>
        <div class="row" style="padding: 0; margin: 0;">
        <div class="col-lg-12">
            <div class="h1" style="font-family:sans-serif; font-size:20px; color: blue;">Ans:-> <%=rp.getString("poston")%> </div></div>
        </div><br>
        <div class="row" style="width: 100%; padding: 0; margin: 0;">
            <div class="col-lg-6">
                <div class="s1 animated slideInLeft" >Posted by--<%=rp.getString("username") %> </div>
            </div>
            <div class="col-lg-6">
                <div class="s2">
                    <table border="0" >
                        <tbody>
                            <tr>
                                <td><button type="button" class="btn btn-success">Like</button>
                                    <img src="images/like.jpg" style="width:50px;height:40px; padding-bottom: 4px;">
                                </td>
                                <td style="padding-left: 100px;"><button type="button" class="btn btn-danger">Dislike</button>
                                <img src="images/dislike.jpg" style="width:50px;height:40px; padding-top: 4px">
                                </td>
                            </tr>
                        </tbody>
                    </table>
     

                   
                    
                </div>
            </div>
        </div>
        
        
    </div>
            <br>
            
    
        <% }
        } %>
        <div  class="container" >
            <form  action="new_post.jsp?threadid=<%= request.getParameter("threadid") %>" method="POST" >
                <div class="row">
                    <div class="col-lg-12">
                <label>ENTER YOUR ANSWERS here </label>
                    </div></div>
                <div class="row">
                    <div class="col-lg-10">
            <textarea name="answer"   style="width:100%;" required></textarea>
                    </div>
                    <div class="col-lg-2">
            <input type="submit"  />
                    </div>
                </div>
        </form>
            <% try{
                out.print(session.getAttribute("msg").toString());
                session.removeAttribute("msg");
                }catch(Exception e){
                
            }
            %>
            </div>
            
    </body>
    <%@include file="footer.jsp" %>
    <script src="js/myscript.js">
    
    </script>
    
</html>