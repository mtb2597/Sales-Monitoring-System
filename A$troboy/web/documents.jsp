<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .col-lg-3{
        
                height: 200px;
                width:266px;
                padding: 0;
                border: solid 1px;
      }
      #top{
        font-size: 20px;
        text-align: center;
        color:#e8491d;
        background-color:black;
        width: 266px;
        height: 50px;
        font-family: cursive;
      }
      #mid{

      }
      #last{
        width:266px;
        height:70px;
        color: #e8491d;
        background-color:black;
        text-align: center;
      }
      #con {
  position: relative;
  width: 50%;
}


.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height:60%;
  width: 100%;
  opacity: 0;
  transition: .5s ease;
  background-color:none;
}

#mid:hover .overlay {
  opacity: 0.7;
}

.text {
  color: white;
  font-size: 20px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
}
        </style>
    </head>
    <body >
        <header style="padding-top: 30px">
		 <div class="container">
			 <div id="branding">
			 <h1> <span class="highlight">Student</span> Query Handler</h1>
			 </div>
			 <nav>
				 <ul>
                                     <li ><a href="index-1.jsp">NEWSFEED</a></li>
					 <li><a href="#">DISCUSSION FORUM</a></li>
                                         <li class="current"><a href="documents.jsp">DOCUMENTS</a></li>
                                         <li><a href="doc.jsp">UPLOAD DOC</a></li>
                                         
                                         
                                         
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
                         <br>
                         <br>
                         <div class="container" style="padding: 0;">
                          
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jacky", "root", "1001");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM image_table ORDER BY id DESC";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String firstname = rs.getString("topic");
                    String lastname = rs.getString("created_by");
                    String filename = rs.getString("filename");
                    String path = rs.getString("path");
                    String on= rs.getString("created_on");
        %>
        <% if((id%2)!=0){%>
        <div class="col-lg-3 animated slideInLeft" >
            <%} else {%>
            <div class="col-lg-3 animated slideInRight" >
            
            <%}%>
            
            <div id="mid" ><a href="<%=filename %>"><img src="<%=filename%>" width="266" height="200" class="image"/></a>
            
            <div class="overlay">
    <div class="text">
        <div id="top"  class="current"> <%=firstname%></div>
        <div id="last" class="current">By--<%=lastname%><br/>
                               <%=on %>
                </div>    
    </div>
  </div>
            
            </div>
                
                
           
        </div>
 
     
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
     
</div>
    </body>
    <%@include file="footer.jsp" %>
    <script src="js/myscript.js">
    
    </script>
</html>
