<%-- 
    Document   : ASIDE
    Created on : Jun 26, 2022, 9:34:22 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link itemprop="url" rel="preconnect" href="https://fonts.googleapis.com">
<link itemprop="url" rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link itemprop="url" href="https://fonts.googleapis.com/css2?family=Mulish:wght@200;300&display=swap" rel="stylesheet">

<style>
    .left-aside .text {
        font-family: poppins, sans-serif;
        color: #676b84;
        font-size: 17px;
        font-weight: 500;
    }


    .menu-aside{
        background: #f3f3f3;
    }
    .menu-item {
        margin-left: 10px;
        width: 100%;
        justify-content: start;
    }
    ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        border: 1px solid #e7e7e7;
        background-color: #f3f3f3;
    }

    li {
        float: left;
    }

    li a {
        display: block;
        color: #666;
        padding: 14px 16px;
        text-decoration: none;
    }

    li a:hover:not(.active) {
        background-color: #ddd;
    }

    li a.active {
        color: white;
        background-color: #04AA6D;
    }
    
    .menu-item a.active {
        background-color: #ddd;
    }
</style>

<nav class="left-aside bg-white col-sm-4 bg-light text-white mx-auto p-5 align-items-center">
    <div class="aside-body p-3">
        <ul class="menu-aside menu">
            <li class="menu-item">
                <a class="menu-link ${pageContext.request.servletPath == '/Views/Customers/editProfile.jsp'? 'active': ''}" 
                     href="${pageContext.request.contextPath}/userProfile">
                    <img src="${pageContext.request.contextPath}/img/users.svg">
                    <span class="text ms-4">Thông tin cá nhân</span>
                </a>
            </li>
            <li class="menu-item">
                <a class="menu-link ${pageContext.request.servletPath == '/Views/Customers/loadCustomerAppointment.jsp'? 'active': ''}"
                   href="${pageContext.request.contextPath}/loadCustomerAppointment">
                    <img src="${pageContext.request.contextPath}/img/calendar.svg">
                    <span class="text ms-4">Lịch đặt khám</span>
                </a>
            </li>
            <li class="menu-item">
                <a class="menu-link ${pageContext.request.servletPath == '/Views/Customers/loadChildrenProfile.jsp'? 'active': ''}" 
                   href="${pageContext.request.contextPath}/loadChildren">
                    <img src="${pageContext.request.contextPath}/img/smile_gray.svg">
                    <span class="text ms-4">Hồ sơ của trẻ</span>
                </a>
            </li>
            <li class="menu-item">
                <a class="menu-link ${pageContext.request.servletPath == '/Views/Customers/verifyByOldPassword.jsp'? 'active': ''}" 
                   href="${pageContext.request.contextPath}/verifyByOldPassword">
                    <img src="${pageContext.request.contextPath}/img/lock.svg">
                    <span class="text ms-4">Đổi mật khẩu</span></a>
            </li>
        </ul>
    </div>
</nav>
