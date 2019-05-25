<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<!--Guest user-->
<c:if test="${sessionScope.uId==null}">
    <div class="col-lg-6 form-group">
        <p class="text-heading" style="text-align: center;">Sorry</p>
        <h1 class="text-heading" style="text-align: center;">Unauthorized Page</h1>
    </div>
					
</c:if>
    
<!--Student user-->    
<c:if test="${sessionScope.uId!=null && sessionScope.uRole == 4 }">
    
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <title>Dashboard</title>
            <jsp:include page="include/dashboard_head.jsp"/>

        </head>
        <body>


             <!--Start Header Area--> 
            <jsp:include page="include/dashboard_header.jsp"/>
             <!--End Header Area--> 


             <!--Start Banner Area--> 
            <section class="banner-area relative">
                    <div class="container">
                            <div class="row d-flex align-items-center justify-content-center">
                                    <div class="about-content col-lg-12">
                                            <h1 class="text-white">
                                                    Student Profile
                                            </h1>
                                            <p>In the history of modern astronomy, there is probably no one greater leap forward than the building and launch of
                                                    the space telescope.</p>
                                            <div class="link-nav">
                                                    <span class="box">
                                                            <a href="index.html">Home </a>
                                                            <i class="lnr lnr-arrow-right"></i>

                                                            <a href="studentprofile.html">Student Profile</a>
                                                    </span>
                                            </div>
                                    </div>
                            </div>
                    </div>
                    <div class="rocket-img">
                            <img src="../src/img/rocket.png" alt="">
                    </div>
            </section>
             <!--End Banner Area--> 
             
            <!-- notification Area start-->
            <c:if test="${param.act eq'sv'}">   
                <!-- notification -->
                <section class="top-category-widget-area pt-90 pb-90 ">
                        <div class="container">
                                <div class="row">
                                        <div class="col-lg-4">

                                        </div>
                                        <div class="col-lg-4">
                                            <center><h4 style="color: blue;">Post Created Successfully</h4></center>
                                        </div>
                                        <div class="col-lg-4">

                                        </div>
                                </div>
                        </div>
                </section>
                <!-- notification --> 
            </c:if>
                
            <c:if test="${param.act eq'del'}">   
                <!-- notification -->
                <section class="top-category-widget-area pt-90 pb-90 ">
                        <div class="container">
                                <div class="row">
                                        <div class="col-lg-4">

                                        </div>
                                        <div class="col-lg-4">
                                            <center><h4 style="color: red;">Post Deleted Successfully</h4></center>
                                        </div>
                                        <div class="col-lg-4">

                                        </div>
                                </div>
                        </div>
                </section>
                <!-- notification --> 
            </c:if>
                
            <c:if test="${param.act eq'up'}">   
                <!-- notification -->
                <section class="top-category-widget-area pt-90 pb-90 ">
                        <div class="container">
                                <div class="row">
                                        <div class="col-lg-4">

                                        </div>
                                        <div class="col-lg-4">
                                            <center><h4 style="color: red;">Post Updated Successfully</h4></center>
                                        </div>
                                        <div class="col-lg-4">

                                        </div>
                                </div>
                        </div>
                </section>
                <!-- notification --> 
            </c:if>
            <!-- notification Area end-->             

             <!--Start post-content Area--> 
            <section class="post-content-area single-post-area">
                    <div class="container">
                            <div class="row">
                                    <div class="col-lg-8 posts-list">

                                            <div class="comment-form">
                                                    <h4>Upload post</h4>
                                                    <form action="/uniHub/addPost?pTag=4" enctype="multipart/form-data" method="POST">
                                                        <div class="form-group">
                                                                <input type="text" name="pTitle" class="form-control" id="subject" placeholder="Title" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Subject'">
                                                        </div>
                                                        <div class="form-group">
                                                                <textarea  name="pContent" class="form-control mb-10" rows="5" name="message" placeholder="Content" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'"
                                                                 required=""></textarea>
                                                        </div>
                                                        <div class="form-group">
                                                                <input type="file" name="file" size="50" class="form-control mb-10">
                                                        </div>

                                                        <button  class="primary-btn">Upload</button>
                                                    </form>
                                            </div>

                                        
                                        
                                        <!-- Start Post Area -->
                                        <c:forEach var="c" items="${postList}" varStatus="ps">
                                            <section class="about-area section-gap">

                                                    <div class="container">
                                                            <div class="row align-items-center justify-content-center">

                                                                    <div class="col-lg-5 col-md-5 about-left">				
                                                                            <img src="${pageContext.request.contextPath}/image/${c.pImage}" 
                                                                                 width="270px" height="116px"/>
                                                                                 <!--width="555px" height="316px"/>-->
                                                                    </div>
                                                                    <div class="offset-lg-1 col-lg-6 offset-md-0 col-md-12 about-right">
                                                                            <h2>
                                                                                    ${ps.count} . ${c.pTitle}
                                                                            </h2>
                                                                            <div class="wow fadeIn" data-wow-duration="1s">
                                                                                    <p>
                                                                                            ${c.pContent}

                                                                                    </p>


                                                                            </div>

                                                                            <a  class="genric-btn info-border circle">${c.sFname}</a>
                                                                            <c:if test="${c.pTag == 1 }">
                                                                                <a class="genric-btn danger-border circle">Event</a>
                                                                            </c:if>                                                                
                                                                            <c:if test="${c.pTag == 2 }">
                                                                                <a class="genric-btn danger-border circle">Event</a>
                                                                            </c:if>
                                                                            <c:if test="${c.pTag == 3 }">
                                                                                <a class="genric-btn warning-border circle">Research</a>
                                                                            </c:if>
                                                                            <c:if test="${c.pTag == 4}">
                                                                                <a class="genric-btn warning-border circle">Research</a>
                                                                            </c:if>

                                                                            <br>
                                                                                <a class="fas fa-edit" href="/uniHub/editPost?pId=${c.pId}"></a>                                                                    
                                                                                <a class="fas fa-trash-alt" href="/uniHub/deletePost?pId=${c.pId}"></a>

                                                                    </div>

                                                            </div>
                                                    </div>

                                            </section>
                                        </c:forEach>
                                        
                                        
                                        
                                        
 
       
                                    </div>
                                    <div class="col-lg-4 sidebar-widgets">
                                            <div class="widget-wrap">
                                                    <div class="single-sidebar-widget search-widget">
                                                            <form class="search-form" action="#">
                                                                    <input placeholder="Search Posts" name="search" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Posts'">
                                                                    <button type="submit"><i class="fa fa-search"></i></button>
                                                            </form>
                                                    </div>
                                                    <div class="single-sidebar-widget user-info-widget">
                                                            <img src="../src/img/blog/avatar.jpeg" alt="">
                                                            <a href="#"><h4>${userName}</h4></a>
                                                            <label><a href="editProfile.html">edit profile</a></label><br>
