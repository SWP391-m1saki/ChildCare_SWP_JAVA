<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Childcare System</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">


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
    <!-- Pills navs -->
    <body>


        <!-- Pills content -->

        <section class="vh-100 mt-5">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="img/logo.png"
                             class="img" alt="Sample image" width="600">
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <form action="register" method="post">      
                            <c:if test="${requestScope.mess != null}">
                                <div class="alert alert-danger center mb-4 pb-1" role="alert">
                                    <p>${requestScope.mess}</p>
                                </div>
                            </c:if>
                            
                            <div class="form-outline mb-4">
                                <input type="text" id="name" class="form-control form-control-lg" name="name" value="${requestScope.name}"/>
                                <label class="form-label" for="name">Full name</label>
                            </div>
                            
                            <div class="form-outline mb-4">
                                <input type="email" id="email" class="form-control form-control-lg" name="email" value="${requestScope.email}"/>
                                <label class="form-label" for="gmail">Email</label>
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-3">
                                <input type="password" id="password" class="form-control form-control-lg" name="password"/>
                                <label class="form-label" for="password">Password</label>
                            </div>

                            <div class="form-outline mb-3">
                                <input type="password" id="passwordConfirm" class="form-control form-control-lg" name="passwordConfirm"/>
                                <label class="form-label" for="passwordConfirm">Confirm Password</label>
                            </div>

                            <div class="d-flex justify-content-between align-items-center">
                                <div class="text-center text-lg-start mt-4 pt-2">
                                    <button class="btn btn-primary btn-lg" type="submit"
                                            style="padding-left: 2.5rem; padding-right: 2.5rem;">Sign up</button>

                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>
