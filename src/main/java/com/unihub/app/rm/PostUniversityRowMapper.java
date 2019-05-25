package com.unihub.app.rm;

import com.unihub.app.domain.Post;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author namal
 * -new
 */
public class PostUniversityRowMapper implements RowMapper<Post> {

    @Override
    public Post mapRow(ResultSet rs, int i) throws SQLException {
        Post p = new Post();
        p.setpId(rs.getInt("pId"));
        p.setpTitle(rs.getString("pTitle"));
        p.setpContent(rs.getString("pContent"));
        p.setuId(rs.getInt("uId"));
        p.setpTag(rs.getInt("pTag"));
        p.setpImage(rs.getString("pImage"));
        p.setUnName(rs.getString("unName"));
        return p;
    }
    
}
