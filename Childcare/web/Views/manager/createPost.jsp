<%-- 
    Document   : createPost
    Created on : Oct 3, 2022, 3:13:22 PM
    Author     : Admin
--%>

<%-- 
    Document   : add-product
    Created on : Jun 26, 2022, 9:41:27 AM
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
        <title>Viết bài đăng</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/add-product.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>

        <!--RichTextEditor-->
        <base href="${pageContext.request.contextPath}/lib/richtexteditor"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/richtexteditor/rte_theme_default.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/richtexteditor/rte.js"></script>
        <script type="text/javascript" src='${pageContext.request.contextPath}/lib/richtexteditor/plugins/all_plugins.js'></script>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <c:set var="context" value="${pageContext.request.contextPath}"/>
        <div class="page-wrapper">
            <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->

                <main class="main-admin-page">
                    <!--HEADER-->
                <%--<jsp:include page="header.jsp"></jsp:include>--%>
                <!--HEADER-->

                <section class="content-main" style="max-width: 980px">
                    <div class="content-header">
                        <h2 class="content-title">Tạo bài viết mới</h2>
                        <div>
                            <a href="${pageContext.request.getContextPath()}/manager/post" class="btn btn-danger fw-bold"> × Hủy</a>
                        </div>
                    </div>

                    <div class="message">
                        <p class="text-danger">${requestScope.mess}</p>
                    </div>

                    <div class="content-body">
                        <div class="add-form">
                            <form method="POST">
                                <div class="form-item">
                                    <input type="text" name="title" required="required" placeholder="Tiêu đề bài viết" class="form-control fw-bold fs-5" value="${requestScope.post.title}">
                                </div>

                                <div class="form-row form-row-2">
                                    <div class="form-item">
                                        <label class="form-label fw-bold fs-6">Chọn danh mục</label>
                                        <select name="category" class="form-select">
                                            <c:forEach items="${requestScope.postCategory}" var="c">
                                                <option value="${c.cateId}">${c.cateName}</option>
                                            </c:forEach>
                                        </select>            
                                    </div>
                                    <style>
                                        .fa-plus{
                                            height: fit-content;
                                            width: fit-content;
                                            padding: 3px;
                                            border-radius: 5px;
                                            margin: auto 0;
                                            border: 1px solid #e8e8e8;
                                            transition: ease-in-out 100ms;
                                        }
                                        .fa-plus:hover {
                                            background: #e8e8e8;
                                            transform: scaleX(1.1);
                                        }
                                    </style>
                                    <i class="fa-solid fa-plus fs-5 text-primary fw-bold"></i>
<!--                                    <form method="post">
                                        <div class="form-item">
                                            <input type="text" name="title" required="required" placeholder="Tiêu đề bài viết" class="form-control">
                                        </div>
                                    </form>-->
                                </div>

                                <div class="form-item">
                                    <label class="form-label fw-bold fs-6">Mô tả bài viết</label>
                                    <textarea name="description" class="form-control"
                                              style="min-height: 100px">${requestScope.post.description}</textarea>
                                </div>

                                <div class="form-item">
                                    <label class="form-label fw-bold fs-6">Nội dung bài viết</label>
                                    <textarea name="content" id="div_editor1" class="form-control">
                                        ${requestScope.post.detail}
                                    </textarea>
                                </div>

                                <div class="form-row form-row-2">
                                    <div class="form-item">
                                        <label class="form-label fs-6 fw-bold">Hình ảnh chính</label>
                                        <input name="image" accept="image/*" class="form-control" type="file" 
                                               onchange="
                                                       document.getElementById('image-preview').src = window.URL.createObjectURL(this.files[0]);
                                                       document.getElementById('image-preview').style = 'visibility: visible';
                                               ">
                                        <img style="visibility: hidden" id="image-preview" alt="your image" width="150" />
                                    </div><!-- comment -->
                                </div> <!-- row.// -->

                                <button type="submit" class="btn btn-primary">Đăng bài</button>
                            </form>
                        </div>
                    </div> <!-- card end// -->
                </section>
            </main>
        </div>
        <script>
            var editor1 = new RichTextEditor("#div_editor1");
        </script>
    </body>
</html>

