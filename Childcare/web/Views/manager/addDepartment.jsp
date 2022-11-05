<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Quản lý Chuyên khoa</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/ui.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <div class="page-wrapper">
            <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->

                <style>
                    .content-main{
                        padding: 20px 50px;
                    }
                </style>
                <main class="main-admin-page">
                    <!--HEADER-->
                <jsp:include page="header.jsp"></jsp:include>
                    <section class="content-main mx-2">
                        <div class="content-header mb-3">
                            <h2 class="content-title ms-2 fs-3">Quản lý chuyên khoa</h2>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-10 mx-auto py-3">

                                            <table class="table">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th scope="col">Id</th>
                                                        <th scope="col">Department name</th>
                                                        <th scope="col">Image</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${requestScope.departmentList}" var="d">
                                                    <tr>
                                                        <th scope="row">${d.departmentId}</th>
                                                        <td>${d.departmentName}</td>
                                                        <td><img src="${pageContext.request.contextPath}/img/${d.image}" class="img-thumbnail" length="80" width="80"></td>
                                                        <td class="text-end"><a class="btn btn-secondary" href="deleteDepartment?id=${d.departmentId}"> Delete </a></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                        <form action="addDepartment" method="post">

                                            <div class="form-outline mb-4">
                                                <input type="text" id="name" class="form-control form-control-lg" name="name"/>
                                                <label class="form-label" for="name">Department name</label>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="text" id="img" class="form-control form-control-lg" name="img"/>
                                                <label class="form-label" for="img">Image</label>
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="text-center text-lg-start mt-4 pt-2">
                                                    <button class="btn btn-primary btn-lg" type="submit"
                                                            style="padding-left: 2.5rem; padding-right: 2.5rem;">Add</button>

                                                </div>
                                            </div>

                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                </section>
            </main>
        </div>
    </body>
</html>
