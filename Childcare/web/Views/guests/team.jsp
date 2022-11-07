<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Childcare System</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@400;700&family=Roboto:wght@400;700&display=swap"
            rel="stylesheet">

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
        <jsp:include page="../Shared/_Header.jsp" />
        <!-- Team Start -->
        <div class="container-fluid py-5">
            <div class="container w-75">
                <div class="text-center mx-auto mb-5" style="max-width: 500px;">
                    <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5">Danh sách bác sĩ
                        hàng đầu</h5>
                </div>


                <c:forEach items="${requestScope.doctors}" var="d">
                    <div class="team-item">
                        <div class="row g-0 bg-light rounded overflow-hidden">
                            <div class="col-12 col-sm-3 h-100 p-3">
                                <img class="img-fluid h-100" width="300" height="300"
                                     src="${context}/img/${d.user.avatar}" style="object-fit: cover;">
                            </div>
                            <div class="col-12 col-sm-7 h-100 d-flex flex-column">
                                <div class="mt-auto p-4">
                                    <h3><a href="loadDoctorDetail?id=${d.doctorId}">${d.user.name}</a></h3>
                                    <h6 class="fw-normal fst-italic text-primary mb-4">${d.title}</h6>
                                    <p class="m-0" style="    line-height: 1.5;
                                       overflow: hidden;
                                       white-space: normal;
                                       max-height: 9rem;">${d.description}</p>
                                    <br>
                                    <br>
                                    <p class="price-des">
                                        <i class="fa-solid fa-sack-dollar" style="color: #838181;"></i>
                                        <span>Phí tư vấn cố định </span>
                                        <span class="price">${d.price}&nbsp;₫</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                </c:forEach>

            </div>
            <!-- Team End -->

            <!-- Footer Start -->
            <jsp:include page="../Shared/_Footer.jsp" />
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

            <!-- Template Javascript -->
            <script src="js/main.js"></script>
    </body>

</html>