<%-- 
    Document   : schedule-shift-detail
    Created on : Oct 25, 2022, 6:33:50 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lịch làm việc</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <c:set var="context" value="${pageContext.request.contextPath}" />        
        <div class="page-wrapper">
            <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->
                <main class="main-admin-page">
                    <!--HEADER-->
                <jsp:include page="header.jsp"></jsp:include>
                    <!--HEADER-->

                    <section class="content-main edit-account ms-5" style="max-width: 1120px">

                        <div class="content-header">
                            <h3 class="content-title my-4">Lịch làm việc</h3>
                        </div>

                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="container">

                                        <c:if test="${requestScope.work_doctors != null && requestScope.work_doctors.size() != 0}">

                                            <div class="table-responsive">
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Bác sĩ</th>
                                                            <th class="text-end"> Hành động </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${requestScope.work_doctors}" var="d">
                                                            <tr>
                                                                <td>
                                                                    <a href="${context}/manager/doctor/profile/detail?id=${d.doctorId}" class="text-dark d-flex justify-content-start align-items-center">
                                                                        <div class="left">
                                                                            <img src="${context}/img/${d.user.avatar}" class="img-xs image p-1 rounded-circle" width="80" height="80" alt="Ảnh bac si">
                                                                        </div>
                                                                        <div class="ms-3">
                                                                            <h6 class="mb-0 title">${d.user.name}</h6>
                                                                        </div>
                                                                    </a>
                                                                </td>
                                                                <td class="text-end">
                                                                    <button class="btn btn-close"></button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table> <!-- table-responsive.// -->
                                            </c:if>
                                            <c:if test="${requestScope.work_doctors == null || requestScope.work_doctors.size() == 0}">
                                                <h3>Không có bác sĩ nào</h3>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">

                                </div>
                            </div>
                        </div>

                    </div> <!-- card end// -->
                </section>
            </main>
        </div>
    </body>
</html>
