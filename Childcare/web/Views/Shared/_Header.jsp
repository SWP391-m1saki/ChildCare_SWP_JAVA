<%@page contentType="text/html" pageEncoding="UTF-8" %>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Topbar Start -->
        <c:set var="context" value="${pageContext.request.contextPath}" />

        <div class="container-fluid py-2 border-bottom d-none d-lg-block">
            <div class="container">
                <div class="row">
                    <div class="col-md-6  text-lg-start mb-2 mb-lg-0">
                        <div class="d-inline-flex align-items-center">
                            <a class="text-decoration-none text-body pe-3" href=""><i class="bi bi-telephone me-2"></i>
                                024 7300 1866</a>
                            <span class="text-body">|</span>
                            <a class="text-decoration-none text-body px-3" href=""><i
                                    class="bi bi-envelope me-2"></i>daihocfpt@fpt.edu.vn</a>
                        </div>
                    </div>
                    <div class="col-md-6 text-center text-lg-end">
                        <div class="d-inline-flex align-items-center">
                            <a class="text-body px-2" href="https://www.facebook.com/DaihocFPTHaNoi">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a class="text-body px-2" href="https://www.linkedin.com/school/fpt-university/">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                            <a class="text-body px-2" href="https://www.instagram.com/fpt_university/">
                                <i class="fab fa-instagram"></i>
                            </a>
                            <a class="text-body ps-2" href="https://www.youtube.com/channel/UCLfZhl8uJXAK2wtA4_IbEMA">
                                <i class="fab fa-youtube"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->

        <style>
            #navbarCollapse a {
                color: #1b3250;
            }
        </style>

        <!-- Navbar Start -->
        <div class="container-fluid sticky-top bg-white shadow-sm">
            <div class="container">
                <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0">
                    <a href="loadHomePage" class="navbar-brand">
                        <h1 class="m-0 text-uppercase text-primary fs-2 my-2"><i
                                class="fa fa-clinic-medical me-2"></i>Childcare System</h1>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse " id="navbarCollapse">
                        <div class="navbar-nav ms-auto py-0 align-items-center">
                            <a href="${context}/loadHomePage" class="nav-item nav-link fs-6 fw-bold ">Trang chủ</a>
                            <a href="${context}/chooseDepartment" class="nav-item nav-link fs-6 fw-bold">Đặt lịch
                                khám</a>
                            <a href="${context}/loadDoctor" class="nav-item nav-link fs-6 fw-bold">Bác sĩ</a>
                            <a href="${context}/chuyen-muc" class="nav-item nav-link fs-6 fw-bold">Chuyên mục</a>
                            <!--                    <a href="${context}/loadAbout" class="nav-item nav-link active fs-6 fw-bold">Về chúng tôi</a>-->

                            <c:if test="${sessionScope.UserLogined == null}">
                                <a href="login" class="nav-item active nav-link fs-6 fw-bold">Đăng nhập</a>
                            </c:if>

                            <c:if test="${sessionScope.UserLogined != null}">

                                <!--<span class="">${sessionScope.UserLogined.name}</span>-->
                                <div class="btn-group">
                                    <button type="img" class="btn btn-infor pe-0"> <img
                                            src="${context}/img/${sessionScope.UserLogined.avatar != null ? sessionScope.UserLogined.avatar : 'default-avatar.jpg'}"
                                            class="rounded-circle" width="45" height="45" alt="Avatar"
                                            loading="lazy" /></button>
                                    <button type="button" class="btn btn-infor btn-sm dropdown-toggle fs-5"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>

                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="${context}/userProfile">Thông tin cá nhân</a>
                                        <a class="dropdown-item" href="${context}/loadChildren">Hồ sơ của trẻ</a>
                                        <a class="dropdown-item" href="${context}/loadCustomerAppointment">Lịch sử đặt
                                            khám</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="${context}/logout">Đăng xuất</a>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->