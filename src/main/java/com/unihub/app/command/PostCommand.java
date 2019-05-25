package com.unihub.app.command;

import com.unihub.app.domain.Post;

/**
 *
 * @author namal
 */
public class PostCommand {
    private Integer pId;
    private String pTitle;
    private String pContent;
    private Integer uId;
    private Integer pTag;
    private String pImage;
    private String uName;

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getpTag() {
        return pTag;
    }

    public void setpTag(Integer pTag) {
        this.pTag = pTag;
    }

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    
}
