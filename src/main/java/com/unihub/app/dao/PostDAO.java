package com.unihub.app.dao;

import com.unihub.app.domain.Post;
import java.util.List;

/**
 *
 * @author namal
 */
public interface PostDAO {
    public void save(Post p);
    public void update(Post p);
    public void delete(Post p);
    public void delete(Integer pId);
    public Post findById(Integer pId);
    public List<Post> findAll();
    public List<Post> findByProperty(String propName, Object propValue);
}
