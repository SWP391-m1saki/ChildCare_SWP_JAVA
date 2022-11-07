<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Đăng nhập</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
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
    </head>

    <body>

        <%
            Cookie[] cookies=request.getCookies();
            String email = "", pass = "",remember="";
            if (cookies != null) {
                 for (Cookie cookie : cookies) {
                   if(cookie.getName().equals("cookEmail")) {
                     email = cookie.getValue();
                   }
                   if(cookie.getName().equals("cookPass")){
                     pass = cookie.getValue();
                   }
                   if(cookie.getName().equals("cookRemember")){
                     remember = cookie.getValue();
                   }
                }
            }
        %>

        <!-- Pills content -->


        <section class="vh-100">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="img/logo.png"
                             class="img-fluid" alt="Sample image">
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <form action="login" method="post">
                            

                            <!--NOTIFICATION - START-->
                            <c:if test="${requestScope.NOTIFICATION != null}">
                                <div class="alert alert-danger center mb-4 pb-1" role="alert">
                                    <p>${NOTIFICATION}</p>
                                </div>
                            </c:if>
                            <!--NOTIFICATION - END -->

                            <!-- Email input -->
                            <div class="form-outline mb-4">

                                <input type="email" id="form3Example3" class="form-control form-control-lg" name="email" value="<%=email%>" required/>

                                <label class="form-label" for="form3Example3">Email</label>
                                
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-3">

                                <input type="password" id="form3Example4" class="form-control form-control-lg" name="password" value="<%=pass%>" required/>

                                <label class="form-label" for="form3Example4">Mật khẩu</label>
                                
                            </div>

                            <div class="d-flex justify-content-between align-items-center">
                                <!-- Checkbox -->
                                <div class="form-check mb-0">
                                    <input class="form-check-input me-2" type="checkbox" value="remember" id="form2Example3" name="remember" <%= "remember".equals(remember.trim()) ? "checked=\"checked\"" : "" %>/>
                                    <label class="form-check-label" for="form2Example3">
                                        Nhớ tài khoản?
                                    </label>
                                </div>
                                <a href="ResetPassword" class="text-body">Quên mật khẩu?</a>
                            </div>
                            <!--                            <div class="pt-1 mb-4">
                                                            <button class="btn btn-dark btn-lg btn-block" type="submit">Sign in</button>
                                                        </div>-->
                            <div class="text-center text-lg-start mt-4 pt-2">
                                <button class="btn btn-info btn-lg" type="submit"
                                        style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng nhập</button>
                                <p class="small fw-bold mt-2 pt-1 mb-0">Bạn chưa có tài khoản? <a href="register"
                                                                                                  class="link-danger">Đăng kí</a></p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>
<!-- Pills content -->