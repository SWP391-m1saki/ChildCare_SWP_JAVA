<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Childcare System</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

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
    <!-- Pills navs -->
    <body>
        <jsp:include page="../Shared/_Header.jsp"></jsp:include>


            <div class="container">
                <div class="row">
                <jsp:include page="ASIDE.jsp"/>


                <div class="col-sm-8 mx-auto p-5 py-4">
                    <h2 class="mb-5">Thêm hồ sơ của trẻ</h2>

                    <form action="addChildren" method="post">

                        <div class="form-outline mb-4">
                            <label class="form-label fs-5" for="name">Họ và tên trẻ</label>
                            <input type="text" id="name" class="form-control form-control-lg w-50" name="name"/>
                        </div>

                        <div class="form-outline mb-4">
                            <label class="form-label  fs-5" for="name">Giới tính</label>
                            <input type='radio' name='gender' value='male' class="fs-5 ms-3"> Nam
                            <input type='radio' name='gender' value='female' class="fs-5"> Nữ<br/>
                        </div>

                        <div class="form-outline mb-4">
                            <label class="form-label fs-5" for="dob">Ngày sinh</label>
                            <input type="date" id="dob" class="form-control form-control-lg w-50" name="dob"/>
                        </div>

                        <div class="d-flex justify-content-between align-items-center">
                            <div class="text-center text-lg-start mt-4">
                                <button class="btn btn-primary btn-lg" type="submit"
                                        style="padding-left: 2.5rem; padding-right: 2.5rem;">Add</button>

                            </div>
                        </div>

                    </form>
                </div>
            </div>

        </div>
    </div>

    <jsp:include page="../Shared/_Footer.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
