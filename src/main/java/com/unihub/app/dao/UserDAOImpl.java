package com.unihub.app.dao;

import com.unihub.app.domain.User;
import com.unihub.app.rm.UserRowMapper;
import com.unihub.app.service.UserService;
import java.util.HashMap;//Check this is a error
import java.util.List;
import java.util.Map;//Check this is a error
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
public class UserDAOImpl extends BaseDAO implements UserDAO {

    @Override
    public void save(User u) {
        
        if (u.getuRole().equals(UserService.ROLE_UNIVERSITY)){
            String sql1 ="INSERT INTO user (uEmail, uPassword, uRole)" +
                            "VALUES ( :uEmail, :uPassword, :uRole)"; 
                            
            String sql2 ="INSERT INTO university ( uId, unName, unAddress, unContactNo, unPic, unAbout)" +
                                "VALUES ((SELECT uid FROM user WHERE uEmail=:uEmail), :uName, :uAddress, :unContactNo, :uPic, :uAbout)";

            Map m = new HashMap();//Check this is a error
            m.put("uName", u.getuName());
            m.put("unContactNo", u.getuPhone());
            m.put("uEmail", u.getuEmail());
            m.put("uAddress", u.getuAddress());
            m.put("uPassword", u.getuPassword());
            m.put("uRole", u.getuRole());
            m.put("uLoginStatus", u.getuLoginStatus());
            m.put("uPic", u.getuPic());
            m.put("uAbout", u.getuAbout());

            KeyHolder kh = new GeneratedKeyHolder();
            SqlParameterSource ps = new MapSqlParameterSource(m);
            super.getNamedParameterJdbcTemplate().update(sql1, ps, kh);
            super.getNamedParameterJdbcTemplate().update(sql2, ps, kh);
            Integer uId = kh.getKey().intValue();
            u.setuId(uId);
            
        }else if(u.getuRole().equals(UserService.ROLE_INDUSTRY)){
            String sql1 ="INSERT INTO user (uEmail, uPassword, uRole)" +
                            "VALUES ( :uEmail, :uPassword, :uRole)"; 
                            
            String sql2 ="INSERT INTO industry ( uId, iName, iAddress, iContactNo, iPic, iAbout)" +
                                "VALUES ((SELECT uid FROM user WHERE uEmail=:uEmail), :uName, :uAddress, :uPhone, :uPic, :uAbout)";

            Map m = new HashMap();//Check this is a error
            m.put("uName", u.getuName());
            m.put("uPhone", u.getuPhone());
            m.put("uEmail", u.getuEmail());
            m.put("uAddress", u.getuAddress());
            m.put("uPassword", u.getuPassword());
            m.put("uRole", u.getuRole());
            m.put("uLoginStatus", u.getuLoginStatus());
            m.put("uPic", u.getuPic());
            m.put("uAbout", u.getuAbout());

            KeyHolder kh = new GeneratedKeyHolder();
            SqlParameterSource ps = new MapSqlParameterSource(m);
            super.getNamedParameterJdbcTemplate().update(sql1, ps, kh);
            super.getNamedParameterJdbcTemplate().update(sql2, ps, kh);
            Integer uId = kh.getKey().intValue();
            u.setuId(uId);
            
        }else if(u.getuRole().equals(UserService.ROLE_STUDENT)){
            String sql1 ="INSERT INTO user (uEmail, uPassword, uRole)" +
                            "VALUES ( :uEmail, :uPassword, :uRole)"; 
                            
            String sql2 ="INSERT INTO student (uId, sFname, sLname, unId, sBatch, sPic, sAbout)" +
                                "VALUES ((SELECT uid FROM user WHERE uEmail=:uEmail), :uFname, :uLname, :uniId, :uBatch, :uPic, :uAbout)";

            Map m = new HashMap();//Check this is a error
            m.put("uFname", u.getuFname());
            m.put("uLname", u.getuLname());
            m.put("uEmail", u.getuEmail());
            m.put("uPassword", u.getuPassword());
            m.put("uRole", u.getuRole());
            m.put("uLoginStatus", u.getuLoginStatus());
            m.put("uPic", u.getuPic());
            m.put("uAbout", u.getuAbout());
            m.put("uniId", u.getUniId());
            m.put("uBatch", u.getuBatch());

            KeyHolder kh = new GeneratedKeyHolder();
            SqlParameterSource ps = new MapSqlParameterSource(m);
            super.getNamedParameterJdbcTemplate().update(sql1, ps, kh);
            super.getNamedParameterJdbcTemplate().update(sql2, ps, kh);
            Integer uId = kh.getKey().intValue();
            u.setuId(uId);
        }
    }

