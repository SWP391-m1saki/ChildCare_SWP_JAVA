<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Childcare System</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

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
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/doctor-detail.css'>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>
    <!-- Pills navs -->

    <body>
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <div id="colorlib-page">
            <jsp:include page="../Shared/_Header.jsp"></jsp:include>
                <!-- Pills content -->
                <div class="container">
                    <div class="row">

                    <jsp:include page="ASIDE.jsp" />
                    <div class="col-sm-8 mx-auto p-5 mt-3">
                        <ul>
                            <li><a href="loadCustomerAppointment?typeId=1" 
                                   ${requestScope.typeId==1? 'class="active"' :''}>Lịch sắp đến</a></li>
                            <li><a href="loadCustomerAppointment?typeId=2" 
                                   ${requestScope.typeId==2? 'class="active"' :''}>Hoàn thành</a></li>
                            <li><a href="loadCustomerAppointment?typeId=3" 
                                   ${requestScope.typeId==3 ? 'class="active"' :''}>Lịch sử đặt lịch</a></li>
                        </ul>

                        <div class="card-group" style="margin-top: 50px;">
                            <c:if test="${requestScope.appointments.isEmpty()}">
                                <p style="margin:0 auto" class="fs-5">Lịch trống</p>
                            </c:if>
                            <c:forEach items="${requestScope.appointments}" var="appointment">
                                <div class="col-md-12" style="padding: 10px 20px">
                                    <form action="cancelAppointment" method="post">
                                        <input type="hidden" name="AppId" value="${appointment.appointmentId}">
                                        <div class="card mb-5 text-dark"
                                             style="background-color: white;
                                             box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1), 0 3px 10px 0 rgba(0, 0, 0, 0.08); border-radius: 10px;">

                                            <div class="card-body px-4">
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

                                                    <div class="row">
                                                        <div class="col-lg-6 col-12">
                                                            <div class="qualification-section">
                                                                <h4 style="color:#1b3250" class="header mb-1">Chi tiết lịch khám</h4>
                                                                <div class="qualication-detail">
                                                                    <ul class="ps-4 bg-white border-0">
                                                                        <li class="w-100">
                                                                            <p class="price-des">
                                                                                <i class="fa-solid fa-calendar-days" style="color: #838181;"></i>
                                                                                <span>Ngày: </span><span>${appointment.slot.shift.date}</span></p>
                                                                        </li>
                                                                        <li class="w-100">
                                                                            <p class="price-des">
                                                                                <i class="fa-solid fa-clock" style="color: #838181;"></i>                                                       
                                                                                <span>Thời gian:</span><span>${appointment.slot.slotTime.startTime} - ${appointment.slot.slotTime.endTime}</span>
                                                                            </p>
                                                                        </li>
                                                                        <li class="w-100"><p class="price-des">
                                                                                <i class="fa-solid fa-sack-dollar" style="color: #838181;"></i>                                                       
                                                                                <span>Phí thăm khám</span>
                                                                                <span class="price">${appointment.slot.shift.schedule.doctor.price}&nbsp;₫</span>
                                                                            </p>
                                                                        </li>
                                                                        <li class="w-100">
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
                                                        </div>
                                                        <div class="col-lg-6 col-12">
                                                            <div class="service-section">
                                                                <h4 style="color:#1b3250" class="header">Thông tin bệnh nhân</h4>
                                                                <div class="qualication-detail">
                                                                    <p class="my-1"><span class="bold-span">Tên trẻ:  </span> ${appointment.child.name}</p>
                                                                    <p class="my-1"><span class="bold-span">Ngày sinh:  </span>  ${appointment.child.dob}</p>
                                                                    <p class="my-1"><span class="bold-span">Giới tính:  </span> ${appointment.child.gender ? 'Nam' : 'Nữ'}</p>
                                                                </div>
                                                            </div>   
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-footer d-flex justify-content-center">
                                                    <c:if test="${appointment.status == 0}"><button type="submit"
                                                            class="btn btn-danger">Hủy</button></c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                            </c:forEach>
                        </div>

                    </div>



                </div>
            </div>
            <jsp:include page="../Shared/_Footer.jsp"></jsp:include>

        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>