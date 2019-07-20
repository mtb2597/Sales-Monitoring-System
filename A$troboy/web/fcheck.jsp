<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>

<!DOCTYPE html>
<html>
    <head>
        
    	<link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/logincss.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet"/>
			<script src="js/jquery-2.2.0.js"></script>
	    <script src="js/bootstrap.min.js"></script>
		<meta charset="utf-8">
		<meta name="causecode">
		<title>Web Design</title>
		<link rel="stylesheet" href="./css/style.css">
		<meta name="viewport" content="width=device-width">
		<meta name="description" content="web design">
		<meta name="author" content="astroboy">
	
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Image Show</title>

        <style>
            button,.btn btn-primary{
                width:100%;
            }
        </style>

    </head>
    <body>
        <header style="padding-top: 30px">
		 <div class="container">
			 <div id="branding">
			 <h1> <span class="highlight">Student</span> Query Handler</h1>
			 </div>
			 <nav>
				 <ul>
                                     <li ><a href="faculty_in.jsp">NEWSFEED</a></li>
                                     <li ><a href="fdoc.jsp">DOCUMENTS</a></li>
                                        <li class="current"><a href="fcheck.jsp">Check Posts</a></li>
                                         
                                         
                                 </ul>
                                      
			 </nav>
                     <div style="float: left;font-style: italic; font-family: cursive; margin-left: 10px;">
                     <div style="float: left; margin-top: 2px;margin-right:25px;">WELCOME</div>
                     <div style="float: right;font-style: italic; font-family: cursive;">
           
                         <button onclick="index.jsp" style="border: none; width: 20; background-color:#000;"><% out.print(session.getAttribute("logged_username").toString());%></button><br>
                         <button style="border: none;  background-color:#ed491d; left:50;"><a href="logout.jsp">log out</a></button>
          
                         </div>
                 </div>
                 </div>
         </header>
                         <%
                             try{
                             if(session.getAttribute("Amsg")!=null){
                                 %>
                                 <script> alert("Database Updated");</script>
        <%
                             }session.removeAttribute("Amsg");
                                 }catch(Exception gh){}
                         %>
<div class="container">
    <%
            try{
                ResultSet tinfo; 
            int c=1;
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jacky","root","1001");%>
            <h1>Threads Info</h1>
            <table border="1" cellspacing="1" cellpadding="1" style="width: 100%;">
                <thead>
                    <tr>
                        <th>@@</th>
                        <th>Idthread</th>
                        <th>topic</th>
                       <!-- <th>created</th> -->
                        <th>created_by</th>
                    </tr>
                </thead>
                <tbody>
                    <form action="delete.jsp" method="post">
                        <input type="hidden" name="lo" value="f">
                    <input type="hidden" name="section" value="thread"/>
                     <%
            PreparedStatement cthread=con.prepareStatement("SELECT * FROM thread");
            tinfo= cthread.executeQuery();
            while(tinfo.next()){ %>
                    <tr>
                        <td><input type="checkbox" name="hiddenID" value="<%=tinfo.getString(1)%>"></td>
                        <td><%=tinfo.getString(1) %></td>
                        <td><%=tinfo.getString(2) %></td>
                       <!--<td> info about created </td> -->
                        <td><%=tinfo.getString(4) %></td>
                    </tr>
                    
                    <%
                 } 
            
            %> <tr>
             <td colspan="5"> <button class="btn btn-primary" style="height: 50%" type="submit">Remove </button></td>
        </tr>
                    </form>
            </tbody>
            </table></div>
            <div class="container">
            <h1>Posts Info</h1>
            <table border="1" cellspacing="1" cellpadding="1" style="width: 100%;">
                
                <thead>
                    <tr>
                        <th>**</th>
                        <th>id</th>
                        <th>username</th>
                        <th>poston</th>
                        <th>Idthread</th>
                        <th>time</th>
                    </tr>
                </thead>
                <tbody>
                    <form action="delete.jsp" method="post">
                         <input type="hidden" name="lo" value="f">
                        <input type="hidden" name="section" value="posts"/>
                     <%
            PreparedStatement cposts=con.prepareStatement("SELECT * FROM posts");
            tinfo= cposts.executeQuery();
            while(tinfo.next()){ %>
                    <tr>
                        <td><input type="checkbox" name="hiddenID" value="<%=tinfo.getString(1)%>"></td>
                        <td><%=tinfo.getString(1) %></td>
                        <td><%=tinfo.getString(2) %></td>
                        <td><%=tinfo.getString(3) %></td>
                        <td><%=tinfo.getString(4) %></td>
                        <td><%=tinfo.getString(5) %></td>
                    </tr>
                    
                    <%
                 } 
            
            %>
                     <tr>
            <td colspan="6"> <button class="btn btn-primary" style="height: 50%" type="submit">Remove </button></td>
        </tr>
                    </form>
            </tbody>
            </table></div>
                     <div class="container">
            <h1>Image Info</h1>
            <table border="1" cellspacing="1" cellpadding="1" style="width: 100%;">
                <thead>
                    <tr>
                        <th>@@</th>
                        <th>id</th>
                        <th>created_by</th>
                        <th>topic</th>
                        <th>filename</th>
                        <th>path</th>
                        <th>created_on</th>
                    </tr>
                </thead>
                <tbody>
                    <form action="delete.jsp" method="post">
                         <input type="hidden" name="lo" value="f">
                        <input type="hidden" name="section" value="image_table"/>
                     <%
            PreparedStatement cimage=con.prepareStatement("SELECT * FROM image_table");
            tinfo= cimage.executeQuery();
            while(tinfo.next()){ %>
                    <tr>
                        <td><input type="checkbox" name="hiddenID" value="<%=tinfo.getString(1)%>"></td>
                        <td><%=tinfo.getString(1) %></td>
                        <td><%=tinfo.getString(2) %></td>
                        <td><%=tinfo.getString(3) %></td>
                        <td><%=tinfo.getString(4) %></td>
                        <td><%=tinfo.getString(5) %></td>
                        <td><%=tinfo.getString(6) %></td>
                    </tr>
                    
                    <%
                 } 
            
%> <tr>
    <td colspan="7"> <button class="btn btn-primary" style="height: 50%" type="submit">Remove </button></td>
        </tr> </form>
                    </tbody>
            </table></div>
           <%
               // con.commit();
            }catch(Exception lo){
                lo.printStackTrace();
                
            }
        
        %>              
    </body>
    <%@include file="footer.jsp" %>
</html>
