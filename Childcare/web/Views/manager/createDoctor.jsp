<%-- 
    Document   : createDoctor
    Created on : Oct 10, 2022, 3:39:03 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Thêm bác sĩ mới</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/add-product.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <div class="page-wrapper">
            <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->
                <main class="main-admin-page">
                    <!--HEADER-->
                <%--<jsp:include page="header.jsp"></jsp:include>--%>
                <!--HEADER-->

                <section class="content-main edit-account">

                    <div class="content-header">
                        <h2 class="content-title">Tạo tài khoản bác sĩ</h2>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-11">
                                    <c:if test="${requestScope.mess != null}">
                                        <div class="alert-danger w-50 mx-4">
                                            <p class="p-2 ps-3">${requestScope.mess}</p>
                                        </div>
                                    </c:if>


                                    <section class="content-body p-xl-4">
                                        <form method="POST">
                                            <div class="row">
                                                <div class="col-lg-8">
                                                    <div class="row gx-3">
                                                        <div class="col-6  mb-3 me-3">
                                                            <label class="form-label">Họ và tên</label>
                                                            <input name="fullname" class="form-control" type="text" placeholder="Type here">
                                                        </div> <!-- col .// -->
                                                        <div class="col-lg-6  mb-3">
                                                            <label class="form-label">Gmail</label>
                                                            <input name="gmail" class="form-control" type="email" placeholder="example@mail.com">
                                                        </div> <!-- col .// -->
                                                        <div class="col-lg-6  mb-3">
                                                            <label class="form-label">Mật khẩu</label>
                                                            <input readonly="readonly" name="password" class="form-control" type="text" value="${requestScope.defaultPass}">
                                                        </div> <!-- col .// -->
                                                        <div class="col-lg-4  mb-3">
                                                            <label class="form-label">Ngày sinh</label>
                                                            <input name="dob" class="form-control" type="date">
                                                        </div> <!-- col .// -->
                                                        <div class="col-lg-4  mb-3">
                                                            <label class="form-label">Số điện thoại</label>
                                                            <input name="phone" class="form-control" type="tel" placeholder="+1234567890" >
                                                        </div> <!-- col .// -->
                                                        <div class="col-lg-4  mb-3">
                                                            <label class="form-label">Giới tính</label>
                                                            <select name="gender" class="form-select">
                                                                <option class="" value="Male" selected>Nam</option>
                                                                <option value="Female">Nữ</option>

                                                            </select>
                                                        </div> <!-- col .// -->
                                                        <div class="col-lg-12  mb-3">
                                                            <label class="form-label">Địa chỉ</label>
                                                            <input name="address" class="form-control" type="text" placeholder="Type here">
                                                        </div> <!-- col .// -->
                                                    </div> <!-- row.// -->
                                                </div> <!-- col.// -->
                                                <div class="col-lg-4 avatar-input">
                                                    <figure class="text-lg-center">
                                                        <img src="${context}/img/default-avatar.jpg" class="img-lg mb-3 img-avatar" alt="User Photo" id="show-avatar">
                                                        <figcaption>
                                                            <div class="btn btn-outline-primary" id="my-button" onclick="document.getElementById('my-file').click()">
                                                                <i class="fa-solid fa-cloud-arrow-up" style="color: blue"></i> Upload
                                                            </div>
                                                            <input type="file" accept="image/*" name="avatar" id="my-file" style="display: none" onchange="document.getElementById('show-avatar').src = window.URL.createObjectURL(this.files[0])">
                                                        </figcaption>
                                                    </figure>
                                                </div> <!-- col.// -->
                                            </div> <!-- row.// -->
                                            <br>
                                            <button class="btn btn-primary fw-bold" type="submit">Tạo tài khoản</button>
                                            <a href="${context}/manager/doctor/profile" class="btn btn-secondary fw-bold ms-4" >Quay lại</a>
                                        </form>

                                        <hr class="my-5">

                                    </section> <!-- content-body .// -->

                                </div> <!-- col.// -->
                            </div> <!-- row.// -->

                        </div> <!-- card body end// -->
                    </div> <!-- card end// -->


                </section>
            </main>
        </div>
    </body>
</html>