<%-- 
    Document   : doctor-profile-list-manager
    Created on : Oct 10, 2022, 3:39:57 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí bác sĩ</title>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/ui.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>

        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <script src='${pageContext.request.contextPath}/js/pagger.js'></script>
        <link href="${pageContext.request.contextPath}/css/pagger.css" rel="stylesheet" type="text/css"/>
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

                    <!--Message display-->
                    <script type="text/javascript">
                        if (${requestScope.mess != null}) {
                            if (${requestScope.mess[0] == "sucess"}) {
                                toastr.success(${requestScope.mess[1]});
                            } else {
                                toastr.error(${requestScope.mess[1]});
                            }
                        }
                </script>

                <section class="content-main p-4 pt-3">

                    <div class="content-header d-flex mb-3">
                        <h3 class="content-title ms-2">Quản lí bác sĩ</h3>
                        <div class="">
                            <a href="${context}/manager/doctor/new" class="btn btn-primary py-2"><i class="material-icons md-plus"></i>Thêm bác sĩ</a>
                        </div>
                    </div>


                    <div class="card mb-4">
                        <header class="card-header">
                            <div class="row gx-3" id="filter-control">

                                <!--SEARCH BAR-->
                                <div class="col-lg-4 col-md-6 me-auto">
                                    <input type="text" name="search" form="main-form" placeholder="Tìm kiếm tên bác sĩ" class="form-control fw-bold" value="${requestScope.search}" onkeyup="doctorListAjax();">
                                </div>

                                <div class="col-lg-2 col-md-3 col-6">
                                    <select class="form-select fw-bold" name="depId" form="main-form">
                                        <option value="-1" ${(requestScope.depId == -1)?'selected':''}>
                                        <span>Chuyên khoa</span>
                                        </option>
                                        <c:forEach items="${requestScope.departments}" var="d">
                                            <option value="${d.key}"
                                                    <c:if test="${requestScope.depId == d.key}">selected</c:if> >
                                                ${d.value.departmentName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-lg-2 col-md-3 col-6">
                                </div>

                            </div>
                        </header> <!-- card-header end// -->
                        <div class="card-body">
                            <div id="list-display">                         
                                <c:if test="${requestScope.doctorList != null && requestScope.doctorList.size() != 0}">

                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Bác sĩ</th>
                                                    <th>Chuyên khoa</th>
                                                    <th>Chức danh</th>
                                                    <th class="text-end"> Hành động </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.doctorList}" var="d">
                                                    <tr>
                                                        <td width="40%">
                                                            <a href="${context}/manager/doctor/profile/detail?id=${d.doctorId}" class="itemside">
                                                                <div class="left">
                                                                    <img src="${context}/img/${d.user.avatar}" class="img-md image p-1" alt="Ảnh bac si" id="show-avatar">
                                                                </div>
                                                                <div class="info pl-3">
                                                                    <h6 class="mb-0 title">${d.user.name}</h6>
                                                                </div>
                                                            </a>
                                                        </td>
                                                        <td class="fw-bold">${requestScope.departments.get(d.departmentId).departmentName}</td>
                                                        <td>
                                                            ${d.title}
                                                        </td>
                                                        <td class="text-end">
                                                            <a href="${context}/manager/doctor/profile/detail?id=${d.doctorId}" class="btn btn-light">Chi tiết</a>
                                                            <a class="btn btn-primary" style="padding: 0.4rem" href="${context}/manager/doctor/schedule?id=${d.doctorId}">Lịch trực</a>
                                                        </td>
                                                    </tr>

                                                </c:forEach>
                                            </tbody>
                                        </table> <!-- table-responsive.// -->
                                    </c:if>
                                    <c:if test="${requestScope.doctorList == null || requestScope.doctorList.size() == 0}">
                                        <h3>Không có bác sĩ nào</h3>
                                    </c:if>
                                </div>
                            </div>
                        </div> <!-- card-body end// -->
                    </div> <!-- card end// -->

                    <!--Display PAGING if list has item
                            Else empty form-->
                    <c:choose>
                        <c:when test="${requestScope.doctorList != null && requestScope.doctorList.size() != 0}">
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                                        function doctorListAjax() {
                                            ajaxCall('/Childcare/AjaxDoctorList', 'list-display');
                                            ajaxCall('/Childcare/AjaxDoctorPaging', 'paging-div');
                                        }

                                        function ajaxCall(url, id) {
                                            $.ajax({
                                                url: url,
                                                type: "POST",
                                                data: {
                                                    search: document.querySelector('input[name="search"]').value,
                                                    depId: document.querySelector('select[name="depId"]').value,
                                                    pagesize: document.querySelector('select[name="pagesize"]').value,
                                                    page: document.querySelector('input[name="pageindex"]').value
                                                },
                                                async: true,
                                                success: function (data) {
                                                    var row = document.getElementById(id);
                                                    row.innerHTML = data;
                                                },
                                                error: function () {
                                                    alert('Errore');
                                                },
                                                complete: function () {
                                                    if (id === 'paging-div') {
                                                        pagger('pagger', parseInt(document.querySelector('input[name="pageindex"]').value, 10), document.querySelector('input[name="totalpage"]').value, 2, -1);
                                                    }
                                                }
                                            });
                                        }
                                        document.querySelector('select[name="depId"]').addEventListener('change', function () {
                                            doctorListAjax();
                                            alert();
                                        });
        </script>
    </body>
</html>