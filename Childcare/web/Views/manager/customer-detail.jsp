<%-- 
    Document   : add-product
    Created on : Jun 26, 2022, 9:41:27 AM
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
        <title>Page Title</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/ui.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>

        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <script src='${pageContext.request.contextPath}/js/pagger.js'></script>
        <link href="${pageContext.request.contextPath}/css/pagger.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <c:set value="${requestScope.user}" var="u" />
        <div class="page-wrapper">
            <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->

                <main class="main-admin-page">
                    <!--HEADER-->
                <jsp:include page="header.jsp"></jsp:include>
                    <!--HEADER-->

                    <section class="content-main edit-account">
                        <div>
                            <h2 >${requestScope.mess}</h2>
                        </div>
                        <div class="content-header">
                            <h2 class="content-title">Ch???nh s???a th??ng tin </h2>
                        </div>
                        <div class="card">
                            <header class="card-header">
                                <div class="row gx-3">
                                    <div class="col-lg-4 col-md-6 me-auto"></div>
                                    <div class="col-lg-2 col-md-3 col-6">
                                        <select class="form-select" name="status" form="main-form">
                                            <option value="-1" <c:if test="${requestScope.user.getStatus()==-1}">selected</c:if>>
                                                Tr???ng th??i</option>
                                            <option value="1" <c:if test="${requestScope.user.getStatus()==1}">selected</c:if>>
                                                Active</option>
                                            <option value="2" <c:if test="${requestScope.user.getStatus()==2}">selected</c:if>>
                                                Inactive</option>
                                            <option value="3" <c:if test="${requestScope.user.getStatus()==3}">selected</c:if>>
                                                Unverified</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-2 col-md-3 col-6">
                                        <div>
                                            <a href="${context}/manager/user" class="btn btn-primary p-1 ms-2">Quay l???i</a>
                                    </div>
                                </div>
                            </div>
                        </header> <!-- card-header end// -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-10">

                                    <section class="content-body p-xl-4">
                                        <form method="POST">
                                            <div class="row">
                                                <div class="col-lg-8">
                                                    <div class="row gx-3">
                                                        <div class="col-6  mb-3 me-3">
                                                            <label class="form-label">H??? v?? t??n</label>
                                                            <input name="name" class="form-control" type="text" placeholder="Type here" value="${u.name}">
                                                        </div> <!-- col .// -->
                                                        <div class="col-lg-6  mb-3">
                                                            <label class="form-label">Email</label>
                                                            <input name="email" class="form-control" type="email" placeholder="example@mail.com" value="${u.email}">
                                                        </div> <!-- col .// -->
                                                        <div class="col-lg-6  mb-3">
                                                            <label class="form-label">Ng??y sinh</label>
                                                            <input name="dob" class="form-control" type="date" value="${u.dob}">
                                                        </div> <!-- col .// -->
                                                        <div class="col-lg-6  mb-3">
                                                            <label class="form-label">S??? ??i???n tho???i</label>
                                                            <input name="phoneNumber" class="form-control" type="tel" placeholder="+1234567890" value="${u.phoneNumber.trim()}" >
                                                        </div> <!-- col .// -->
                                                        <div class="col-lg-12  mb-3">
                                                            <label class="form-label">?????a ch???</label>
                                                            <input name="address" class="form-control" type="text" placeholder="Type here" value="${u.address}">
                                                        </div> <!-- col .// -->
                                                    </div> <!-- row.// -->
                                                </div> <!-- col.// -->
                                                <div class="col-lg-4 avatar-input">
                                                    <figure class="text-lg-center">
                                                        <img src="${context}/img/${u.avatar==null?'default-avatar.jpg':u.avatar}" class="img-lg mb-3 img-avatar" alt="User Photo" id="show-avatar">
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
                                            <button class="btn btn-primary" type="submit">C???p nh???t</button>
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
        <script src="${context}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
    </body>
</html>
