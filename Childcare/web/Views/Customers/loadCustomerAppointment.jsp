<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Childcare System</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

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
    </head>
    <!-- Pills navs -->
    <body>
        <c:set var="context" value="${pageContext.request.contextPath}" />  
        <div id="colorlib-page">
            <jsp:include page="../Shared/_Header.jsp"></jsp:include>
                <!-- Pills content -->
                <div class="container">
                    <div class="row">

                    <jsp:include page="ASIDE.jsp"/>


                        <div class="col-sm-8 mx-auto p-5 mt-3">
                            <ul>

                                <li><a href="loadCustomerAppointment?typeId=1" 
                                    ${requestScope.typeId == 1 ? 'class="active"':''}>Lịch sắp đến</a></li>
                            <li><a href="loadCustomerAppointment?typeId=2" 
                                   ${requestScope.typeId == 2 ? 'class="active"':''}>Hoàn thành</a></li>
                            <li><a href="loadCustomerAppointment?typeId=3" 
                                   ${requestScope.typeId == 3 ? 'class="active"':''}>Lịch sử đặt lịch</a></li>
                        </ul>

                        <div class="card-group" style="margin-top: 50px;">
                            <c:if test="${requestScope.AppHm.isEmpty()}"><p style="margin:0 auto" class="fs-5">Lịch trống</p></c:if>
                            <c:forEach items="${requestScope.AppHm}" var="app">
                                <div class="col-md-12" style="padding: 10px 20px">
                                    <form action="cancelAppointment" method="post">
                                        <input type="hidden" name="AppId" value="${app.key.appointmentId}">
                                        <div class="card mb-5 text-dark" style="background-color: white;
                                             box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1), 0 3px 10px 0 rgba(0, 0, 0, 0.08); border-radius: 10px;">

                                            <div class="card-body">
                                                <div class="d-flex align-items-center doctor-profile-header">
                                                    <div class="profileImage">
                                                        <img src="${context}/img/${app.value.user.avatar}" width="80" height="80" class="rounded-circle">
                                                    </div>
                                                    <div class="doctorInfoHeader ms-3">
                                                        <h3 class="fs-4">
                                                            <span class="title">${app.value.title}</span> 
                                                            <span class="fullname">${app.value.user.name}</span>
                                                        </h3>
                                                    </div >
                                                </div>
                                                <div class="doctor-detail pt-3 ps-2">
                                                    <div class="description-section">
                                                        <p style="color: #8c8c8c; font-size: 14px; line-height: 18px;">
                                                            Ngày:    
                                                            <span style="color:#030B12">${app.key.slot.shift.date}</span>
                                                        </p>
                                                        <p style="color: #8c8c8c; font-size: 14px; line-height: 18px;">
                                                            Thời gian: 
                                                            <span style="color:#030B12">${app.key.slot.slotTime.startTime} - ${app.key.slot.slotTime.endTime}</span>
                                                        </p>
                                                        <p style="color: #8c8c8c; font-size: 14px; line-height: 18px;">
                                                            Phí: 
                                                            <span style="color:#030B12">${app.value.price}</span>
                                                        </p>
                                                        <p style="color: #8c8c8c; font-size: 14px; line-height: 18px;">
                                                            Trạng thái: 
                                                            <c:if test="${app.key.status == 0}"><span style="color: #1794DC; font-size: 14px;">Sắp đến</span></c:if>
                                                            <c:if test="${app.key.status == 1}"><span style="color: #12D80C; font-size: 14px;">Hoàn thành</span></c:if>
                                                            <c:if test="${app.key.status == 2}"><span style="color: #F33E11; font-size: 14px;">Đã hủy</span></c:if>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-footer d-flex justify-content-center"> 
                                                <c:if test="${app.key.status == 0}"><button type="submit" class="btn btn-danger">Hủy</button></c:if>
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

    </body>
</html>
