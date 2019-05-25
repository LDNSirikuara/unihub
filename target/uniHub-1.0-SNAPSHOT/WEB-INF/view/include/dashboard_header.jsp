<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--Guest user-->
<c:if test="${sessionScope.uId==null}">
    <h1>Can't visit</h1>
</c:if>
    
<!--Admin user-->    
<c:if test="${sessionScope.uId!=null && (sessionScope.uRole == 1 || sessionScope.uRole == 2 || sessionScope.uRole == 3 || sessionScope.uRole == 4)}">
    <header id="header">
        <div class="container">
            <div class="row align-items-center justify-content-between d-flex">
                <div id="logo">
                        <a href="index.html"><img src="../src/img/logo.png" alt="" title="" /></a>
                </div>
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li><a href="/uniHub/index">Home</a></li>
                        <li><a href="/uniHub/about">About</a></li>
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

<!--University user-->    
<%--<c:if test="${sessionScope.uId!=null && sessionScope.uRole == 2}">
    <header id="header">
        <div class="container">
            <div class="row align-items-center justify-content-between d-flex">
                <div id="logo">
                        <a href="index.html"><img src="../src/img/logo.png" alt="" title="" /></a>
                </div>
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="about.html">About</a></li>
                        <li class="menu-has-children menu-active"><a href="courses.html">Course</a>
                            <ul>
                                <li><a href="university.html">University</a></li>
                                <li><a href="company.html">Industry</a></li>
                             </ul>
                        </li>
      
                        <li><a href="about.html">Logout</a></li>
                    </ul>
                </nav><!-- #nav-menu-container -->
            </div>
        </div>
    </header>
</c:if>

<!--Industry user-->    
<c:if test="${sessionScope.uId!=null && sessionScope.uRole == 3}">
    <header id="header">
        <div class="container">
            <div class="row align-items-center justify-content-between d-flex">
                <div id="logo">
                        <a href="index.html"><img src="../src/img/logo.png" alt="" title="" /></a>
                </div>
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="about.html">About</a></li>
                        <li class="menu-has-children menu-active"><a href="courses.html">Course</a>
                            <ul>
                                <li><a href="university.html">University</a></li>
                                <li><a href="company.html">Industry</a></li>
                             </ul>
                        </li>
      
                        <li><a href="about.html">Logout</a></li>
                    </ul>
                </nav><!-- #nav-menu-container -->
            </div>
        </div>
    </header>
</c:if>

<!--Student user-->    
<c:if test="${sessionScope.uId!=null && sessionScope.uRole == 4}">
    <header id="header">
        <div class="container">
            <div class="row align-items-center justify-content-between d-flex">
                <div id="logo">
                        <a href="index.html"><img src="../src/img/logo.png" alt="" title="" /></a>
                </div>
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="about.html">About</a></li>
                        <li class="menu-has-children menu-active"><a href="courses.html">Course</a>
                            <ul>
                                <li><a href="university.html">University</a></li>
                                <li><a href="company.html">Industry</a></li>
                             </ul>
                        </li>
      
                        <li><a href="about.html">Logout</a></li>
                    </ul>
                </nav><!-- #nav-menu-container -->
            </div>
        </div>
    </header>
</c:if>--%>