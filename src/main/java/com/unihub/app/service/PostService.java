package com.unihub.app.service;

import com.unihub.app.domain.Post;
import com.unihub.app.domain.User;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author namal
 */
public interface PostService {
    
    public static final Integer UNIVERSITY_EVENT_POST=1;
    public static final Integer INDUSTRY_EVENT_POST=2;
    public static final Integer INDUSTRY_RESEARCH_POST=3;
    public static final Integer STUDENT_RESEARCH_POST=4;
    
    public void addPost(Post p);   
    public void updatePost(Post p); 
    public void deletePost(Integer pId); 
    public List<Post> getPostList(Integer roleID);
    
    public List<Post> getUPostList(Integer uId);
    public List<Post> getIPostList(Integer uId);
    public List<Post> getSPostList(Integer uId);

    public Post findById(Integer pId);
    
    
}
