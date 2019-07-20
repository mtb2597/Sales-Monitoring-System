<%-- 
    Document   : header
    Created on : 20 Mar, 2018, 10:08:25 PM
    Author     : A$troboy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
	
        <header style="padding-top: 30px">
		 <div class="container">
			 <div id="branding">
			 <h1> <span class="highlight">Student</span> Query Handler</h1>
			 </div>
			 <nav>
				 <ul>
                                     <li class="current"><a href="faculty_in.jsp">NEWSFEED</a></li>
                                     <li><a href="fdoc.jsp">DOCUMENTS</a></li>
                                         <li><a href="fcheck.jsp">Check Posts</a></li>
                                         
                                         
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
