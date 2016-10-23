<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
    </head>
    <body>
        <header class = "MainHeader">
        <h1 id ="IndexHeader" a href="/Instagrim">InstaGrim ! </h1>
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
                <li><a href="/Instagrim/Upload" class = "selected">Upload</a></li>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <li> <a href ="Profile" method ="GET">Logout</a></li>
                    <%}
                            }else{
                                %>
                <li><a href = "/Instagrim">Home</a></li>
                <<li><a href="/Instagrim/Upload" class = "selected">Upload</a></li>
                <li><a href="/Instagrim/Register">Register</a></li>
                <li><a href="/Instagrim/Login">Login</a></li>
                <%                      
                    }%>
            </ul>
        </nav>
        
        <!--<nav>
            <ul>
                <li class="nav"><a href="upload.jsp">Upload</a></li>
                <li class="nav"><a href="/Instagrim/Images/majed">Sample Images</a></li>
            </ul>
        </nav>-->
 
        <article class = "ArticleDesign">
            <h3>File Upload</h3>
            
            <h4>Select filter</h4>
            
            <form method="POST" enctype="multipart/form-data" action="Image">
                <!--<select id = "filterSelect" name = "filterSelect">
                    <option value="1">None</option>
                    <option value="2">Grayscale</option>
                    <option value="3">Brighter</option>
                    <option value="4">Darker</option>
                </select>
                -->
                <input type="radio" name="filter" value=""> empty<br>
                <input type="radio" name="filter" value="grayscale" checked> GrayScale<br>
                <input type="radio" name="filter" value="brighter"> Brighter<br>
                <input type="radio" name="filter" value="darker"> Darker<br>
                <input type="radio" name="filter" value="none"> none<br>
                
                
                File to upload: <input type="file" name="upfile"><br/>
                <input type = "hidden" name = "check" value = "false">
                <br/>
                <input type="submit" class ="button" value="Upload file">
            </form>

        </article>
        <footer>
            
            <p>&COPY; Andy C & Joe Davis</p>
            
        </footer>
    </body>
</html>
