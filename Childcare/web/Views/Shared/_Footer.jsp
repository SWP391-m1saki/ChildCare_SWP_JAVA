<%-- 
    Document   : _Footer
    Created on : Oct 7, 2022, 2:36:46 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<c:set var="context" value="${pageContext.request.contextPath}" />
<div class="container-fluid bg-dark text-light mt-5 py-5">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-3 col-md-6">
                <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 border-secondary mb-4">Thông tin liên lạc</h4>
                <p class="mb-4">Hãy liên lạc với chúng tôi qua những cách sau</p>
                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary me-3"></i>Khu Giáo dục và Đào tạo – Khu Công nghệ cao Hòa Lạc – Km29 Đại lộ Thăng Long, H. Thạch Thất, TP. Hà Nội</p>
                <p class="mb-2"><i class="fa fa-envelope text-primary me-3"></i>daihocfpt@fpt.edu.vn</p>
                <p class="mb-0"><i class="fa fa-phone-alt text-primary me-3"></i>024 7300 1866</p>
            </div>
            <div class="col-lg-3 col-md-6">
                <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 border-secondary mb-4">Đường dẫn</h4>
                <div class="d-flex flex-column justify-content-start">
                    <a class="text-light mb-2" href="${context}/loadHomePage"><i class="fa fa-angle-right me-2"></i>Home</a>
                    <a class="text-light mb-2" href="${context}/loadDoctor"><i class="fa fa-angle-right me-2"></i>Bác sĩ</a>
                    <a class="text-light mb-2" href="${context}/chuyen-muc"><i class="fa fa-angle-right me-2"></i>Chuyên mục</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 border-secondary mb-4">Phổ biến</h4>
                <div class="d-flex flex-column justify-content-start">
                    <a class="text-light mb-2" href="${context}/loadHomePage"><i class="fa fa-angle-right me-2"></i>Home</a>
                    <a class="text-light mb-2" href="${context}/loadDoctor"><i class="fa fa-angle-right me-2"></i>Bác sĩ</a>
                    <a class="text-light mb-2" href="${context}/chuyen-muc"><i class="fa fa-angle-right me-2"></i>Chuyên mục</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">

                <h6 class="text-primary text-uppercase mt-4 mb-3">Theo dõi chúng tôi qua</h6>
                <div class="d-flex">
                    <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-2" href="https://www.youtube.com/channel/UCLfZhl8uJXAK2wtA4_IbEMA"><i class="fab fa-youtube"></i></a>
                    <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-2" href="https://www.facebook.com/DaihocFPTHaNoi"><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-2" href="https://www.linkedin.com/school/fpt-university/"><i class="fab fa-linkedin-in"></i></a>
                    <a class="btn btn-lg btn-primary btn-lg-square rounded-circle" href="https://www.instagram.com/fpt_university/"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid bg-dark text-light border-top border-secondary py-4">
    <div class="container">
        <div class="row g-5">
            <div class="col-md-6 text-center text-md-start">
                <p class="mb-md-0">&copy; <a class="text-primary" href="#">ChildCare System</a>. All Rights Reserved.</p>
            </div>
        </div>
    </div>
</div>
