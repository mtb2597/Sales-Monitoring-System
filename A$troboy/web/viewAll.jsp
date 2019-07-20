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
                                         <li class="current"><a href="viewAll.jsp">DOCUMENTS</a></li>
                                         <li><a href="doc.jsp">UPLOAD DOC</a></li>
                                         <li><a href="documents.jsp">ABOUT US</a></li>
                                         
                                         
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
        
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new_schema", "root", "1001");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM image_table";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String filename = rs.getString("filename");
                    String path = rs.getString("path");
        %>
        <div class="container">
        <table style="width:100%" border="2">
            <tr>
                <th>Id</th>
                <th>Created By</th>
                <th>Topic</th>
                <th>Image</th>
                <th>Path</th>
                <th>View full image</th>
            </tr>
            <tr>
                <td><%=id%></td>
                <td><%=firstname%></td>
                <td><%=lastname%></td>
               
                <td><image src="<%=filename%>" width="200" height="200"/></td>
                <td><%=path%></td>
                <td><a href="<%=filename %>"> cool</a></td>
            </tr>
        </table>
        </div>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body> 
    <script src="js/myscript.js">
    
    </script>
</html>