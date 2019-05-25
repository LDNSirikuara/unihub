;<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
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
							Login Here
					</h1>
					<p>Login Here First To Experience The Capabilities Of  In Sri Lanka University Industry collaboration.</p>
					<div class="link-nav">
						<span class="box">
							<a href="index.html">Home </a>
							<i class="lnr lnr-arrow-right"></i>
							<a href="login.html">Login Here</a>
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

	<!-- Start login-page Area -->
	<section class="contact-page-area section-gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<form class="form-area contact-form text-right" modelAttribute="command" id="myForm" action="/uniHub/loginn" method="POST">
						<div class="row">
							<div class="col-lg-6 form-group">
									
							</div>
							<div class="col-lg-6 form-group">
									<h3 class="text-heading" style="text-align: left;">Login</h3>
                                                                        
                                                                        <c:if test="${err!=null}">
                                                                            <h6 class="text-danger">${err}</h6>
                                                                        </c:if>
									<div class="mt-10">
										<input type="text" name="uEmail" placeholder="Enter your Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your Email'"
										required class="single-input">
									</div>
									<div class="mt-10">
										<input type="password" name="uPassword" placeholder="Enter your Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your Password'"
										required class="single-input">
									</div>

							</div>
							<div class="col-lg-12">
								<div class="alert-msg" style="text-align: left;"></div>
								<!--<a href="studentprofile.html" class="genric-btn primary circle arrow">Login<span class="lnr lnr-arrow-right"></span></a>--> 
                                                            <button class="genric-btn primary circle arrow">Login</button>
							</div>
	
                                                    
                                                    <script type="text/javascript">
                                                        function validateEmail(){
                                                            var text = document.getElementById("Email").value;
                                                            if ( text === ""){
                                                                document.getElementById("erroremail").innerHTML="";
                                                                document.getElementById("erroremail").style.color="red";
                                                            }
                                                            else {
                                                                document.getElementById("erroremail").innerHTML="";
                                                                document.getElementById("erroremail").style.color="green";
                                                            }
                                                        }
                                                        function validatePassword(){
                                                            var text = document.getElementById(Password).value;
                                                            if(text===""){
                                                                document.getElementById("errorpassword").innerHTML="";
                                                                document.getElementById("errorpassword").style.color="red";
                                                            }
                                                            else {
                                                                document.getElementById("errorepassword").innerHTML="";
                                                                document.getElementById("errorepassword").style.color="green";
                                                            }
                                                        }
                                                        </script>
                                                  
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- End contact-page Area -->

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
