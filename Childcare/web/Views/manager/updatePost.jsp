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
        <title>Chỉnh sửa bài đăng</title>
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

        <!--Display Message-->
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

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
                <%--<jsp:include page="header.jsp"></jsp:include>--%>
                <!--HEADER-->

                <section class="content-main" style="max-width: 980px">
                    <div class="content-header">
                        <h2 class="content-title">Chỉnh sửa bài viết</h2>
                        <div>
                            <a href="${pageContext.request.getContextPath()}/manager/post" class="btn btn-danger"> × Hủy</a>
                        </div>
                    </div>

                    <script type="text/javascript">
                        if (${requestScope.mess != null}) {
                            toastr.success(${requestScope.mess});
                        }
                    </script>

                    <div class="content-body">
                        <div class="add-form">
                            <form method="POST">
                                <div class="form-item">
                                    <input type="text" name="title" required="required" placeholder="Tiêu đề bài viết" class="form-control fw-bold fs-5" value="${requestScope.post.title}">
                                </div>

                                <div class="form-row form-row-2">
                                    <div class="form-item form-row-2">
                                        <label class="form-label fw-bold fs-6">Chọn danh mục</label>
                                        <select name="category" class="form-select">
                                            <c:forEach items="${requestScope.postCategory}" var="c">
                                                <option value="${c.cateId}"
                                                        ${(requestScope.post.cateId == c.cateId) ?'selected': ''}
                                                        >${c.cateName}</option>
                                            </c:forEach>
                                        </select>                          
                                    </div>
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
                                        <input name="image" accept="image/*" class="form-control" type="file" onchange="document.getElementById('image-preview').src = window.URL.createObjectURL(this.files[0])">
                                        <img id="image-preview" alt="your image" width="150" src="${context}/img/${requestScope.post.image}"/>
                                    </div><!-- comment -->
                                </div> <!-- row.// -->

                                <button type="submit" class="btn btn-primary">Cập nhật</button>
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

