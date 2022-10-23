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
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>
        <!--<link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/ui.css'>-->
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/time-table.css'>
        <link href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css" rel="stylesheet">

        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>

        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <script src='${pageContext.request.contextPath}/js/pagger.js'></script>
        <link href="${pageContext.request.contextPath}/css/pagger.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <style type="text/css">

            .bg-light-gray {
                background-color: #f7f7f7;
            }

            .table-bordered thead td,
            .table-bordered thead th {
                border-bottom-width: 2px;
            }

            .table thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
            }

            .table-bordered td,
            .table-bordered th {
                border: 1px solid #dee2e6;
            }


            .bg-sky.box-shadow {
                box-shadow: 0px 5px 0px 0px #00a2a7
            }

            .bg-orange.box-shadow {
                box-shadow: 0px 5px 0px 0px #af4305
            }

            .bg-green.box-shadow {
                box-shadow: 0px 5px 0px 0px #4ca520
            }

            .bg-yellow.box-shadow {
                box-shadow: 0px 5px 0px 0px #dcbf02
            }

            .bg-pink.box-shadow {
                box-shadow: 0px 5px 0px 0px #e82d8b
            }

            .bg-purple.box-shadow {
                box-shadow: 0px 5px 0px 0px #8343e8
            }

            .bg-lightred.box-shadow {
                box-shadow: 0px 5px 0px 0px #d84213
            }


            .bg-sky {
                background-color: #61c262
            }

            .bg-orange {
                background-color: #e95601
            }

            .bg-green {
                background-color: #5bbd2a
            }

            .bg-yellow {
                background-color: #f0d001
            }

            .bg-pink {
                background-color: #ff48a4
            }

            .bg-purple {
                background-color: #9d60ff
            }

            .bg-lightred {
                background-color: #ff5722
            }

            .padding-15px-lr {
                padding-left: 15px;
                padding-right: 15px;
            }

            .padding-5px-tb {
                padding-top: 5px;
                padding-bottom: 5px;
            }

            .margin-10px-bottom {
                margin-bottom: 10px;
            }

            .border-radius-5 {
                border-radius: 5px;
            }

            .margin-10px-top {
                margin-top: 10px;
            }

            .font-size14 {
                font-size: 14px;
            }

            .text-light-gray {
                color: #d6d5d5;
            }

            .font-size13 {
                font-size: 13px;
            }

            .table-bordered td,
            .table-bordered th {
                border: 1px solid #dee2e6;
            }

            .table td,
            .table th {
                padding: .75rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }

            .show-doctor-working:hover {
                background-color: #4ca520;
                /* border: 2px solid white; */
            }

            .display-pop-up {
                position: absolute;
                background-color: white;
            }

            .list-doctor-of-slot {
                background-color: #dee2e6;
                display: inline-block;
                padding: 15px;
                padding-top: 0;
                margin: 0px;
                list-style: none;
                overflow: hidden;
                max-height: 220px;
                overflow-y: scroll;
            }

            .list-doctor-of-slot li {
                background-color: rgb(246, 242, 242);
                padding: 5px 10px;
                margin: 5px 0;
            }

            .modal-header {
                padding: 8px 15px;
                background: #d6d5d5;
            }

            .list-doctor-of-slot a{
                color: black;
            }

            div.pretty {
                margin-right: 0;
            }
        </style>
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <div class="page-wrapper">
            <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->
                <main class="main-admin-page">
                    <!--HEADER-->
                <%--<jsp:include page="header.jsp"></jsp:include>--%>
                <!--HEADER-->

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

                <section class="content-main">

                    <div class="content-header">
                        <h2 class="content-title">Quản lí bài viết</h2>
                    </div>

                    <div class="card mb-4">
                        <div>
                            <div class="container" style="max-width: 500px;">
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
                                                <td>
                                                    <div class="pretty p-default p-bigger">
                                                        <input type="checkbox" name="work-shift" value="T2-S">
                                                        <div class="state p-primary">
                                                            <label></label>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="pretty p-default p-bigger">
                                                        <input type="checkbox" name="work-shift" value="T2-S">
                                                        <div class="state p-primary">
                                                            <label></label>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="pretty p-default p-bigger">
                                                        <input type="checkbox" name="work-shift" value="T2-S">
                                                        <div class="state p-primary">
                                                            <label></label>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="pretty p-default p-bigger">
                                                        <input type="checkbox" name="work-shift" value="T2-S">
                                                        <div class="state p-primary">
                                                            <label></label>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="pretty p-default p-bigger">
                                                        <input type="checkbox" name="work-shift" value="T2-S">
                                                        <div class="state p-primary">
                                                            <label></label>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="pretty p-default p-bigger">
                                                        <input type="checkbox" name="work-shift" value="T2-S">
                                                        <div class="state p-primary">
                                                            <label></label>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="pretty p-default p-bigger">
                                                        <input type="checkbox" name="work-shift" value="T2-S">
                                                        <div class="state p-primary">
                                                            <label></label>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="align-middle">
                                                    <span>Chiều</span>
                                                    <div class="small text-secondary">13:00-16:00</div>
                                                </td>
                                                <td>
                                                    <div class="pretty p-default p-bigger">
                                                        <input type="checkbox" name="work-shift" value="T2-S">
                                                        <div class="state p-primary">
                                                            <label></label>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="pretty p-default p-bigger">
                                                        <input type="checkbox" name="work-shift" value="T2-S">
                                                        <div class="state p-primary">
                                                            <label></label>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="pretty p-default p-bigger">
                                                        <input type="checkbox" name="work-shift" value="T2-S">
                                                        <div class="state p-primary">
                                                            <label></label>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="pretty p-default p-bigger">
                                                        <input type="checkbox" name="work-shift" value="T2-S">
                                                        <div class="state p-primary">
                                                            <label></label>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="pretty p-default p-bigger">
                                                        <input type="checkbox" name="work-shift" value="T2-S">
                                                        <div class="state p-primary">
                                                            <label></label>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="pretty p-default p-bigger">
                                                        <input type="checkbox" name="work-shift" value="T2-S">
                                                        <div class="state p-primary">
                                                            <label></label>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="pretty p-default p-bigger">
                                                        <input type="checkbox" name="work-shift" value="T2-S">
                                                        <div class="state p-primary">
                                                            <label></label>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="container table-schedule">
                            <div class="table-responsive">
                                <table class="table table-bordered text-center">
                                    <thead>
                                        <tr class="bg-light-gray">
                                            <th class="text-uppercase">Thời gian
                                            </th>
                                            <th class="text-uppercase">Thứ 2</th>
                                            <th class="text-uppercase">Thứ 3</th>
                                            <th class="text-uppercase">Thứ 4</th>
                                            <th class="text-uppercase">Thứ 5</th>
                                            <th class="text-uppercase">Thứ 6</th>
                                            <th class="text-uppercase">Thứ 7</th>
                                            <th class="text-uppercase">Chủ Nhật</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="align-middle">
                                                <span>Sáng</span>
                                                <div class="margin-10px-top font-size14">10:00-11:00</div>
                                            </td>
                                            <td>
                                                <span
                                                    class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13 show-doctor-working">Xem</span>
                                                <div class="margin-10px-top font-size14">3 bác sĩ</div>
                                            </td>
                                            <td>
                                                <span
                                                    class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13 show-doctor-working">Xem</span>
                                                <div class="margin-10px-top font-size14">3 bác sĩ</div>
                                            </td>
                                            <td>
                                                <span
                                                    class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13 show-doctor-working">Xem</span>
                                                <div class="margin-10px-top font-size14">3 bác sĩ</div>
                                            </td>
                                            <td>
                                                <span
                                                    class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13 show-doctor-working">Xem</span>
                                                <div class="margin-10px-top font-size14">3 bác sĩ</div>
                                            </td>
                                            <td>
                                                <span
                                                    class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13 show-doctor-working">Xem</span>
                                                <div class="margin-10px-top font-size14">3 bác sĩ</div>
                                            </td>
                                            <td>
                                                <span
                                                    class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13 show-doctor-working">Xem</span>
                                                <div class="margin-10px-top font-size14">3 bác sĩ</div>
                                            </td>
                                            <td>
                                                <span
                                                    class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13 show-doctor-working">Xem</span>
                                                <div class="margin-10px-top font-size14">3 bác sĩ</div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="align-middle">
                                                <span>Chiều</span>
                                                <div class="margin-10px-top font-size14">13:00-16:00</div>
                                            </td>
                                            <td>
                                                <span
                                                    class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13 show-doctor-working">Xem</span>
                                                <div class="margin-10px-top font-size14">3 bác sĩ</div>
                                            </td>
                                            <td>
                                                <span
                                                    class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13 show-doctor-working">Xem</span>
                                                <div class="margin-10px-top font-size14">3 bác sĩ</div>
                                            </td>
                                            <td>
                                                <span
                                                    class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13 show-doctor-working">Xem</span>
                                                <div class="margin-10px-top font-size14">3 bác sĩ</div>
                                            </td>
                                            <td>
                                                <span
                                                    class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13 show-doctor-working">Xem</span>
                                                <div class="margin-10px-top font-size14">3 bác sĩ</div>
                                            </td>
                                            <td>
                                                <span
                                                    class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13 show-doctor-working">Xem</span>
                                                <div class="margin-10px-top font-size14">3 bác sĩ</div>
                                            </td>
                                            <td>
                                                <span
                                                    class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13 show-doctor-working">Xem</span>
                                                <div class="margin-10px-top font-size14">3 bác sĩ</div>
                                            </td>
                                            <td>
                                                <span
                                                    class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13 show-doctor-working">Xem</span>
                                                <div class="margin-10px-top font-size14">3 bác sĩ</div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div> <!-- card end// -->
                </section>
            </main>
        </div>
        <script src="${context}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
        <script type="text/javascript">

                            const showBtns = Array.from(document.querySelectorAll('.show-doctor-working'));
                            showBtns.forEach(btn => btn.addEventListener('click', function () {
                                    const list = document.createElement("div");
                                    list.innerHTML = `<div class="display-pop-up">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Danh sách bác sĩ</h5>
                                                        <button type="button" class="close close-doctor-list fw-bold fs-4"
                                                         data-dismiss="modal" aria-label="Close">×</button>
                                                    </div>
                                                    <ul class="list-doctor-of-slot">
                                                        <li>
                                                            <a href="#" class="itemside">
                                                                    <img src="${context}/img/team-1.jpg" 
                                                                         class="img-sm img-avatar rounded-circle" alt="User Photo" width="40" id="show-avatar">
                                                                    <span class="mb-0 title">Ths. Nguyen Văn An</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" class="itemside">
                                                                    <img src="${context}/img/team-1.jpg" 
                                                                         class="img-sm img-avatar rounded-circle" alt="User Photo" width="40" id="show-avatar">
                                                                    <span class="mb-0 title">Ths. Nguyen Văn An</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" class="itemside">
                                                                    <img src="${context}/img/team-1.jpg" 
                                                                         class="img-sm img-avatar rounded-circle" alt="User Photo" width="40" id="show-avatar">
                                                                    <span class="mb-0 title">Ths. Nguyen Văn An</span>
                                                            </a>
                                                        </li>
                                                        
                                                        <li>
                                                            <a href="#" class="itemside">
                                                                    <img src="${context}/img/team-1.jpg" 
                                                                         class="img-sm img-avatar rounded-circle" alt="User Photo" width="40" id="show-avatar">
                                                                    <span class="mb-0 title">Ths. Nguyen Văn An</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" class="itemside">
                                                                    <img src="${context}/img/team-1.jpg" 
                                                                         class="img-sm img-avatar rounded-circle" alt="User Photo" width="40" id="show-avatar">
                                                                    <span class="mb-0 title">Ths. Nguyen Văn An</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#" class="itemside">
                                                                    <img src="${context}/img/team-1.jpg" 
                                                                         class="img-sm img-avatar rounded-circle" alt="User Photo" width="40" id="show-avatar">
                                                                    <span class="mb-0 title">Ths. Nguyen Văn An</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>`;
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
                        </script>
    </body>
</html>
