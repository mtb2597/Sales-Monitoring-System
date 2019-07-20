
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.http.HTTPException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author A$troboy
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();  
          
String n=request.getParameter("name");  
String p=request.getParameter("email"); 
String m=request.getParameter("mess");
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jacky", "root", "1001");  
  
PreparedStatement ps=con.prepareStatement(  
"insert into feedback(name,email,message)"+"values(?,?,?)");  
  
ps.setString(1,n);  
ps.setString(2,p);
ps.setString(3,m);
          
int i=ps.executeUpdate();  
if(i>0) { 
out.print("Thank you for your valuable feedback");
out.print("<br>");
out.print("<a href=\"index.jsp\">Go back</a>");
}
else{
    out.print("sorry");
     } 
          
}catch (Exception e2) {System.out.println(e2);}  
          
out.close();  
}  
  
}  
    
