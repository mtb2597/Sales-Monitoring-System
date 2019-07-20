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
	
        <header>
		 <div class="container">
			 <div id="branding">
			 <h1 class="animated slideInDown"> <span class="highlight">Student</span> Query Handler</h1>
			 </div>
			 <nav class="animated slideInDown">
				 <ul>
					 <li class="current"><a href="index.jsp">Home</a></li>
					 <li><a href="services.jsp">Services</a></li>
                                         <li><a href="about.jsp">About </a></li>
                                       <li><button  id="bout" onclick="document.getElementById('modal-wrapper').style.display='block'" >
                                     LOGIN</button></li>
                                 </ul>
                                      
			 </nav>
                 </div>



	 </header>
<div id="modal-wrapper" class="modal">
  
<form class="modal-content animate" action="connect.jsp" method="POST">
    <input type="hidden" name="who" value="user"/>
    <div class="imgcontainer">
      <span onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Close PopUp">&times;</span>
      <img src="images/100.jpg" alt="Avatar" class="avatar">
      <h1 id="hpop">LOGIN / SIGN UP</h1>
    </div>

    <div class="container">
      <input type="text" placeholder="Enter Username" name="uname" id="uin">
      <input type="password" placeholder="Enter Password" name="psw" id="pin">        
      <button  id="bin" type="submit">Login</button>
      
      <input type="checkbox" style="margin:26px 30px;"> Remember me      
      <a href="#" style="text-decoration:none; float:right; margin-right:34px; margin-top:26px;">Forgot Password ?</a>
      
      <button  id="bin" type="submit" formaction="sign.jsp">SIGN UP</button>
    </div>
    
  </form>
  
</div>
            <script>


var modal = document.getElementById('modal-wrapper');
window.onclick = function(event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
}
</script>
