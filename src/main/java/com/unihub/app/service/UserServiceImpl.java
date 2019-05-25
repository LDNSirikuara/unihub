package com.unihub.app.service;

import com.unihub.app.dao.BaseDAO;
import com.unihub.app.dao.UserDAO;
import com.unihub.app.domain.User;
import com.unihub.app.exception.UserBlockedException;
import com.unihub.app.rm.UserRowMapper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

/**
 *
 * @author namal
 */
@Service
public class UserServiceImpl extends BaseDAO implements UserService {
    
    @Autowired
    private UserDAO userDAO;

    @Override
    public void register(User u) {
        userDAO.save(u);
    }

    @Override
    public User login(String uEmail, String uPassword) throws UserBlockedException {
        String sql="SELECT uId, uEmail, uRole, uLoginStatus FROM user WHERE uEmail=:le AND uPassword=:pw ";
        Map m = new HashMap();
        m.put("le", uEmail);
        m.put("pw", uPassword);
       
        try {
            User u = getNamedParameterJdbcTemplate().queryForObject(sql, m, new UserRowMapper());
            if (u.getuLoginStatus().equals(UserService.LOGIN_STATUS_BLOCKED)){
                throw new UserBlockedException("You account has been blocked. Contact admin!");
            }else{
                return u;
            }
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<User> getUserList() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void changeLginStatus(Integer userId, Integer loginStatus) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }    
}
