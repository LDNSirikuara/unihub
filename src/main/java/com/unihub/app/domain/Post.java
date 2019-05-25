package com.unihub.app.domain;

/**
 *
 * @author namal
 * -new
 */
public class Post {
    private Integer pId;
    private String pTitle;
    private String pContent;
    private Integer uId;
    private Integer pTag;
    private String pImage;
    private String unName;
    private String iName;
    private String sFname;
    
    public Post() {
    }

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

    public String getUnName() {
        return unName;
    }

    public void setUnName(String unName) {
        this.unName = unName;
    }

    public String getiName() {
        return iName;
    }

    public void setiName(String iName) {
        this.iName = iName;
    }

    public String getsFname() {
        return sFname;
    }

    public void setsFname(String sFname) {
        this.sFname = sFname;
    }





}