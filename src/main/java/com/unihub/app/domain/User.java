package com.unihub.app.domain;

/**
 *
 * @author namal
 * -new
 */
public class User {
    private Integer uId;
    private String uName;
    private String uPhone;
    private String uEmail;
    private String uAddress;
    private String uFname;
    private String uLname;
    private String uPassword;
    private Integer uRole;
    private Integer uLoginStatus;
    private String uPic;
    private String uAbout;
    private String uBatch;
    private String uniId;
    
    public User() {
    }


    public String getUniId() {
        return uniId;
    }

    public void setUniId(String uniId) {
        this.uniId = uniId;
    }
    
    public String getuPic() {
        return uPic;
    }

    public void setuPic(String uPic) {
        this.uPic = uPic;
    }

    public String getuAbout() {
        return uAbout;
    }

    public void setuAbout(String uAbout) {
        this.uAbout = uAbout;
    }

    public String getuBatch() {
        return uBatch;
    }


    public void setuBatch(String uBatch) {
        this.uBatch = uBatch;
    }



    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPhone() {
        return uPhone;
    }

    public void setuPhone(String uPhone) {
        this.uPhone = uPhone;
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail;
    }

    public String getuAddress() {
        return uAddress;
    }

    public void setuAddress(String uAddress) {
        this.uAddress = uAddress;
    }

    public String getuFname() {
        return uFname;
    }

    public void setuFname(String uFname) {
        this.uFname = uFname;
    }

    public String getuLname() {
        return uLname;
    }

    public void setuLname(String uLname) {
        this.uLname = uLname;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    public Integer getuRole() {
        return uRole;
    }

    public void setuRole(Integer uRole) {
        this.uRole = uRole;
    }

    public Integer getuLoginStatus() {
        return uLoginStatus;
    }

    public void setuLoginStatus(Integer uLoginStatus) {
        this.uLoginStatus = uLoginStatus;
    }
    
    
}
