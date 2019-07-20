<%@page import="java.sql.*"%>
<% 
String [] id = request.getParameterValues("hiddenID");
// String id= request.getParameter("hiddenID");
  if (id != null && id.length != 0) {
    out.println("You have selected: ");
        for (int i = 0; i < id.length; i++) {
        out.println(id[i]); 
    } //end for loop
}// end if


        Connection conn = null;
    try {
    Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String URL="jdbc:mysql://localhost:3306/jacky";
                String USERNAME="root";
                String PASSWORD="1001";
    
    // Step 3: Establish connection to URL
    conn =DriverManager.getConnection(URL,USERNAME,PASSWORD);
    String sqlStr=null;
    String mm=null;
    if(request.getParameter("section").equals("image_table")){
     sqlStr = "Delete from image_table WHERE id =?";
    }
    else{
        if(request.getParameter("section").equals("posts")){
           sqlStr = "Delete from posts WHERE id =?"; 
        }
        else{
            if(request.getParameter("section").equals("thread")){
             sqlStr = "Delete from thread WHERE Idthread =?";   
            }
            else{
               sqlStr = "Delete from user WHERE id =?"; 
            }
            
        }
    }
    PreparedStatement pstmt = conn.prepareStatement(sqlStr);

    //pstmt.setArray(1,Integer.parseInt(id));
    //pstmt.setInt(1,Integer.parseInt(id));
    // for (int i = 0; i < id.length; i++)
//if (id !=null){
      int rec=0;
      for (int i = 0; i < id.length; i++){
        //   pstmt.setString(1, id[i]);


            pstmt.setString(1, id[i]); 
            rec=pstmt.executeUpdate();
      }
             conn.close();
             out.print(rec);

             if (rec>0){
                    mm="yes";
                    %>
                    <h1>hello updated</h1>
                    
                    <%

                } //end if

                else{
                mm="no";
                
                    %>
                    <h1>no data altered go back</h1>
                <%
                }%>
                <%if(request.getParameter("lo").equals("f")){
                    session.setAttribute("Amsg",mm);
                response.sendRedirect("fcheck.jsp");
                }else{%>
                <a href="dummy.jsp"> go back</a>
                <%}
                session.setAttribute("Amsg",mm);
                
//end else

//response.sendRedirect("dummy.jsp");

    }//end try



     catch (Exception e) {
                out.println(e.getMessage());
            }


 %>