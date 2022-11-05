<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Childcare System</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">  

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/admin.css" rel="stylesheet">
    </head>
    <body>
        <c:set var="context" value="${pageContext.request.contextPath}" />  
        <c:set var="user" value="${sessionScope.UserLogined}" ></c:set>
            <div id="colorlib-page">
            <jsp:include page="../Shared/_Header.jsp"></jsp:include>
                <!-- Pills content -->
                <div class="container">
                    <div class="row">
                    <jsp:include page="ASIDE.jsp"/>
                    <div class="col-sm-8 mx-auto py-4">
                        <h1 class="mb-3 ms-3">Hồ sơ của bạn</h1>
                        <section class="content-body p-xl-4">
                            <form action="userProfile" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div class="row gx-3">
                                            <div class="col-6  mb-3 me-3">
                                                <label class="form-label">Họ và tên</label>
                                                <input name="name" value="${user.name}" class="form-control" type="text" placeholder="Type here">
                                            </div> <!-- col .// -->
                                            <div class="col-lg-6  mb-3">
                                                <label class="form-label">Email</label>
                                                <input  class="form-control" type="email" placeholder="example@mail.com" name="email" value="${user.email}" readonly>
                                            </div> <!-- col .// -->
                                            <div class="col-lg-6  mb-3">
                                                <label class="form-label">Ngày sinh</label>
                                                <input name="dob" value="${user.dob}" class="form-control" type="date">
                                            </div> <!-- col .// -->
                                            <div class="col-lg-6  mb-3">
                                                <label class="form-label">Số điện thoại</label>
                                                <input name="phonenumber" class="form-control" type="tel" placeholder="+1234567890" value="${user.phoneNumber.trim()}" >
                                            </div> <!-- col .// -->
                                            <div class="col-lg-6  mb-3">
                                                <label class="form-label my-1">Giới tính</label>
                                                <div class="d-flex align-items-center h-50">
                                                    <input type='radio' name='gender' value='male' ${user.isGender()?"checked":""} class="form-check-input ms-2">
                                                    <label class="">Nam</label>
                                                    <input type='radio' name='gender' value='female' ${user.isGender()?"":"checked"} class="form-check-input ms-4">
                                                    <label class="">Nữ</label>
                                                </div>
                                            </div> <!-- col .// -->
                                            <div class="col-lg-12  mb-3">
                                                <label class="form-label">Địa chỉ</label>
                                                <input name="address" class="form-control" type="text" placeholder="Type here" value="${user.address}">
                                            </div> <!-- col .// -->
                                        </div> <!-- row.// -->
                                    </div> <!-- col.// -->
                                    <div class="col-lg-4 avatar-input">
                                        <figure class="text-lg-center">
                                            <img src="${context}/img/${user.avatar==null?'default-avatar.jpg':user.avatar}" class="img-lg my-3 rounded-circle" width="196" height="196" alt="User Photo" id="show-avatar">
                                            <figcaption>
                                                <div class="btn btn-outline-primary" id="my-button" onclick="document.getElementById('my-file').click()">
                                                    <i class="fa-solid fa-cloud-arrow-up" style="color: blue"></i> Upload
                                                </div>
                                                <input type="file" accept="image/*" name="avatar" id="my-file" style="display: none" 
                                                       onchange="document.getElementById('show-avatar').src = window.URL.createObjectURL(this.files[0])">
                                            </figcaption>
                                        </figure>
                                    </div> <!-- col.// -->
                                </div> <!-- row.// -->
                                <br>
                                <button class="btn btn-primary" type="submit">Cập nhật</button>
                            </form>

                            <hr class="my-5">

                        </section> <!-- content-body .// -->

                    </div> <!-- col.// -->

                    <!--                    <div class="col-sm-8 mx-auto p-5">
                    
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
                    
                                        </div>-->
                </div>
            </div>
            <jsp:include page="../Shared/_Footer.jsp"></jsp:include>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
