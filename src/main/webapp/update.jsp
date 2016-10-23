<%-- 
    Document   : register.jsp
    Created on : Sep 28, 2014, 6:29:51 PM
    Author     : Administrator
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
                <li><a href="/Instagrim/Register">Register</a></li>
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
            <h3>Update Details</h3>
            
            <form method="POST"  action="UpdateProfile">
                <input type = "text" name ="username" value = "<%=lg.getUsername()%>" readonly>
                <input type="text" name="firstname" placeholder="Firstname">
                <input type="text" name="surname" placeholder="Surname">
                <input type="email" name="email" placeholder="Email">
                <p> </p>
                <input type = "submit" class ="button" value ="Update Details">
            </form>
            </br>    
            <form method="POST" enctype="multipart/form-data" action="Image">                
                Choose Profile Picture: <input type="file" name="upfile"><br/>
                <input type = "hidden" name = "check" value = "true">
                <br/>
                <input type="submit" class ="button" value="Upload Profile Picture">              
            </form>

        </article>
                
        <footer>
            
            <p>&COPY; Andy C & Joe Davis</p>
            
        </footer>
    </body>
</html>
