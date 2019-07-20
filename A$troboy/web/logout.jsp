<%-- 
    Document   : logout
    Created on : 27 Mar, 2018, 12:40:59 PM
    Author     : A$troboy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 try{
     session.removeAttribute("logged_username");
     session.setAttribute("msg","Succesfully logged out");
     response.sendRedirect("index.jsp");
     
 }catch(Exception e){
     
 }
%>