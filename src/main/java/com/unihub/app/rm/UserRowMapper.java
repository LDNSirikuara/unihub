package com.unihub.app.rm;

import com.unihub.app.domain.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author namal
 * -new
 */
public class UserRowMapper implements RowMapper<User> {

    @Override
    public User mapRow(ResultSet rs, int i) throws SQLException {
        User u = new User();
        u.setuId(rs.getInt("uId"));
        u.setuEmail(rs.getString("uEmail"));
        u.setuRole(rs.getInt("uRole"));
        u.setuLoginStatus(rs.getInt("uLoginStatus"));
        return u;
    }
    
}
