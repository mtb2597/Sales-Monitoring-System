/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;  
import java.sql.*;  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
/**
 *
 * @author A$troboy
 */
@WebServlet("/Registerf")
public class Registerf  extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();  
          
String n=request.getParameter("fuser");  
String p=request.getParameter("fpass"); 
          
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jacky", "root", "1001");  
  
PreparedStatement ps=con.prepareStatement(  
"insert into faculty(username,password)"+"values(?,?)");  
  
ps.setString(1,n);  
ps.setString(2,p);
          
int i=ps.executeUpdate();  
if(i>0) { 
out.print("You are successfully registered...");
}
else{
    out.print("sorry");
     } 
          
}catch (Exception e2) {System.out.println(e2);}  
          
out.close();  
}  
  
}  
    

