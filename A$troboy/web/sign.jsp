<%-- 
    Document   : sign
    Created on : 20 Mar, 2018, 10:42:52 PM
    Author     : A$troboy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    	<link href="css/bootstrap.min.css" rel="stylesheet">
			<script src="js/jquery-2.2.0.js"></script>
	    <script src="js/bootstrap.min.js"></script>
            <script> function validate(){
                var result=false;
                var i=document.getElementsByTagName("input");
                if(i[0].value===i[1].value){
                    alert("FIRST AND LAST NAME CANT BE SAME");
                }
                else{
                        if(i[3].value===i[4].value){
                            alert("USERNAME AND PASSWORD CANT BE SAME");
                        }
                        else{
                                if(i[4].value===i[5].value){
                                      result = true;
                                }
                                else{
                                    alert("PASSWORD ENTERED DO NOT MATCH");
                                }
                        }
                    }
            
                
                return(result);}
            </script>
		<meta charset="utf-8">
		<meta name="causecode">
		<title>Web Design</title>
		
		<link rel="stylesheet" href="css/style.css">
		<meta name="viewport" content="width=device-width">
		<meta name="description" content="web design">
		<meta name="author" content="astroboy">
	</head>
	<body>
	 <header>
		 <div class="container">
			 <div id="branding">
			 <h1> <span class="highlight">Student</span> Query Handler</h1>
			 </div>
			 <nav>
				 <ul>
					 <li><a href="index.jsp">Home</a></li>
					 <li><a href="services.jsp">Services</a></li>
                                         <li class="current"><a href="sign.jsp">SIGN UP</a></li>
                                         <li><a href="about.jsp">About US</a></li>
					 
				 </ul>
			 </nav>
		 </div>
	 </header>
            <div class="container" style="font-family: cursive;">
                <div  id="lform">
                <form name="sign_form" action="insert.jsp" method="POST" onsubmit="return validate()">
                <table border="0" cellspacing="4" cellpadding="1" >
                    <thead>
                        <tr>
                            <th><br></th>
                            <th><br></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                    <td id="block1"><label>FIRST NAME</label><br><br></td>
                    <td><input type="text" name="fname"  placeholder="ENTER FIRST NAME"  required/><br><br></td>
                        </tr>
                        <tr>
                            <td id="block1"><label style="padding-right: 50px">LAST NAME</label><br><br></td>
                            <td><input type="text" name="lname"  placeholder= "ENTER LAST  NAME"/><br><br></td>
                        </tr>
                        <tr>
                            <td id="block1"><label style="padding-right: 50px">EMAIL ADDRESS</label><br><br></td>
                            <td><input type="email" name="email"  placeholder="ENTER EMAIL ADDRESS"   required/><br><br></td>
                        </tr>
                        <tr>
                            <td id="block1"><label style="padding-right: 50px">USERNAME</label><br><br></td>
                            <td><input type="text" name="id"  placeholder="CHOOSE USERNAME" required/><br><br></td>
                        </tr>
                     
                        <tr>
                            <td id="block1"><label style="padding-right: 50px">PASSWORD</label><br><br></td>
                            <td><input type="password" name="pass"  placeholder= "PASSWORD"   title="make a strong password" required/><br><br></td>
                        </tr>
                        <tr>
                            <td id="block1"><label style="padding-right: 50px">RE-ENTER PASSWORD</label><br><br></td>
                            <td><input type="password" name="re_pass"  placeholder= "CONFIRM PASSWORD" required/><br><br></td>
                        </tr>
                        <tr>
                            <td id="block1"><label style="padding-right: 50px">PHONE</label><br><br></td>
                            <td><input type="tel" name="mobile"  placeholder="ENTER CONTACT NUMBER"  minlength="10" maxlength="10"/><br><br></td>
                        </tr>
                        <tr>
                            <td id="block1"><label style="padding-right: 50px">ACADEMIC YEAR</label><br><br></td>
                            <td><input type="number" name="year"  placeholder="Year" max="4" min="1"/><br><br></td>
                        </tr>
                    </tbody>
                </table>
                 <input  type="submit" style=" width:100%;"/>
            </form>
                </div>
                    <div style="float: right; padding-top:9%; padding-right:9%; ">
                        
                        <div id="my-slider" class="carousel slide" data-ride="carousel" >
          <ol class="carousel-indicators">
            <li data-target="#my-slider" class="active" data-slide-to="0"></li>
            <li data-target="#my-slider"  data-slide-to="1"></li>
            <li data-target="#my-slider"  data-slide-to="2"></li>
            <li data-target="#my-slider"  data-slide-to="3"></li>
            <li data-target="#my-slider"  data-slide-to="4"></li>
            <li data-target="#my-slider"  data-slide-to="5"></li>
            
            
          </ol>
          <div class="carousel-inner" role="listbox" >
            <div class="item active">
                <img src="images/university.png" height="250" width="250" alt="cool"/>
              <div  class="carousel-caption">
                
              </div>
            </div>
            <div class="item">
                <img src="images/trophy.png" height="250" width="250" alt="cool"/>
              <div class="carousel-caption">
                
              </div>
            </div>
              <div class="item">
                  <img src="images/ios7-people-outline.png" height="250" width="250" alt="cool"/>
              <div class="carousel-caption">
                
              </div>
            </div>
            <div class="item">
                <img src="images/document.png" height="250" width="250" alt="cool"/>
              <div class="carousel-caption">
                
              </div>
            </div>
              <div class="item">
                  <img src="images/ios7-lightbulb-outline.png" height="250" width="250" alt="cool"/>
              <div class="carousel-caption">
                
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
                       
                </div>
            </div>
    </body>
    <%@include file="footer.jsp" %>
    <script src="js/myscript.js">
    
    </script>
</html>
