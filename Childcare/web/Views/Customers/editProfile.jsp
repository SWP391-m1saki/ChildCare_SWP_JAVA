<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Childcare System</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">


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
        <div id="colorlib-page">
            <jsp:include page="../Shared/_Header.jsp"></jsp:include>
                <!-- Pills content -->
                <div class="container">
                    <div class="row">

                        <div class="col-sm-4 bg-light text-white mx-auto p-5 align-items-center" >
                            <ul class="list-group list-group-flush">

                                <li class="list-group-item list-group-item-dark"><a href='userProfile'>Chỉnh sửa tài khoản</a></li>
                                <li class="list-group-item list-group-item-dark"><a href='loadChildren'>Hồ sơ của trẻ</a></li>
                                <li class="list-group-item list-group-item-dark"><a href='#'>Lịch của bạn</a></li>
                                <li class="list-group-item list-group-item-dark"><a href='verifyByOldPassword'>Đổi mật khẩu</a></li>
                            </ul>

                        </div>

                        <div class="col-sm-8 mx-auto p-5">

                            <form action="userProfile" method="post" enctype="multipart/form-data">

                                <div class="form-outline mb-4">
                                    <input type="email" id="email" class="form-control form-control-lg" name="email" value="${sessionScope.UserLogined.email}" readonly/>
                                <label class="form-label" for="gmail">Email</label>
                            </div>


                            <div class="form-outline mb-4">
                                <input type="text" id="name" class="form-control form-control-lg" name="name" value="${sessionScope.UserLogined.name}"/>
                                <label class="form-label" for="name">Full name</label>
                            </div>

                            <div class="form-outline mb-4">
                                Gender: <input type='radio' name='gender' value='male' ${sessionScope.UserLogined.isGender()?"checked":""} >Male
                                <input type='radio' name='gender' value='female' ${sessionScope.UserLogined.isGender()?"":"checked"}> Female<br/>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="text" id="phonenumber" class="form-control form-control-lg" name="phonenumber" value="${sessionScope.UserLogined.phoneNumber}"/>
                                <label class="form-label" for="phonenumber">Phone number</label>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="date" id="dob" class="form-control form-control-lg" name="dob" value="${sessionScope.UserLogined.dob}"/>
                                <label class="form-label" for="dob">Date of birth</label>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="text" id="address" class="form-control form-control-lg" name="address" value="${sessionScope.UserLogined.address}"/>
                                <label class="form-label" for="address">Address</label>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="file" id="avatar" class="form-control form-control-lg" name="avatar"/>
                                <label class="form-label" for="avatar">Avatar</label>
                            </div>


                            <div class="d-flex justify-content-between align-items-center">
                                <div class="text-center text-lg-start mt-4 pt-2">
                                    <button class="btn btn-primary btn-lg" type="submit"
                                            style="padding-left: 2.5rem; padding-right: 2.5rem;">Update</button>

                                </div>
                            </div>

                        </form>

                    </div>

                </div>
            </div>



            <jsp:include page="../Shared/_Footer.jsp"></jsp:include>

        </div>

    </body>
</html>
