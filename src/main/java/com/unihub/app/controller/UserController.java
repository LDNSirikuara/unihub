package com.unihub.app.controller;

import com.unihub.app.command.LoginCommand;
import com.unihub.app.command.PostCommand;
import com.unihub.app.command.UserCommand;
import com.unihub.app.domain.Post;
import com.unihub.app.domain.User;
import com.unihub.app.exception.UserBlockedException;
import com.unihub.app.service.PostService;
import com.unihub.app.service.UserService;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;

/**
 *
 * @author namal
 */
@Controller
public class UserController {
    
    @Autowired
    private ServletContext servletContext;
    
    @Autowired
    private UserService userService;
    
    @Autowired    
    private PostService postService;
    
    @RequestMapping(value = {"/","/index"})
    public String index(){
        return "index";
    }
    
    @RequestMapping(value = {"/login"})
    public String login(Model m){
        m.addAttribute("command", new LoginCommand());
        return "login";

    }
    
    @RequestMapping(value = "/loginn", method = RequestMethod.POST)
    public String handleLogin(@ModelAttribute("command") LoginCommand cmd, Model m, HttpSession session){
        try {
            User loggedInUser = userService.login(cmd.getuEmail(), cmd.getuPassword());
            if(loggedInUser == null){
                //FAILED
                // add error message and go back to login-form
                m.addAttribute("err","Login Failed! Enter Valide Credentials");
                return "login";
            }else{
                //SUCCESS
                //Check the role and redirrect a appropriate dashboard
                if(loggedInUser.getuRole().equals(UserService.ROLE_ADMIN)){
                    // add user details in session (assign session to logd in admin)
                    addUserInSession(loggedInUser, session);
                    return "redirect:admin/dashboard";
                }else if(loggedInUser.getuRole().equals(UserService.ROLE_UNIVERSITY)){
                    addUserInSession(loggedInUser, session);
                    // add user details in session (assign session to logd in admin)
                    return "redirect:university/dashboard";
                }else if(loggedInUser.getuRole().equals(UserService.ROLE_INDUSTRY)){
                    // add user details in session (assign session to logd in admin)
                    addUserInSession(loggedInUser, session);
                    return "redirect:industry/dashboard";
                }else if(loggedInUser.getuRole().equals(UserService.ROLE_STUDENT)){
                    // add user details in session (assign session to logd in admin)
                    addUserInSession(loggedInUser, session);
                    return "redirect:student/dashboard";
                }else{
                     // add error message and go back to login-form
                    m.addAttribute("err", "invalid user role");
                    return "login";
                }
            }
        } catch (UserBlockedException ex) {
            // add error message and go back to login-form
            m.addAttribute("err", ex.getMessage());
            return "login";
        }
    }
    
    @RequestMapping(value = {"/about"})
    public String about(){
        return "about";
    }
        
    @RequestMapping(value = {"/logout"})
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:index?act=lo";
    }
    
    @RequestMapping(value = {"/signup"})
    public String signup(Model m){
        UserCommand cmd = new UserCommand();
        m.addAttribute("command", cmd);
        return "signup";
    }
    
    @RequestMapping(value = {"/signupp"})
    public String handleSignup(@ModelAttribute("command") UserCommand cmd, Model m){
        try {
            User user = cmd.getUser();
            userService.register(user);
            return "redirect:login";
        } catch (DuplicateKeyException e) {
            e.printStackTrace();
            m.addAttribute("err", "User email already registered. Please use another one!"); 
            return "signup";
        }
    }
    
    private void addUserInSession(User u, HttpSession session){
        session.setAttribute("user",u);
        session.setAttribute("uId",u.getuId());
        session.setAttribute("uRole",u.getuRole());
        session.setAttribute("uEmail",u.getuEmail());
        
        
    }     
    
