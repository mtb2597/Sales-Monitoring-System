<%-- 
    Document   : index
    Created on : 20 Mar, 2018, 5:23:35 PM
    Author     : A$troboy
--%>
<%@page import="java.util.Date" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="css/animate.min.css" rel="stylesheet"/>
    <body>
        <div >
    <%@include file="header.jsp" %>
        </div>
        <div  id="mobile_view">
            <section class="newsletter">
                <div class="container " style="width: 100%">
   
    <form action="connect.jsp" method="POST">
        <input type="hidden"  name="who" value="user"/>
        <input type="text" placeholder="Enter Your Email" class="cool" name="uname">
        <input type="password"  name="psw"  class="cool" placeholder="Enter Your Password" >
			<button class="button_1" type="submit">LOG IN</button>
                        <button class="button_1"><a href="sign.jsp">Sign up</a></button>
		</form>
		</div>
        </section></div>
	
    <% try{
            out.print(session.getAttribute("msg").toString());
            session.removeAttribute("msg");
            
        }catch(Exception ek){
            
}%>
	<section id="showcase">
        <div id="my-slider" class="carousel slide" data-ride="carousel" >
          <ol class="carousel-indicators">
            <li data-target="#my-slider" class="active" data-slide-to="0"></li>
            <li data-target="#my-slider"  data-slide-to="1"></li>
            <li data-target="#my-slider"  data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img  class="animated rollIn"src="images/resources/banner-1.jpg"  width="100%"  alt="cool"/>
              <div  class="carousel-caption animated bounce">
                <h1>START YOUR ACADEMIC WITH US</h1>
              </div>
            </div>
            <div class="item">
              <img  class="animated rollIn" src="images/resources/banner-2.jpg"  width="100%" alt="cool"/>
              <div class="carousel-caption">
                <h1>WE WILL HELP YOU AND GUIDE YOU</h1>
              </div>
            </div>
            <div class="item">
              <img  class="animated rollIn" src="images/resources/banner-3.jpg"  width="100%" alt="cool"/>
              <div class="carousel-caption">
                <h1>IF YOU WANNA RUN THEN FIRST LEARN HOW TO WALK</h1>
              </div>
            </div>
          </div>
        <a class="left carousel-control " href="#my-slider" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" area-hidden="true"></span>
          <span class="sr-only">previous</span>
        </a>
        <a class="right carousel-control" href="#my-slider" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" area-hidden="true"></span>
          <span class="sr-only">next</span>
        </a>
      </div>
</section>
        <!--<section >
            <div class="container" style="float: none;">
    <!--<h1>Enter The Virtual Class </h1>
		<form onsubmit="coooool.jsp">
			<input type="email" placeholder="Enter Your Email">
                        <input type="password" placeholder="Enter Your Password">
			<button class="button_1" type="submit">LOGIN</button>
		</form>>
		</div>
	</section-->
	<section id="boxes">
		<div class="container">
			<div class="box">
                            <img src="./images/ios7-people-outline.png">
				<h3>DISCUSS</h3>
				<p>Discussion is an exchange of knowledge; an argument an exchange of ignorance. The aim of argument, or of discussion, should not be victory, but progress.</p>
			</div>
			<div class="box">
                            <img src="./images/ios7-lightbulb-outline.png">
				<h3>GET ANSWERS AND IDEAS</h3>
				<p> Great minds discuss ideas; average minds discuss events; small minds discuss people. No matter what people tell you, words and ideas can change the world. Words are often seen hunting for an idea, but ideas are never seen hunting for words.</p>
			</div>
			<div class="box">
                            <img src="./images/trophy.png">
				<h3>ACHIEVE</h3>
				<p>The starting point of all achievement is desire and curiosity to know about new things.</p>
			</div>
		</div>
	</section>

<%@include file="footer.jsp" %>
</body>
<script src="js/myscript.js">
    
    </script>
</html>
