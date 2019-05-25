package com.unihub.app.dao;

import com.unihub.app.domain.User;
import java.util.List;

/**
 *
 * @author namal
 */
public interface UserDAO {
    
    public void save(User u);
    
    public void update(User u);
    
    public void delete(User u);
    
    public void delete(Integer uId);
    
    public User findById(Integer uId);
    
    public List<User> findAll();
    
    public List<User> findByProperty(String propName, Object propValue);
}