    @Override
    public void update(User u) {        
        if (u.getuRole().equals(UserService.ROLE_UNIVERSITY)){            
            String sql = "UPDATE university "
                    + " SET unName=:uName,"
                    + " unAddress=:uAddress,"
                    + " unContactNo=:uPhone,"
                    + " unPic=:unPic,"
                    + " unAbout=:unAbout"
                     + " WHERE uId=:uId";
            Map m = new HashMap();
            m.put("uName", u.getuName());
            m.put("uAddress", u.getuAddress());
            m.put("uPhone", u.getuPhone());
            m.put("unPic", u.getuPic());
            m.put("unAbout", u.getuAbout());
            m.put("uId", u.getuId());
            getNamedParameterJdbcTemplate().update(sql, m);
            
        }else if(u.getuRole().equals(UserService.ROLE_INDUSTRY)){
            String sql = "UPDATE industry "
                    + " SET iName=:uName,"
                    + " iAddress=:uAddress,"
                    + " iContactNo=:uPhone,"
                    + " iPic=:unPic,"
                    + " iAbout=:unAbout"
                     + " WHERE uId=:uId";
            Map m = new HashMap();
            m.put("uName", u.getuName());
            m.put("uAddress", u.getuAddress());
            m.put("uPhone", u.getuPhone());
            m.put("unPic", u.getuPic());
            m.put("unAbout", u.getuAbout());
            m.put("uId", u.getuId());
            getNamedParameterJdbcTemplate().update(sql, m);
                        
        }else if(u.getuRole().equals(UserService.ROLE_STUDENT)){
            String sql = "UPDATE student "
                    + " SET sFname=:uFname,"
                    + " sLname=:uLname,"
                    + " unId=:UniId,"
                    + " sBatch=:uBatch,"
                    + " sPic=:uPic,"
                    + " sAbout=:uAbout"
                     + " WHERE uId=:uId";
            Map m = new HashMap();
            m.put("uFname", u.getuFname());
            m.put("uLname", u.getuLname());
            m.put("UniId", u.getUniId());
            m.put("uBatch", u.getuBatch());
            m.put("uPic", u.getuPic());
            m.put("uAbout", u.getuAbout());
            m.put("uId", u.getuId());
            getNamedParameterJdbcTemplate().update(sql, m);

        }
    }

    @Override
    public void delete(User u) {
        this.delete(u.getuId());
    }

    @Override
    public void delete(Integer uId) {
        String sql ="DELETE FROM user WHERE uId =?";
        getJdbcTemplate().update(sql,uId);
    }

    @Override
    public User findById(Integer uId) {
        String sql = "SELECT uId, uName, uPhone, uEmail, uAddress, uFname, uLname, uRole, uLoginStatus"
                +" FROM user WHERE uId=?";
        User u = getJdbcTemplate().queryForObject(sql, new UserRowMapper(),uId);
        return u;
    }

    @Override
    public List<User> findAll() {
        String sql = "SELECT uId, uName, uPhone, uEmail, uAddress, uFname, uLname, uRole, uLoginStatus"
                +" FROM user";
        return getJdbcTemplate().query(sql, new UserRowMapper());
    }

    @Override
    public List<User> findByProperty(String propName, Object propValue) {
        String sql = "SELECT uId, uName, uPhone, uEmail, uAddress, uFname, uLname, uRole, uLoginStatus"
                +" FROM user WHERE "+propName+"=?";
        return getJdbcTemplate().query(sql, new UserRowMapper(), propValue);
    }
    
}