<!--                                                            <label>Himashi</label>
                                                            <label>Charuka</label><br>
                                                            <label>NSBM green university</label><br>
                                                            <label>17.2</label>-->

                                                            <ul class="social-links">
                                                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-github"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-behance"></i></a></li>
                                                            </ul>
                                                             <p>
                                                                    Boot camps have its supporters andit sdetractors. Some people do not understand why you should have to spend money on boot
                                                                    camp when you can get. Boot camps have itssuppor ters andits detractors.
                                                            </p> 
                                                    </div>
                                                    <div class="single-sidebar-widget tag-cloud-widget">
                                                            <h4 class="tagcloud-title">Tag Clouds</h4>
                                                            <ul>
                                                                    <li><a href="">University</a></li>
                                                                    <li><a href="#">University Events</a></li>
                                                                    <li><a href="#">Companies</a></li>
                                                                    <li><a href="#">Research Projects</a></li>

                                                            </ul>
                                                    </div>
                                                    <div class="single-sidebar-widget popular-post-widget">
                                                            <h4 class="popular-title">Popular Posts</h4>
                                                            <div class="popular-post-list">
                                                                    <div class="single-post-list d-flex flex-row align-items-center">
                                                                            <div class="thumb">
                                                                                    <img class="img-fluid" src="../src/img/blog/pp1.jpg" alt="">
                                                                            </div>
                                                                            <div class="details">
                                                                                    <a href="blog-single.html"><h6>Space The Final Frontier</h6></a>
                                                                                    <p>02 Hours ago</p>
                                                                            </div>
                                                                    </div>
                                                                    <div class="single-post-list d-flex flex-row align-items-center">
                                                                            <div class="thumb">
                                                                                    <img class="img-fluid" src="../src/img/blog/pp2.jpg" alt="">
                                                                            </div>
                                                                            <div class="details">
                                                                                    <a href="blog-single.html"><h6>The Amazing Hubble</h6></a>
                                                                                    <p>02 Hours ago</p>
                                                                            </div>
                                                                    </div>
                                                                    <div class="single-post-list d-flex flex-row align-items-center">
                                                                            <div class="thumb">
                                                                                    <img class="img-fluid" src="../src/img/blog/pp3.jpg" alt="">
                                                                            </div>
                                                                            <div class="details">
                                                                                    <a href="blog-single.html"><h6>Astronomy Or Astrology</h6></a>
                                                                                    <p>02 Hours ago</p>
                                                                            </div>
                                                                    </div>
                                                                    <div class="single-post-list d-flex flex-row align-items-center">
                                                                            <div class="thumb">
                                                                                    <img class="img-fluid" src="../src/img/blog/pp4.jpg" alt="">
                                                                            </div>
                                                                            <div class="details">
                                                                                    <a href="blog-single.html"><h6>Asteroids telescope</h6></a>
                                                                                    <p>02 Hours ago</p>
                                                                            </div>
                                                                    </div>
                                                            </div>
                                                    </div>
                                                    <div class="single-sidebar-widget ads-widget">
                                                            <a href="#"><img class="img-fluid" src="../src/img/blog/ads_banner.jpg" alt=""></a>
                                                    </div>
                                                    <div class="single-sidebar-widget post-category-widget">
                                                            <h4 class="category-title">Post Catgories</h4>
                                                            <ul class="cat-list">
                                                                    <li>
                                                                            <a href="#" class="d-flex justify-content-between">
                                                                                    <p>University</p>
                                                                                    <p>37</p>
                                                                            </a>
                                                                    </li>
                                                                    <li>
                                                                            <a href="#" class="d-flex justify-content-between">
                                                                                    <p>University Events</p>
                                                                                    <p>24</p>
                                                                            </a>
                                                                    </li>
                                                                    <li>
                                                                            <a href="#" class="d-flex justify-content-between">
                                                                                    <p>Company</p>
                                                                                    <p>59</p>
                                                                            </a>
                                                                    </li>
                                                                    <li>
                                                                            <a href="#" class="d-flex justify-content-between">
                                                                                    <p>Research Projects</p>
                                                                                    <p>29</p>
                                                                            </a>
                                                                    </li>

                                                            </ul>
                                                    </div>
                                                    <div class="single-sidebar-widget newsletter-widget">
                                                            <h4 class="newsletter-title">Newsletter</h4>
                                                            <p>
                                                                    Here, I focus on a range of items and features that we use in life without giving them a second thought.
                                                            </p>
                                                            <div class="form-group d-flex flex-row">
                                                                    <div class="col-autos">
                                                                            <div class="input-group">
                                                                                    <div class="input-group-prepend">
                                                                                            <div class="input-group-text"><i class="fa fa-envelope" aria-hidden="true"></i>
                                                                                            </div>
                                                                                    </div>
                                                                                    <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Enter email" onfocus="this.placeholder = ''"
                                                                                     onblur="this.placeholder = 'Enter email'">
                                                                            </div>
                                                                    </div>
                                                                    <a href="#" class="bbtns">Subcribe</a>
                                                            </div>
                                                            <p class="text-bottom">
                                                                    You can unsubscribe at any time
                                                            </p>
                                                    </div>
                                            </div>
                                    </div>
                            </div>
                    </div>
            </section>
             <!--End post-content Area--> 


             <!--Start Footer Area--> 
            <jsp:include page="include/dashboard_footer.jsp"/>
             <!--End Footer Area--> 

             <!--####################### Start Scroll to Top Area #######################--> 
            <div id="back-top">
                    <a title="Go to Top" href="#"></a>
            </div>
             <!--####################### End Scroll to Top Area #######################--> 

            <jsp:include page="include/dashboard_script.jsp"/>
        </body>
    </html
</c:if>

