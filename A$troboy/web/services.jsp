<%-- 
    Document   : services
    Created on : 20 Mar, 2018, 10:26:51 PM
    Author     : A$troboy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    	<link href="css/bootstrap.min.css" rel="stylesheet"/>
        <link href="css/logincss.css" rel="stylesheet"/>
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
	</head>
	<body>
	 <header>
		 <div class="container">
			 <div id="branding">
			 <h1 class="animated slideInDown"> <span class="highlight">Student</span> Query Handler</h1>
			 </div>
			 <nav class="animated slideInDown">
				 <ul>
					 <li ><a href="index.jsp">Home</a></li>
					 <li class="current"><a href="services.jsp">Services</a></li>
                                         <li><a href="about.jsp">About </a></li>
                                         <li><button id="bob"><a href="sign.jsp">SIGN UP</a>
                                     </button></li>
                                 </ul>
                                      
			 </nav>
                 </div>



	 </header>
  

  

	<section id="newsletter">
		<div class="container ">
    <h1>Faculty Login</h1>
    <form action="connect.jsp" method="POST">
        <input type="hidden"  name="who" value="faculty"/>
        <input type="text" placeholder="Enter Your Email" class="cool" name="uname">
        <input type="password"  name="psw"  class="cool" placeholder="Enter Your Password" >
			<button class="button_1" type="submit">LOG IN</button>
		</form>
		</div>
	</section>
	<section id="main">
		<div class="container">
			<article id="main-col">
				<h1 class="page-title">Services </h1>
				<ul id="services">
                                    <li class="animated slideInLeft">
            <h3>Discussion Forum</h3>
            <p>This provide a platform to ask questions and get replied by  other  users(students and faculty).It includes all the answers associated with a particular question and with it's rating.</p>
            
          </li>
          <li class="animated slideInRight">
            <h3>Documents Section</h3>
          <p>This section deals with the documents uploaded.Users can share important documents to support their answers like diagram</p>
          <p>Faculty can share documents related to the department(notice,list of holidays,practical dates)</p>
          </li>
          <li class="animated slideInLeft">
            <h3>News Feed</h3>

            <p>This help user to know about the new posts and documents uploaded along with the list of questions asked upto that time</p>
            <p>Details of Last 5 users who performed recent activity</p>
          </li>
          <li class="animated slideInLeft">
            <h3>Review Section</h3>

            <p>In this section website users can rate the answers posted to the website. It includes like and dislike button associated with every answer and percentage of it. </p>
            
          </li>
          <li class="animated slideInRight">
            <h3>Quiz Section</h3>

            <p>This section includes quizzes, riddles for the user.It is like an competetion with overall scoreboard</p>
            <p>Pricing 100k per month</p>
          </li>
          
          <li class="animated slideInRight">
            <h3>Other Resources</h3>

            <p>This provide user to share all the necessary documents required for a good academics like old question paper, pdfs of core subjects,tips etc.</p>
            
          </li>
        </ul>
			</article>
			<aside id="sidebar">
				<div class="dark">
				<h3>Feedback</h3>
                                <form class="qoute" action="Feedback" method="post">
                                    <div>
            <label >Name</label><br>
            <input type="text" placeholder="Name" name="name" style="color: black;" >
          </div>
          <div>
            <label>Email</label><br>
            <input type="email" placeholder="Email" name="email" style="color: black;" required="">
          </div>
          <div>
            <label>Message</label><br>
            <textarea placeholder="Message"  name="mess" style="color: black;" required=""></textarea>
          </div>
          <button class="button_1" type="submit">Send</button>
        </form>
      </div>
			</aside>

		</div>
		</section>
	      <footer>
	<p>CHIRANTAN SHUKLA , copyright &copy; 2017</p>
  </footer>
</body>
<script src="js/myscript.js">
    
    </script>
</html>

