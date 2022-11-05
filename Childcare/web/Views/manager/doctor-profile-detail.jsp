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
        <title>Thông tin bác sĩ</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/add-product.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>
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
                        <h3 class="content-title m-0 ms-2 fs-3 text-secondary">Thông tin bác sĩ</h3>
                    </div>

                    <style>
                        .doctor-profile-header{
                            display: grid;
                            grid-gap: 16px;
                            position: relative;
                            margin: 24px;
                            border-bottom: 1px solid rgb(228, 232, 236);
                            grid-template-columns: 1fr 10fr 3.5fr;
                            align-items: center;
                            vertical-align: middle;
                        }

                        .tablist{
                            display: block;
                            max-width: 100%;
                            border-bottom: 1px solid rgb(228, 232, 236);
                            margin-bottom: 24px;
                        }

                        .tablist li{
                            color: rgb(45, 135, 243);
                            border-bottom: 3px solid rgb(45, 135, 243);
                            padding-bottom: 4px;
                            height: 35px;
                            font-weight: 600;
                            width: fit-content;
                        }

                        .doctor-detail>*{
                            margin-bottom: 25px;
                        }

                        .doctor-detail .header {
                            position: relative;
                            margin: auto 0;
                            margin-bottom: 16px;
                            font-size: 16px;
                            line-height: 24px;
                            padding-left: 8px;
                            font-weight: 700;
                        }
                        .description-section .header::after {
                            position: absolute;
                            top: 1px;
                            left: 0px;
                            width: 2px;
                            height: 15px;
                            margin-top: 4px;
                            background-color: rgb(45, 135, 243);
                            content: "";
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

                        .qualication-detail p{
                            margin-bottom: 0;
                        }

                        .qualication-detail li {
                            list-style-type: disc;
                        }

                        .account-info {
                            position: sticky;
                            background: rgb(248, 249, 252);
                            top: 5rem;
                            right: 0px;
                            border: 1px solid #dbdfe5;
                            margin-top: 15px;
                            display: flex;
                            padding: 16px;
                            border: 1px solid #dbdfe5;
                            margin-bottom: 8px;
                            flex-direction: column;
                            border-radius: 6px;
                            max-height: calc(100vh - 6rem);
                        }

                        .account-infor_header {
                            font-size: 18px;
                            line-height: 28px;
                            letter-spacing: -0.2px;
                            margin-top: 8px;
                            margin-bottom: 8px;
                            font-weight: 700;
                        }

                        .account-info span {
                            font-weight: 600;
                        }
                    </style>
                    <div class="card" style="max-width:1120px;">
                        <div class="card-body">
                            <div class="row doctor-profile-header mt-1">
                                <div class="profileImage">
                                    <img class="mb-3 rounded-circle shadow-4" src="${context}/img/${doctorProfile.user.avatar}" style="width: 100px;height:100px" alt="Avatar"/>
                                </div>
                                <div class="doctorInfoHeader">
                                    <h1 class="fs-4">
                                        <span class="title">${doctorProfile.title}</span> 
                                        <span class="fullname">${doctorProfile.user.name}</span>
                                    </h1>
                                    <c:forEach items="${requestScope.departments}" var="d">
<!--                                        <option ${d.key == doctorProfile.departmentId ? 'selected' : ''} value="${d.key}">${d.value.getDepartmentName()}</option>-->
                                        <p class="text-sm-start" ${d.key != doctorProfile.departmentId ? 'hidden' : ''}>${d.value.getDepartmentName()}</p>
                                    </c:forEach>

                                </div>
                                <div class="action">
                                    <a class="btn btn-primary fw-bold" href="${context}/manager/doctor/profile/update?id=${doctorProfile.doctorId}">Chỉnh sửa</a>
                                    <a href="${context}/manager/doctor/profile" class="btn btn-secondary fw-bold" >Quay lại</a>
                                </div>
                            </div><!-- End doctor header -->

                            <!-- Start doctor content body -->
                            <div class="row">
                                <div class="col-lg-8 doctor-profile-body">
                                    <section class="content-body p-xl-4">
                                        <div class="tablist">
                                            <li>Thông tin cơ bản</li>
                                        </div>
                                        <div class="doctor-detail">
                                            <div class="description-section">
                                                <h4 style="color:#1b3250" class="header">Thông tin bác sĩ</h4>
                                                <p>${doctorProfile.description}</p>
                                            </div>
                                            <div class="service-section">
                                                <h6 class="header ps-0">
                                                    <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <circle cx="16" cy="16" r="16" fill="#BCDEFF"></circle>
                                                    <ellipse cx="16.133" cy="23.866" rx="15.333" ry="0.667" fill="#91CAFF"></ellipse>
                                                    <g clip-path="url(#service_svg__clip0_20298_56108)">
                                                    <path d="M11.37 9.69V8.47c0-1.378 1.12-2.5 2.5-2.5h4.261c1.379 0 2.5 1.122 2.5 2.5v2.636h-1.387V8.471c0-.614-.5-1.113-1.113-1.113H13.87c-.613 0-1.112.5-1.112 1.113v2.623h-1.388V9.69z" fill="#2C74DF"></path>
                                                    <path d="M24.153 23.658H7.848c-.592 0-1.073-.48-1.073-1.072v-6.548a4.945 4.945 0 014.945-4.944h8.56a4.945 4.945 0 014.945 4.944v6.548c0 .592-.48 1.072-1.072 1.072z" fill="#fff"></path>
                                                    <path d="M6.775 22.586c0 .592.48 1.072 1.073 1.072h16.305c.593 0 1.073-.48 1.073-1.072V21.22H6.776v1.365z" fill="#2D87F3"></path>
                                                    <path d="M23.05 21.22v1.366c0 .592-.48 1.072-1.073 1.072h2.175c.593 0 1.073-.48 1.073-1.072V21.22H23.05z" fill="#2B62CD"></path>
                                                    <path d="M18.944 15.427h-1.856V13.57h-2.175v1.857h-1.856v2.175h1.856v1.856h2.175v-1.856h1.856v-2.175z" fill="#2D87F3"></path>
                                                    <path d="M17.087 13.57H16v5.888h1.087v-1.856h1.857v-2.175h-1.857V13.57z" fill="#2B62CD"></path>
                                                    </g><defs><clipPath id="service_svg__clip0_20298_56108">
                                                        <path fill="#fff" transform="translate(6.4 5.6)" d="M0 0h19.2v19.2H0z"></path>
                                                    </clipPath></defs>
                                                    </svg>
                                                    <span>Dịch vụ</span>
                                                </h6>
                                                <div class="service-detail">
                                                    <h6 class="">Thăm khám và tư vấn</h6>
                                                    <p class="price-des">
                                                        <i class="fa-solid fa-sack-dollar" style="color: #838181;"></i>                                                       <span>Phí tư vấn cố định </span>
                                                        <span class="price">${doctorProfile.price}&nbsp;₫</span></p>
                                                </div>
                                            </div>
                                            <div class="qualification-section">
                                                <h6 class="header ps-0">
                                                    <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="16" cy="16" r="16" fill="#BCDEFF"></circle>
                                                    <ellipse cx="15.999" cy="24" rx="15.333" ry="0.667" fill="#91CAFF"></ellipse>
                                                    <path d="M9.063 8.023c.372.064.715.24.985.504.334.335.523.788.527 1.26v8.71h-2.2C7.615 18.496 7 17.88 7 17.12V9.788C7 8.8 7.8 8 8.788 8l.275.023z" fill="#2D87F3"></path>
                                                    <path d="M21.6 8.069H9.04c.375.02.728.185.986.458.348.308.548.75.55 1.215V22.69a1.375 1.375 0 001.327 1.421h10.544a1.467 1.467 0 001.42-1.42V10.2c0-1.215-1.076-2.132-2.268-2.132z" fill="#fff"></path>
                                                    <path d="M21.115 14.05h-8.159a.458.458 0 010-.917h8.16a.458.458 0 110 .917zM16.99 11.759h-4.034a.458.458 0 010-.917h4.034a.458.458 0 110 .917z" fill="#2D87F3"></path>
                                                    <path d="M21.163 23.79v3.599l-2.108-1.582-2.109 1.582-.046-3.598v-2.315l.046-.115a3.163 3.163 0 004.148.092h.138l-.069 2.338z" fill="#2743AD"></path>
                                                    <path d="M19.032 16.09a3.163 3.163 0 11-.003 6.325 3.163 3.163 0 01.003-6.325z" fill="#2D87F3"></path>
                                                    </svg>
                                                    <span>Học tập và kinh nghiệm làm việc</span>
                                                </h6>
                                                <div class="qualication-detail">
                                                    <ul>
                                                        <li><p>${doctorProfile.qualification}</p></li>

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <hr class="mt-5 mb-3">
                                        <div class="">
                                            <a class="btn btn-primary ms-3 fw-bold" style="padding: 0.4rem" href="${context}/manager/doctor/schedule?id=${doctorProfile.doctorId}">Lịch làm việc</a>
                                        </div>
                                    </section> <!-- content-body .// -->
                                </div> <!-- col.// -->

                                <div class="col-lg-4">
                                    <div class="account-info">
                                        <h6 class="account-infor_header">Thông tin tài khoản</h6>
                                        <p><span>Số điện thoại:  </span> ${doctorProfile.user.phoneNumber}</p>
                                        <p><span>Ngày sinh:  </span>  ${doctorProfile.user.dob}</p>
                                        <p class="ps-1"><span>Địa chỉ:  </span> ${doctorProfile.user.address}</p>
                                        <div class="action">
                                            <a class="btn btn-success rounded-pill py-1 fs-bold" 
                                               href="${context}/manager/user/detail?id=${doctorProfile.doctorId}"
                                               style="background: #4ae882;">Chỉnh sửa</a>
                                            <a href="mailto:${doctorProfile.user.email}?subject=Feedback&body=Message" target="_blank" class="btn btn-secondary rounded-pill py-1">Liên hệ</a>
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
