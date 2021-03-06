<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
    </head>
    <body>
        <header class = "MainHeader">
        
        <h1>InstaGrim ! </h1>
        <h3>Your world in Black and White</h3>
        </header>
        
        <nav>
            <ul class = "List">
                
                <%    
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                 %>
                <li><a href="/Instagrim/ProfileHome">Profile</a></li>              
                <li><a href="/Instagrim/Upload">Upload</a></li>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>" class = "selected">Your Images</a></li>
                <li> <a href ="/Instagrim/Profile" method ="GET">Logout</a></li>
                    <%}
                            }else{
                                %>
                <li><a href = "/Instagrim">Home</a></li>
                <li><a href="/Instagrim/Upload">Upload</a></li>
                <li><a href="/Instagrim/Register">Register</a></li>
                <li><a href="/Instagrim/Login">Login</a></li>
                <%                      
                    }%>
            </ul>
        </nav>
        
        <!--<nav>
            <ul>
                <li class="nav"><a href="/Instagrim/upload.jsp">Upload</a></li>
                <li class="nav"><a href="/Instagrim/Images/majed">Sample Images</a></li>
                
            </ul>
        </nav>-->
 
        <article id = "Pictures">
            <h1>Your Pics</h1>
        <%
            java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
            if (lsPics == null) {
        %>
                <p>No Pictures found</p>
        <%
            } else {
                Iterator<Pic> iterator;
                iterator = lsPics.iterator();
                while (iterator.hasNext()) {
                    Pic p = (Pic) iterator.next();
        %>
        <a href="/Instagrim/Image/<%=p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a><%

                }
            }   
        %>
        </article>
        <footer>
            
            <p>&COPY; Andy C & Joe Davis</p>
            
        </footer>
    </body>
</html>
