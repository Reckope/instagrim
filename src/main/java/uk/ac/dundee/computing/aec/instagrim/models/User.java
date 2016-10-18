/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.models;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import uk.ac.dundee.computing.aec.instagrim.lib.AeSimpleSHA1;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;

/**
 *
 * @author Administrator
 */

public class User {
    Cluster cluster;
    public User(){
        
    }
    
    public boolean RegisterUser(String username, String Password, String firstname, String surname, String email){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("INSERT INTO userprofiles (login,password,first_name,last_name,email) Values(?,?,?,?,?)");
        
        
        BoundStatement boundStatement = new BoundStatement(ps);
        session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username,EncodedPassword, firstname, surname, email));
        //We are assuming this always works.  Also a transaction would be good here !
        
        return true;
    }
    
    public boolean IsValidUser(String username, String Password){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select password from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return false;
        } else {
            for (Row row : rs) {
               
                String StoredPass = row.getString("password");
                if (StoredPass.compareTo(EncodedPassword) == 0)
                    return true;
            }
        }
   
    
    return false;  
    }
    
    public String[] getUserInfo(String username){
    
            String[] userInfo = new String[3];
            
            Session session = cluster.connect("instagrim");
            
            PreparedStatement ps = session.prepare("SELECT first_name, last_name, email FROM userprofiles WHERE login =?");
            ResultSet rs = null;
            
            BoundStatement boundStatement = new BoundStatement(ps);
            
            rs = session.execute(boundStatement.bind(username));
            
            if(rs.isExhausted()){
            
                System.out.println("No user info");
                
            }else{
            
                for(Row row: rs){
                
                    userInfo[0] = row.getString(0);
                    userInfo[1] = row.getString(1);
                    userInfo[2] = row.getString(2);
                    //System.out.println(userInfo[0]);
                }
            
            }
            
            return userInfo;
            
    }
    
    public void UpdateUser(String username, String firstname, String surname, String email){
    
        Session session = cluster.connect("Instagrim");
        PreparedStatement ps = session.prepare("UPDATE userprofiles SET first_name = '" + firstname
                                                + "', last_name = '" + surname
                                                + "', email = '" + email + "' WHERE login =?");
        
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);           
        rs = session.execute(boundStatement.bind(username));
        
        if(rs.isExhausted()){           
                System.out.println("No user info");              
            }
    }
    
    public void deleteUser(String username){
    
        Session session = cluster.connect("Instagrim");
        
        PreparedStatement ps = session.prepare("DELETE from userprofiles WHERE login =?");
        
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute(boundStatement.bind(username));
        
    
    }
    
       public void setCluster(Cluster cluster) {
        this.cluster = cluster;
        
        
    }

    
}
