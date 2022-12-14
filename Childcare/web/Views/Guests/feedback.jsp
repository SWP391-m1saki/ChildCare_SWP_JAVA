<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Feedback</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/add-product.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>




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
        <jsp:include page="../header.jsp"/>
        <%--<c:set var="context" value="${pageContext.request.contextPath}" />--%>

        <main class="main-admin-page">
            <!--HEADER-->

            <section class="content-main edit-account">

                <div class="content-header">
                    <h2 class="content-title">Th??ng tin b??c s??</h2>
                </div>

                <style>
                    .doctor-profile-header{
                        display: grid;
                        grid-gap: 16px;
                        position: relative;
                        margin: 24px;
                        border-bottom: 1px solid rgb(228, 232, 236);
                        grid-template-columns: 1fr 10fr;
                        align-items: center;
                        vertical-align: middle;
                    }

                    .tablist{
                        display: block;
                        max-width: 100%;
                        border-bottom: 1px solid rgb(228, 232, 236);
                        margin-bottom: 24px;
                    }

                    .tablist li{
                        color: rgb(45, 135, 243);
                        border-bottom: 3px solid rgb(45, 135, 243);
                        padding-bottom: 4px;
                        height: 35px;
                        font-weight: 600;
                        width: fit-content;
                    }

                    .doctor-detail>*{
                        margin-bottom: 25px;
                    }

                    .doctor-detail .header {
                        position: relative;
                        margin: auto 0;
                        margin-bottom: 16px;
                        font-size: 16px;
                        line-height: 24px;
                        padding-left: 8px;
                        font-weight: 700;
                    }
                    .description-section .header::after {
                        position: absolute;
                        top: 1px;
                        left: 0px;
                        width: 2px;
                        height: 15px;
                        margin-top: 4px;
                        background-color: rgb(45, 135, 243);
                        content: "";
                    }

                    .service-detail {
                        background: rgb(248, 249, 252);
                        border-radius: 6px;
                        padding: 16px;
                    }

                    .price-des {
                        display: flex;
                        -webkit-box-align: center;
                        align-items: center;
                        margin-top: 10px;
                        margin-bottom: 0;
                        gap: 8px;
                        font-size: 14px;
                        line-height: 24px;
                        color: #262626;
                    }

                    .price-des .price {
                        color: #009e5c;
                    }

                    .qualication-detail p{
                        margin-bottom: 0;
                    }

                    .qualication-detail li {
                        list-style-type: disc;
                    }
                </style>
                <div class="card">
                    <div class="card-body">
                        <div class="row doctor-profile-header">
                            <div class="profileImage">
                                <img class="mb-3 rounded-circle shadow-4" src="${doctors.user.avatar}" style="width: 100px;height:100px" alt="Avatar"/>
                            </div>
                            <div class="doctorInfoHeader">
                                <h1 class="fs-4">
                                    <span class="title">${doctors.title}</span> 
                                    <span class="fullname">${doctors.user.name}</span>
                                </h1>
                                <p class="text-sm-start">??a khoa</p>
                            </div>
                        </div>
                        <div class="row doctor-profile-body">
                            <div class="col-lg-9">
                                <section class="content-body p-xl-4">
                                    <div class="row tablist" style="display: grid;grid-template-columns: 160px 140px;grid-template-rows: 50px;">
                                        <div style="border: 10px">
                                            <li><a href="loadDoctorDetail">Th??ng tin c?? b???n</a></li>
                                        </div>    
                                        <div style="border: 10px">
                                            <li><a href="loadFeedback">Ph???n h???i</a></li>
                                        </div>
                                    </div>
                                    <div class="doctor-detail">
                                        <div class="description-section">
                                            <h4 style="color:#1b3250" class="header">Th??ng tin b??c s??</h4>
                                            <p>${doctors.description}</p>
                                        </div>
                                        <div class="service-section">
                                            <h6 class="header ps-0">
                                                <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <circle cx="16" cy="16" r="16" fill="#BCDEFF"></circle>
                                                <ellipse cx="16.133" cy="23.866" rx="15.333" ry="0.667" fill="#91CAFF"></ellipse>
                                                <g clip-path="url(#service_svg__clip0_20298_56108)">
                                                <path d="M11.37 9.69V8.47c0-1.378 1.12-2.5 2.5-2.5h4.261c1.379 0 2.5 1.122 2.5 2.5v2.636h-1.387V8.471c0-.614-.5-1.113-1.113-1.113H13.87c-.613 0-1.112.5-1.112 1.113v2.623h-1.388V9.69z" fill="#2C74DF"></path>
                                                <path d="M24.153 23.658H7.848c-.592 0-1.073-.48-1.073-1.072v-6.548a4.945 4.945 0 014.945-4.944h8.56a4.945 4.945 0 014.945 4.944v6.548c0 .592-.48 1.072-1.072 1.072z" fill="#fff"></path>
                                                <path d="M6.775 22.586c0 .592.48 1.072 1.073 1.072h16.305c.593 0 1.073-.48 1.073-1.072V21.22H6.776v1.365z" fill="#2D87F3"></path>
                                                <path d="M23.05 21.22v1.366c0 .592-.48 1.072-1.073 1.072h2.175c.593 0 1.073-.48 1.073-1.072V21.22H23.05z" fill="#2B62CD"></path>
                                                <path d="M18.944 15.427h-1.856V13.57h-2.175v1.857h-1.856v2.175h1.856v1.856h2.175v-1.856h1.856v-2.175z" fill="#2D87F3"></path>
                                                <path d="M17.087 13.57H16v5.888h1.087v-1.856h1.857v-2.175h-1.857V13.57z" fill="#2B62CD"></path>
                                                </g><defs><clipPath id="service_svg__clip0_20298_56108">
                                                    <path fill="#fff" transform="translate(6.4 5.6)" d="M0 0h19.2v19.2H0z"></path>
                                                </clipPath></defs>
                                                </svg>
                                                <span>D???ch v???</span>
                                            </h6>
                                            <div class="service-detail">
                                                <h6 class="">Th??m kh??m v?? t?? v???n</h6>
                                                <p class="price-des">
                                                    <i class="fa-solid fa-sack-dollar" style="color: #838181;"></i>                                                       <span>Ph?? t?? v???n c??? ?????nh </span>
                                                    <span class="price">${doctors.price}&nbsp;???</span></p>
                                            </div>
                                        </div>
                                        <div class="qualification-section">
                                            <h6 class="header ps-0">
                                                <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="16" cy="16" r="16" fill="#BCDEFF"></circle>
                                                <ellipse cx="15.999" cy="24" rx="15.333" ry="0.667" fill="#91CAFF"></ellipse>
                                                <path d="M9.063 8.023c.372.064.715.24.985.504.334.335.523.788.527 1.26v8.71h-2.2C7.615 18.496 7 17.88 7 17.12V9.788C7 8.8 7.8 8 8.788 8l.275.023z" fill="#2D87F3"></path>
                                                <path d="M21.6 8.069H9.04c.375.02.728.185.986.458.348.308.548.75.55 1.215V22.69a1.375 1.375 0 001.327 1.421h10.544a1.467 1.467 0 001.42-1.42V10.2c0-1.215-1.076-2.132-2.268-2.132z" fill="#fff"></path>
                                                <path d="M21.115 14.05h-8.159a.458.458 0 010-.917h8.16a.458.458 0 110 .917zM16.99 11.759h-4.034a.458.458 0 010-.917h4.034a.458.458 0 110 .917z" fill="#2D87F3"></path>
                                                <path d="M21.163 23.79v3.599l-2.108-1.582-2.109 1.582-.046-3.598v-2.315l.046-.115a3.163 3.163 0 004.148.092h.138l-.069 2.338z" fill="#2743AD"></path>
                                                <path d="M19.032 16.09a3.163 3.163 0 11-.003 6.325 3.163 3.163 0 01.003-6.325z" fill="#2D87F3"></path>
                                                </svg>
                                                <span>H???c t???p v?? kinh nghi???m l??m vi???c</span>
                                            </h6>
                                            <div class="qualication-detail">
                                                <ul>
                                                    <li><p>H??n ${doctors.qualification} n??m kinh nghi???m l??m vi???c t???i b???nh vi???n.</p></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-8">
                                        </div> <!-- row.// -->
                                    </div> <!-- col.// -->
                                    <hr class="my-5">



                                    <div class="feedback-section" >
                                        <!--<div class="sc-fvEvSO hVVIhR mb-16" data-size="md" data-icon-position="left">-->
                                        <h6 class="header ps-0">

                                            <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <circle cx="16" cy="16" r="16" fill="#BCDEFF">
                                            </circle>
                                            <ellipse cx="16.133" cy="23.866" rx="15.333" ry="0.667" fill="#91CAFF">
                                            </ellipse><g clip-path="url(#service_svg__clip0_20298_56108)">
                                            <path d="M11.37 9.69V8.47c0-1.378 1.12-2.5 2.5-2.5h4.261c1.379 0 2.5 1.122 2.5 2.5v2.636h-1.387V8.471c0-.614-.5-1.113-1.113-1.113H13.87c-.613 0-1.112.5-1.112 1.113v2.623h-1.388V9.69z" fill="#2C74DF"></path>
                                            <path d="M24.153 23.658H7.848c-.592 0-1.073-.48-1.073-1.072v-6.548a4.945 4.945 0 014.945-4.944h8.56a4.945 4.945 0 014.945 4.944v6.548c0 .592-.48 1.072-1.072 1.072z" fill="#fff"></path>
                                            <path d="M6.775 22.586c0 .592.48 1.072 1.073 1.072h16.305c.593 0 1.073-.48 1.073-1.072V21.22H6.776v1.365z" fill="#2D87F3"></path>
                                            <path d="M23.05 21.22v1.366c0 .592-.48 1.072-1.073 1.072h2.175c.593 0 1.073-.48 1.073-1.072V21.22H23.05z" fill="#2B62CD"></path>
                                            <path d="M18.944 15.427h-1.856V13.57h-2.175v1.857h-1.856v2.175h1.856v1.856h2.175v-1.856h1.856v-2.175z" fill="#2D87F3"></path>
                                            <path d="M17.087 13.57H16v5.888h1.087v-1.856h1.857v-2.175h-1.857V13.57z" fill="#2B62CD"></path>
                                            </g>
                                            <defs>
                                            <clipPath id="service_svg__clip0_20298_56108">
                                                <path fill="#fff" transform="translate(6.4 5.6)" d="M0 0h19.2v19.2H0z"></path>
                                            </clipPath>
                                            </defs>
                                            </svg>
                                            <span>Nh???n x??t c???a kh??ch h??ng</span>
                                        </h6>
                                        <!--<h6 style="--custom-heading-color:#1b3250" data-tag="h6" class="sc-hBxehG dqWeVm">Nh???n x??t c???a kh??ch h??ng</h6>-->
                                    </div>
                                    <c:forEach items="${requestScope.feedbacks}" var="f">
                                        <div class="service-detail">
                                            <div class="indexstyled__StyledDoctorInfoService-sc-1xtgixm-0 chDyDa">
                                                <p style="font-weight: bolder" data-size="p4" data-type="semiBold" class="sc-bcXHqe iHAyeJ">${f.user.name}:</p>
                                                <div data-is-collapsed="true" class="indexstyled__StyledDescriptionWrapper-sc-8pttbg-6 kaydiC">
                                                    <p data-size="p4" data-type="regular" class="sc-bcXHqe eKWdrn description">${f.description}</p>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                    </c:forEach>
                                    </div>
                                </section> <!-- content-body .// -->
                            </div> <!-- col.// -->
                        </div> <!-- row.// -->
                    </div> <!-- card body end// -->
                </div> <!-- card end// -->
            </section>
        </main>
    </body>
</html>