package com.unihub.app.dao;

import com.unihub.app.domain.Post;
import com.unihub.app.rm.PostEditRowMapper;
import com.unihub.app.rm.PostRowMapper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

/**
 *
 * @author namal
 */
@Repository
public class PostDAOImpl extends BaseDAO implements PostDAO {

    @Override
    public void save(Post p) {
        String sql="INSERT INTO post(pTitle, pContent, uId, pTag, pImage)"
                +"VALUES(:pTitle, :pContent, :uId, :pTag, :pImage)";
        Map m = new HashMap();//Check this is a error
        m.put("pTitle", p.getpTitle());
        m.put("pContent", p.getpContent());
        m.put("uId", p.getuId());
        m.put("pTag", p.getpTag());
        m.put("pImage", p.getpImage());
        
        KeyHolder kh = new GeneratedKeyHolder();
        SqlParameterSource ps = new MapSqlParameterSource(m);
        getNamedParameterJdbcTemplate().update(sql, ps, kh);
        p.setpId(kh.getKey().intValue());
    }
        
    @Override
    public void update(Post p) {
                String sql="UPDATE post SET pTitle=:pTitle, pContent=:pContent, pImage=:pImage WHERE pId=:pId";
        Map m = new HashMap();//Check this is a error
        m.put("pId", p.getpId());
        m.put("pTitle", p.getpTitle()); 
        m.put("pContent", p.getpContent());
        m.put("pImage", p.getpImage());
        getNamedParameterJdbcTemplate().update(sql, m);
        
    }

    @Override
    public void delete(Post p) {
        this.delete(p.getpId());
    }

    @Override
    public void delete(Integer pId) {
               String sql = "DELETE FROM post WHERE pId=?";
        getJdbcTemplate().update(sql, pId);
    }

    @Override
    public Post findById(Integer pId) {
        String sql="SELECT pId, pTitle, pContent, uId, pTag, pImage FROM post WHERE pId=?";
        return getJdbcTemplate().queryForObject(sql, new PostEditRowMapper(),pId);
    }

    @Override
    public List<Post> findAll() {
        String sql="SELECT pId, pTitle, pContent, pUser FROM post";
        return getJdbcTemplate().query(sql, new PostRowMapper());
    }

    @Override
    public List<Post> findByProperty(String propName, Object propValue) {
        String sql="SELECT pId, pTitle, pContent, pUser FROM post WHERE "+propName+"=?";
        return getJdbcTemplate().query(sql, new PostRowMapper(),propValue);
    }
    
}
