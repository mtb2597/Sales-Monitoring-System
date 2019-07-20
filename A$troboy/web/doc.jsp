<%--
    Document   : index
    Created on : Sep 16, 2017, 9:19:42 PM //last updated Feb 22, 2018, 23:07:00 PM
    Author     : Dharmesh
--%>

<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    	<link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/logincss.css" rel="stylesheet">
			<script src="js/jquery-2.2.0.js"></script>
	    <script src="js/bootstrap.min.js"></script>
		<meta charset="utf-8">
		<meta name="causecode">
		<title>Web Design</title>
		<link rel="stylesheet" href="./css/style.css">
		<meta name="viewport" content="width=device-width">
		<meta name="description" content="web design">
		<meta name="author" content="astroboy">
	</head>
        <body>
        <header style="padding-top: 30px">
		 <div class="container">
			 <div id="branding">
			 <h1> <span class="highlight">Student</span> Query Handler</h1>
			 </div>
			 <nav>
				 <ul>
                                         <li ><a href="index-1.jsp">NEWSFEED</a></li>
					 <li><a href="#">DISCUSSION FORUM</a></li>
                                         <li ><a href="documents.jsp">DOCUMENTS</a></li>
                                         <li class="current"><a href="doc.jsp">UPLOAD DOC</a></li>
                                         <li><a href="doc.jsp">ABOUT US</a></li>
                                         
                                         
                                 </ul>
                                      
			 </nav>
                     <div style="float: left;font-style: italic; font-family: cursive; margin-left: 10px;">
                     <div style="float: left; margin-top: 2px;margin-right:25px;">WELCOME</div>
                     <div style="float: right;font-style: italic; font-family: cursive;">
           
                         <button onclick="index.jsp" style="border: none; width: 20; background-color:#000;"><% out.print(session.getAttribute("logged_username").toString());%></button><br>
                         <button style="border: none; width: 20; background-color:#ed491d; left:50;"><a href="logout.jsp">log out</a></button>
          
                         </div>
                 </div>
         </header>
                         <div class="container">
                         <div  class="container" style="float: left; padding-left:10%;">
                <form class="animated slideInDown" action="FileUploadServlet" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="know" value="0"/>
                <table border="0" cellspacing="4" cellpadding="1" >
                    <thead>
                        <tr>
                            <th><br></th>
                            <th><br></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><label >FIRST NAME</label><br><br></td>
                            <td><input type="text" name="firstname" value="<% out.print(session.getAttribute("logged_username").toString());%>"><br><br></td>
                        </tr>
                        <tr>
                            <td><label >Topic</label><br><br></td>
                            <td><input type="text" name="lastname" required/><br><br></td>
                        </tr>
                        <tr>
                            <td><label style="padding-right: 50px">Image Link: </label><br><br></td>
                            <td> <input type="file" name="file"><br><br></td>
                        </tr>
                        
                        </tr>
                    </tbody>
                </table>
                 <input  type="submit" value="Submit" style=" width:100%;"/>
            </form>
                         </div>
                        <div style="float: right; padding-top: 20px;">
                            <center><a href="documents.jsp">View All documents </a></center></div>
                        </div>
                        
        </body>
        <div style="padding-bottom: 0px; margin-bottom: 0px;">
         <%@include file="footer.jsp" %>
        </div>
        
        
        <script src="js/myscript.js">
    
    </script>
    
    
</html>