//    -----------------------------------------------------------------------------
//    Post Controllers-------------------------------------------------------------
//    -----------------------------------------------------------------------------
    
    
    @Bean
    public MultipartConfigElement multipartConfigElement() {
        return new MultipartConfigElement("");
    }

    @Bean
    public MultipartResolver multipartResolver() {
        org.springframework.web.multipart.commons.CommonsMultipartResolver multipartResolver = new org.springframework.web.multipart.commons.CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(1000000);
        return multipartResolver;
    }
    
    @RequestMapping(value = "/addPost", method = RequestMethod.POST, consumes = "multipart/form-data")
    public String addorUpdatePost(@ModelAttribute("command") PostCommand cmd, Model m, @RequestParam("file") MultipartFile file,HttpSession session,User u){
        Integer postId = (Integer) session.getAttribute("opId");
        if(postId==null){
            
            //save Post task
            String imageName = uploadFile(file);
            Post p = new Post();
            if(imageName!=null){   
                p.setpImage(imageName);
            }
            p.setpTitle(cmd.getpTitle());
            p.setpContent(cmd.getpContent());
            p.setpTag(cmd.getpTag());
            p.setuId((Integer) session.getAttribute("uId"));
            postService.addPost(p);

            if (session.getAttribute("uRole").equals(UserService.ROLE_UNIVERSITY)){
                return "redirect:university/dashboard?act=sv";
            }else if (session.getAttribute("uRole").equals(UserService.ROLE_INDUSTRY)){
                return "redirect:industry/dashboard?act=sv";
            }else if (session.getAttribute("uRole").equals(UserService.ROLE_STUDENT)){
                return "redirect:student/dashboard?act=sv";
            }
            return "redirect:wall";    
        }else{
            //Update post Task
            
            String imageName = uploadFile(file);
            Post p = new Post();
            p.setpId(postId);
            if(imageName!=null){   
                p.setpImage(imageName);
            }
            p.setpTitle(cmd.getpTitle());
            p.setpContent(cmd.getpContent());
            p.setpTag(cmd.getpTag());
            p.setuId((Integer) session.getAttribute("uId"));
            postService.updatePost(p);
            session.removeAttribute("opId");

            if (session.getAttribute("uRole").equals(UserService.ROLE_UNIVERSITY)){
                return "redirect:university/dashboard?act=up";
            }else if (session.getAttribute("uRole").equals(UserService.ROLE_INDUSTRY)){
                return "redirect:industry/dashboard?act=up";
            }else if (session.getAttribute("uRole").equals(UserService.ROLE_STUDENT)){
                return "redirect:student/dashboard?act=up";
            }
            return "redirect:wall";
        }   
    }

    private String uploadFile(MultipartFile file){
        if (!file.isEmpty()){
            try{
                byte[] bytes = file.getBytes();
                //Creating the directory to store file
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "images");
                if(!dir.exists()){
                }dir.mkdirs();                                  
//                 Create the file on server
                String name = String.valueOf(new Date().getTime())+".jpg";
                File serverFile = new File(dir.getAbsolutePath() + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                return name;
            } catch(Exception e){
                
            }
        }else{
            
        }
        return null;
    }
    
    
    @RequestMapping(value = {"/wall"})
    public String postList(Model m, HttpSession session){

        Integer roleID = (Integer) session.getAttribute("uRole");

        m.addAttribute("postList", postService.getPostList(roleID));
        return "wall";
    }
    

    @RequestMapping(value = {"/industry/dashboard"})
    public String industryDashboard(Model m, HttpSession session){
        Integer uId = (Integer) session.getAttribute("uId");
        m.addAttribute("userName", session.getAttribute("uEmail"));
        m.addAttribute("postList", postService.getIPostList(uId));
        return "dashboard_industry";
    }
    
    
    @RequestMapping(value = {"/student/dashboard"})
    public String studentDashboard(Model m, HttpSession session){
        Integer uId = (Integer) session.getAttribute("uId");
        m.addAttribute("userName", session.getAttribute("uEmail"));
        m.addAttribute("postList", postService.getSPostList(uId));
        return "dashboard_student";
    }
    
    
    @RequestMapping(value = {"/university/dashboard"})
    public String universityDashboard(Model m, HttpSession session){
        Integer uId = (Integer) session.getAttribute("uId");
        m.addAttribute("userName", session.getAttribute("uEmail"));
        m.addAttribute("postList", postService.getUPostList(uId));
      
        return "dashboard_university";
    }
    
    @RequestMapping(value = {"/deletePost"})
    public String deletePost(@RequestParam("pId") Integer pId , HttpSession session){
        postService.deletePost(pId);
        
        if (session.getAttribute("uRole").equals(UserService.ROLE_UNIVERSITY)){
            return "redirect:university/dashboard?act=del";
        }else if (session.getAttribute("uRole").equals(UserService.ROLE_INDUSTRY)){
            return "redirect:industry/dashboard?act=del";
        }else if (session.getAttribute("uRole").equals(UserService.ROLE_STUDENT)){
            return "redirect:student/dashboard?act=del";
        }
        return "redirect:wall";
    }
    
    @RequestMapping(value = {"/editPost"})
    public String editPost(Model m, HttpSession session, @RequestParam("pId")Integer pId){        
        session.setAttribute("opId", pId); 
        m.addAttribute("postEdit", postService.findById(pId));
        return "edit_post";
    }    
    
}
