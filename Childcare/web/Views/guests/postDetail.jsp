<%-- 
    Document   : postDetail
    Created on : Oct 5, 2022, 9:38:48 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>MEDINOVA - Hospital Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">  

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <!--Font awesome-->
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <style>
            img {
                width: 100%;
            }

            .entry-post_info {
                padding-bottom: 0.5rem;
                margin-bottom: 1rem;
                border-bottom: 1px dashed #ddd;
                justify-content: flex-start;
            }
            body {
                color: #5d6573;
            }
            .entry-cat a:hover {
                color: var(--main-color-1);
            }
            .entry-cat a {
                background-color: #eee;
                color: #555;
                display: inline-block;
                padding: 4px 8px;
                margin-right: 4px;
                margin-top: 4px;
                border-radius: 3px;
            }
        </style>

        <!-- Topbar Start -->
        <div class="container-fluid py-2 border-bottom d-none d-lg-block">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-lg-start mb-2 mb-lg-0">
                        <div class="d-inline-flex align-items-center">
                            <a class="text-decoration-none text-body pe-3" href=""><i class="bi bi-telephone me-2"></i>+012 345 6789</a>
                            <span class="text-body">|</span>
                            <a class="text-decoration-none text-body px-3" href=""><i class="bi bi-envelope me-2"></i>info@example.com</a>
                        </div>
                    </div>
                    <div class="col-md-6 text-center text-lg-end">
                        <div class="d-inline-flex align-items-center">
                            <a class="text-body px-2" href="">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a class="text-body px-2" href="">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a class="text-body px-2" href="">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                            <a class="text-body px-2" href="">
                                <i class="fab fa-instagram"></i>
                            </a>
                            <a class="text-body ps-2" href="">
                                <i class="fab fa-youtube"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid sticky-top bg-white shadow-sm mb-5">
            <div class="container">
                <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0">
                    <a href="index.html" class="navbar-brand">
                        <h1 class="m-0 text-uppercase text-primary"><i class="fa fa-clinic-medical me-2"></i>Medinova</h1>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <div class="navbar-nav ms-auto py-0">
                            <a href="index.html" class="nav-item nav-link">Home</a>
                            <a href="about.html" class="nav-item nav-link">About</a>
                            <a href="service.html" class="nav-item nav-link">Service</a>
                            <a href="price.html" class="nav-item nav-link">Pricing</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu m-0">
                                    <a href="blog.html" class="dropdown-item">Blog Grid</a>
                                    <a href="detail.html" class="dropdown-item active">Blog Detail</a>
                                    <a href="team.html" class="dropdown-item">The Team</a>
                                    <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                                    <a href="appointment.html" class="dropdown-item">Appointment</a>
                                    <a href="search.html" class="dropdown-item">Search</a>
                                </div>
                            </div>
                            <a href="contact.html" class="nav-item nav-link">Contact</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->

        <c:set var="post" value="${requestScope.postDetail}"/>
        <!--BreadCrum-->
        <div class="container-fluid fs-6">
            <div class="container">

                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">
                        <a href="chuyen-muc?cid=${requestScope.cid}">
                            <c:forEach items="${requestScope.categoryList}" var="c">
                                <c:if test="${c.cateId == requestScope.cid}">${c.cateName}</c:if>
                            </c:forEach>
                        </a>
                        <c:if test="${requestScope.cid == -1}">Bài viết
                        </c:if>
                    </li>
                    <li class="breadcrumb-item">${post.title}</li>
                </ol>
            </div>
        </div>

        <!-- Blog Start -->
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-8">
                    <!-- Blog Detail Start -->
                    <div class="mb-5">
                        <!--<img class="img-fluid w-100 rounded mb-5" src="${pageContext.request.contextPath}/img/${post.image}" alt="">-->
                        <h1 class="mb-4">${post.title}</h1>

                        <div class="entry-post_info">
                            <span><i class="fa-regular fa-clock"></i> <fmt:formatDate pattern="dd/MM/yyyy" value="${post.createdAt}"></fmt:formatDate>
                                </span>
                                <!-- <span><i class="fa fa-eye"></i> 35.105 lượt xem</span> -->
                            </div>

                            <p>${post.detail}</p>

                        <!--                        <div class="d-flex justify-content-between bg-light rounded p-4 mt-4 mb-4">
                                                    <div class="d-flex align-items-center">
                                                        <img class="rounded-circle me-2" src="img/user.jpg" width="40" height="40" alt="">
                                                        <span>John Doe</span>
                                                    </div>
                                                    <div class="d-flex align-items-center">
                                                        <span class="ms-3"><i class="far fa-eye text-primary me-1"></i>12345</span>
                                                        <span class="ms-3"><i class="far fa-comment text-primary me-1"></i>123</span>
                                                    </div>
                                                </div>-->
                        <div class="entry-cat">
                            <span><i class="fa-regular fa-tag"></i> Chuyên mục: </span>
                            <a href="chuyen-muc?cid=${requestScope.cid}">
                                <c:forEach items="${requestScope.categoryList}" var="c">
                                    <c:if test="${c.cateId == requestScope.cid}">${c.cateName}</c:if>
                                </c:forEach>
                            </a>
                        </div>                    
                    </div>
                    <!-- Blog Detail End -->

                </div>

                <!-- Sidebar Start -->
                <jsp:include page="_Sidebar.jsp"></jsp:include>

                </div>
            </div>
            <!-- Blog End -->


            <!-- Footer Start -->
            <div class="container-fluid bg-dark text-light mt-5 py-5">
                <div class="container py-5">
                    <div class="row g-5">
                        <div class="col-lg-3 col-md-6">
                            <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 border-secondary mb-4">Get In Touch</h4>
                            <p class="mb-4">No dolore ipsum accusam no lorem. Invidunt sed clita kasd clita et et dolor sed dolor</p>
                            <p class="mb-2"><i class="fa fa-map-marker-alt text-primary me-3"></i>123 Street, New York, USA</p>
                            <p class="mb-2"><i class="fa fa-envelope text-primary me-3"></i>info@example.com</p>
                            <p class="mb-0"><i class="fa fa-phone-alt text-primary me-3"></i>+012 345 67890</p>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 border-secondary mb-4">Quick Links</h4>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Home</a>
                                <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>About Us</a>
                                <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Our Services</a>
                                <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Meet The Team</a>
                                <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Latest Blog</a>
                                <a class="text-light" href="#"><i class="fa fa-angle-right me-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 border-secondary mb-4">Popular Links</h4>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Home</a>
                                <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>About Us</a>
                                <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Our Services</a>
                                <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Meet The Team</a>
                                <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Latest Blog</a>
                                <a class="text-light" href="#"><i class="fa fa-angle-right me-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 border-secondary mb-4">Newsletter</h4>
                            <form action="">
                                <div class="input-group">
                                    <input type="text" class="form-control p-3 border-0" placeholder="Your Email Address">
                                    <button class="btn btn-primary">Sign Up</button>
                                </div>
                            </form>
                            <h6 class="text-primary text-uppercase mt-4 mb-3">Follow Us</h6>
                            <div class="d-flex">
                                <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-2" href="#"><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-2" href="#"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square rounded-circle" href="#"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid bg-dark text-light border-top border-secondary py-4">
                <div class="container">
                    <div class="row g-5">
                        <div class="col-md-6 text-center text-md-start">
                            <p class="mb-md-0">&copy; <a class="text-primary" href="#">Your Site Name</a>. All Rights Reserved.</p>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <p class="mb-0">Designed by <a class="text-primary" href="https://htmlcodex.com">HTML Codex</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}lib/easing/easing.min.js"></script>
        <script src="${pageContext.request.contextPath}lib/waypoints/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}lib/tempusdominus/js/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="${pageContext.request.contextPath}lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
