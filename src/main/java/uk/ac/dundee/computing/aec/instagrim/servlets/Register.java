/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*Each of these methods receives a HttpServletRequest and HttpServletResponse object,
  which makes it easy to access the payload of the request and construct a response.*/
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.models.User;
import uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn;
import uk.ac.dundee.computing.aec.instagrim.stores.ProfileStore;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet { //This is called inheritence, because this class inherited from HttPServlet.
    Cluster cluster=null;
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }




    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String firstname=request.getParameter("firstname");
        String surname=request.getParameter("surname");
        String email=request.getParameter("email");
        String confirmPassword = request.getParameter("confirmPassword");
        
        if(password.equals(confirmPassword)){
            
            HttpSession session;
            session = request.getSession();
        
            ProfileStore profilestore;
            profilestore = new ProfileStore();
            profilestore.setFirstName(firstname);
            profilestore.setSurname(surname);
            profilestore.setEmail(email);
            session.setAttribute("ProfileStore", profilestore);
        
            User us=new User();
            //LoggedIn lg = new LoggedIn();
            us.setCluster(cluster);
            us.RegisterUser(username, password, firstname, surname, email);
            //lg.setFirstName(firstname);
        
            response.sendRedirect("/Instagrim");
        }else{

            //JOptionPane.showMessageDialog(null, "Passwords do not match");
            response.sendRedirect("/Instagrim/PasswordError");
        
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) //This is called by the server (via the service method) to allow a servlet to handle a GET request.
        throws ServletException, IOException {
        
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
            rd.forward(request,response);
            
            /*
                This is extending REST.
                Rest stands for "Representational State Transfer".
                REST provides a definition of a resource, which is what web pages point to.
                An API that adheres to the principles of REST does not require the client to know anything about the structure of the API.
                So instead of the URL containing "register.jsp", it will instead just appear as "Register".
            */
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
