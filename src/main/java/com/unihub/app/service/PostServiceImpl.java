package com.unihub.app.service;

import com.unihub.app.dao.BaseDAO;
import com.unihub.app.dao.PostDAO;
import com.unihub.app.domain.Post;
import com.unihub.app.domain.User;
import com.unihub.app.rm.PostIndustryRowMapper;
import com.unihub.app.rm.PostRowMapper;
import com.unihub.app.rm.PostStudentRowMapper;
import com.unihub.app.rm.PostUniversityRowMapper;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author namal
 */
@Service
public class PostServiceImpl extends BaseDAO implements PostService {
    @Autowired
    private PostDAO postDAO;
    
    @Override
    public void addPost(Post p) {
        postDAO.save(p);
    }

    @Override
    public void updatePost(Post p) {
        postDAO.update(p);
    }

    @Override
    public void deletePost(Integer pId) {
        postDAO.delete(pId);
    }


    @Override
    public List<Post> getPostList(Integer roleID) {
       
        String sql = "SELECT post.pTitle, post.pContent, post.pImage, post.pTag, post.pId, student.sFname, industry.uId, university.uId, student.uId, university.unName, industry.iName "+
                "FROM post "+
                "LEFT JOIN student "+
                "ON post.uId = student.uId "+
                "LEFT JOIN university "+
                "ON post.uId = university.uId "+
                "LEFT JOIN industry "+
                "ON post.uId = industry.uId";
        return getJdbcTemplate().query(sql, new PostRowMapper());
        
    }   

    @Override
    public List<Post> getUPostList(Integer uId) {
                String sql = "SELECT post.pTitle, post.pContent, post.pTag, post.pId, post.pImage, university.unName, university.uId, post.uId FROM post \n" +                            
                "INNER JOIN university\n" +
                "ON post.uId = university.uId"+
                " WHERE post.uId=?";
        return getJdbcTemplate().query(sql, new PostUniversityRowMapper(),uId);
    }

    @Override
    public List<Post> getIPostList(Integer uId) {
        String sql = "SELECT post.pTitle, post.pContent, post.pTag, post.pId, post.pImage, industry.iName, industry.uId, post.uId FROM post \n" +                            
                "INNER JOIN industry\n" +
                "ON post.uId = industry.uId"+
                " WHERE post.uId=?";
        return getJdbcTemplate().query(sql, new PostIndustryRowMapper(),uId);
    }

    @Override
    public List<Post> getSPostList(Integer uId) {
         String sql = "SELECT post.pTitle, post.pContent, post.pTag, post.pId, post.pImage, student.sFname, student.uId, post.uId FROM post \n" +                            
                "INNER JOIN student\n" +
                "ON post.uId = student.uId"+
                " WHERE post.uId=?";
        return getJdbcTemplate().query(sql, new PostStudentRowMapper(),uId);
    }

    @Override
    public Post findById(Integer pId) {
        return postDAO.findById(pId);
    }
    
}
