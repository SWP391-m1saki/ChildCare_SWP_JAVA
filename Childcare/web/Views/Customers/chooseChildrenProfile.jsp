<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Đặt lịch hẹn</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/add-product.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>

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


        <!--HEADER-->

        <section class="row" style="display: flex; justify-content: center; margin-top: 100px">

            <div class="col-md-8">
                <h5> Bạn đang đặt lịch hẹn cho:</h5>
            </div>
            <style>
                .main-infor{
                    border-bottom: 1px solid rgb(228, 232, 236);

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
                .vertical-center {
                    margin: 0;
                    position: absolute;
                    top: 50%;
                    -ms-transform: translateY(-50%);
                    transform: translateY(-50%);
                }
                .card-hghlght {
                    pointer-events: auto;
                    transform: scale(1);
                    transition: all 0.4s;
                }

                .card-hghlght:hover {
                    opacity: 1;
                    transform: scale(1.02);
                }

                .content:hover .card-hghlght:not(:hover) {
                    opacity: 0.5;
                    transform: scale(0.9);
                }

                .disabled {
                    cursor: pointer;
                    opacity: 0.6;
                    cursor: not-allowed;
                }
                .cc{
                    padding: 10px;
                    border: 1px solid rgb(228, 232, 236);
                    border-radius: 6px;
                    margin-bottom: 10px;
                }
                .activee{
                    border: 1px solid #1F77B3;
                    background-color: white;
                }
            </style>
            <div class="col-lg-8">

                <div class="row doctor-profile-body" id="ChildDiv">
                    <div class="card-group col-md-6">
                        <c:forEach items="${requestScope.ChildrenList}" var="child">
                            <div class="col-md-12  card-hghlght cc " name="ChildCard" child-id="${child.childrenId}">
                                <form class="childFrm" action="chooseChild" method="post" name="childFrm">
                                    <input type="hidden" name="ChildId" value="${child.childrenId}">
                                    <div class="row main-infor">
                                        <div class="col-md-2">
                                            <img src="${child.avatar}" style="border-radius: 50%; width: 70px; height: 70px;">
                                        </div>
                                        <div class="col-md-8 ">
                                            <p style="font-size: 16px; line-height: 24px; padding-top: 20px; font-weight: bold;">
                                                ${child.name}
                                            </p>
                                        </div>
                                    </div>

                                    <div class="col-md-4" style="padding-top: 20px;">
                                        <div class="row">
                                            <p style="color: #8c8c8c; font-size: 14px; line-height: 18px;">
                                                Ngày sinh: 
                                                <span style="color:#030B12">${child.dob}</span>
                                            </p>
                                        </div>
                                        <div class="row">
                                            <p style="color: #8c8c8c; font-size: 14px; line-height: 18px;">
                                                Giới tính: 
                                                <c:if test="${child.gender == true}">
                                                    <span style="color:#030B12">Nam</span>
                                                </c:if>
                                                <c:if test="${child.gender == false}">
                                                    <span style="color:#030B12">Nữ</span>
                                                </c:if>
                                            </p>

                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:forEach>

                        <div style="display: flex; align-items: center; justify-content: center; margin-bottom: 40px;">
                            <button id="SubmitChildButton" type="button" style="background-color: #1B7ED1; color:white;" disabled="true" onclick="ChildSubmit()">Xác nhận</button>
                        </div>
                    </div>



                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                Thông tin đặt lịch
                            </div>
                            <div class="card-body">
                                <div class="row doctor-profile-header" style="border-bottom: 1px solid rgb(228, 232, 236);">
                                    <div class="profileImage">
                                        <img class="mb-3 rounded-circle shadow-4" src="${doctors.user.avatar}" style="width: 100px;height:100px" alt="Avatar"/>
                                    </div>
                                    <div class="doctorInfoHeader" >
                                        <h1 class="fs-4">
                                            <span class="title">${doctors.title}</span> 
                                            <span class="fullname">${doctors.user.name}</span>
                                        </h1>
                                        <p class="text-sm-start">Đa khoa</p>
                                    </div>
                                </div>
                                <div class="doctor-detail" style="padding-top: 20px;">
                                    <div class="description-section">
                                        <p style="color: #8c8c8c; font-size: 14px; line-height: 18px;">
                                            Ngày:    
                                            <span style="color:#030B12">${shift.date}</span>
                                        </p>
                                        <p style="color: #8c8c8c; font-size: 14px; line-height: 18px;">
                                            Thời gian: 
                                            <span style="color:#030B12">${slotTime.startTime} - ${slotTime.endTime}</span>
                                        </p>
                                        <p style="color: #8c8c8c; font-size: 14px; line-height: 18px;">
                                            Phí: 
                                            <span style="color:#030B12">${doctors.price}</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- row.// -->

            </div> <!-- card body end// -->
            <script>
                var headerr = document.getElementById("ChildDiv");
                var cards = headerr.getElementsByClassName("card-hghlght");
                for (var i = 0; i < cards.length; i++) {
                    cards[i].addEventListener("click", function () {
                        document.getElementById("SubmitChildButton").disabled = false;
                        var currentt = document.getElementsByClassName("activee");
                        for (var i = 0; i < currentt.length; i++)
                        {
                            currentt[i].className = currentt[i].className.replace(" activee", "");
                        }

                        if (this.className.indexOf("card-hghlght") !== -1)
                            this.className += " activee";
                    });
                }


                function ChildSubmit() {
                    var ChildDiv2 = document.getElementsByClassName("activee");
                    var ChildForm = ChildDiv2[0].getElementsByClassName("childFrm");
                    ChildForm[0].submit();
                }

            </script>


        </section>
        <jsp:include page="../Shared/_Footer.jsp"></jsp:include>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>