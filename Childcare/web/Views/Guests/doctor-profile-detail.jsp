<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Thông tin bác sĩ</title>
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
        <script src="js/DateChoose.js"></script>
        <jsp:include page="../Shared/_Header.jsp"></jsp:include>
        <%--<c:set var="context" value="${pageContext.request.contextPath}" />--%>

        <main class="main-admin-page">
            <!--HEADER-->

            <section class="content-main edit-account">

                <div class="content-header">
                    <h2 class="content-title">Thông tin bác sĩ</h2>
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
                    .chooseDateButton {
                        padding: 13px 0px 13px 16px;
                        border: 1px solid rgb(228, 232, 236);
                        border-radius: 6px;
                        width: 100%;
                        font-weight: normal;
                        text-align: start;
                        cursor: pointer;
                        position: relative;
                        z-index: 3;
                        background-color: rgb(255, 255, 255);
                        box-sizing: border-box;
                    }

                    .gridSlot{
                        display: grid;
                        margin: 8px 0;
                        grid-gap: 7px 8px;
                        grid-template-columns: 1fr 1fr 1fr;
                        max-height: 200px;
                        overflow: auto;
                    }

                    .gridButton{
                        display: flex;
                        min-width: 90px;
                        align-items: center;
                        justify-content: center;
                        padding: 8px 4px;
                        border: 1px solid #dbdfe5;
                        border-radius: 6px;
                        cursor: pointer;
                        font-size: 13px;
                        background: #fff;
                        font-feature-settings: "tnum";
                        font-variant-numeric: tabular-nums;
                    }
                    .active, .btnSlot:hover{
                        background-color: #1B7ED1;
                        color: white;
                    }
                    .disabled {
                        cursor: pointer;
                        opacity: 0.6;
                        cursor: not-allowed;
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
                                <p class="text-sm-start">Đa khoa</p>
                            </div>
                        </div>
                        <div class="row doctor-profile-body">
                            <div class="col-lg-8">
                                <section class="content-body p-xl-4">
                                    <div class="tablist">
                                        <li>Thông tin cơ bản</li>
                                    </div>
                                    <div class="doctor-detail">
                                        <div class="description-section">
                                            <h4 style="color:#1b3250" class="header">Thông tin bác sĩ</h4>
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
                                                <span>Dịch vụ</span>
                                            </h6>
                                            <div class="service-detail">
                                                <h6 class="">Thăm khám và tư vấn</h6>
                                                <p class="price-des">
                                                    <i class="fa-solid fa-sack-dollar" style="color: #838181;"></i>                                                       <span>Phí tư vấn cố định </span>
                                                    <span class="price">${doctors.price}&nbsp;₫</span></p>
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
                                                <span>Học tập và kinh nghiệm làm việc</span>
                                            </h6>
                                            <div class="qualication-detail">
                                                <ul>
                                                    <li><p>Hơn ${doctors.qualification} năm kinh nghiệm làm việc tại bệnh viện.</p></li>
                                                    <!--                                                        <li><p> Hơn 15 năm kinh nghiệm Khám và điều trị bệnh Mắt - đã thực hiện nhiều ca chấp lẹo, mộng thịt, cũng như nhiều phẫu thuật khác về mắt Kinh nghiệm</p></li>
                                                                                                            <li><p> Chuyên khoa Mắt Lĩnh vực chuyên sâu</p></li>
                                                                                                            <li><p>Bắt đầu làm việc tại Phòng khám Đa khoa Thành Công vào tháng 2/2008</p></li>-->
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-8">
                                        </div> <!-- row.// -->
                                    </div> <!-- col.// -->
                                    <hr class="my-5">

                                </section> <!-- content-body .// -->

                            </div> <!-- col.// -->
                            <div class="col-lg-4">
                                <div class="card" style="background-color: rgb(248, 249, 252);">
                                    <h5 style="font-size: 20px; letter-spacing: -0.2px; line-height: 24px; font-weight: 700; margin-top: 32px; margin-bottom: 8px; margin-left: 16px;">Tư vấn trực tiếp</h5>
                                    <p style="color: #262626; leter-spacing: 0px; font-weight: 400; font-size: 15px; line-height: 18px; margin-bottom: 16px; margin-left: 16px;">
                                        Bác sĩ chuyên khám và tư vấn các bệnh lý về ... cho trẻ nhỏ
                                    </p>
                                    <div style="position: relative; margin: 20px 40px 20px;">
                                        <div class="nativeDatePicker chooseDateButton" style="text-align: center">
                                            <form id="frm" action="loadDoctorDetail" method="post">
                                                <input type="hidden" value="${doctors.doctorId}" name="doctorId">
                                                <input type="date" min="2022-10-30" max="2022-11-15" id="choosedDate" name="choosedDate" value="${requestScope.choosedDate}" onchange="myFunction()">
                                                <span class="validity"></span>
                                            </form>
                                        </div>
                                    </div>

                                    <c:if test="${requestScope.slotList.isEmpty()==true}">
                                        <div style="padding-bottom: 30px; text-align: center">
                                            Lịch trống
                                        </div>
                                    </c:if>
                                    <c:if test="${requestScope.slotList.isEmpty()==false}">
                                        <form id="frmDate" action="chooseChild" method="get">
                                            <div class="gridSlot" style="padding: 20px" id="myDiv">

                                                <input type="hidden" name="doctorId" value="${doctors.doctorId}">
                                                <c:if test="${requestScope.morning != null}">
                                                    <input type="hidden" name="morning" value="${requestScope.morning.shiftId}">
                                                </c:if>
                                                <c:if test="${requestScope.afternoon != null}">
                                                    <input type="hidden" name="afternoon" value="${requestScope.afternoon.shiftId}">
                                                </c:if>


                                                <c:forEach items="${requestScope.slotList}" var="slot">
                                                    <div class="gridButton btnSlot" name="SlotTimeButton" role="button" data-slotTime-id="${slot.slotTimeId}">
                                                        ${slot.startTime} - ${slot.endTime}
                                                    </div>
                                                </c:forEach>
                                                <input type="hidden" name="slotTimeId" id="slotTimeId"/>
                                            </div>
                                            <div style="display: flex; align-items: center; justify-content: center; margin-bottom: 40px;">
                                                <button id="SubmitButton" type="submit" style="background-color: #1B7ED1; color:white;" disabled="true" onclick="processSlotTime()">Đặt lịch</button>
                                            </div>
                                        </form>
                                    </c:if>
                                </div>
                            </div>
                        </div> <!-- row.// -->

                    </div> <!-- card body end// -->
                </div> <!-- card end// -->
                <script>

                    var header = document.getElementById("myDiv");
                    var btns = header.getElementsByClassName("btnSlot");
                    for (var i = 0; i < btns.length; i++) {
                        btns[i].addEventListener("click", function () {
                            document.getElementById("SubmitButton").disabled = false;
                            var current = document.getElementsByClassName("active");
                            current[0].className = current[0].className.replace(" active", "");
                            if (this.className.indexOf("btnSlot") !== -1)
                                this.className += " active";
                        });
                    }

                    function myFunction() {
                        //alert("The input value has changed. The new value is: ");
                        document.getElementById("frm").submit();
                    }

                    function processSlotTime() {

                        var selectedSlot = document.getElementsByClassName("active");
                        var SlotTimeId = selectedSlot[0].getAttribute("data-slotTime-id");
                        //alert(SlotTimeId);
                        var hiddenSlotTimeId = document.getElementById("slotTimeId");
                        hiddenSlotTimeId.value = SlotTimeId;

                        var form = document.getElementById("frmDate");
                        form.submit();
                    }
                </script>

            </section>
            <jsp:include page="../Shared/_Footer.jsp"></jsp:include>
        </main>
    </body>
</html>