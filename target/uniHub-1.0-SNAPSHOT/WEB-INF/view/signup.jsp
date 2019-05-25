<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign up</title>
        <jsp:include page="include/head.jsp"/> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
							Sign Up Here
					</h1>
					<p>Sign Up Here First To Experience The Capabilities Of In Sri Lanka University Industry Collaboration.</p>
					<div class="link-nav">
						<span class="box">
							<a href="index.html">Home </a>
							<i class="lnr lnr-arrow-right"></i>
							<a href="signup.html">Sign Up Here</a>
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

	<!-- Start Signup-page Area -->
	<section class="contact-page-area section-gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
                                    
                                   

<div class="container">
                                                                        
        <c:if test="${err!=null}">
            <h6 class="text-danger">${err}</h6>
        </c:if>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Student</a></li>
    <li><a data-toggle="tab" href="#menu1">University</a></li>
    <li><a data-toggle="tab" href="#menu2">Industry</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
        
        <!--sTUDENT SIGNUP-->
        
        <form class="form-area contact-form text-right" id="myForm" action="signupp?user.uRole=4" method="POST">
            <div class="row">
                <div class="col-lg-2 form-group">

                </div>
                <div class="col-lg-6 form-group">
                    <h3 class="text-heading" style="text-align: left;">Student SignUp</h3>

                    <div class="mt-10">
                        <input type="text" name="user.uFname" placeholder="First Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name'"
                        required class="single-input">
                    </div>	
                    <div class="mt-10">
                        <input type="text" name="user.uLname" placeholder="Last Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Last Name'"
                        required class="single-input">
                    </div>
                    
                    <div class="input-group-icon mt-10">
                        <div class="icon"><i class="fa fa-university" aria-hidden="true"></i></div>
                        <div class="form-select" id="default-select">
                            <select name="user.uniId">
                                    <option value="NSBM">NSBM</option>
                                    <option value="MIT">MIT</option>
                                    <option value="SLLIT">SLLIT</option>
                                    <option value="IDM">IDM</option>
                                    <option value="E-soft">E-soft</option>
                            </select>
                        </div>
                    </div>   
                    
                    <div class="input-group-icon mt-10">
                        <div class="icon"><i class="fa fa-university" aria-hidden="true"></i></div>
                        <div class="form-select" id="default-select">
                            <select name="user.uBatch">
                                    <option value="16.1">16.1</option>
                                    <option value="16.2">16.2</option>
                                    <option value="17.1">17.1</option>
                                    <option value="17.2">17.2</option>
                                    <option value="18.1">18.1</option>
                                    <option value="18.2">18.2</option>
                                    <option value="19.1">19.1</option>
                                    <option value="19.2">19.2</option>
                            </select>
                        </div>
                    </div> 
                    
                    <div class="mt-10">
                        <textarea class="single-textarea" name="user.uAbout" placeholder="About you!" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Message'"
                         required></textarea>
                    </div>
                    
                    <div class="mt-10">
                        <input type="text" name="user.uEmail" placeholder="Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email'"
                        required class="single-input">
                    </div>
                    <div class="mt-10">
                        <input type="password" name="user.uPassword" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'"
                        required class="single-input">
                    </div>
                    
                </div>
            </div>

            <div class="col-lg-8">
                    <div class="alert-msg" style="text-align: left;"></div>
                    <button  class="genric-btn primary circle arrow">Sign Up<span class="lnr lnr-arrow-right"></span></button>
            </div>
        </form>
    </div>
      
    <div id="menu1" class="tab-pane fade">
        
        <!--uNIVERCITY SIGNUP-->
        
        <form class="form-area contact-form text-right" id="myForm" action="signupp?user.uRole=2" method="POST">
            <div class="row">
                <div class="col-lg-2 form-group">

                </div>
                <div class="col-lg-6 form-group">
                    <h3 class="text-heading" style="text-align: left;">University SignUp</h3>

                    <div class="mt-10">
                        <input type="text" name="user.uName" placeholder="University Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'University Name'"
                        required class="single-input">
                    </div>	
                    <div class="mt-10">
                        <input type="text" name="user.uAddress" placeholder="Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Last Name'"
                        required class="single-input">
                    </div>
                    <div class="mt-10">
                        <input type="text" name="user.uPhone" placeholder="Contact No" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Last Name'"
                        required class="single-input">
                    </div>
                    
                    
                    
                    <div class="mt-10">
                        <textarea class="single-textarea" name="user.uAbout" placeholder="About!" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Message'"
                         required></textarea>
                    </div>
                    
                    <div class="mt-10">
                        <input type="text" name="user.uEmail" placeholder="Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'University Name'"
                        required class="single-input">
                    </div>
                    <div class="mt-10">
                        <input type="password" name="user.uPassword" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Faculty'"
                        required class="single-input">
                    </div>
                    
                </div>
            </div>

            <div class="col-lg-8">
                    <div class="alert-msg" style="text-align: left;"></div>
                    <button  class="genric-btn primary circle arrow">Sign Up<span class="lnr lnr-arrow-right"></span></button>
            </div>
        </form>
    </div>
    <div id="menu2" class="tab-pane fade">
      
        <!--iNDUSTRY SIGNUP-->
        
        <form class="form-area contact-form text-right" id="myForm" action="signupp?user.uRole=3" method="POST">
            <div class="row">
                <div class="col-lg-2 form-group">

                </div>
                <div class="col-lg-6 form-group">
                    <h3 class="text-heading" style="text-align: left;">Industry SignUp</h3>

                    <div class="mt-10">
                        <input type="text" name="user.uName" placeholder="Company Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name'"
                        required class="single-input">
                    </div>	
                    <div class="mt-10">
                        <input type="text" name="user.uAddress" placeholder="Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Last Name'"
                        required class="single-input">
                    </div>
                    <div class="mt-10">
                        <input type="text" name="user.uPhone" placeholder="Contact No" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Last Name'"
                        required class="single-input">
                    </div>
                    
                    
                    
                    <div class="mt-10">
                        <textarea class="single-textarea" name="user.uAbout" placeholder="About!" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Message'"
                         required></textarea>
                    </div>
                    
                    <div class="mt-10">
                        <input type="text" name="user.uEmail" placeholder="Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'University Name'"
                        required class="single-input">
                    </div>
                    <div class="mt-10">
                        <input type="password" name="user.uPassword" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Faculty'"
                        required class="single-input">
                    </div>
                    
                </div>
            </div>

            <div class="col-lg-8">
                    <div class="alert-msg" style="text-align: left;"></div>
                    <button  class="genric-btn primary circle arrow">Sign Up<span class="lnr lnr-arrow-right"></span></button>
            </div>
                    
                </div>
            </div>
        </form>
        
    </div>
  </div>
</div>

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
