<%-- 
    Document   : ErrorPage
    Created on : Oct 13, 2022, 8:45:28 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lỗi</title>
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
    </head>
    <body>
        <jsp:include page="../Shared/_Header.jsp"/>

        <section class="content-main">

                <div class="row" style="margin-top:60px">
                    <div class="col-sm-12">
                        <div class="w-50 mx-auto text-center">
                            <img src="${pageContext.request.contextPath}/images/not-found.png" width="350" alt="Page Not Found">
                        <h3 class="mt-4">Oops! Trang không tìm thấy</h3>
                        <p>Có thể bạn đã nhập sai đường dẫn hoặc trang không còn tồn tại. Đừng lo lắng... chuyện này xảy ra với tất cả chúng ta. Bạn hãy thử
                            kiểm tra lại đường dẫn</p>
                        <a href="${pageContext.request.contextPath}/loadHomePage" class="btn btn-primary mt-4">Quay lại trang chủ
                        </a>
                    </div>
                </div>
            </div>


        </section>
        
        <jsp:include page="../Shared/_Footer.jsp"/>
    </body>
</html>
