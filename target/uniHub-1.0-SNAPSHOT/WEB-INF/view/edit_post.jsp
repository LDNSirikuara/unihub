<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--Guest user-->
<c:if test="${sessionScope.uId==null}">
    <div class="col-lg-6 form-group">
        <p class="text-heading" style="text-align: center;">Sorry</p>
        <h1 class="text-heading" style="text-align: center;">Unauthorized Page</h1>
    </div>
					
</c:if>
    
<!--University user-->    
<c:if test="${sessionScope.uId!=null && sessionScope.uRole == 2 || sessionScope.uRole == 3 || sessionScope.uRole == 4}">

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <title>Dashboard</title>
            <jsp:include page="include/head.jsp"/>  
        </head>
        <body>

            <!-- Start Header Area -->
            <jsp:include page="include/header.jsp"/>
            <!-- End Header Area -->


            <!-- Start Banner Area -->
            <section class="banner-area relative">
                    <div class="container">
                            <div class="row d-flex align-items-center justify-content-center">
                                    <div class="about-content col-lg-12">
                                            <h1 class="text-white">
                                                    University Profile
                                            </h1>
                                            <p>we make the collabertation universities and industries <br> on the Web</p>
                                            <div class="link-nav">
                                                    <span class="box">
                                                            <a href="index.html">Home </a>
                                                            <i class="lnr lnr-arrow-right"></i>
                                                            <a href="universityprofile.html">university profile</a>
                                                    </span>
                                            </div>
                                    </div>
                            </div>
                    </div>
                    <div class="rocket-img">
                            <img src="src/img/rocket.png" alt="">
                    </div>
            </section>
            <!-- End Banner Area -->

            <!-- Start top-category-widget Area -->
            <section class="top-category-widget-area pt-90 pb-90 ">
                    <div class="container">
                            <div class="row">
                                    <div class="col-lg-4">
                                            <div class="single-cat-widget">
                                                    <div class="content relative">
                                                            <div class="overlay overlay-bg"></div>
                                                            <a href="#" target="_blank">
                                                                    <div class="thumb">
                                                                            <img class="content-image img-fluid d-block mx-auto" src="src/img/blog/cat-widget1.jpg" alt="">
                                                                    </div>
                                                                    <div class="content-details">
                                                                            <h4 class="content-title mx-auto text-uppercase">University life</h4>
                                                                            <span></span>
                                                                            <p>Enjoy your university life together</p>
                                                                    </div>
                                                            </a>
                                                    </div>
                                            </div>
                                    </div>
                                    <div class="col-lg-4">
                                            <div class="single-cat-widget">
                                                    <div class="content relative">
                                                            <div class="overlay overlay-bg"></div>
                                                            <a href="#" target="_blank">
                                                                    <div class="thumb">
                                                                            <img class="content-image img-fluid d-block mx-auto" src="src/img/blog/cat-widget2.jpg" alt="">
                                                                    </div>
                                                                    <div class="content-details">
                                                                            <h4 class="content-title mx-auto text-uppercase">Events</h4>
                                                                            <span></span>
                                                                            <p>build skills personal development</p>
                                                                    </div>
                                                            </a>
                                                    </div>
                                            </div>
                                    </div>
                                    <div class="col-lg-4">
                                            <div class="single-cat-widget">
                                                    <div class="content relative">
                                                            <div class="overlay overlay-bg"></div>
                                                            <a href="calender.html" target="_blank">
                                                                    <div class="thumb">
                                                                            <img class="content-image img-fluid d-block mx-auto" src="src/img/blog/cat-widget2.jpg" alt="">
                                                                    </div>
                                                                    <div class="content-details">
                                                                            <h4 class="content-title mx-auto text-uppercase">Calender</h4>
                                                                            <span></span>
                                                                            <p>click</p>
                                                                    </div>
                                                            </a>
                                                    </div>
                                            </div>
                                    </div>
                            </div>
                    </div>
            </section>
            <!-- End top-category-widget Area -->
            

 
             
            
            <!-- Start post-content Area -->
            <section class="post-content-area">
                    <div class="container">
                            <div class="row">
                                    <div class="col-lg-8 posts-list">

                                        <div class="comment-form">
                                            <h4>Edit post </h4>
                                                <form action="/uniHub/addPost?pTag=1" enctype="multipart/form-data" method="POST" modelAttribute="command">
                                                    <div class="form-group">
                                                        <input type="text" name="pTitle" class="form-control" id="subject" value="${postEdit.pTitle}"  >
                                                    </div>
                                                    <div class="form-group">
                                                            <textarea  name="pContent" class="form-control mb-10" rows="5" name="message" value="" placeholder="Content" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'"
                                                             required="">${postEdit.pContent}</textarea>
                                                    </div>
                                                    <div class="form-group">
                                                            <input type="file" name="file" size="50" class="form-control mb-10" value="${postEdit.pImage}">
                                                    </div>

                                                    <button  class="primary-btn">Upload</button>
                                                </form>
                                        </div>
  




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
                                                            <img src="src/img/blog/university.png" alt="">
                                                            <a href="#"><h4>university profile</h4></a>
                                                            <label><a href="editUniprofile.html">edit profile</a></label><br>

                                                            <label>NSBM green university</label><br>
                                                            <label>
                                                                            Mahenwaththa, Pitipana,
                                                                            Homagama

                                                                            Sri Lanka</label><br>

                                                            <p>

                                                            </p>
                                                            <ul class="social-links">
                                                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-github"></i></a></li>
                                                                    <li><a href="#"><i class="fa fa-behance"></i></a></li>
                                                            </ul>
                                                            <!-- <p>
                                                                    Boot camps have its supporters andit sdetractors. Some people do not understand why you should have to spend money on boot
                                                                    camp when you can get. Boot camps have itssuppor ters andits detractors.
                                                            </p> -->
                                                    </div>
                                                    <div class="single-sidebar-widget popular-post-widget">
                                                            <h4 class="popular-title">Popular Posts</h4>
                                                            <div class="popular-post-list">
                                                                    <div class="single-post-list d-flex flex-row align-items-center">
                                                                            <div class="thumb">
                                                                                    <img class="img-fluid" src="src/img/blog/pp1.jpg" alt="">
                                                                            </div>
                                                                            <div class="details">
                                                                                    <a href="blog-single.html"><h6>Space The Final Frontier</h6></a>
                                                                                    <p>02 Hours ago</p>
                                                                            </div>
                                                                    </div>
                                                                    <div class="single-post-list d-flex flex-row align-items-center">
                                                                            <div class="thumb">
                                                                                    <img class="img-fluid" src="src/img/blog/pp2.jpg" alt="">
                                                                            </div>
                                                                            <div class="details">
                                                                                    <a href="blog-single.html"><h6>The Amazing Hubble</h6></a>
                                                                                    <p>02 Hours ago</p>
                                                                            </div>
                                                                    </div>
                                                                    <div class="single-post-list d-flex flex-row align-items-center">
                                                                            <div class="thumb">
                                                                                    <img class="img-fluid" src="src/img/blog/pp3.jpg" alt="">
                                                                            </div>
                                                                            <div class="details">
                                                                                    <a href="blog-single.html"><h6>Astronomy Or Astrology</h6></a>
                                                                                    <p>02 Hours ago</p>
                                                                            </div>
                                                                    </div>
                                                                    <div class="single-post-list d-flex flex-row align-items-center">
                                                                            <div class="thumb">
                                                                                    <img class="img-fluid" src="src/img/blog/pp4.jpg" alt="">
                                                                            </div>
                                                                            <div class="details">
                                                                                    <a href="blog-single.html"><h6>Asteroids telescope</h6></a>
                                                                                    <p>02 Hours ago</p>
                                                                            </div>
                                                                    </div>
                                                            </div>
                                                    </div>
                                                    <div class="single-sidebar-widget ads-widget">
                                                            <a href="#"><img class="img-fluid" src="src/img/blog/ads_banner.jpg" alt=""></a>
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
                                                    <div class="single-sidebar-widget tag-cloud-widget">
                                                            <h4 class="tagcloud-title">Tag Clouds</h4>
                                                            <ul>
                                                                            <li><a href="">University</a></li>
                                                                            <li><a href="#">University Events</a></li>
                                                                            <li><a href="#">Companies</a></li>
                                                                            <li><a href="research.html">Research Projects</a></li>

                                                            </ul>
                                                    </div>
                                            </div>
                                    </div>
                            </div>
                    </div>
            </section>
            <!-- End post-content Area -->

            <!-- Start Footer Area -->
            <jsp:include page="include/footer.jsp"/>
            <!-- End Footer Area -->

            <!-- ####################### Start Scroll to Top Area ####################### -->
            <div id="back-top">
                    <a title="Go to Top" href="#"></a>
            </div>
            <!-- ####################### End Scroll to Top Area ####################### -->

            <jsp:include page="include/script.jsp"/>  
        </body>
    </html>
</c:if> 
