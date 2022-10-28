<%-- 
    Document   : doctor-schdule-update
    Created on : Oct 23, 2022, 9:22:41 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Lịch làm việc</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/add-product.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/time-table.css'>
        <link href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css" rel="stylesheet">
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
                <jsp:include page="header.jsp"></jsp:include>
                <!--HEADER-->

                <section class="content-main edit-account">

                    <div class="content-header">
                        <h2 class="content-title my-2 mb-4">Lịch làm việc</h2>
                    </div>
                    <style>
                        .doctor-profile-header{
                            display: grid;
                            grid-gap: 16px;
                            position: relative;
                            margin: 24px;
                            border-bottom: 1px solid rgb(228, 232, 236);
                            grid-template-columns: 1fr 10fr 3.5fr;
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

                        .account-info {
                            position: sticky;
                            background: rgb(248, 249, 252);
                            top: 5rem;
                            right: 0px;
                            border: 1px solid #dbdfe5;
                            margin-top: 15px;
                            display: flex;
                            padding: 16px;
                            border: 1px solid #dbdfe5;
                            margin-bottom: 8px;
                            flex-direction: column;
                            border-radius: 6px;
                            max-height: calc(100vh - 6rem);
                        }

                        .account-infor_header {
                            font-size: 18px;
                            line-height: 28px;
                            letter-spacing: -0.2px;
                            margin-top: 8px;
                            margin-bottom: 8px;
                            font-weight: 700;
                        }

                        .account-info span {
                            font-weight: 600;
                        }
                    </style>
                    <div class="card" style="max-width:1120px; min-height: 600px">
                        <div class="card-body">
                            <div class="row doctor-profile-header">
                                <div class="profileImage">
                                    <img class="mb-3 rounded-circle shadow-4" src="${context}/img/${doctor.user.avatar}" style="width: 100px;height:100px" alt="Avatar"/>
                                </div>
                                <div class="doctorInfoHeader">
                                    <h1 class="fs-4">
                                        <span class="title">${doctor.title}</span> 
                                        <span class="fullname">${doctor.user.name}</span>
                                    </h1>
                                    <c:forEach items="${requestScope.departments}" var="d">
                                        <p class="text-sm-start" ${d.key != doctor.departmentId ? 'hidden' : ''}>${d.value.getDepartmentName()}</p>
                                    </c:forEach>

                                </div>
                                <div class="action">
                                    <a href="${context}/manager/doctor/profile/detail?id=${doctor.doctorId}" class="btn btn-secondary fw-bold" >Quay lại</a>
                                </div>
                            </div><!-- End doctor header -->

                            <!-- Start doctor schedule table -->
                            <div>
                                <div class="container" style="max-width: 600px;">
                                    <form method="POST">
                                        <div class="table-responsive">
                                            <table class="table table-bordered text-center">
                                                <thead>
                                                    <tr class="bg-light-gray">
                                                        <th class="text-uppercase">Ngày</th>
                                                        <th class="text-uppercase">T2</th>
                                                        <th class="text-uppercase">T3</th>
                                                        <th class="text-uppercase">T4</th>
                                                        <th class="text-uppercase">T5</th>
                                                        <th class="text-uppercase">T6</th>
                                                        <th class="text-uppercase">T7</th>
                                                        <th class="text-uppercase">CN</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="align-middle">
                                                            <span>Sáng</span>
                                                            <div class="small text-secondary">7:30-11:30</div>
                                                        </td>
                                                        <c:forEach var = "day" begin = "1" end = "7">
                                                            <td>
                                                                <div class="pretty p-default p-bigger">
                                                                    <input type="checkbox" name="work-shift" value="${day}-S"
                                                                           <c:forEach items="${requestScope.schedules}" var="s">
                                                                               ${(day == s.dayOfWeek && s.isMorningShift == true)?'checked':''}
                                                                           </c:forEach>>
                                                                    <div class="state p-primary">
                                                                        <label></label>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </c:forEach>
                                                    </tr>

                                                    <tr>
                                                        <td class="align-middle">
                                                            <span>Chiều</span>
                                                            <div class="small text-secondary">13:00-16:00</div>
                                                        </td>
                                                        <c:forEach var = "day" begin = "1" end = "7">
                                                            <td>
                                                                <div class="pretty p-default p-bigger">
                                                                    <input type="checkbox" name="work-shift" value="${day}-C"
                                                                           <c:forEach items="${requestScope.schedules}" var="s">
                                                                               ${(day == s.dayOfWeek && s.isMorningShift == false)?'checked':''}
                                                                           </c:forEach>>                                                               
                                                                    <div class="state p-primary">
                                                                        <label></label>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </c:forEach>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="d-flex justify-content-center">
                                            <button class="btn btn-primary fw-bold" type="submit">Cập nhật</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div> <!-- card body end// -->
                    </div> <!-- card end// -->
                </section>
            </main>
        </div>
    </body>
</html>
