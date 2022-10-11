<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Childcare System</title>
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
    <!-- Pills navs -->
    <body>


        <!-- Pills content -->

        <section class="vh-100">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="img/logo.png"
                             class="img-fluid" alt="Sample image">
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <form action="ResetPassword" method="post">
                            

                            <div class="divider d-flex align-items-center my-4">
                                <p class="text-center fw-bold mx-3 mb-0">Enter your email to change password</p>
                            </div>
                            <div class="alert alert-success center mb-4" role="alert">
                                <p>${NOTIFICATION}</p>
                            </div>
                            <!-- Email input -->
                            <div class="form-outline mb-4">
                                <input type="email" id="form3Example3" class="form-control form-control-lg" name="email" required/>
                                <label class="form-label" for="form3Example3">Email</label>
                            </div>

                            <div class="text-center text-lg-start mt-4 pt-2">
                                <button class="btn btn-info btn-lg" type="submit"
                                        style="padding-left: 2.5rem; padding-right: 2.5rem;">Send code to your email</button>
                                <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="register"
                                                                                                  class="link-danger">Register</a></p>
                            </div>

                        </form>
                    </div>
                </div>

        </section>

    </body>
</html>
<!-- Pills content -->