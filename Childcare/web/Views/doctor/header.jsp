<%-- 
    Document   : header
    Created on : Jun 26, 2022, 9:39:10 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
    .col-search form {
        width: 480px;
        position: relative;
    }
    .dropdown-menu-list img {
        width: 16px;
        margin-right: 10px;
    }
    .dropdown-menu-list{
        font-size: 16px;
        box-shadow: 0 0 20px 0 rgb(0 0 0 / 30%);
        border-radius: 5px;
        border: none;
    }
    .search_field input[type="text"] {
        padding: 1px 2px;
    }
    .search_field input {
        display: inline-block;
        font-size: 17px;
        height: 50px;
        width: 100%;
        padding-left: 87px;
        padding-right: 15px;
        border-bottom: 1px solid #f4f7fc;
        background: #f5f7fd;
        border-radius: 30px;
        border: none;
    }

    .search-btn{
        position: absolute;
        left: 0;
        top: 0;
        height: 100%;
        background: 0 0;
        font-size: 12px;
        border: 0;
        padding-left: 40px;
        padding-right: 11px;
    }

</style>
<header class="main-header navbar py-3 ms-1">
    <div class="col-search">
        <form action="#">
            <div class="search_field">
                <input type="text" class="text-secondary" style="padding-left: 87px;
                       padding-right: 15px;" placeholder="Search here...">
            </div>
            <button type="submit" class="search-btn"> <img src="${context}/img/search.svg"> </button>
        </form>
    </div>
    <div class="col-user">
        <li class="nav-item">
            <a class="nav-link btn-icon" href="#">
                <i class="fa-solid fa-bell"></i>
            </a>
        </li>
        <li class="dropdown nav-item">
            <a class="dropdown-account-toggle ms-3" href="#">
                <c:choose>
                    <c:when test="${sessionScope.UserLogined.avatar != null}">
                        <img src="${pageContext.request.contextPath}/img/${sessionScope.UserLogined.avatar}" class="img-user" alt="User Photo">
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/img/default-avatar.jpg" class="img-user" alt="User Photo">
                    </c:otherwise>
                </c:choose>
                <i class="fa-solid fa-caret-down" style="font-size: 16px"></i>
            </a>
            <div class="dropdown-menu-list dropdown-menu-end">
                
                <a class="dropdown-item" href="${context}/doctor/profile">
                    <img src="${context}/img/user.svg" alt="alt"/> Thông tin cá nhân
                </a>
                <a class="dropdown-item" href="${context}/logout">
                    <img src="${context}/img/log-out.svg" alt="alt"/> Đăng xuất
                </a>
            </div>
        </li>
    </div>
</header>
