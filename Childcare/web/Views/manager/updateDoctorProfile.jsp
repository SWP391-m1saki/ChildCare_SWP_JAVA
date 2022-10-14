<%-- 
    Document   : update Doctor profile
    Created on : Oct 10, 2022, 3:39:03 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Chỉnh sửa hồ sơ bác sĩ</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/add-product.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <c:set var="doctorProfile" value="${requestScope.doctorProfile}"/>
        <div class="page-wrapper">
            <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->
                <main class="main-admin-page">
                    <!--HEADER-->
                <jsp:include page="header.jsp"></jsp:include>
                <!--HEADER-->

                <section class="content-main" style="max-width: 900px">
                    <div class="content-header p-1 ps-3 mb-3">
                        <h3 class="content-title">Chỉnh sửa hồ sơ bác sĩ</h3>
                    </div>

                    <div class="content-body">
                        <div class="add-form ms-3">
                            <div class="form-item">
                                <h5 class="p-3" style="
                                    color: #4644a3;
                                    background: #fdfdfd;
                                    width: fit-content;
                                    border-radius: 10px;
                                    border: 1px solid #f0f0f0;
                                    ">Bác sĩ Hoàng Minh Nhựt</h5>
                            </div>

                            <form method="POST">

                                <div class="row gx-3">
                                    <div class="col-6  mb-3">
                                        <label class="form-label fw-bold fs-6">Chức danh</label>
                                        <input name="title" class="form-control" value="${doctorProfile.title}" type="text" placeholder="Nhập gì đó">
                                    </div> <!-- col .// -->
                                </div><!-- comment -->

                                <div class="row gx-3">
                                    <div class="col-6  mb-3">
                                        <label class="form-label fw-bold fs-6">Chọn chuyên khoa</label>
                                        <select name="department" class="form-select">
                                            <c:forEach items="${requestScope.departments}" var="d">
                                                <option ${d.key == doctorProfile.departmentId ? 'selected' : ''} value="${d.key}">${d.value.getDepartmentName()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-10  mb-3">
                                        <label class="form-label fw-bold fs-6">Thông tin giới thiệu</label>
                                        <textarea name="qualification" class="form-control">${doctorProfile.description}</textarea>
                                    </div>

                                    <div class="col-10  mb-3">
                                        <label class="form-label fw-bold fs-6">Học vấn và kinh nghiệm làm việc</label>
                                        <textarea name="description" class="form-control" style="min-height: 100px">${doctorProfile.qualification}</textarea>
                                    </div>
                                </div>

                                <div class="row gx-3">
                                    <div class="col-2  mb-3">
                                        <label class="form-label fw-bold fs-6">Giá thăm khám</label>
                                        <input name="price" class="form-control" type="text" placeholder="" value="${doctorProfile.price}">
                                    </div> <!-- col .// -->
                                </div><!-- comment -->


                                <button type="submit" class="btn btn-primary">Cập nhật</button>
                            </form>
                        </div>
                    </div> <!-- card end// -->
                </section>
            </main>
        </div>
    </body>
</html>