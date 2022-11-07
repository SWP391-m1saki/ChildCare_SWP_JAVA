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
    .page-wrapper {
        margin: 0;
        padding: 0;
        position: relative;
    }

    .left-aside {
        position: fixed;
        top: 0;
        left: 0;
        width: 19%;
        height: 100vh;
        font-family: 'Mulish', sans-serif;
    }

    main {
        position: absolute;
        top: 0;
        right: 0;
        width: 81%;
    }

    .left-aside .text {
        font-family: poppins, sans-serif;
        color: #676b84;
        font-size: 17px;
        font-weight: 500;
    }


</style>



<nav class="left-aside fixed-aside bg-white">
    <div class="aside-top logo d-flex justify-content-between">
        <a href="${pageContext.request.contextPath}/manager/doctor/profile" class="p-3">
            <img src="${pageContext.request.contextPath}/img/logo_manager.png" alt="">
        </a>
        <div class="sidebar_close_icon">
            <button class="btn btn-icon btn-aside-minimize">
                <i class="fa fa-bars"></i>
            </button>
        </div>
    </div>

    <div class="aside-body p-3">
        <ul class="menu-aside menu">
            <li class="menu-item">
                <a class="menu-link" href="${pageContext.request.contextPath}/admin/dashboard">
                    <img src="${pageContext.request.contextPath}/img/home.svg">
                    <span class="text ms-4">Dashboard</span>
                </a>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="${pageContext.request.contextPath}/manager/doctor/profile">
                    <img src="${pageContext.request.contextPath}/img/users.svg">
                    <span class="text ms-4">Bác sĩ</span>
                </a>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="${pageContext.request.contextPath}/manager/schedule">
                    <img src="${pageContext.request.contextPath}/img/calendar.svg">
                    <span class="text ms-4">Lịch làm việc</span>
                </a>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="${pageContext.request.contextPath}/manager/user">
                    <img src="${pageContext.request.contextPath}/img/users.svg">
                    <span class="text ms-4">Người dùng</span>
                </a>
            </li>

            <li class="menu-item">
                <a class="menu-link" href="${pageContext.request.contextPath}/manager/account">
                    <img src="${pageContext.request.contextPath}/img/settings_gray.svg">
                    <span class="text ms-4">Account Setting</span>
                </a>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="${pageContext.request.contextPath}/manager/review">
                    <img src="${pageContext.request.contextPath}/img/calendar.svg">
                    <span class="text ms-4">Đánh giá</span>
                </a>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="${pageContext.request.contextPath}/doctor/request/list">
                    <img src="${pageContext.request.contextPath}/img/edit.svg">
                    <span class="text ms-4">Quản lí đơn xin nghỉ</span> </a>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="${pageContext.request.contextPath}/admin/chat">
                    <img src="${pageContext.request.contextPath}/img/calendar.svg">
                    <span class="text ms-4">Chat với người dùng</span> </a>
            </li>
        </ul>
    </div>
</nav>
