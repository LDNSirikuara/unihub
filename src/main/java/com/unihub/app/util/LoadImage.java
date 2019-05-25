package com.unihub.app.util;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author namal
 */
@WebServlet(urlPatterns = "/image/*")
public class LoadImage extends HttpServlet {
    
    private String imagePath;

    @Override
    public void init() throws ServletException {
        imagePath = System.getProperty("catalina.home") + File.separator + "images";
    }
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        //Get requested image by path info.
        String requestedImage = request.getPathInfo();
      
        //Check if file name is actually supplide to the request URI.
        if (requestedImage == null){
            //do your thing if image is not suppkide to the request URI.
            //Throw an exceptin or send 404, or show default/warning image, or jest ignore it.
            response.sendError(HttpServletResponse.SC_NOT_FOUND); //404
            return;
        }
        
        if (requestedImage.equals("/")){         
            requestedImage = "default.jpg";                     
            //Decode the file name (might contain spaces and on) and prepare file object.
            File image = new File(imagePath, URLDecoder.decode(requestedImage,"UTF-8"));
            //check if file actually existe if filesystem.
            if(!image.exists()){
                //do your thing if image is not suppkide to the request URI.
                //Throw an exceptin or send 404, or show default/warning image, or jest ignore it.
                response.sendError(HttpServletResponse.SC_NOT_FOUND); //404
                return;
            }

            //Get content type by filename.
            String contentType = getServletContext().getMimeType(image.getName());
            //Check id file is actually an image(avoid download of other file by hackers!).
            //For all content type. see :
            if(contentType == null || !contentType.startsWith("image")){
                //do your thing if image is not suppkide to the request URI.
                //Throw an exceptin or send 404, or show default/warning image, or jest ignore it.
                response.sendError(HttpServletResponse.SC_NOT_FOUND); //404
                return;            
            }
            response.reset();
            response.setContentType(contentType);
            response.setHeader("Content-Length", String.valueOf(image.length()));

            //Write image content to response.
            Files.copy(image.toPath(), response.getOutputStream());
        }
        
        //Decode the file name (might contain spaces and on) and prepare file object.
        File image = new File(imagePath, URLDecoder.decode(requestedImage,"UTF-8"));
        //check if file actually existe if filesystem.
        if(!image.exists()){
            //do your thing if image is not suppkide to the request URI.
            //Throw an exceptin or send 404, or show default/warning image, or jest ignore it.
            response.sendError(HttpServletResponse.SC_NOT_FOUND); //404
            return;
        }
        
        //Get content type by filename.
        String contentType = getServletContext().getMimeType(image.getName());
        //Check id file is actually an image(avoid download of other file by hackers!).
        //For all content type. see :
        if(contentType == null || !contentType.startsWith("image")){
            //do your thing if image is not suppkide to the request URI.
            //Throw an exceptin or send 404, or show default/warning image, or jest ignore it.
            response.sendError(HttpServletResponse.SC_NOT_FOUND); //404
            return;            
        }      

        response.reset();
        response.setContentType(contentType);
        response.setHeader("Content-Length", String.valueOf(image.length()));
        
        //Write image content to response.
        Files.copy(image.toPath(), response.getOutputStream());
    }
}
