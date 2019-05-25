/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unihub.app.exception;

/**
 *
 * @author namal
 */
public class UserBlockedException extends Exception {
    
    /**
     * Create User object without error description.
     */
    public UserBlockedException(){
        
    }
    
    /**
     * Create User object with error description.
     * @param errDesc
     */
    public UserBlockedException(String errDesc){
        super(errDesc);
    }
    
}
