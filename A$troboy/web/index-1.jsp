<%-- 
    Document   : index
    Created on : 20 Mar, 2018, 5:23:35 PM
    Author     : A$troboy
--%>
<%@page import="javaFile.Threads" %>
<%@page import="java.util.Date" %>
<%@include file="GetDoc.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <link href="css/animate.min.css" rel="stylesheet"/>
        <style>
            .affix + .row {
      padding-top:70px;
    
  }
            .affix {
                background-color:#f4f4f4;
                padding-top: 20px;
                padding-bottom: 20px;
      top: 0;
      width: 100%;
      z-index: 9999 !important;
  }
          
        .sc {
                        margin-top: 20px;
			background-color:#FF0;
                        background-image:url("images/cool.jpg");
			margin-bottom:10px;
			min-height:300px;
			text-align:center;
			font-size: large;
                        color: white;
		}
	
		.mc{
			
			overflow: auto;
                        max-height:1000px;
			min-height:610px;
			text-align:left;
                        padding-left: 40px;
			margin-bottom: 10px;
			font-size:large;
			
		}
        </style>
        <% try{
                out.print("<script>alert(\""+session.getAttribute("mn").toString() +"\");</script>");
                                                            session.removeAttribute("mn");
                                                            }catch(Exception e){
                
                                                                }
        %>
    </head>
    <body>
        <div class="animated slideInDown"> 
<%@include file="header-1.jsp"%>
        </div>

<div class="container " style=" width: 100%" >
   
    <div class="row " style="padding-top: 20px; padding-bottom: 10px;">
        <div class="col-lg-9" data-spy="affix" data-offset-top="215">
                        <div style="color:black;">
                                                                 <%try {%>
                                        <form name="enter topic"  action="insert_topic.jsp?user=<% out.print(session.getAttribute("logged_username").toString());%>" method="POST">
                                                             <% }catch(Exception l){
                                                             } %>
                                        <span style=" font-size:20px;">GOT ANY DOUBT? Add your Query now!!!</span>
                                        <input type="text" name="topic" style="width:800px;" /> 
                                        <input  type="submit" class="btn"/>
                                                          <% try{
                                                            out.print(session.getAttribute("msg").toString());
                                                            session.removeAttribute("msg");
                                                            }catch(Exception e){
                
                                                                }
                                                                            %>
                                        </form>
        	
                        </div>
        	
        </div>
                                        <div class="col-lg-3"style="font-size:15px;"><br> 
                                            <div style="text-align: center; font-family: cursive; color: red;"><button class="btn-block"><a href="postedby_me.jsp">check queries posted by you</a></button></div></div>
    </div>
    
    <div class="row">
        <div class="col-lg-9">
        	<div class="mc animated slideInLeft">
                    <div style="text-align: center;"><h1 id="ask">Asked Queries</h1></div>
                    <%@include file="forum.jsp" %>
                   
                    
        	
        
                </div>
        </div>
        <div class="col-lg-3">
        	<div class="row">
        		<div class="col-lg-12">
                            <div class="sc animated slideInRight"> LATEST queries by<br>
                                    <% 
            for(Threads s:l){
                 if(l.indexOf(s)<6){
                 out.print(s.getCreatedby());
                 %>
                 <br>
                                    <%
                    }
}

                

%></div>        
        		</div>
        	</div>
            <div class="row">
        		<div class="col-lg-12">
        			<div class="sc animated slideInRight">LATEST upload by<br>
                                    <% 
            for(Documents s:d){
               if(l.indexOf(s)<6){
                   %>
                   <a href="documents.jsp"><%out.print(s.getCreated_by());%></a><%
                 %>
                 <br>
                                    <%
                    }
}

                

%></div>        
        		</div>
        	</div>
            
		</div>
    </div>
            </div>

<%@include file="footer.jsp" %>
</body>
<script src="js/myscript.js">
    
    </script>
</html>
