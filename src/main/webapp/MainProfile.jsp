<%-- 
    Document   : profile
    Created on : Sep 29, 2016, 3:26:00 PM
    Author     : JoeDavis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title id ="Instagrim">Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <%ProfileStore profile = (ProfileStore) session.getAttribute("ProfileStore");%>
        
    </head>
    <body>
        <header class = "MainHeader">
            <h1 id ="IndexHeader" a href="/Instagrim">InstaGrim !</h1>
            <h3>Your world in Black and White</h3>
        </header>
        <nav>
            <ul class = "List">
                
                <%    
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        //ProfileStore ps = (ProfileStore) session.getAttribute("ProfileStore");
                        if (lg != null) {
                            //String UserName = lg.getUsername();
                            //String FirstName = lg.getFirstName();
                            if (lg.getlogedin()) {
                 %>
                <li><a href="/Instagrim/MainProfile.jsp" class = "selected">Profile</a></li>              
                <li><a href="/Instagrim/upload.jsp">Upload</a></li>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <li> <a href ="Profile" method ="GET">Logout</a></li>
                    <%}
                            }else{
                                %>
                <li><a href = "/Instagrim">Home</a></li>
                <li><a href="upload.jsp">Upload</a></li>
                <li><a href="register.jsp">Register</a></li>
                <li><a href="login.jsp">Login</a></li>
                <%                      
                    }%>
            </ul>
        </nav>
        <div id = "container">  
            <div class = "ArticleDesign">
            <p>Hello <b><%=profile.getFirstName()%> <%=profile.getSurname()%>!</b></p>
            <p>Username: <b><%=lg.getUsername()%></b></p>
            <p>Email: <b><%=profile.getEmail()%></b></p>
            
           <!-- <a href = "update.jsp">Update Details</a>-->
            <a href="update.jsp" class="button" role="button">Update Details</a>
            </div>
            
        </div>    
        <footer>
            
            <p>&COPY; Andy C & Joe Davis</p>
            
        </footer>
    </body>
</html>
