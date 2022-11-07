<%-- 
    Document   : doctor-scheduling
    Created on : Oct 20, 2022, 3:32:46 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Childcare System</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
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
    </head>

    <body>
        <c:set var="context" value="${pageContext.request.contextPath}" />  
        <jsp:include page="Shared/_Header.jsp"/>
        <!-- Hero Start -->
        <div class="container-fluid bg-primary py-5 mb-5 hero-header">
            <div class="container py-5">
                <div class="row justify-content-start">
                    <div class="col-lg-8 text-center text-lg-start">
                        <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5" style="border-color: rgba(256, 256, 256, .3) !important;">Welcome To ChildCare System</h5>
                        <h1 class="display-1 text-white mb-md-4">Best Healthcare Solution In Your City</h1>
                        <div class="pt-2">
                            <a href="chooseDepartment" class="btn btn-outline-light rounded-pill py-md-3 px-md-5 mx-2">Appointment</a>
                            <a href="" class="btn btn-outline-light rounded-pill py-md-3 px-md-5 mx-2">Chat with Doctor</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->
        
         <!-- Blog Start -->
        <div class="container-fluid py-5">
            <div class="container">
                <div class="text-center mx-auto mb-5" style="max-width: 500px;">
                    <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5">Blog Post</h5>
                    <h1 class="display-4">Our Latest Medical Blog Posts</h1>
                </div>
                <div class="row g-5">
                    <div class="col-xl-4 col-lg-6">
                        <div class="bg-light rounded overflow-hidden">
                            <img class="img-fluid w-100" src="img/blog-1.jpg" alt="">
                            <div class="p-4">
                                <a class="h3 d-block mb-3" href="">Dolor clita vero elitr sea stet dolor justo  diam</a>
                                <p class="m-0">Dolor lorem eos dolor duo et eirmod sea. Dolor sit magna
                                    rebum clita rebum dolor stet amet justo</p>
                            </div>
                            <div class="d-flex justify-content-between border-top p-4">
                                <div class="d-flex align-items-center">
                                    <img class="rounded-circle me-2" src="img/user.jpg" width="25" height="25" alt="">
                                    <small>John Doe</small>
                                </div>
                                <div class="d-flex align-items-center">
                                    <small class="ms-3"><i class="far fa-eye text-primary me-1"></i>12345</small>
                                    <small class="ms-3"><i class="far fa-comment text-primary me-1"></i>123</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6">
                        <div class="bg-light rounded overflow-hidden">
                            <img class="img-fluid w-100" src="img/blog-2.jpg" alt="">
                            <div class="p-4">
                                <a class="h3 d-block mb-3" href="">Dolor clita vero elitr sea stet dolor justo  diam</a>
                                <p class="m-0">Dolor lorem eos dolor duo et eirmod sea. Dolor sit magna
                                    rebum clita rebum dolor stet amet justo</p>
                            </div>
                            <div class="d-flex justify-content-between border-top p-4">
                                <div class="d-flex align-items-center">
                                    <img class="rounded-circle me-2" src="img/user.jpg" width="25" height="25" alt="">
                                    <small>John Doe</small>
                                </div>
                                <div class="d-flex align-items-center">
                                    <small class="ms-3"><i class="far fa-eye text-primary me-1"></i>12345</small>
                                    <small class="ms-3"><i class="far fa-comment text-primary me-1"></i>123</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6">
                        <div class="bg-light rounded overflow-hidden">
                            <img class="img-fluid w-100" src="img/blog-3.jpg" alt="">
                            <div class="p-4">
                                <a class="h3 d-block mb-3" href="">Dolor clita vero elitr sea stet dolor justo  diam</a>
                                <p class="m-0">Dolor lorem eos dolor duo et eirmod sea. Dolor sit magna
                                    rebum clita rebum dolor stet amet justo</p>
                            </div>
                            <div class="d-flex justify-content-between border-top p-4">
                                <div class="d-flex align-items-center">
                                    <img class="rounded-circle me-2" src="img/user.jpg" width="25" height="25" alt="">
                                    <small>John Doe</small>
                                </div>
                                <div class="d-flex align-items-center">
                                    <small class="ms-3"><i class="far fa-eye text-primary me-1"></i>12345</small>
                                    <small class="ms-3"><i class="far fa-comment text-primary me-1"></i>123</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Blog End -->

        <!-- Team Start -->
        <div class="container-fluid py-5">
            <div class="container">
                <div class="text-center mx-auto mb-5" style="max-width: 500px;">
                    <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5">Our Doctors</h5>
                    <h1 class="display-4">Qualified Healthcare Professionals</h1>
                </div>
                <div>
                    <c:forEach items="${requestScope.doctors}" var="d">
                        <div class="team-item">
                            <div class="row g-0 bg-light rounded overflow-hidden">
                                <div class="col-12 col-sm-5 h-100">
                                    <img class="img-fluid h-100" src="${d.user.avatar}" style="object-fit: cover;">
                                </div>
                                <div class="col-12 col-sm-7 h-100 d-flex flex-column">
                                    <div class="mt-auto p-4">
                                        <h3><a href="loadDoctorDetail?id=${d.doctorId}">${d.user.name}</a></h3>
                                        <h6 class="fw-normal fst-italic text-primary mb-4">${d.title}</h6>
                                        <p class="m-0">${d.description}</p>
                                    </div>
                                    <div class="d-flex mt-auto border-top p-4">
                                        <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-3" href="#"><i class="fab fa-twitter"></i></a>
                                        <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-3" href="#"><i class="fab fa-facebook-f"></i></a>
                                        <a class="btn btn-lg btn-primary btn-lg-square rounded-circle" href="#"><i class="fab fa-linkedin-in"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                    </c:forEach>    
                </div>
            </div>
        </div>
        <!-- Team End -->


        <!-- Testimonial Start -->
        <div class="container-fluid py-5">
            <div class="container">
                <div class="text-center mx-auto mb-5" style="max-width: 500px;">
                    <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5">Feedback</h5>
                    <h1 class="display-4">Patients Say About Our Services</h1>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div>
                            <c:forEach items="${requestScope.feedbacks}" var="f">
                                <div class="testimonial-item text-center">
                                    <div class="position-relative mb-5">
                                        <img style="width: 160px; height: 160px;" class="img-fluid rounded-circle mx-auto" src="${f.user.avatar}" alt="">
                                        <div class="position-absolute top-100 start-50 translate-middle d-flex align-items-center justify-content-center bg-white rounded-circle" style="width: 60px; height: 60px;">
                                            <i class="fa fa-quote-left fa-2x text-primary"></i>
                                        </div>
                                    </div>
                                    <p class="fs-4 fw-normal">${f.description}</p>
                                    <hr class="w-25 mx-auto">
                                    <h3>${f.user.name}</h3>
                                    <!--<h6 class="fw-normal text-primary mb-3">Profession</h6>-->
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->


        <!-- Footer Start -->
        <jsp:include page="Shared/_Footer.jsp"/>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <script src="js/main.js"></script>
    </body>

</html>
