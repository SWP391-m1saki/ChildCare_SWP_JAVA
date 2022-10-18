<%-- 
    Document   : postDetail
    Created on : Oct 5, 2022, 9:38:48 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Chuyên mục</title>
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
        <style>
            img {
                width: 100%;
            }

            .post-description {
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 3; /* number of lines to show */
                line-height: 1.5em;        /* fallback */
                max-height: 4.5em; 
                color: #464646;
            }

            .post-title {
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2; /* number of lines to show */
                line-height: 1.5em;        /* fallback */
                max-height: 3em;       /* fallback */
            }

        </style>

        <jsp:include page="../Shared/_Header.jsp"/>

        <!--BreadCrum-->
        <div class="container-fluid fs-5">
            <div class="container">

                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
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


        <!-- Blog Start -->
        <div class="container py-5">
            <div class="row g-5" style="margin-left: 70px">
                <div class="col-lg-8">
                    <div class="text-center mx-auto mb-5">
                        <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5">Bài viết mới nhất</h4>
                    </div>
                    <div class="row g-5 pb-3" style="background: #f6f6f685;" id="post-list">
                        <c:forEach items="${requestScope.postList}" var="post">
                            <div class="post col-xl-6 col-lg-6" >
                                <div class="bg-light rounded overflow-hidden" style="height: 460px">
                                    <a href="${pageContext.request.contextPath}/bai-viet?id=${post.postId}">
                                        <img class="img-fluid w-100" style="aspect-ratio: 3 / 2;" src="${pageContext.request.contextPath}/img/${post.image}" alt="">
                                    </a>
                                    <div class="p-4">
                                        <a class="h4 d-block mb-3 post-title" href="${pageContext.request.contextPath}/bai-viet?id=${post.postId}">${post.title}</a>
                                        <p class="m-0 post-description">${post.description}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <c:if test="${requestScope.postList.size() >= 6}">
                        <div class="col-12 text-center mt-4">
                            <button class="btn btn-primary py-3 px-5 load-more">Xem thêm</button>
                        </div>
                    </c:if>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}lib/easing/easing.min.js"></script>
        <script src="${pageContext.request.contextPath}lib/waypoints/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}lib/tempusdominus/js/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="${pageContext.request.contextPath}lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            function ajaxCall(size) {
                var currentNumOfPost = document.getElementsByClassName('post').length;
                $.ajax({
                    url: '/Childcare/ajax/post/loadmore',
                    type: "POST",
                    data: {
                        cid: document.querySelector('input[name="cid"]').value,
                        search: document.querySelector('input[name="search"]').value,
                        currentLoad: currentNumOfPost
                    },
                    async: true,
                    success: function (data) {
                        var row = document.getElementById('post-list');
                        row.innerHTML = row.innerHTML + data;
                    },
                    error: function () {
                        alert('Errore');
                    }
                });
                if (currentNumOfPost >= size) {
                    document.querySelector('button.load-more').remove();
                }

            }
            document.querySelector('button.load-more').addEventListener('click', function () {
                ajaxCall(${requestScope.postList.size()});
            });

        </script>
    </body>
</html>
