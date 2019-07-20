<%-- 
    Document   : dummy
    Created on : 21 Mar, 2018, 1:13:24 AM
    Author     : A$troboy
--%>
<%@page import="java.sql.*"%>

<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body >
        <h1>Astroboy Welcome</h1>  <button class="btn-link"><a href="logout.jsp"  style="color:black;" >BACK TO HOME</a></button>

          <div class="container">
                <h1>Faculty signup</h1>
                <form  action="Registerf" method="post" >
                    <label>Username</label>
                    <input type="text" name="fuser" required=""/><br>
                    <label>Password</label>
                    <input type="text"  name="fpass" required=""/>
                    <button class="btn btn-primary" type="submit">Click to Add Faculty</button>
                </form>
            </div>
        
        <br>
        <div class="container">
        <h2>USERS Info</h2><br>
        
        <table border="1" cellpadding="1" style="width:100% ;background-color:black;color: #00ACED;">
            <thead>
                <tr>
                    <th>**</th>
                    <th>--</th>
                    <th>username</th>
                    <th>first_name</th>
                    <th>last_name</th>
                    <th>email</th>
                    <th>password</th>
                    <th>phone</th>
                    <th>acad_year</th>
                </tr>
            </thead>
            <tbody>
            <form action="delete.jsp" method="post">
                <input type="hidden" name="section" value="user"/>
               <%
            try{
                ResultSet tinfo;
            int c=1;
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jacky","root","1001");
        PreparedStatement cuser=con.prepareStatement("SELECT * FROM user");
        ResultSet users= cuser.executeQuery();
        while(users.next()){ %>   
                
                
                
                <tr>
                    <td><input type="checkbox" name="hiddenID" value="<%=users.getString(1)%>"></td>
                    <td><%=users.getString(1) %></td>
                    <td><%= users.getString("username") %></td>
                    <td><%= users.getString("first_name") %></td>
                    <td><%= users.getString("last_name") %></td>
                    <td><%= users.getString("email") %></td>
                    <td><%= users.getString(5) %></td>
                    <td><%= users.getString(6) %></td>
                    <td><%= users.getInt("acad_year") %></td>
                </tr>
        
 
        <%
           c++; }
        %>
        <tr>
            <td colspan="5"> <button class="btn btn-primary" type="submit" style="height: 50%"> Update </button></td>
        </tr>
            </form>
            </tbody>
        </table></div>
            <br>
            <div class="container">
            <h1>Threads Info</h1>
            <table border="1" cellspacing="1" cellpadding="1" style="width: 100%;">
                <thead>
                    <tr>
                        <th>@@</th>
                        <th>Idthread</th>
                        <th>topic</th>
                       <!-- <th>created</th>-->
                        <th>created_by</th>
                    </tr>
                </thead>
                <tbody>
                    <form action="delete.jsp" method="post">
                    <input type="hidden" name="section" value="thread"/>
                     <%
            PreparedStatement cthread=con.prepareStatement("SELECT * FROM thread");
            tinfo= cthread.executeQuery();
            while(tinfo.next()){ %>
                    <tr>
                        <td><input type="checkbox" name="hiddenID" value="<%=tinfo.getString(1)%>"></td>
                        <td><%=tinfo.getString(1) %></td>
                        <td><%=tinfo.getString(2) %></td>
                        
                        <td><%=tinfo.getString(4) %></td>
                    </tr>
                    
                    <%
                 } 
            
            %> <tr>
            <td colspan="5"> <button class="btn btn-primary" type="submit" style="height: 50%"> Update </button></td>
        </tr>
                    </form>
            </tbody>
            </table></div>
            <div class="container">
            <h1>Posts Info</h1>
            <table border="1" cellspacing="1" cellpadding="1" style="width: 100%; background-color:black;color: #00ACED; ">
                
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
           <td colspan="5"> <button class="btn btn-primary" type="submit" style="height: 50%"> Update </button></td>
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
            <td colspan="5"> <button class="btn btn-primary" type="submit" style="height: 50%"> Update </button></td>
        </tr> </form>
                    </tbody>
            </table></div>
            <div class="container">
            <h1>Faculty Info</h1>
            <table border="1" cellspacing="1" cellpadding="1" style="width: 100%;background-color: black;color: #00ACED; ">
                <thead>
                    <tr>
                        <th>@@</th>
                        <th>id</th>
                        <th>username</th>
                        <th>password</th>
                    </tr>
                </thead>
                <tbody>
                    <form action="delete.jsp" method="post">
                        <input type="hidden" name="section" value="image_table"/>
                     <%
            PreparedStatement cfac=con.prepareStatement("SELECT * FROM faculty");
            tinfo= cfac.executeQuery();
            while(tinfo.next()){ %>
                    <tr>
                        <td><input type="checkbox" name="hiddenID" value="<%=tinfo.getString(1)%>"></td>
                        <td><%=tinfo.getString(1) %></td>
                        <td><%=tinfo.getString(2) %></td>
                        <td><%=tinfo.getString(3) %></td>
                    </tr>
                    
                    <%
                 } 
            
%> <tr>
            <td colspan="5"> <button class="btn btn-primary" type="submit" style="height: 50%"> Update </button></td>
        </tr> </form>
                    </tbody>
            </table></div>
            
            <br>
          
            <br><br><br>
            
            
            
            <%
               // con.commit();
            }catch(Exception lo){
                lo.printStackTrace();
                
            }
        
        %>
        
    </body>

</html>
