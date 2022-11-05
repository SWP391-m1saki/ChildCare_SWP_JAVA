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
        <style>
            .scroll-overflow{
                overflow: hidden;
                overflow-y: scroll;
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

                    <section class="content-main edit-account ms-5" style="max-width: 1120px">

                        <div class="content-header">
                        </div>

                        <div class="card my-4">
                            <div class="card-header py-2">
                                <div class="row">
                                    <div class="col-6 d-flex align-items-center">
                                        <h5 class="content-title my-0 ms-3">Bác sĩ có lịch trực</h5>
                                    </div>
                                    <div class="col-5 d-flex justify-content-end">
                                        <a href="${context}/manager/schedule" class="btn btn-primary py-2">Quay lại</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row mb-3">
                                <div class="col-lg-2 col-md-3 col-6">
                                    <form id="select-department">
                                        <select class="form-select fw-bold" name="depId" onchange="this.form.submit()">
                                            <option value="-1" ${(requestScope.depId == -1)?'selected':''}>Chuyên khoa</option>
                                            <c:forEach items="${requestScope.departments}" var="d">
                                                <option value="${d.key}"
                                                        <c:if test="${requestScope.depId == d.key}">selected</c:if> >
                                                    ${d.value.departmentName}
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <input type="hidden" name="weeknum" value="${requestScope.weeknum}">
                                        <input type="hidden" name="shift" value="${requestScope.shift}">
                                    </form>
                                </div>
                                <div class="offset-md-4 col-5 d-flex align-items-center">
                                    <h5 class="ms-2">Thêm bác sĩ vào ca trực</h5>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="container scroll-overflow" style="max-height: 500px">

                                        <c:if test="${requestScope.work_doctors != null && requestScope.work_doctors.size() != 0}">

                                            <div class="table-responsive" style="overflow-x: hidden">
                                                <table class="table table-hover" style="margin-right: 30px">
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
                                                                            <img src="${context}/img/${d.user.avatar}" class="img-xs image p-1 rounded-circle" width="70" height="70" alt="Ảnh bac si">
                                                                        </div>
                                                                        <div class="ms-3">
                                                                            <h6 class="mb-0 title">${d.user.name}</h6>
                                                                        </div>
                                                                    </a>
                                                                </td>
                                                                <td class="text-end">
                                                                    <button class="btn btn-close remove-doctor" value="${d.doctorId}"></button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table> <!-- table-responsive.// -->
                                            </div>
                                        </c:if>
                                        <c:if test="${requestScope.work_doctors == null || requestScope.work_doctors.size() == 0}">
                                            <h3>Không có bác sĩ nào</h3>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-lg-6 ps-4">
                                    <input type="text" name="search" form="main-form" placeholder="Tìm kiếm tên bác sĩ" class="form-control fw-bold w-75" value="${requestScope.search}">
                                    <form method="POST" action="">
                                        <div class="container scroll-overflow px-0 pt-2 search-list" style="max-height: 500px">

                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div> <!-- card end// -->
                </section>
            </main>
        </div>
        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">
                                            const removeDoctorBtns = Array.from(document.querySelectorAll('.remove-doctor'));
                                            removeDoctorBtns.forEach(btn => btn.addEventListener('click', (e) => {
                                                    const isConfirmed = confirm('Bạn có thực sự muốn thay đổi lịch của bác sĩ');
                                                    if (isConfirmed) {
                                                        $.ajax({
                                                            url: '/Childcare/ajax/schedule/remove-doctor',
                                                            type: "POST",
                                                            data: {
                                                                doctorId: e.currentTarget.value,
                                                                weeknum: document.querySelector('form input[name="weeknum"]').value,
                                                                shift: document.querySelector('form input[name="shift"]').value
                                                            },
                                                            async: true,
                                                            success: function (data) {

                                                            }
                                                        });
                                                        e.currentTarget.parentElement.parentElement.remove();
                                                    }
                                                }));
                                            document.querySelector('input[name="search"]').addEventListener('input', (e) => {
                                                $.ajax({
                                                    url: '/Childcare/ajax/schedule/search-doctor-to-add',
                                                    type: "POST",
                                                    data: {
                                                        search: e.currentTarget.value,
                                                        weeknum: document.querySelector('form input[name="weeknum"]').value,
                                                        shift: document.querySelector('form input[name="shift"]').value
                                                    },
                                                    async: true,
                                                    success: function (data) {
                                                        document.querySelector('.search-list').innerHTML = data;
                                                    }
                                                });
                                            });
        </script>
    </body>
</html>
