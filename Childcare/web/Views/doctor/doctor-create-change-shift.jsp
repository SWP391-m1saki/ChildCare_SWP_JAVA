<%-- 
    Document   : doctor-create-change-shift
    Created on : Oct 25, 2022, 4:43:45 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tạo đổi lịch làm việc</title>
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
        <div class="page-wrapper">
            <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->
                <main class="main-admin-page">
                    <!--HEADER-->
                <jsp:include page="header.jsp"></jsp:include>
                <!--HEADER-->

                <section class="content-main edit-account">

                    <div class="content-header">
                        <h2 class="content-title">Thay đổi lịch làm việc</h2>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-11">

                                    <section class="content-body p-xl-4">
                                        <form method="POST">
                                            <div class="row">
                                                <div class="col-lg-8">
                                                    <div class="row gx-3">
                                                        <div class="col-12  mb-3 me-3">
                                                            <label class="form-label">Thông tin xin nghỉ</label>
                                                            <textarea name="description" class="form-control" placeholder="Type here" style="min-height:500px "></textarea>
                                                        </div> <!-- col .// -->                                                 
                                                    </div> <!-- row.// -->
                                                </div> <!-- col.// -->
                                            </div> <!-- row.// -->
                                            <br>
                                            <button class="btn btn-primary" type="submit">Gửi</button>
                                        </form>

                                        <hr class="my-5">

                                    </section> <!-- content-body .// -->

                                </div> <!-- col.// -->
                            </div> <!-- row.// -->

                        </div> <!-- card body end// -->
                    </div> <!-- card end// -->


                </section>
            </main>
        </div>
    </body>
</html>
