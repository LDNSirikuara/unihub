<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--Admin user-->    
<c:if test="${sessionScope.uId!=null && (sessionScope.uRole == 1 || sessionScope.uRole == 2 || sessionScope.uRole == 3 || sessionScope.uRole == 4)}">

<!DOCTYPE html>
<html>
    <head>
        <title>Wall</title>
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
						Wall
					</h1>
                                            <p>The collaboration between universities and the industry is increasingly perceived as a vehicle to enhance innovation through knowledge</p>
                                        </h1>
					<div class="link-nav">
						<span class="box">
							<a href="index.html">Home </a>
							<i class="lnr lnr-arrow-right"></i>
							<a href="about.html">About Us</a>
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


	<!-- Start About Area -->
        <c:forEach var="c" items="${postList}" varStatus="ps">
            <section class="about-area section-gap">

                    <div class="container">
                            <div class="row align-items-center justify-content-center">

                                    <div class="col-lg-5 col-md-6 about-left">				
                                            <img src="${pageContext.request.contextPath}/image/${c.pImage}" 
                                                 width="555px" height="316px"/>
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
                                            <a  class="genric-btn info-border circle">${c.iName}${c.sFname}${c.unName}</a>
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
                                    </div>

                            </div>
                    </div>

            </section>
        </c:forEach>
        
	<!-- End About Area -->


	<!-- Start Footer Area -->
        <jsp:include page="include/footer.jsp"/>
	<!-- End Footer Area -->

	<!-- ####################### Start Scroll to Top Area ####################### -->
	<div id="back-top">
		<a title="Go to Top" href="#"></a>
	</div>
        <!-- Script -->
        <jsp:include page="include/script.jsp"/>
        
    </body>
</html>
</c:if>
