<%-- 
    Document   : customer-info-list
    Created on : Oct 20, 2022, 10:19:56 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Quản lí người dùng</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/ui.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <script src='${pageContext.request.contextPath}/js/pagger.js'></script>
        <link href="${pageContext.request.contextPath}/css/pagger.css" rel="stylesheet" type="text/css"/>
        
    </head>

    <body>
        <style>
            .content-main{
                padding: 20px;
            }
        </style>
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <div class="page-wrapper">
            <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->

                <main class="main-admin-page">
                    <!--HEADER-->
                <jsp:include page="header.jsp"></jsp:include>
                    <!--HEADER-->

                    <section class="content-main mx-2">
                        <div class="content-header mb-3">
                            <h2 class="content-title ms-2 fs-4">Quản lí người dùng</h2>
                            <div>
                                <!--<a href="#" class="btn btn-primary"><i class="material-icons md-plus"></i> Create new</a>-->
                            </div>
                        </div>

                        <div class="card mb-4">
                            <header class="card-header bg-white">
                                <div class="row gx-3">
                                    <div class="col-lg-4 col-md-6 me-auto">
                                        <input type="text" name="search" form="main-form" placeholder="Tìm kiếm tên hoặc email" class="form-control" value="${requestScope.search}">
                                </div>
                                <div class="col-lg-2 col-md-3 col-6">

                                </div>
                                <div class="col-lg-2 col-md-3 col-6">
                                </div>
                            </div>
                        </header> <!-- card-header end// -->
                        <div class="card-body">

                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Người dùng</th>
                                            <th>Email</th>
                                            <th>Điện thoại</th>
                                            <th class="text-end"> Hành động </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.userList}" var="u">
                                            <tr>
                                                <td width="40%">
                                                    <a href="${context}/manager/user/detail?id=${u.id}" class="itemside">
                                                        <div class="left">
                                                            <c:choose>
                                                                <c:when test="${u.avatar != null}">
                                                                    <img src="${context}/img/${u.avatar}" class="img-sm img-avatar" alt="User Photo" id="show-avatar">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <img src="${context}/img/default-avatar.jpg" class="img-sm img-avatar" alt="User Photo" id="show-avatar">
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <div class="info pl-3">
                                                            <h6 class="mb-0 title">${u.name}</h6>
                                                            <small class="text-muted">ID: #${u.id}</small>
                                                        </div>
                                                    </a>
                                                </td>
                                                <td>${u.email}</td>
                                                <td>${u.phoneNumber}</td>
                                                <td class="text-end">
                                                    <a href="${context}/manager/user/detail?id=${u.id}" class="btn btn-light">Chỉnh sửa</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table> <!-- table-responsive.// -->
                            </div>

                        </div> <!-- card-body end// -->
                    </div> <!-- card end// -->


                    <!--Display PAGING if list has item
                            Else empty form-->
                    <c:choose>
                        <c:when test="${requestScope.userList != null && requestScope.userList.size() != 0}">
                            <jsp:include page="../Shared/_Paging.jsp"></jsp:include>
                        </c:when> 
                        <c:otherwise>
                            <form method="post" id="main-form">
                            </form>
                        </c:otherwise>
                    </c:choose>
                </section>
            </main>
        </div>

        <script src="${context}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
    </body>
</html>
