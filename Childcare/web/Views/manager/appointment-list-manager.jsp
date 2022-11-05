<%-- 
    Document   : customer-info-list
    Created on : Oct 20, 2022, 10:19:56 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Quản lí người dùng</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/ui.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
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

                <style>
                    .content-main{
                        padding: 20px;
                    }

                    .left-aside {
                        width: 17%;
                    }
                    .main-admin-page{
                        width: 83%;
                    }

                    table tr>*{
                        vertical-align: middle;
                    }
                </style>
                <main class="main-admin-page">
                    <!--HEADER-->
                <jsp:include page="header.jsp"></jsp:include>
                    <!--HEADER-->

                    <section class="content-main mx-2">
                        <div class="content-header mb-3">
                            <h2 class="content-title ms-2 fs-3">Quản lí lịch đặt khám</h2>
                        </div>
                        <div class="row">
                            <div class="col-md-9 pe-0">
                                <div class="card mb-4">
                                    <header class="card-header bg-white py-3">
                                        <div class="row gx-3">
                                            <!--Search bar-->
                                            <div class="col-lg-3 col-md-5 me-auto">
                                            </div>
                                            <!--Trang thai don hang-->
                                            <div class="col-lg-6 col-md-6 col-12 d-flex">
                                                <select class="form-select" form="main-form" name="appStatus" onchange="this.form.submit();">
                                                    <option value="-1" <c:if test="${requestScope.appStatus==-1}">selected</c:if>>
                                                        Trạng thái</option>
                                                    <option value="0" <c:if test="${requestScope.appStatus==0}">selected</c:if>>
                                                        Sắp tới</option>
                                                    <option value="1" <c:if test="${requestScope.appStatus==1}">selected</c:if>>
                                                        Thành công</option>
                                                    <option value="2" <c:if test="${requestScope.appStatus==2}">selected</c:if>>
                                                        Đã hủy</option>
                                                </select>

                                                <select class="form-select" name="depId" form="main-form" onchange="this.form.submit();">
                                                    <option value="-1" ${(requestScope.depId == -1)?'selected':''}>
                                                    Chuyên khoa</option>
                                                    <c:forEach items="${requestScope.departments}" var="d">
                                                    <option value="${d.departmentId}"
                                                            <c:if test="${requestScope.depId == d.departmentId}">selected</c:if>>
                                                        ${d.departmentName}</option>
                                                    </c:forEach>
                                            </select>
                                        </div>

                                    </div>
                                    </form>

                                </header> <!-- card-header end// -->
                                <div class="card-body">
                                    <c:if test="${empty requestScope.appointments}">
                                        <h5 class="text-center py-4">Không có lịch đặt khám nào</h5>
                                    </c:if>
                                    <c:if test="${!(empty requestScope.appointments)}">


                                        <div class="table-responsive">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Người dùng</th>
                                                        <th>Số điện thoại</th>
                                                        <th>Tên trẻ</th>
                                                        <th>Bác sĩ</th>
                                                        <th>Chuyên khoa</th>
                                                        <th>Trạng thái</th>
                                                        <th class="text-end">Hành động</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.appointments}" var="app">
                                                        <tr>
                                                            <td>
                                                                <a href="${context}/manager/appointment/detail?id=${app.appointmentId}" class="itemside">
                                                                    <h6 class="mb-0 title">${app.child.parent.name}</h6>
                                                                </a>
                                                            </td>
                                                            <td>${app.child.parent.phoneNumber}</td>
                                                            <td>${app.child.name}</td>
                                                            <td>${app.slot.shift.schedule.doctor.user.name}</td>
                                                            <td>${requestScope.departments[app.slot.shift.schedule.doctor.departmentId - 1].departmentName}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${app.status == 0}">
                                                                        <span class="badge rounded-pill alert-primary">Sắp tới</span>
                                                                    </c:when>
                                                                    <c:when test="${app.status == 1}">
                                                                        <span class="badge rounded-pill alert-success">Thành công</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span class="badge rounded-pill alert-danger">Đã hủy</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td class="text-end">
                                                                <a href="${context}/manager/appointment/detail?id=${app.appointmentId}" class="btn btn-secondary py-2"
                                                                   style="padding: 0.3rem 0.75rem;
                                                                   margin: 0.35rem 0;">Chi tiết</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table> <!-- table-responsive.// -->
                                        </div>
                                    </c:if>

                                </div> <!-- card-body end// -->
                            </div> <!-- card end// -->

                            <!--Display PAGING if list has item
                            Else empty form-->
                            <c:choose>
                                <c:when test="${requestScope.appointments != null && requestScope.appointments.size() != 0}">
                                    <jsp:include page="../Shared/_Paging.jsp"></jsp:include>
                                </c:when> 
                                <c:otherwise>
                                    <form method="post" id="main-form">
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="col-md-3">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <h5 class="mb-3">Bộ lọc</h5>
                                    <div class="mb-4">
                                        <label for="order_id" class="form-label">Tên khách hàng</label>
                                        <input type="text" placeholder="Type here" class="form-control" form="main-form" name="customer_name" value="${requestScope.customer_name}">
                                    </div>
                                    <div class="mb-4">
                                        <label for="order_customer" class="form-label">Tên trẻ</label>
                                        <input type="text" placeholder="Type here" class="form-control" form="main-form"  name="child_name" value="${requestScope.child_name}">
                                    </div>

                                    <div class="mb-4">
                                        <label for="order_customer" class="form-label">Tên bác sĩ</label>
                                        <input type="text" placeholder="Type here" class="form-control" form="main-form"  name="doctor_name" value="${requestScope.doctor_name}">
                                    </div>

                                    <div class="mb-4">
                                        <label for="order_created_date" class="form-label">Số điện thoại | Email</label>
                                        <input type="text" placeholder="Type here" class="form-control" form="main-form"  name="phone_email" value="${requestScope.phone_email}">
                                    </div>
                                    <div class="mb-4">
                                        <button class="btn btn-primary py-2" form="main-form"  type="submit">Tìm kiếm</button>
                                        <button class="btn btn-primary-light py-2">Xóa bộ lọc</button>
                                    </div>
                                </div>
                            </div> <!-- card end// -->
                        </div>
                    </div>
                </section>
            </main>
        </div>
        <script src="${context}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
    </body>
</html>
