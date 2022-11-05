<%-- 
    Document   : doctor-scheduling
    Created on : Oct 20, 2022, 3:32:46 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lịch làm việc</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/time-table.css'>
        <link href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css" rel="stylesheet">

        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>

        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>

    <body>
        <style type="text/css">
            .table td {
                padding: 7px 0;
            }

            span.btn-secondary {
                width: fit-content;
            }
        </style>
        <c:set var="context" value="${pageContext.request.contextPath}" />  
        <c:set var="slots" value="${requestScope.slots}" />  

        <div class="page-wrapper">
            <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->
                <main class="main-admin-page">
                    <!--HEADER-->
                <jsp:include page="header.jsp"></jsp:include>
                    <!--HEADER-->

                    <section class="content-main edit-account ms-5" style="max-width: 1120px">

                        <div class="content-header">
                            <h3 class="content-title my-4">Lịch làm việc</h3>
                        </div>

                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="container table-schedule">
                                    <div class="table-responsive">
                                        <table class="table table-bordered text-center">
                                            <thead>
                                                <tr class="bg-light-gray">
                                                    <th class="text-uppercase" rowspan="2">Thời gian
                                                        <form method="POST" id="main-form">
                                                            <select name="selectWeek" class="p-0 mt-2" onchange="this.form.submit()">
                                                            </select>
                                                        </form>
                                                    </th>
                                                    <th class="text-uppercase">Thứ 2</th>
                                                    <th class="text-uppercase">Thứ 3</th>
                                                    <th class="text-uppercase">Thứ 4</th>
                                                    <th class="text-uppercase">Thứ 5</th>
                                                    <th class="text-uppercase">Thứ 6</th>
                                                    <th class="text-uppercase">Thứ 7</th>
                                                    <th class="text-uppercase">Chủ Nhật</th>
                                                </tr>
                                                <tr class="bg-light-gray current-week-day">
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="slotTime" begin="1" end="14">
                                                <tr>
                                                    <td class="align-middle">
                                                        <span>Slot ${slotTime}</span>
                                                    </td>
                                                    <c:forEach var="dayOfWeek" begin="1" end="7">
                                                        <td>
                                                            <div class="">
                                                                <c:choose>
                                                                    <c:when test="${slots[dayOfWeek-1][slotTime-1].getSlotStatusExtended() == -1}">
                                                                        <span class="badge rounded-pill alert-secondary">Đang trống</span>
                                                                    </c:when>
                                                                    <c:when test="${slots[dayOfWeek-1][slotTime-1].getSlotStatusExtended() == 0}">
                                                                        <a href="${context}/doctor/slot/detail?id=${slots[dayOfWeek-1][slotTime-1].slotId}" class="badge rounded-pill alert-warning">${slots[dayOfWeek-1][slotTime-1].getStatusLable()}</a>
                                                                    </c:when>
                                                                    <c:when test="${slots[dayOfWeek-1][slotTime-1].getSlotStatusExtended() == 1}">
                                                                        <a href="${context}/doctor/slot/detail?id=${slots[dayOfWeek-1][slotTime-1].slotId}" class="badge rounded-pill alert-primary">${slots[dayOfWeek-1][slotTime-1].getStatusLable()}</a>
                                                                    </c:when>
                                                                    <c:when test="${slots[dayOfWeek-1][slotTime-1].getSlotStatusExtended() == 2}">
                                                                        <a href="${context}/doctor/slot/detail?id=${slots[dayOfWeek-1][slotTime-1].slotId}" class="badge rounded-pill alert-danger">${slots[dayOfWeek-1][slotTime-1].getStatusLable()}</a>
                                                                    </c:when>
                                                                    <c:when test="${slots[dayOfWeek-1][slotTime-1].getSlotStatusExtended() == 3}">
                                                                        <a href="${context}/doctor/slot/detail?id=${slots[dayOfWeek-1][slotTime-1].slotId}" class="badge rounded-pill alert-success">${slots[dayOfWeek-1][slotTime-1].getStatusLable()}</a>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span>-</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </td>
                                                    </c:forEach>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div> <!-- card end// -->
                </section>
            </main>
        </div>
        <script src="${context}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">
                                                                const selectedWeekNum = ${requestScope.selectedWeek};
                                                                const currentWeekNum = parseInt(moment().format('w'), 10);
                                                                $(document).ready(function () {
                                                                    var weekOptions = ``;
                                                                    var start_day, end_day;
                                                                    for (let i = currentWeekNum - 2; i <= currentWeekNum + 2; i++) {
                                                                        var week = moment().week(i).clone();
                                                                        start_day = week.isoWeekday(1).format('DD/MM');
                                                                        end_day = week.isoWeekday(7).format('DD/MM');

                                                                        if (i === selectedWeekNum) {
                                                                            weekOptions += `<option selected value='` + i + `'>` + start_day + ` To ` + end_day + `</option>\n`;
                                                                            var dayOfCurrentWeek = '';
                                                                            for (let j = 1; j <= 7; j++) {
                                                                                dayOfCurrentWeek += '<th align="center">' + week.isoWeekday(j).format('DD/MM') + '</th>';
                                                                            }
                                                                            document.querySelector('.current-week-day').innerHTML = dayOfCurrentWeek;
                                                                        } else
                                                                            weekOptions += `<option value='` + i + `'>` + start_day + ` To ` + end_day + `</option>\n`;
                                                                    }
                                                                    document.querySelector('select[name="selectWeek"]').innerHTML = weekOptions;
                                                                });
        </script>
    </body>
</html>


