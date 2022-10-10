<%-- 
    Document   : postList
    Created on : Oct 4, 2022, 8:15:19 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    </head>

    <body>
        <!-- Header Start -->
        <jsp:include page="../Shared/_Header.jsp"/>
        <!-- Header End -->

        <!--BreadCrum-->
        <div class="container-fluid fs-5">
            <div class="container">

                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="./">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">
                        <c:forEach items="${requestScope.categoryList}" var="c">
                            <c:if test="${c.cateId == requestScope.cid}">${c.cateName}</c:if>
                        </c:forEach>
                        <c:if test="${requestScope.cid == -1}">Bài viết
                        </c:if>
                    </li>
                </ol>

            </div>
        </div>
        <div style="height: 1px; background-color: gray; max-width: 1200px; margin-left: 110px"></div>

        <!-- Blog Start -->
        <style>
            .bg-light {
                background-color: #fbfbfb !important;
            }
        </style>
        <div class="container-fluid py-5">
            <div class="container">
                <div class="text-center mx-auto mb-5" style="max-width: 500px;">
                    <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5">Bài viết mới nhất</h4>
                </div>
                <div class="row g-5">

                    <div class="col-xl-4 col-lg-6">
                        <div class="bg-light rounded overflow-hidden">
                            <img class="img-fluid w-100" src="${pageContext.request.contextPath}/img/blog-2.jpg" alt="">
                            <div class="p-4">
                                <a class="h3 d-block mb-3" href="">Dolor clita vero elitr sea stet dolor justo  diam</a>
                                <p class="m-0">Dolor lorem eos dolor duo et eirmod sea. Dolor sit magna
                                    rebum clita rebum dolor stet amet justo</p>
                            </div>
                        </div>
                    </div>
                    <c:forEach items="${requestScope.postList}" var="post">
                        <div class="col-xl-4 col-lg-6">
                            <div class="bg-light rounded overflow-hidden">
                                <img class="img-fluid w-100" src="${pageContext.request.contextPath}/img/${post.image}" alt="">
                                <div class="p-4">
                                    <a class="h3 d-block mb-3" href="${pageContext.request.contextPath}/bai-viet?id=${post.postId}">${post.title}</a>
                                    <input type="hidden" name="postid" value="${post.postId}">
                                    <p class="m-0">${post.description}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>   
                    <div class="col-12 text-center">
                        <button class="btn btn-primary py-3 px-5">Load More</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Blog End -->


        <!-- Footer Start -->
        <jsp:include page="../Shared/_Footer.jsp"/>
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
