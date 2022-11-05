<%-- 
    Document   : doctor-profile-detail
    Created on : Oct 10, 2022, 3:40:36 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Chi tiết hẹn khám</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/add-product.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/doctor-detail.css'>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>

    </head>
    <body>
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <c:set var="doctorProfile" value="${requestScope.doctorProfile}" />
        <div class="page-wrapper">
            <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->
                <main class="main-admin-page">
                    <!--HEADER-->
                <jsp:include page="header.jsp"></jsp:include>
                    <!--HEADER-->

                    <section class="content-main edit-account p-4 pt-3">

                        <div class="content-header mb-3">
                            <h3 class="content-title m-0 ms-2 fs-3 text-secondary">Chi tiết lịch khám</h3>
                        </div>

                        <div class="card" style="max-width:1120px;">
                            <div class="card-body">
                                <div class="row doctor-profile-header my-1 d-flex">
                                    <div class="action col-sm-3 offset-lg-9 mb-3">
                                        <a class="btn btn-primary fw-bold" href="${context}/manager/appointment/update?id=${doctorProfile.doctorId}">Chỉnh sửa</a>
                                    <a href="${context}/manager/appointment" class="btn btn-secondary fw-bold" >Quay lại</a>
                                </div>
                            </div><!-- End doctor header -->

                            <!-- Start doctor content body -->
                            <div class="row">
                                <div class="col-lg-8 doctor-profile-body">
                                    <section class="content-body p-xl-4">
                                        <div class="doctor-detail">
                                            <div class="description-section">
                                                <h4 style="color:#1b3250" class="header">Thông tin bác sĩ</h4>
                                                <div class="row doctor-profile-header my-4">
                                                    <div class="profileImage">
                                                        <img class="mb-3 rounded-circle shadow-4" 
                                                             src="${context}/img/${appointment.slot.shift.schedule.doctor.user.avatar}" style="width: 70px;height:70px" alt="Avatar"/>
                                                    </div>
                                                    <div class="doctorInfoHeader">
                                                        <h1 class="fs-5">
                                                            <span class="title">${appointment.slot.shift.schedule.doctor.title} </span> 
                                                            <span class="fullname"> ${appointment.slot.shift.schedule.doctor.user.name}</span>
                                                        </h1>
                                                        <p class="text-sm-start" ${appointment.slot.shift.schedule.doctor.departmentId}>
                                                            <span class="fw-bold">Chuyên khoa: </span>${requestScope.departments[appointment.slot.shift.schedule.doctor.departmentId].departmentName}</p>
                                                    </div>
                                                </div><!-- End doctor header -->
                                            </div>

                                            <div class="qualification-section">
                                                <h4 style="color:#1b3250" class="header">Chi tiết lịch khám</h4>
                                                <div class="qualication-detail">
                                                    <ul>
                                                        <li>
                                                            <p class="price-des">
                                                                <i class="fa-solid fa-calendar-days" style="color: #838181;"></i>
                                                                <span>Ngày: </span>
                                                                <span>${appointment.slot.shift.date}</span></p>
                                                        </li>
                                                        <li>
                                                            <p class="price-des">
                                                                <i class="fa-solid fa-clock" style="color: #838181;"></i>                                                       
                                                                <span>Thời gian:</span>                                                                 
                                                                <span>${appointment.slot.slotTime.startTime} - ${appointment.slot.slotTime.endTime}</span>
                                                            </p>
                                                        </li>
                                                        <li>
                                                            <p class="price-des">
                                                                <i class="fa-solid fa-sack-dollar" style="color: #838181;"></i>                                                       
                                                                <span>Phí thăm khám</span>
                                                                <span class="price">${appointment.slot.shift.schedule.doctor.price}&nbsp;₫</span>
                                                            </p>
                                                        </li>
                                                        <li>
                                                            <p class="price-des">
                                                                <i class="fa-solid fa-check-double" style="color: #838181;"></i>
                                                                <span>Trạng thái: </span>

                                                                <c:choose>
                                                                    <c:when test="${appointment.status == 0}">
                                                                        <span class= text-primary">  Sắp tới</span>
                                                                    </c:when>
                                                                    <c:when test="${appointment.status == 1}">
                                                                        <span class="text-success">  Thành công</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span class="text-danger">  Đã hủy</span>
                                                                    </c:otherwise>
                                                                </c:choose></p>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="service-section mt-3">
                                                <h4 style="color:#1b3250" class="header">Thông tin bệnh nhân</h4>
                                                <div class="qualication-detail ms-4">
                                                    <p class="my-1"><span class="bold-span">Tên trẻ:  </span> ${appointment.child.name}</p>
                                                    <p class="my-1"><span class="bold-span">Ngày sinh:  </span>  ${appointment.child.dob}</p>
                                                    <p class="my-1"><span class="bold-span">Giới tính:  </span> ${appointment.child.gender ? 'Nam' : 'Nữ'}</p>
                                                </div>
                                            </div>         
                                        </div>
                                        <hr class="mt-5 mb-3">
                                    </section> <!-- content-body .// -->
                                </div> <!-- col.// -->

                                <div class="col-lg-4">
                                    <div class="account-info ms-2">
                                        <h6 class="account-infor_header">Thông tin liên hệ</h6>
                                        <p><span>Tên phụ huynh:  </span> ${appointment.child.parent.name}</p>
                                        <p><span>Số điện thoại:  </span> ${appointment.child.parent.phoneNumber}</p>
                                        <p class="ps-1"><span>Địa chỉ:  </span> ${appointment.child.parent.address}</p>
                                        <div class="action">
                                            <a href="mailto:${appointment.child.parent.email}?subject=Feedback&body=Message" target="_blank"
                                               style="background: #4ae882;" class="btn btn-success rounded-pill py-1">Liên hệ</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- card body end// -->
                    </div> <!-- card end// -->
                </section>
            </main>
        </div>
    </body>
</html>
