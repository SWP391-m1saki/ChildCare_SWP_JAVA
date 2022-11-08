<%-- 
    Document   : doctor-create-change-shift
    Created on : Oct 25, 2022, 4:43:45 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tạo đổi lịch làm việc</title>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/ui.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/doctor-detail.css'>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>

        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <script src='${pageContext.request.contextPath}/js/pagger.js'></script>
        <link href="${pageContext.request.contextPath}/css/pagger.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <div class="page-wrapper">
            <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->
                <main class="main-admin-page">
                    <!--HEADER-->
                <jsp:include page="header.jsp"></jsp:include>
                <!--HEADER-->

                <section class="content-main edit-account">

                    <div class="content-header">
                        <h2 class="content-title">Thay đổi lịch làm việc</h2>
                    </div>
                    <c:set value="${requestScope.doctor}" var="doctorProfile"/>
                    <c:set value="${requestScope.changeRequest}" var="r"/>
                    <div class="card p-4 ps-0">
                        <div class="d-flex align-items-center doctor-profile-header">
                            <div class="profileImage">
                                <img class="mb-3 rounded-circle shadow-4" src="${context}/img/${doctorProfile.user.avatar}" style="width: 100px;height:100px" alt="Avatar"/>
                            </div>
                            <div class="doctorInfoHeader ms-3">
                                <h1 class="fs-4">
                                    <span class="title">${doctorProfile.title}</span> 
                                    <span class="fullname">${doctorProfile.user.name}</span>
                                </h1>
                                <c:forEach items="${requestScope.departments}" var="d">
<!--                                        <option ${d.key == doctorProfile.departmentId ? 'selected' : ''} value="${d.key}">${d.value.getDepartmentName()}</option>-->
                                    <p class="text-sm-start" ${d.key != doctorProfile.departmentId ? 'hidden' : ''}>${d.value.getDepartmentName()}</p>
                                </c:forEach>
                            </div>

                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-11">

                                    <section class="content-body p-xl-4">
                                        <div class="row">
                                            <div class="col-lg-8">
                                                <label>Thời gian gửi: ${r.requestTime}</label>
                                            </div>
                                        </div>
                                        <form method="POST">
                                            <div class="row">
                                                <div class="col-lg-8">
                                                    <div class="row gx-3">
                                                        <div class="col-12  mb-3 me-3">
                                                            <label class="form-label">Thông tin xin nghỉ</label>
                                                            <p>${r.description}</p>
                                                        </div> <!-- col .// -->   
                                                        <div class="col-12  mb-3 me-3">
                                                            <label class="form-label">Xác nhận</label>
                                                            <select name="status">
                                                                <c:choose>
                                                                    <c:when test="${r.status == 1}">
                                                                        <option value="1" selected>Đang xử lí</option>
                                                                        <option value="2">Chấp nhận</option>
                                                                        <option value="3">Từ chối</option>
                                                                    </c:when>
                                                                    <c:when test="${r.status == 2}">
                                                                        <option value="1">Đang xử lí</option>
                                                                        <option value="2" selected>Chấp nhận</option>
                                                                        <option value="3">Từ chối</option>
                                                                    </c:when>
                                                                    <c:when test="${r.status == 3}">
                                                                        <option value="1" >Đang xử lí</option>
                                                                        <option value="2" >Chấp nhận</option>
                                                                        <option value="3" selected>Từ chối</option>
                                                                    </c:when>
                                                                </c:choose>

                                                            </select>
                                                        </div> <!-- col .// -->
                                                        <div class="col-12  mb-3 me-3">
                                                            <label class="form-label">Phản hồi</label>
                                                            <textarea name="reponse" class="form-control" placeholder="Type here" style="min-height:500px ">${r.reponseDescription}</textarea>
                                                        </div> <!-- col .// -->  
                                                    </div> <!-- row.// -->
                                                </div> <!-- col.// -->
                                            </div> <!-- row.// -->
                                            <br>
                                            <button class="btn btn-primary py-2 px-3" type="submit">Gửi</button>
                                            <a href="/Childcare/manager/doctor/shift/list" class="btn btn-secondary fw-bold ms-3">Quay lại</a>
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
