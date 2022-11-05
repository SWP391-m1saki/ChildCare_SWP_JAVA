<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Childcare System</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">  

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/admin.css" rel="stylesheet">
    </head>
    <!-- Pills navs -->
    <body>
        <jsp:include page="../Shared/_Header.jsp"></jsp:include>


            <div class="container">
                <div class="row">
                <jsp:include page="ASIDE.jsp"/>

                <div class="col-sm-8 mx-auto p-5 mt-3">
                    <table class="table table-hover">

                        <tbody>
                            <c:if test="${requestScope.ChildrenList.isEmpty()}">
                            <h4 class="mb-5 mt-3">Bạn chưa lưu hồ sơ nào của trẻ</h4>
                        </c:if>
                        <c:forEach items="${requestScope.ChildrenList}" var="p">
                            <tr>
                                <td>
                                    <a href="#" class="itemside">
                                        <img src="${p.avatar}" class="img-lg image p-1"  id="show-avatar">
                                    </a>
                                </td>
                                <td>
                                    ${p.name}
                                </td>
                                <td>
                                    Giới tính: ${p.getGender()?"Nam":"Nữ"}
                                </td>
                                <td>
                                    Ngày sinh: ${p.getDob()}
                                </td>
                                <td class="text-end">
                                    <div class="mb-1">
                                        <a class="btn btn-secondary" href="updateChildren?id=${p.childrenId}">Chi tiết</a>
                                    </div>
                                    <div class="mb-1">
                                        <a class="btn btn-secondary" href="deleteChildren?id=${p.childrenId}"> Xóa </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table> <!-- table-responsive.// -->

                    <a href="addChildren" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Thêm trẻ</a>
                </div>

            </div>
        </div>

        <jsp:include page="../Shared/_Footer.jsp"></jsp:include>
        <div class="container-fluid bg-dark text-light border-top border-secondary py-4">
            <div class="container">
                <div class="row g-5">
                    <div class="col-md-6 text-center text-md-start">
                        <p class="mb-md-0">&copy; <a class="text-primary" href="#">ChildCare System</a>. All Rights Reserved.</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
