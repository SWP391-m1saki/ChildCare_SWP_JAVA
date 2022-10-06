<%-- 
    Document   : postList.jsp
    Created on : Oct 3, 2022, 9:07:49 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/ui.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>

        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
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
                                    <input type="text" name="search" form="main-form" placeholder="Tìm kiếm tên bài viết" class="form-control fw-bold" value="${requestScope.search}">
                                </div>

                                <div class="col-lg-2 col-md-3 col-6">
                                    <select class="form-select fw-bold" name="cid" onchange="this.form.submit();" form="main-form">
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
                        <div class="card-body">

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
                                                        <img src="${context}/img/${p.image}" class="img-lg image p-1" alt="User Photo" id="show-avatar">
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
                            </div>

                        </div> <!-- card-body end// -->
                    </div> <!-- card end// -->

                    <jsp:include page="../Share/_Paging.jsp"></jsp:include>

                    </section>
                </main>
            </div>
            <script src="${context}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
    </body>
</html>
