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
                background-color: #fbfbfb;
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

        <!-- Header Start -->
        <jsp:include page="../Shared/_Header.jsp"/>
        <!-- Header End -->

        <c:set var="post" value="${requestScope.postDetail}"/>

        <!--BreadCrum-->
        <div class="container-fluid fs-6 mt-5">
            <div class="container">

                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="./">Trang chủ</a></li>
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
            <div class="row g-5" style="margin-left: 50px">
                <div class="col-lg-8 p-4" style="background: white;">
                    <!-- Blog Detail Start -->
                    <div class="mb-5">
                        <!--<img class="img-fluid w-100 rounded mb-5" src="${pageContext.request.contextPath}/img/${post.image}" alt="">-->
                        <h1 class="mb-4">${post.title}</h1>

                        <div class="entry-post_info">
                            <span><i class="fa-regular fa-clock"></i> <fmt:formatDate pattern="dd/MM/yyyy" value="${post.createdAt}"></fmt:formatDate>
                                </span>
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
