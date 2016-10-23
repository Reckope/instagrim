<%-- 
    Document   : wrongPassword
    Created on : Oct 20, 2016, 6:51:57 PM
    Author     : JoeDavis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
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
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <li> <a href ="Profile" method ="GET">Logout</a></li>
                    <%}
                            }else{
                                %>
                <li><a href = "/Instagrim">Home</a></li>
                <li><a href="/Instagrim/Upload">Upload</a></li>
                <li><a href="/Instagrim/Register" class = "selected">Register</a></li>
                <li><a href="/Instagrim/Login">Login</a></li>
                <%                      
                    }%>
            </ul>
        </nav>
        
        <!--<nav>
            <ul>
                
                <li><a href="/Instagrim/Images/majed">Sample Images</a></li>
            </ul>
        </nav>-->
       
        <article class = "ArticleDesign">
            <h3>Passwords do not match</h3>
            <h4>Please ensure both passwords match<h4>                  
            <a href="/Instagrim/Register" class="button" >Back to register</a>
        </article>
        <footer>
            
            <p>&COPY; Andy C & Joe Davis</p>
            
        </footer>
    </body>
</html>
