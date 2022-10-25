<%-- 
    Document   : doctor-scheduling
    Created on : Oct 20, 2022, 3:32:46 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
        <script src='${pageContext.request.contextPath}/js/pagger.js'></script>
        <link href="${pageContext.request.contextPath}/css/pagger.css" rel="stylesheet" type="text/css"/>
    <body>
        <style type="text/css">

        </style>
        <!--Message display-->
        <script type="text/javascript">
            if (${requestScope.mess != null}) {
                if (${requestScope.mess[0] == "sucess"}) {
                    toastr.success(${requestScope.mess[1]});
                } else {
                    toastr.error(${requestScope.mess[1]});
                }
            }
        </script>
        <c:set var="context" value="${pageContext.request.contextPath}" />        
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
                                                        <form method="POST">
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
                                                <tr>
                                                    <td class="align-middle">
                                                        <span>Sáng</span>
                                                        <div class="margin-10px-top font-size14">10:00-11:00</div>
                                                    </td>
                                                <c:forEach var = "day" begin = "1" end = "7">
                                                    <td>
                                                        <div class="">
                                                            <input type="hidden" name="work-shift" value="${day}-S">
                                                            <a href="${context}/manager/schedule/detail?weeknum=${requestScope.selectedWeek}&shift=S${day}"
                                                                class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13 show-doctor-working">Xem</a>
                                                            <div class="margin-10px-top font-size14">${morningShifts[day-1]} bác sĩ</div>
                                                        </div>
                                                    </td>
                                                </c:forEach>
                                            </tr>

                                            <tr>
                                                <td class="align-middle">
                                                    <span>Chiều</span>
                                                    <div class="margin-10px-top font-size14">13:00-16:00</div>
                                                </td>
                                                <c:forEach var = "day" begin = "1" end = "7">
                                                    <td>
                                                        <div class="">
                                                            <input type="hidden" name="work-shift" value="${day}-C">
                                                            <a href="${context}/manager/schedule/detail?weeknum=${requestScope.selectedWeek}&shift=C${day}"
                                                                 class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13 show-doctor-working">Xem</a>
                                                            <div class="margin-10px-top font-size14">${afternoonShifts[day-1]} bác sĩ</div>
                                                        </div>
                                                    </td>
                                                </c:forEach>
                                            </tr>
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


                                                                function ajaxCall() {

                                                                }

                                                                const showBtns = Array.from(document.querySelectorAll('.show-doctor-working'));
                                                                showBtns.forEach(btn => btn.addEventListener('click', function () {
                                                                        const list = document.createElement("div");
                                                                        $.ajax({
                                                                            url: '/Childcare/ajax/shift/schedule',
                                                                            type: "POST",
                                                                            data: {
                                                                                week_number: document.querySelector('select[name="selectWeek"]').value,
                                                                                dayOfWeek: document.querySelector('select[name="depId"]').value,
                                                                                isMorningShift: document.querySelector('select[name="pagesize"]').value,
                                                                            },
                                                                            async: true,
                                                                            success: function (data) {
                                                                                list.innerHTML = data;
                                                                            },
                                                                            error: function () {
                                                                                alert('Errore');
                                                                            }
                                                                        });
                                                                        btn.insertAdjacentElement('afterend', list);
                                                                    }));

                                                                document.querySelector('.table-schedule').addEventListener('click', e => {
                                                                    if (e.target === document.querySelector('.close-doctor-list')) {
                                                                        let list = document.querySelector('.display-pop-up');
                                                                        if (list !== null) {
                                                                            list.parentElement.remove();
                                                                        }
                                                                    }
                                                                });

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


