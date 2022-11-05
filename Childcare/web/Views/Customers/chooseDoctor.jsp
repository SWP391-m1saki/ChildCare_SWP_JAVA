<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Childcare System</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

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
        <jsp:include page="../Shared/_Header.jsp"></jsp:include>
        <c:set var="context" value="${pageContext.request.contextPath}" />

        <style>
            .doctor-profile-header{
                display: grid;
                grid-gap: 16px;
                position: relative;
                margin: 24px;
                border-bottom: 1px solid rgb(228, 232, 236);
                grid-template-columns: 1fr 10fr;
                align-items: center;
                vertical-align: middle;
            }

            .service-detail {
                background: rgb(248, 249, 252);
                border-radius: 6px;
                padding: 16px;
            }

            .price-des {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                margin-top: 10px;
                margin-bottom: 0;
                gap: 8px;
                font-size: 14px;
                line-height: 24px;
                color: #262626;
            }

            .price-des .price {
                color: #009e5c;
            }
        </style>

        <div class="container">
            <!--            <div class="row">
                            BreadCrum
                            <div class="container-fluid fs-6 mt-4 ms-5">
                                <div class="container nav-item nav-link">
            
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="">Trang chủ</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">
                                            Danh sách bác sĩ
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>-->

            <div class="row" style="max-width: 1120px; margin: 0 auto;">
                <div class="col-sm-12 mx-auto">
                    <div class="row" >
                        <div class="ps-4 py-3 ms-2">
                            <h5>${requestScope.DoctorList.size()} bác sĩ ${requestScope.DepartmentName}: </h5>
                        </div>
                        <div class="card-group" >
                            <c:forEach items="${requestScope.DoctorList}" var="d">
                                <div class="col-md-12" style="padding:10px 20px" >
                                    <form action="chooseDoctor" method="post" id="doctorFrm">
                                        <input type="hidden" name="DoctorId" value="${d.doctorId}">
                                        <div class="card mb-5 text-dark" style="background-color: white;
                                             box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1), 0 3px 10px 0 rgba(0, 0, 0, 0.08); border-radius: 10px;">

                                            <div class="card-body" >
                                                <div class="row doctor-profile-header">
                                                    <div class="profileImage">
                                                        <img src="${context}/img/${d.user.avatar}" style="border-radius: 50%; width: 70px; height: 70px;">
                                                    </div>
                                                    <div class="doctorInfoHeader">
                                                        <h3 >
                                                            <span class="title">${d.title}</span> 
                                                            <span class="fullname">${d.user.name}</span>
                                                        </h3>
                                                        <p class="text-sm-start">${requestScope.DepartmentName}</p>
                                                    </div >
                                                </div>
                                                <div class="service-detail">

                                                    <p class="price-des">
                                                        <i class="fa-solid fa-sack-dollar" style="color: #838181;"></i>  <span>Phí tư vấn cố định </span>
                                                        <span class="price">${d.price}</span></p>
                                                </div>
                                            </div>
                                            <div class="card-footer d-flex justify-content-center">
                                                <button type="submit" class="btn btn-dark">Đặt Lịch</button>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <jsp:include page="../Shared/_Footer.jsp"></jsp:include>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
