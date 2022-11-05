<%-- 
    Document   : doctor-change-shift-list
    Created on : Oct 27, 2022, 8:17:36 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đơn xin nghỉ</title>
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
                <%--<jsp:include page="header.jsp"></jsp:include>--%>
                <!--HEADER-->

                <section class="content-main">
                    <div class="content-header">
                        <h2 class="content-title">Lịch sử đơn thay đổi lịch làm việc</h2>
                    </div>

                    <div class="card mb-4">
                        <header class="card-header">
                            <div class="row gx-3" id="filter-control">

                                <!--SEARCH BAR-->
                                <div class="col-lg-4 col-md-6 me-auto">
                                    <input type="text" name="search" form="main-form" placeholder="Tìm kiếm tên bác sĩ" class="form-control fw-bold" value="${requestScope.search}" onkeyup="doctorListAjax();">

                                </div>
                                <!-- Select -->
                                <div class="col-lg-7 col-md-6 me-auto d-flex justify-content-end w-50">
                                    <select class="form-select fw-bold w-50" name="status" form="main-form" onchange="this.form.submit()">
                                        <option value="-1" ${(requestScope.status == -1)?'selected':''}>
                                        <span>Trạng thái</span>
                                        </option>
                                        <option value="1" ${(requestScope.status == 1)?'selected':''}>Chưa xác nhận</option>
                                        <option value="2" ${(requestScope.status == 2)?'selected':''}>Chấp nhận</option>
                                        <option value="3" ${(requestScope.status == 3)?'selected':''}>Từ chối</option>
                                    </select>

                                </div>


                            </div>
                        </header> <!-- card-header end// -->
                        <div class="card-body">
                            <div id="list-display">                         
                                <c:if test="${requestScope.changeRequestList != null && requestScope.changeRequestList.size() != 0}">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Hình ảnh</th>
                                                    <th>Bác sĩ</th>
                                                    <th>Thời gian gửi</th>
                                                    <th>Thông tin</th>
                                                    <th>Trạng thái</th>
                                                    <th>Thời gian trả lời</th>
                                                    <th>Thông tin trả lời</th>
                                                    <th class="text-end"> Hành động </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.changeRequestList}" var="d">
                                                    <tr>

                                                        <td><img class="mb-3 rounded-circle shadow-4" src="${context}/img/${d.doctor.user.avatar}" style="width: 100px;height:100px" alt="Avatar"/></td>
                                                        <td>${d.doctor.user.name}</td>
                                                        <td>${d.requestTime}</td>
                                                        <td>${d.description}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${d.status == 1}">
                                                                    <span class="badge rounded-pill alert-warning">${d.getStatusLable()}</span>
                                                                </c:when>
                                                                <c:when test="${d.status == 2}">
                                                                    <span class="badge rounded-pill alert-success">${d.getStatusLable()}</span>
                                                                </c:when>
                                                                <c:when test="${d.status == 3}">
                                                                    <span class="badge rounded-pill alert-danger">${d.getStatusLable()}</span>
                                                                </c:when>
                                                            </c:choose>                                                         
                                                        </td>
                                                        <td>
                                                            ${d.reponseTime}
                                                        </td>
                                                        <td>${d.reponseDescription}</td>
                                                        <td class="text-end">
                                                            <a href="${context}/manager/doctor/shift/update?id=${d.requestId}" class="btn btn-light">Chi tiết</a>

                                                        </td>
                                                    </tr>

                                                </c:forEach>
                                            </tbody>
                                        </table> <!-- table-responsive.// -->
                                    </c:if>
                                    <c:if test="${requestScope.changeRequestList == null || requestScope.changeRequestList.size() == 0}">
                                        <h3>Không có đơn nào</h3>
                                    </c:if>
                                </div>
                            </div>
                        </div> <!-- card-body end// -->
                    </div> <!-- card end// -->

                    <!--Display PAGING if list has item
                            Else empty form-->
                    <c:choose>
                        <c:when test="${requestScope.changeRequestList != null && requestScope.changeRequestList.size() != 0}">
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
</body>
</html>
