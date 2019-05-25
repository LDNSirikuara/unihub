<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--Guest user-->
<c:if test="${sessionScope.uId==null}">
    <header id="header">
        <div class="container">
            <div class="row align-items-center justify-content-between d-flex">
                <div id="logo">
                        <a href="index"><img src="src/img/logo.png" alt="" title="" /></a>
                </div>
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li><a href="index">Home</a></li>
                        <li><a href="about">About</a></li>
                        <li><a href="login">Login</a></li>
                        <li><a href="signup">SignUp</a></li>
                    </ul>
                </nav><!-- #nav-menu-container -->
            </div>
        </div>
    </header>
</c:if>
    
<!--Admin user-->    
<c:if test="${sessionScope.uId!=null && (sessionScope.uRole == 1 || sessionScope.uRole == 2 || sessionScope.uRole == 3 || sessionScope.uRole == 4)}">
    <header id="header">
        <div class="container">
            <div class="row align-items-center justify-content-between d-flex">
                <div id="logo">
                        <a href="index"><img src="src/img/logo.png" alt="" title="" /></a>
                </div>
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li><a href="index">Home</a></li>
                        <li><a href="about">About</a></li>
                        <li><a href="/uniHub/wall">Wall</a></li>  
                        
                        <c:if test="${sessionScope.uId!=null &&  sessionScope.uRole == 2}">
                            <li><a href="/uniHub/university/dashboard">Profile</a></li>
                        </c:if>
                        <c:if test="${sessionScope.uId!=null &&  sessionScope.uRole == 3}">
                            <li><a href="/uniHub/industry/dashboard">Profile</a></li>
                        </c:if>
                        <c:if test="${sessionScope.uId!=null &&  sessionScope.uRole == 4}">
                            <li><a href="/uniHub/student/dashboard">Profile</a></li>
                        </c:if>
                            
                        <li><a href="/uniHub/logout">Logout</a></li>
                    </ul>
                </nav><!-- #nav-menu-container -->
            </div>
        </div>
    </header>
</c:if>
