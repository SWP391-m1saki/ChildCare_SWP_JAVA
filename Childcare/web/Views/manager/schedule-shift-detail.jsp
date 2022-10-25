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
                                <div class="container table-schedule">
                                    <div class="table-responsive">
                                        <table class="table table-bordered text-center">
                                            <thead>
                                                <tr class="bg-light-gray">
                                                    <th>Bac si</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${requestScope.work_doctors}" var="d">
                                                <tr>
                                                    <td width="40%">
                                                        <a href="${context}/manager/doctor/profile/detail?id=${d.doctorId}" class="itemside">
                                                            <div class="left">
                                                                <img src="${context}/img/${d.user.avatar}" class="img-md image p-1" alt="Ảnh bac si" id="show-avatar">
                                                            </div>
                                                            <div class="info pl-3">
                                                                <h6 class="mb-0 title">${d.title} ${d.user.name}</h6>
                                                            </div>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div> <!-- card end// -->
                </section>
            </main>
        </div>
    </body>
</html>
