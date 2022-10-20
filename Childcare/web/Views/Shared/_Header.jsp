<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Topbar Start -->
<div class="container-fluid py-2 border-bottom d-none d-lg-block">
    <div class="container">
        <div class="row">
            <div class="col-md-6  text-lg-start mb-2 mb-lg-0">
                <div class="d-inline-flex align-items-center">
                    <a class="text-decoration-none text-body pe-3" href=""><i class="bi bi-telephone me-2"></i> 024 7300 1866</a>
                    <span class="text-body">|</span>
                    <a class="text-decoration-none text-body px-3" href=""><i class="bi bi-envelope me-2"></i>daihocfpt@fpt.edu.vn</a>
                </div>
            </div>
            <div class="col-md-6 text-center text-lg-end">
                <div class="d-inline-flex align-items-center">
                    <a class="text-body px-2" href="https://www.facebook.com/DaihocFPTHaNoi">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-body px-2" href="https://www.linkedin.com/school/fpt-university/">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a class="text-body px-2" href="https://www.instagram.com/fpt_university/">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a class="text-body ps-2" href="https://www.youtube.com/channel/UCLfZhl8uJXAK2wtA4_IbEMA">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Topbar End -->


<!-- Navbar Start -->
<div class="container-fluid sticky-top bg-white shadow-sm">
    <div class="container">
        <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0">
            <a href="index.html" class="navbar-brand">
                <h1 class="m-0 text-uppercase text-primary"><i class="fa fa-clinic-medical me-2"></i>Childcare System</h1>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0">
                    <a href="loadHomePage" class="nav-item nav-link active">Home</a>
                    <a href="loadAbout" class="nav-item nav-link">About</a>
                    <a href="loadDoctor" class="nav-item nav-link">Our Doctors</a>
                    <a href="blog.jsp" class="nav-item nav-link">Blog</a>

                    <c:if test="${sessionScope.UserLogined == null}">
                        <a href="login" class="nav-item nav-link">Login</a>
                    </c:if>

                    <c:if test="${sessionScope.UserLogined != null}">

                        <a class="nav-item nav-link">${sessionScope.UserLogined.name}</a>
                        <div class="btn-group">
                            <button type="img" class="btn btn-infor"> <img src="${sessionScope.UserLogined.getAvatar()}" class="rounded-circle"
                                                                           height="30" alt="Avatar" loading="lazy" /></button>
                            <button type="button" class="btn btn-infor btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>

                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="userProfile">Edit Account</a>
                                <a class="dropdown-item" href="loadChildren">Children's profiles</a>
                                <a class="dropdown-item" href="#">Appointment</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="logout">Logout</a>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </nav>
    </div>
</div>
<!-- Navbar End -->
