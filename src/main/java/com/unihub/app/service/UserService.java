package com.unihub.app.service;

import com.unihub.app.domain.User;
import com.unihub.app.exception.UserBlockedException;
import java.util.List;

/**
 *
 * @author namal
 */
public interface UserService {
    
    public static final Integer LOGIN_STATUS_ACTIVE=1;
    public static final Integer LOGIN_STATUS_BLOCKED=2;
    
    public static final Integer ROLE_ADMIN=1;
    public static final Integer ROLE_UNIVERSITY=2;
    public static final Integer ROLE_INDUSTRY=3;
    public static final Integer ROLE_STUDENT=4;
    
    
    /**
     * The method handle the user registration task.
     * @param u the new user detail as user object.
     */
    public void register(User u);
    
    
    /**
     * The method handle login operation(authentication) using given credentials,
     * it return user object when success and null when failed.
     * When user account is blocked an exception will be thrown this method.
     * @param uEmail
     * @param uPassword 
     * @return  
     * @throws com.unihub.app.exception.UserBlockedException When user account is blocked.
     */
    public User login(String uEmail, String uPassword) throws UserBlockedException;
    
    
    /**
     * Call this method to get list of registered users.
     * @return 
     */
    public List<User> getUserList();
    
    
    /**
     * This method change the user login status for details passed as argument.
     * @param userId
     * @param loginStatus 
     */
    public void changeLginStatus(Integer userId, Integer loginStatus);

}
