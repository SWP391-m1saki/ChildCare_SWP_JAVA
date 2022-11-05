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
        <title>Chi tiết slot</title>
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
                </style>
                <main class="main-admin-page">
                    <!--HEADER-->
                <jsp:include page="header.jsp"></jsp:include>
                    <!--HEADER-->

                    <section class="content-main mx-2">
                        <div class="content-header mb-3">
                            <h2 class="content-title ms-2 fs-3">Lịch khám của ca</h2>
                        </div>
                        <div class="row">
                            <div class="col-md-12 pe-0">
                                <div class="card mb-4">
                                    <header class="card-header bg-white py-2">
                                        <div class="row">
                                            <!--Search bar-->
                                            <div class="col-lg-2 offset-10">
                                                <a href="${context}/doctor/schedule" class="btn btn-primary py-2">Quay lại</a>
                                            </div>
                                        </div>
                                    </header> <!-- card-header end// -->
                                    <div class="card-body">
                                    <c:if test="${empty requestScope.appointments}">
                                        <h5 class="text-center py-4">Không có lịch đặt khám nào</h5>
                                    </c:if>
                                    <c:forEach items="${requestScope.appointments}" var="appointment">
                                        <div class="col-md-12" style="padding: 10px 20px">
                                            <form method="post">
                                                <div class="card mb-5 text-dark" style="background-color: white;
                                                     box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1), 0 3px 10px 0 rgba(0, 0, 0, 0.08); border-radius: 10px;">

                                                    <div class="card-body p-4">
                                                        <div class="doctor-detail">
                                                            <div class="row">
                                                                <div class="col-lg-4 col-12 ps-5">
                                                                    <div class="qualification-section">
                                                                        <h4 style="color:#1b3250" class="header mb-1">Chi tiết lịch khám</h4>
                                                                        <div class="qualication-detail">
                                                                            <ul class="ps-2 mt-2 bg-white border-0">
                                                                                <li class="w-100">
                                                                                    <p class="price-des">
                                                                                        <i class="fa-solid fa-calendar-days" style="color: #838181;"></i>
                                                                                        <span>Ngày: </span><span>${appointment.slot.shift.date}</span></p>
                                                                                </li>
                                                                                <li class="w-100">
                                                                                    <p class="price-des">
                                                                                        <i class="fa-solid fa-clock" style="color: #838181;"></i>                                                       
                                                                                        <span>Thời gian: </span><span> ${appointment.slot.slotTime.startTime} - ${appointment.slot.slotTime.endTime}</span>
                                                                                    </p>
                                                                                </li>
                                                                                <li class="w-100">
                                                                                    <p class="price-des">
                                                                                        <i class="fa-solid fa-check-double" style="color: #838181;"></i>
                                                                                        <span>Trạng thái: </span>

                                                                                        <c:choose>
                                                                                            <c:when test="${appointment.status == 0}">
                                                                                                <span class= "text-primary fw-bold">  Sắp tới</span>
                                                                                            </c:when>
                                                                                            <c:when test="${appointment.status == 1}">
                                                                                                <span class="text-success fw-bold">  Thành công</span>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <span class="text-danger fw-bold">  Đã hủy</span>
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                    </p>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-12">
                                                                    <div class="service-section">
                                                                        <h4 style="color:#1b3250" class="header">Thông tin bệnh nhân</h4>
                                                                        <div class="qualication-detail ms-2">
                                                                            <p class="my-1"><span class="bold-span">Tên trẻ:  </span> ${appointment.child.name}</p>
                                                                            <p class="my-1"><span class="bold-span">Ngày sinh:  </span>  ${appointment.child.dob}</p>
                                                                            <p class="my-1"><span class="bold-span">Giới tính:  </span> ${appointment.child.gender ? 'Nam' : 'Nữ'}</p>
                                                                        </div>
                                                                    </div>   
                                                                </div>
                                                                <div class="col-lg-4 col-12">
                                                                    <div class="service-section">
                                                                        <h5 class="account-infor_header">Thông tin liên hệ</h5>
                                                                        <p class="ms-2"><span>Tên phụ huynh:  </span> ${appointment.child.parent.name}</p>
                                                                        <p class="ms-2"><span>Số điện thoại:  </span> ${appointment.child.parent.phoneNumber}</p>
                                                                        <p class="ms-2"><span>Địa chỉ:  </span> ${appointment.child.parent.address}</p>
                                                                    </div>   
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-footer d-flex justify-content-center">
                                                            <c:if test="${appointment.status == 0}">
                                                                <input type="hidden" name="appId" value="${appointment.appointmentId}">
                                                                <button type="submit" class="btn btn-success">Hoàn thành</button>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </div>

                            </div> <!-- card-body end// -->
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
