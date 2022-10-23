<%-- 
    Document   : postList.jsp
    Created on : Oct 3, 2022, 9:07:49 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí bài viết</title>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/ui.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>

        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

                <section class="content-main">

                    <div class="content-header">
                        <h2 class="content-title">Quản lí bài viết</h2>
                    </div>
                    <div class="mb-3">
                        <a href="${context}/manager/post/create" class="btn btn-primary"><i class="material-icons md-plus"></i>Viết bài mới</a>
                    </div>

                    <div class="card mb-4">
                        <header class="card-header">
                            <div class="row gx-3">

                                <!--SEARCH BAR-->
                                <div class="col-lg-4 col-md-6 me-auto">
                                    <input type="text" name="search" form="main-form" placeholder="Tìm kiếm tên bài viết" class="form-control fw-bold" value="${requestScope.search}" onkeyup="postAjaxList();">
                                </div>

                                <div class="col-lg-2 col-md-3 col-6">
                                    <select class="form-select fw-bold" name="cid" form="main-form">
                                        <option value="-1" ${(requestScope.cid == -1)?'selected':''}>
                                        <span>Chuyên mục</span>
                                        </option>
                                        <c:forEach items="${requestScope.postCategory}" var="c">
                                            <option value="${c.cateId}"
                                                    <c:if test="${requestScope.cid== c.cateId}">selected</c:if> >
                                                ${c.cateName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-lg-2 col-md-3 col-6">
                                </div>

                            </div>
                        </header> <!-- card-header end// -->
                        <div class="card-body" id='list-display'>
                            <c:if test="${requestScope.postList != null && requestScope.postList.size() != 0}">

                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Bài viết</th>
                                                <th>Tiêu đề</th>
                                                <th>Chuyên mục</th>
                                                <th>Ngày viết</th>
                                                <th class="text-end"> Hành động </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.postList}" var="p">
                                                <tr>
                                                    <td>
                                                        <a href="#" class="itemside">
                                                            <img src="${context}/img/${p.image}" class="img-lg image p-1" alt="Ảnh bài viết" id="show-avatar">
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <div style="max-width: 430px">
                                                            <h4>${p.title}</h4>
                                                            <p style="
                                                               max-height: 100px;
                                                               white-space: normal;
                                                               overflow: hidden;
                                                               text-overflow: ellipsis;
                                                               ">${p.description}</p>
                                                        </div>
                                                    </td>
                                                    <td class="fw-bold">
                                                        <c:forEach items="${requestScope.postCategory}" var="c">
                                                            <c:if test="${c.cateId == p.cateId}">${c.cateName}</c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${p.createdAt}"></fmt:formatDate>
                                                        </td>
                                                        <td class="text-end">
                                                            <div class="mb-2">
                                                                <a href="${context}/bai-viet?id=${p.postId}" class="btn btn-light">Chi tiết</a>
                                                        </div>
                                                        <div class="mb-2">
                                                            <a class="btn btn-secondary" href="${context}/manager/post/update?id=${p.postId}">Chỉnh sửa</a>
                                                            <a class="btn btn-danger"  onclick="return confirm('Bạn có chắc chắn muốn xóa?')" href="${context}/manager/post/delete?id=${p.postId}">Xóa</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table> <!-- table-responsive.// -->
                                </c:if>
                                <c:if test="${requestScope.postList == null || requestScope.postList.size() == 0}">
                                    <h3>Không có bài viết nào</h3>
                                </c:if>
                            </div>
                        </div> <!-- card-body end// -->
                    </div> <!-- card end// -->

                    <!--Display PAGING if list has item
                            Else empty form-->
                    <c:choose>
                        <c:when test="${requestScope.postList != null && requestScope.postList.size() != 0}">
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
                                                                function postAjaxList() {
                                                                    ajaxCall('/Childcare/AjaxPostList', 'list-display');
                                                                    ajaxCall('/Childcare/AjaxPostPaging', 'paging-div');
                                                                }

                                                                function ajaxCall(url, id) {
                                                                    $.ajax({
                                                                        url: url,
                                                                        type: "POST",
                                                                        data: {
                                                                            search: document.querySelector('input[name="search"]').value,
                                                                            cid: document.querySelector('select[name="cid"]').value,
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
                                                                document.querySelector('select[name="cid"]').addEventListener('change', function () {
                                                                    postAjaxList();
                                                                });
//                                                                document.querySelector('input[name="search"]').addEventListener('input', function () {
//                                                                    postAjaxList();
//                                                                });
//                                                                $('#main-form').change(function (e) {
//                                                                    if (e.target.matches('select[name="pagesize"]')) {
//                                                                        doctorListAjax();
//                                                                    }
//                                                                });
        </script>
    </body>
</html>
