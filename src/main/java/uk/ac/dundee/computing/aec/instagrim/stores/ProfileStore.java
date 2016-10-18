/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.stores;


/**
 *
 * @author JoeDavis
 */
public class ProfileStore {

    private String Firstname = null;
    private String Surname = null;
    private String Email = null;
    private java.util.UUID picUUID;
    
    public void setFirstName(String firstname) {
        this.Firstname = firstname;
    }

    public String getFirstName() {
        return Firstname;
        
    }
    
    public void setSurname(String surname) {
        this.Surname = surname;
    }

    public String getSurname() {
        return Surname;
        
    }
    
    public void setEmail(String email) {
        this.Email = email;
    }

    public String getEmail() {
        return Email;
        
    }
    
    public void update(String firstname, String surname, String email){
    
        setFirstName(firstname);
        setSurname(surname);
        setEmail(email);
        
    }
    
    public void setProfileUUID(java.util.UUID picUUID){
    
        this.picUUID = picUUID;
    
    }
    
    public java.util.UUID getProfileUUID(){
    
        return picUUID;
    
    }
    
    
    
}
