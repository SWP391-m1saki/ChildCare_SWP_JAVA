<%-- 
    Document   : postList.jsp
    Created on : Oct 3, 2022, 9:07:49 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/add-product.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/theme.min.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>
    </head>
    <body>
        <div class="content">
        <nav class="navbar-glass  fs--1 navbar-top sticky-kit navbar navbar-expand navbar-light">
            <div aria-label="Toggle navigation"
                class="toggle-icon-wrapper me-md-3 me-2 d-xl-none navbar-toggler collapsed">
                <button class="navbar-toggler-humburger-icon btn btn-link d-flex flex-center" id="burgerMenu"><span
                        class="navbar-toggle-icon"><span class="toggle-line"></span></span></button>
            </div><a class="text-decoration-none navbar-brand text-left" id="topLogo" href="/">
                <div class="d-flex align-items-center"><img class="me-2" src="/static/media/falcon.fa3b1ec6.png"
                        alt="Logo" width="40"><span class="font-sans-serif">falcon</span></div>
            </a>
            <ul class="align-items-center d-none d-lg-block navbar-nav">
                <li class="nav-item">
                    <div class="search-box dropdown">
                        <div class="toggle" id="react-aria7631882193-1" aria-expanded="false" data-toggle="dropdown">
                            <form class="position-relative"><input placeholder="Search..." aria-label="Search"
                                    type="search" class="rounded-pill search-input form-control" value=""><svg
                                    aria-hidden="true" focusable="false" data-prefix="fas" data-icon="search"
                                    class="svg-inline--fa fa-search fa-w-16 position-absolute text-400 search-box-icon"
                                    role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                    <path fill="currentColor"
                                        d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z">
                                    </path>
                                </svg></form>
                        </div>
                        <div aria-labelledby="react-aria7631882193-1" data-bs-popper="static" class="dropdown-menu">
                            <div class="scrollbar py-3" style="max-height: 24rem;">
                                <h6 class="px-card pt-0 pb-2 fw-medium dropdown-header" role="heading">Recently Browsed
                                </h6>
                                <a data-rr-ui-dropdown-item="" class="fs--1 px-card py-1 hover-primary  dropdown-item"
                                    href="/events/event-detail">
                                    <div class="d-flex align-items-center"><svg aria-hidden="true" focusable="false"
                                            data-prefix="fas" data-icon="circle"
                                            class="svg-inline--fa fa-circle fa-w-16 me-2 text-300 fs--2" role="img"
                                            xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                            <path fill="currentColor"
                                                d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z">
                                            </path>
                                        </svg>
                                        <div class="fw-normal">Pages <svg aria-hidden="true" focusable="false"
                                                data-prefix="fas" data-icon="chevron-right"
                                                class="svg-inline--fa fa-chevron-right fa-w-10 mx-1 text-500 fs--2"
                                                role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                                                <path fill="currentColor"
                                                    d="M285.476 272.971L91.132 467.314c-9.373 9.373-24.569 9.373-33.941 0l-22.667-22.667c-9.357-9.357-9.375-24.522-.04-33.901L188.505 256 34.484 101.255c-9.335-9.379-9.317-24.544.04-33.901l22.667-22.667c9.373-9.373 24.569-9.373 33.941 0L285.475 239.03c9.373 9.372 9.373 24.568.001 33.941z">
                                                </path>
                                            </svg> Events</div>
                                    </div>
                                </a><a data-rr-ui-dropdown-item=""
                                    class="fs--1 px-card py-1 hover-primary  dropdown-item"
                                    href="/e-commerce/customers">
                                    <div class="d-flex align-items-center"><svg aria-hidden="true" focusable="false"
                                            data-prefix="fas" data-icon="circle"
                                            class="svg-inline--fa fa-circle fa-w-16 me-2 text-300 fs--2" role="img"
                                            xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                            <path fill="currentColor"
                                                d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z">
                                            </path>
                                        </svg>
                                        <div class="fw-normal">E-commerce <svg aria-hidden="true" focusable="false"
                                                data-prefix="fas" data-icon="chevron-right"
                                                class="svg-inline--fa fa-chevron-right fa-w-10 mx-1 text-500 fs--2"
                                                role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                                                <path fill="currentColor"
                                                    d="M285.476 272.971L91.132 467.314c-9.373 9.373-24.569 9.373-33.941 0l-22.667-22.667c-9.357-9.357-9.375-24.522-.04-33.901L188.505 256 34.484 101.255c-9.335-9.379-9.317-24.544.04-33.901l22.667-22.667c9.373-9.373 24.569-9.373 33.941 0L285.475 239.03c9.373 9.372 9.373 24.568.001 33.941z">
                                                </path>
                                            </svg> Customers</div>
                                    </div>
                                </a>
                                <hr class="text-200 dark__text-900">
                                <h6 class="px-card pt-0 pb-2 fw-medium dropdown-header" role="heading">Suggested Filter
                                </h6>
                                <a data-rr-ui-dropdown-item="" class="fs-0 px-card py-1 dropdown-item"
                                    href="/e-commerce/customers">
                                    <div class="d-flex align-items-center">
                                        <div class="fw-medium text-decoration-none me-2 badge badge-soft-warning">
                                            customers:
                                        </div>
                                        <div class="flex-1 fs--1">All customers list</div>
                                    </div>
                                </a><a data-rr-ui-dropdown-item="" class="fs-0 px-card py-1 dropdown-item"
                                    href="/events/event-detail">
                                    <div class="d-flex align-items-center">
                                        <div class="fw-medium text-decoration-none me-2 badge badge-soft-success">
                                            events:
                                        </div>
                                        <div class="flex-1 fs--1">Latest events in current month</div>
                                    </div>
                                </a><a data-rr-ui-dropdown-item="" class="fs-0 px-card py-1 dropdown-item"
                                    href="/e-commerce/product/product-grid">
                                    <div class="d-flex align-items-center">
                                        <div class="fw-medium text-decoration-none me-2 badge badge-soft-info">products:
                                        </div>
                                        <div class="flex-1 fs--1">Most popular products</div>
                                    </div>
                                </a>
                                <hr class="text-200 dark__text-900">
                                <h6 class="px-card pt-0 pb-2 fw-medium dropdown-header" role="heading">Files</h6><a
                                    data-rr-ui-dropdown-item="" class="px-card py-2 dropdown-item"
                                    href="/e-commerce/product/product-list#!">
                                    <div class="d-flex align-items-center">
                                        <div class="file-thumbnail"><img
                                                src="data:image/png;base64,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"
                                                alt="" class="border h-100 w-100 fit-cover rounded-lg"></div>
                                        <div class="ms-2">
                                            <h6 class="mb-0">iPhone</h6>
                                            <p class="fs--2 mb-0"><span class="fw-semi-bold">Antony</span><span
                                                    class="fw-medium text-600 ms-2">27 Sep at 10:30 AM</span></p>
                                        </div>
                                    </div>
                                </a><a data-rr-ui-dropdown-item="" class="px-card py-2 dropdown-item"
                                    href="/e-commerce/product/product-list#!">
                                    <div class="d-flex align-items-center">
                                        <div class="file-thumbnail"><img
                                                src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAMAAAD04JH5AAAAkFBMVEUAAAAse+X4+v5rou1knuzg6/uCsfBWleo6hOe50/dDiegxf+bk7vwtfOXz9/5IjenV5fqryvVbmOtfm+zJ3fm91vdooOxPken9/v/u9f2dwfNBiOjc6vva6PqZv/OOufGHtPGAsO9zqO76/P7o8fw4g+ehxPTD2fh+ru93q+5Rkuqyz/aUvfLR4/mLt/GnyfSCtHegAAAAAXRSTlMAQObYZgAAAzpJREFUeNrtm+1yojAUQO9FK1hAUVSkKiJgXT9q3//tNiTtRqG2lavJzJrzT2cYDoQjUQlcwkuGMx+vZ+bBLbBSFxuy6wGdwsbmTKb047eRwh+g0kFOv33GDj8Ztr9kiB+8Ao0nPv7hAs7p/hN4urAdfuCPgcSB79+CxgLoBkDBLg9iDs0E2g49xjUiRtBQoDNyqTHmvCWoMX9h8AtttVwuk0sCsPeJMVrIaF0ORPB8UQAOIkZ9ArAVMeoTyEMRozYBiPs8xrfbCoxsBo9sHATB4jsBmFNiFAKNMwSOiDHqaROAvbwz6hGAZSVGusDYYfAzG/QYPwlAJmLUUYHAGooYdQnIGLUJwHwtYtQhUI+RLhCPGK3PKVn2GwEYyBiVZig5ihj1CUxbIkZdAjJGbQIQP4sYyQI/T8m8r4d7IWO8X4ZywxBqbHwxTb27AMzK0Q6gxruM8b4CK2REMdRIsaRzd4GAn+v+ZgrQIEbylIxPhzmOXSXi7/vWfTKU9CL8lrsLQGFrFgDr6BIECFMySfE6iZw6blWAXsF1tIzAfyBQdBlt/qmeZVmHKEDP0Ag8oIA3YITIyFar1fIBMzQC2gU2fQaf4488xgNmaAS0XwPaKzAC2gW03w21Z2gEtAuIi1CPgKRjBB5bYNrdOsgYDnpaBLp9+bTQ+1S5gLXFUyaxYoG8hef0C7UCHRS4zw4KdpZKgY2PJe1NDlC8CIeOSgGbH/0ABLF4QiFQJzDCkn3ln6CWOoGUT4RA4rnlKegpE9ghYw4n/EFGV5nAuuwOThkjI1ElYNWfbZrzDlQJ5H6ZIJyyQEaqbAic2hB0lQ2B/Bg4y36r9iI8VN9blIPiKslQ7g9fK/9OtUGJgNzeT6bA8WwseVMoMHexxN7HkAdH8SJTejve4weuj4Kop1QAXvzKhORJ9ZxwvMYT2rH6SWksHziPxnq+F1jjtDUMt8kCQIuAxAgYASNgBIyAETACRsAIGAEjQBBottiNzgQZOWG5H5UIER3CgkcqC2TYhCWfBORPu4erFr0OA7gZAd+/68EvSSvLfomEfeSkpIXPdGyLsvSbjl0QFr/TcY8WXIeXhDMfb4I/CxMPLvAXi0c63okhC7MAAAAASUVORK5CYII="
                                                alt="" class="img-fluid"></div>
                                        <div class="ms-2">
                                            <h6 class="mb-0">Falcon v1.8.2</h6>
                                            <p class="fs--2 mb-0"><span class="fw-semi-bold">John</span><span
                                                    class="fw-medium text-600 ms-2">30 Sep at 12:30 PM</span></p>
                                        </div>
                                    </div>
                                </a>
                                <hr class="text-200 dark__text-900">
                                <h6 class="px-card pt-0 pb-2 fw-medium dropdown-header" role="heading">Members</h6><a
                                    data-rr-ui-dropdown-item="" class="px-card py-2 dropdown-item" href="/user/profile">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar avatar-l status-online"><img class="rounded-circle "
                                                src="/static/media/2.20b1aba3.jpg" alt=""></div>
                                        <div class="ms-2">
                                            <h6 class="mb-0">Anna Karinina</h6>
                                            <p class="fs--2 mb-0">Technext Limited</p>
                                        </div>
                                    </div>
                                </a><a data-rr-ui-dropdown-item="" class="px-card py-2 dropdown-item"
                                    href="/user/profile">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar avatar-l "><img class="rounded-circle "
                                                src="/static/media/1.f7d5569c.jpg" alt=""></div>
                                        <div class="ms-2">
                                            <h6 class="mb-0">Antony Hopkins</h6>
                                            <p class="fs--2 mb-0">Brain Trust</p>
                                        </div>
                                    </div>
                                </a><a data-rr-ui-dropdown-item="" class="px-card py-2 dropdown-item"
                                    href="/user/profile">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar avatar-l "><img class="rounded-circle "
                                                src="/static/media/3.b3477e97.jpg" alt=""></div>
                                        <div class="ms-2">
                                            <h6 class="mb-0">Emma Watson</h6>
                                            <p class="fs--2 mb-0">Google</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
            <ul class="navbar-nav-icons ms-auto flex-row align-items-center navbar-nav">
                <li class="nav-item"><a role="button" class="px-2 theme-control-toggle nav-link" tabindex="0" href="#">
                        <div class="theme-control-toggle-label"><svg aria-hidden="true" focusable="false"
                                data-prefix="fas" data-icon="moon" class="svg-inline--fa fa-moon fa-w-16 fs-0"
                                role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <path fill="currentColor"
                                    d="M283.211 512c78.962 0 151.079-35.925 198.857-94.792 7.068-8.708-.639-21.43-11.562-19.35-124.203 23.654-238.262-71.576-238.262-196.954 0-72.222 38.662-138.635 101.498-174.394 9.686-5.512 7.25-20.197-3.756-22.23A258.156 258.156 0 0 0 283.211 0c-141.309 0-256 114.511-256 256 0 141.309 114.511 256 256 256z">
                                </path>
                            </svg></div>
                    </a></li>
                <li class="d-none d-sm-block nav-item"><a
                        class="px-0 notification-indicator notification-indicator-warning position-relative notification-indicator-fill nav-link"
                        href="/e-commerce/shopping-cart"><span class="notification-indicator-number">9</span><svg
                            aria-hidden="true" focusable="false" data-prefix="fas" data-icon="shopping-cart"
                            class="svg-inline--fa fa-shopping-cart fa-w-18 fs-4" role="img"
                            xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"
                            style="transform-origin: 0.5625em 0.5em;">
                            <g transform="translate(288 256)">
                                <g transform="translate(0, 0)  scale(0.5625, 0.5625)  rotate(0 0 0)">
                                    <path fill="currentColor"
                                        d="M528.12 301.319l47.273-208C578.806 78.301 567.391 64 551.99 64H159.208l-9.166-44.81C147.758 8.021 137.93 0 126.529 0H24C10.745 0 0 10.745 0 24v16c0 13.255 10.745 24 24 24h69.883l70.248 343.435C147.325 417.1 136 435.222 136 456c0 30.928 25.072 56 56 56s56-25.072 56-56c0-15.674-6.447-29.835-16.824-40h209.647C430.447 426.165 424 440.326 424 456c0 30.928 25.072 56 56 56s56-25.072 56-56c0-22.172-12.888-41.332-31.579-50.405l5.517-24.276c3.413-15.018-8.002-29.319-23.403-29.319H218.117l-6.545-32h293.145c11.206 0 20.92-7.754 23.403-18.681z"
                                        transform="translate(-288 -256)"></path>
                                </g>
                            </g>
                        </svg></a></li>
                <li class="dropdown"><a
                        class="px-0 nav-link notification-indicator notification-indicator-primary toggle"
                        id="react-aria7631882193-2" aria-expanded="false" href="/e-commerce/product/product-list#!"><svg
                            aria-hidden="true" focusable="false" data-prefix="fas" data-icon="bell"
                            class="svg-inline--fa fa-bell fa-w-14 fs-4" role="img" xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 448 512" style="transform-origin: 0.4375em 0.5em;">
                            <g transform="translate(224 256)">
                                <g transform="translate(0, 0)  scale(0.625, 0.625)  rotate(0 0 0)">
                                    <path fill="currentColor"
                                        d="M224 512c35.32 0 63.97-28.65 63.97-64H160.03c0 35.35 28.65 64 63.97 64zm215.39-149.71c-19.32-20.76-55.47-51.99-55.47-154.29 0-77.7-54.48-139.9-127.94-155.16V32c0-17.67-14.32-32-31.98-32s-31.98 14.33-31.98 32v20.84C118.56 68.1 64.08 130.3 64.08 208c0 102.3-36.15 133.53-55.47 154.29-6 6.45-8.66 14.16-8.61 21.71.11 16.4 12.98 32 32.1 32h383.8c19.12 0 32-15.6 32.1-32 .05-7.55-2.61-15.27-8.61-21.71z"
                                        transform="translate(-224 -256)"></path>
                                </g>
                            </g>
                        </svg></a>
                    <div aria-labelledby="react-aria7631882193-2" data-bs-popper="static"
                        class="dropdown-menu-card dropdown-menu-end dropdown-caret dropdown-caret-bg dropdown-menu">
                        <div class="dropdown-menu-notification dropdown-menu-end shadow-none card"
                            style="max-width: 20rem;">
                            <div class="card-header card-header">
                                <div class="align-items-center row">
                                    <div class="col">
                                        <h6 class="mb-0">Notifications</h6>
                                    </div>
                                    <div class="text-right col-auto"><a class="card-link fw-normal"
                                            href="/e-commerce/product/product-list#!">Mark all as read</a></div>
                                </div>
                            </div>
                            <div class="fw-normal fs--1 scrollbar list-group list-group-flush"
                                style="max-height: 19rem;">
                                <div class="list-group-title">NEW</div>
                                <div class="list-group-item"><a
                                        class="notification notification-unread notification-flush rounded-0 border-x-0 border-300 border-bottom-0"
                                        href="/e-commerce/product/product-list#!">
                                        <div class="notification-avatar">
                                            <div class="avatar avatar-2xl me-3"><img class="rounded-circle "
                                                    src="/static/media/1.f7d5569c.jpg" alt=""></div>
                                        </div>
                                        <div class="notification-body">
                                            <p class="mb-1"><strong>Emma Watson</strong> replied to your comment :
                                                "Hello
                                                world 😍"</p><span class="notification-time"><span class="me-2"
                                                    role="img" aria-label="Emoji">💬</span>Just Now</span>
                                        </div>
                                    </a></div>
                                <div class="list-group-item"><a
                                        class="notification notification-unread notification-flush rounded-0 border-x-0 border-300 border-bottom-0"
                                        href="/e-commerce/product/product-list#!">
                                        <div class="notification-avatar">
                                            <div class="avatar avatar-2xl me-3">
                                                <div class="avatar-name rounded-circle "><span>AB</span></div>
                                            </div>
                                        </div>
                                        <div class="notification-body">
                                            <p class="mb-1"><strong>Albert Brooks</strong> reacted to <strong>Mia
                                                    Khalifa's</strong> status</p><span class="notification-time"><span
                                                    class="me-2" role="img" aria-label="Emoji">❤️</span>9hr</span>
                                        </div>
                                    </a></div>
                                <div class="list-group-title">EARLIER</div>
                                <div class="list-group-item"><a
                                        class="notification notification-flush rounded-0 border-x-0 border-300 border-bottom-0"
                                        href="/e-commerce/product/product-list#!">
                                        <div class="notification-avatar">
                                            <div class="avatar avatar-2xl me-3"><img class="rounded-circle "
                                                    src="/static/media/weather.27c27b87.jpg" alt=""></div>
                                        </div>
                                        <div class="notification-body">
                                            <p class="mb-1">The forecast today shows a low of 20℃ in California. See
                                                today's
                                                weather.</p><span class="notification-time"><span class="me-2"
                                                    role="img" aria-label="Emoji">🌤️</span>1d</span>
                                        </div>
                                    </a></div>
                                <div class="list-group-item"><a
                                        class="notification notification-flush rounded-0 border-x-0 border-300 border-bottom-0 notification-unread"
                                        href="/e-commerce/product/product-list#!">
                                        <div class="notification-avatar">
                                            <div class="avatar avatar-xl me-3"><img class="rounded-circle "
                                                    src="/static/media/oxford.9cafa98d.png" alt=""></div>
                                        </div>
                                        <div class="notification-body">
                                            <p class="mb-1"><strong>University of Oxford</strong> created an event :
                                                "Causal
                                                Inference Hilary 2019"</p><span class="notification-time"><span
                                                    class="me-2" role="img" aria-label="Emoji">✌️</span>1W</span>
                                        </div>
                                    </a></div>
                                <div class="list-group-item"><a
                                        class="notification notification-flush rounded-0 border-x-0 border-300 border-bottom-0"
                                        href="/e-commerce/product/product-list#!">
                                        <div class="notification-avatar">
                                            <div class="avatar avatar-xl me-3"><img class="rounded-circle "
                                                    src="/static/media/10.8575d5a9.jpg" alt=""></div>
                                        </div>
                                        <div class="notification-body">
                                            <p class="mb-1"><strong>James Cameron</strong> invited to join the group:
                                                United
                                                Nations International Children's Fund</p><span
                                                class="notification-time"><span class="me-2" role="img"
                                                    aria-label="Emoji">🙋‍</span>2d</span>
                                        </div>
                                    </a></div>
                            </div>
                            <div class="card-footer text-center border-top"><a class="card-link d-block"
                                    href="/e-commerce/product/product-list#!">View all</a></div>
                        </div>
                    </div>
                </li>
                <li class="dropdown"><a class="nav-link px-2 nine-dots toggle" id="react-aria7631882193-3"
                        aria-expanded="false" href="/e-commerce/product/product-list#!"><svg
                            xmlns="http://www.w3.org/2000/svg" width="16" height="37" viewBox="0 0 16 16" fill="none">
                            <circle cx="2" cy="2" r="2" fill="#6C6E71"></circle>
                            <circle cx="2" cy="8" r="2" fill="#6C6E71"></circle>
                            <circle cx="2" cy="14" r="2" fill="#6C6E71"></circle>
                            <circle cx="8" cy="8" r="2" fill="#6C6E71"></circle>
                            <circle cx="8" cy="14" r="2" fill="#6C6E71"></circle>
                            <circle cx="14" cy="8" r="2" fill="#6C6E71"></circle>
                            <circle cx="14" cy="14" r="2" fill="#6C6E71"></circle>
                            <circle cx="8" cy="2" r="2" fill="#6C6E71"></circle>
                            <circle cx="14" cy="2" r="2" fill="#6C6E71"></circle>
                        </svg></a>
                    <div aria-labelledby="react-aria7631882193-3" data-bs-popper="static"
                        class="dropdown-menu-card dropdown-menu-end dropdown-caret dropdown-caret-bg dropdown-menu">
                        <div class="dropdown-menu-end shadow-none card">
                            <div data-simplebar="init" class="nav-quick-links">
                                <div class="simplebar-wrapper" style="margin: 0px;">
                                    <div class="simplebar-height-auto-observer-wrapper">
                                        <div class="simplebar-height-auto-observer"></div>
                                    </div>
                                    <div class="simplebar-mask">
                                        <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                                            <div class="simplebar-content-wrapper" tabindex="0" role="region"
                                                aria-label="scrollable content" style="height: auto; overflow: hidden;">
                                                <div class="simplebar-content" style="padding: 0px;">
                                                    <div class="card-body">
                                                        <div class="text-center g-0 row">
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="/user/profile">
                                                                    <div class="avatar avatar-2xl "><img
                                                                            class="rounded-circle "
                                                                            src="/static/media/3.b3477e97.jpg" alt="">
                                                                    </div>
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2">
                                                                        Account</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="https://themewagon.com/"><img
                                                                        src="data:image/png;base64,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"
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        Themewagon</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="https://mailbluster.com/"><img
                                                                        src="data:image/png;base64,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"
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        Mailbluster</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="#!"><img
                                                                        src="data:image/png;base64,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"
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        Google</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="#!"><img
                                                                        src="data:image/png;base64,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"
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        Spotify</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="#!"><img
                                                                        src="data:image/png;base64,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"
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        Steam</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="#!"><img
                                                                        src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFoAAABgCAYAAACdSWXJAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAnRSURBVHgB7Z1NbhvJFcdfVZMiqSyiOcG0BxjLAQIMdQLTJxj5BKYWA9uZheRFYMtZDIVgIgtZDLVwLCGLoU8w9gnEOcHQQIBYChBzTjDKwqJksavyXrGbbrXZ7I+qJtkUf4DNr2aL/LP4qup9kcGMcf/x8VecQxWErErGVpikS1hR1wFW/MdKgFN8/BSvdqXE64x1LCk7fWDdw73VNzBDMJgyD7f/c1tKUUPZaihmNSimFlK28S22GePtF7tf/gxTZCpCk7ggnHXBWd2osOOQsuuK3pqG6BMTemvrl5Xz8vImY7COX/kqTBMUHc1Mg/Ni+/n3X/wKEyBzoT2B0c5uTWz0xsUd5ZZVbGQteGZCz7TAAQaTKjTL52f7zebaKWRAJkJ/+/jt1w6DJjBmQ55wTcqL3dWXYBijQj948m8bT/kjClyDPCOhZdqcGBOaRnGfs9asm4nYGB7dHAzwcPvkB4ezV3MjMoFmD21368GT4+/AAFojejDhVX7KvamIAjc+lrVU1zElqYV27fFR7ia8tKApQbFracVOJfS1E9lDQ+zEQl9bkT1Sip1I6GsvskcKsWOvOmjiW4jsgho4zof2QJN4xBa6V1n+cSGyD9RCrbhiEktoWkuijVmHBVfBZe39x29/iHVo1AHKb4GbEUgARToE7ayAYWQEqhgFmW2nEmOnfBilwWgORnWSPJ8Br0X5uMcKnXbys3jR9k8UeJ4afnnu4V/DS7BhBlDiOqIlmXx98OwPbe/+rca7lfOLD79BEnBQlc97a+M8fxFCH6NdhjokgrUPdm/eCXv04fbxPdzaNmB6gndR5Gbl7P3LMGEePHl7lHS3K4V8dbh3627Y44WwB1xB6pAUFacLx3XSvEwjOI1CNxgLbuA2tkmi54IjGijGfvTRrI3/1SABjLN1CtGFmZBQodFONfBTheSIn+McRYKjScFj+Xfet2YgJHSYEB1h8S6X8lcM3HbK5+enYaOPlljvl39nW8JZkdz6Cs2BLTmvUrDXO4YJ2SxfnO3EdepbFu84QkBSpHRa+HpGmpCRQt9/erKJz7IhBY7jxI5QoG3s4sXGn56e7AsU6nD3o62Mi/umOu7Ntv+xwdyAH+pesvM6Tv8NDlFIjFryLW/itZ1PHgreobv7K/fOPssqHDQpUk2ILhQWq/TObgQ1GPGx0eqA2ZCSvItMNBs3Ur8H8sm7o/oKI4SWdVigBQWkg9vzK0LTSkB3m/3tX/77OeScgflMD43qXqlyz39fcERvgSb9/ofpJscYgLGC9mChRCH/7aHQOPNXTWQQ4fY790IPcgE1wQ2PSn1zGQothNwEAyT1E8wiwdGYFv8H5jMdHxf4OuDCvAU5h3PeABP43BdKaDIbRnzNEhrP9269hpzz/PsvX6PnsQn62N/8+V/qG66EdgBugz7dg2erOzAnvNi9+QgvuqAJ5wWlrRIafQvaNokNHERzBfqZ66CJZ++V0AMnjBbdLBIDp43yxEV4I6OQ7iqMk33WjYDM42j2wEGYKLoUhDYvtInjuO7VXpxT5jzMKZWlovY3VYjLGnccoWU2cJPTmVR5wjQgBxP76IZNBcYibRzRertBLvRsWD5QERcdbAxi6NlnYWAJNOsIpvkecY9CNlpLaM5Z7v3PUTDh/A+0kDiiNZPHcT8/t/bZA71570ATWkfbsCBrbO3SCsZ47h39UXCuXzJipIZl3sGo+GegibbQ6MeenwKhECS3fg+acJXBo3OCa2DjccVggybcS7FKi7gGQuPKStvpxnF7qSU04/mPEcbABg0oqYZsdBf0sJOUGOQNlXqgGX3CaA0JzbqgyUVl+WuYU3D5qh19oqRNrr2PBxX5rsP8oh19In8Qx2WHlguQoCjCPJoPMhvSgNCMyTe8VCpod9MKS+zLOybMBlE+P++otN0H28fkNLFBg7B01bxiqniVAiOHu6tr3L3VBk3cxD4jLRdmAcasTRO5LlTBQJfuFjxeOUTkSTnb8ueb5RXViw+kdsIngQsFFdxVQpfLZa1Irx8B4lWeU3fVBCidFhiiUFj6OKJVhrs0E/sjE0J10nkU23xTATbsqzf03unmL1w9/6AonfqMQk4YmDyzTQUYyJZ3fSg05S/oevKu/hVmMw4dUz2JsoLW/9QTSoJom24q4M93uVKV9XD7+CeZRXF9hv3k0kICk+vArae0wTQSWgfPVje8mwGhabbFTzb0uXAq+pd3/vn3PyoD76vxrkOsPz5oUSklNKfVdtjr7pt5h0kp7vhrzEfUGY6vgx5VyT/wcPEjSLLpGXa/hbYQuKjPQHgatb3S8ufUjxo/XBJ3nU2kZdyn9fCfCB01qgkp5FawppqKIC8uPhzp1MEwITvogKF6ba1k9sGoxSVaFiYhBihqPWgm2agD41T3UzV/5aK34d9yuxWnv0Dq7fz4zghJSNOhwBDdg93VG8E7RwZncfvZgAiomv+iVDny3zdICEyfvG3xQh2MITdgCjj9y5GtJEYKTTYYTUDkulpiGCvY6oaem6r+A2dpk1mpqqBfTjgBE9+Dt1AIEppuwKR4FGddPcq/USoVd5Kmuno+AZNYlpX8A09Plzr0hj0YKjSNCCtmJj9OPFeOIxOCS6i7ScRGe2/EseWnWCwYP2cYOGc1x30jWcTzY08qYQ2c1M5wsM62Rz1PNUPBF5lVRdf9pye/Zd48K7A5GUUBIiiXS3fjrCTcUf3JisEVcMfd3NymN03ion1HgZ03aZqhJMHNW8lS6LEmY/g6IAZx1tZEsDvYLJD1Mk8WitXDv34RudmKlXtHJoEzFukIR49dC64TEjdXMUQmYic5/uNvN/fpxGMPStDZMPegFknmlUTZpHTiqDUyLffmXew0k3fitF1VIy3HdzAgsdE2vlMdbeYNfO8v9m49SviseJPhKNxlWyPyQPJFS3iFn2ibfpWtUCgON0H9/uWK+qU3GDYeNI7JyZBGchqRidSJ6OqrI2MITb/+gCNc/aoFRlwccdn1/tFt+mUICawOsw6+17QiE1oZ/yQ2rUaMhsBmDLWhQren7oZKu7SCViO48VgDjfRfCTNbntEFq1AzYdaMFAuRX6RcWlqLmiTDyDLqkbZgVfUz7Z2txV0nRxG5BY+L2/1wA1ca7Sm3Lb5CioJVdK+KjaT9TKMwXv5GXzN3dDcgR6h5Bl8zjWJ/UNUUxka0H3d0kyPppb9t8cyCJq/AC43nz7Lz02QitIfXthgF3xknuNQsWBoHFUPJEfd7red5Yak5CUdYpkJ7+AWn5O6gDUf7lVkkBCfDFkZvhuenYITEDVSl935/krncqXeGunzz9KRqCYd2hd0sbKIft6lrbRJ/a8GCBQsWLFiwYMG14P9nwGeH+NhphgAAAABJRU5ErkJggg=="
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        Github</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="#!"><img
                                                                        src="data:image/png;base64,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"
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        Discord</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="#!"><img
                                                                        src="data:image/png;base64,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"
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        xbox</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="#!"><img
                                                                        src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGIAAABiCAYAAACrpQYOAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAexSURBVHgB7Z1Pc9NGFMDfynEC5JIyyXCsD9yBybGlKJ8AeuBMvgH0VALt1IeGHgmfoHDm0PQTxA7tkZn2zsE90mQyHDCQxNLy3lpar1aSbcn64zHvN7P2Stpdrfbp7X/tCpiWBwdrcNG5DUK4IKWL/y1g4kj5D4DooWUffrv1YlpvYipXj7r38beNzteAmR4pe0DpNoVAxgtCaUHjD3TlApMfCR1wGtuw+81/aU7SBfHwoAXCOeAsqCBIOz76N2Bv613SZSfVo2j8zkIoEEpLyl1SSBbETvceZ0clQGn6oypvY6RpRBuYcmiItip7LWxBiKE2iBYwZbEGq83bYKW9LQgHhXAHmHKRvgvDipKuLJmCIPsSumoBUzYuqLQeKwhxHZiyacFQEDr9l4yLjnWcDSE6KN99tP0LReHLezB8e1owCwLegRR74EiMm3gHxXANG2p3VHdPPhowyp5kmPB04AQXcyAewO7NZ1A8HdWwdBpP0Z637HoOfe+HtIbUDHTQPIOfXt3HF2YPskNpTWmuBBHmUSSQZTSr8Ojwf8gECuFJKUKIsnN4kLltQ1q6e3MLyiaPMJ58t4G/fTRnaDyzjIiU4lNBD1qFENS98K3OjLMNVfArpoFUGpIFB0YakVB9zYJUZUI1PNnC7mXqYp4SpQ3pnWyF0xBZ0yLy0muJbGxsZNOGoe/iCuapENMLYtgFXR1ehpckitYISZajo6PsgmAKI9QIFkJ9KEVwzAOmelzXpT+hsyamHjqdDv1J3aAApi501kSWsIzgsqJadPlstxtYM6pFK4FuR0BUM5jqiGRNkZNM9ZgawdRIfMyaqZpIYW2WE0y1RFrWBHd11EhYWJuGqQFVWG9ubrI21EN0Fsfr169ZE2rG7OJgYVSPTnOz04+zphrhbvA5IdtkAaZIBFi9r3q2GTBVopoLWGNVB2bWxGVE9YigxirMMWvWiOrRNVaz95U1ogZc1431NTE1EEwe4KxpTpD25AGmJriMqJfET7c4a6oe3XSwB4YWiIq/BWzkvp+uvi5o76u8DjuHt6AqPP8B5ENXX83e1wXTCrmX9JV/4Tzs/jLrIgF2GbFYWiEwu7joHMDjv7+GstjpPgVHtGFGzM95F3O4lIQhvR48OnyuPv2SUNDXpRiukNtFLSZmCmLRG3Xb6j0r9FUrLjAeGJoTuEFXP9GPGZna4N7XeYJng9fPaBJyMNOPqYdR1sQz/apndXU1tgQEUwP9Pi1Mo2ZxcK1pDghncbBG1EhEAXSt6fLly1xg14jWiJOTE86iqicyGzx2kqmE2NzX2EmmfLD6Gr74kSmXsL6+Dkx1BNVX/TWvnmB2fHzMk8yqJ7GMyJ4tSVHeEGTi/WZciHf+iJUR+fD96qastA/WMLaLtly2zoVmqzUJHH4sc2De5JNzH2O4sJtNzdrFsQb+oFO6MGhPiwJmSswTWGsyD0W4dH7+qivN5yFh7HTb8NH/s9A1uH9+dQ0G/jbeI+/krbkFa02R5ZlIEObyD/mFQYuhX2rQ29uDIhCobZ5cw7BhgdEPZ89r8mFWZpzx9gURmebK6zXVyJUrV7Sdu8Fr5O3bt/QXW1yRqQceGJoDEr8YYqon8sWQ3aDrAVMykX0wYh+8hwLpAFMu0U1G4gvwBs3uLjDl4ji0DU6kAW2O0EkhhA/L3r7at40pix7sfvsisOsGdCgID418//69D23sKxKL1cE2VwinHdjModLItxEraC6hOVFn8uz7xownui/eV2g+wnAfOt+svnqBGbLifQ9cgyqSnrUvnh+Y2B5DZAbaGWVRvreVY6M7xoY04YN3w9oX7xwMQZjdGySUJprTWECP/7oH0m/DrJu3fmkMN6ttp+xeeQGCbGnoNAoJ4jw1YCUQeQd9tfCft1tOpocFcgdf3C5qwf6YgTIaglCVJDqwBSGuXr26/ObNGyq4L8Kw8Kb/C4HHcA/mcLdfm7T1Ae1BJ+1uaWkJBoOBDOwS7Ynn7LASzoN9Do8FHvuQ3LGZFCdhhK/jAMmkPWuY3YRZPb31lMtQwUyTmT4Exx4Y1dekm1ACLwcmFAIZEg5pjLn977gHNB9C2+kBCXxI2w+k+DOxr6e5mRSfJH9JfpPil3QcCp3Oh4KghD4LDAmBBPCJju/evTt4+fKlN82NKbGb6+vrzePjYxICCYX+m4Fxms2mc35+DhAdaZr0oKn3xfAgCE9a7hIFSnb0I9BPJIGDcNLeZHUe3Uh0I2ByHGUQXsxtcO9YnGBUGwq1gRL/NDB0HBbSsZul0QhMmPikEUuGiWnEysqKOj49PU182/C6j9fKGP+YlKhTh4FxpPinuaHrTtrzwUgbSAj0xlOin+FI3BkOAp232+0BGj/t5uMI91w2hdIwzo8LQz0Y9V/1+/1JCWWujqPy9BR/+vqYsNKyt6Q4RM7Rd23W7IokbbefyXRjagQJIhRIaPxxkZ5EmEANw24KIhZpGosNhwHRLn3fF47jyOBcFpR/w5+dMHaigXXdFFqiX9o++ujoyC5HJOTXMlMYZqNtVo3VmAIJtYL+VVbluq6ZbWmzubnZNNw1TbfBtSS/Tftc6BZGmhmG1zD9WeE0Jhyrexthp5lJ4SqDhbCZW5SRBadS6c1yMEv8Kn22z/NJhR30jsz3AAAAAElFTkSuQmCC"
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        Kanban</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="#!"><img
                                                                        src="data:image/png;base64,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"
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        Hp</p>
                                                                </a></div>
                                                            <div class="col-12">
                                                                <hr class="my-3 mx-n3 text-200">
                                                            </div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="#!"><img
                                                                        src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFoAAABaCAYAAAA4qEECAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAVPSURBVHgB7Z3PT1xVFMfPHWj50YhNMbEKmKkmdKqL0kUb241YurNNmU2XwEYbU4yJq1Y3szHujCaQ+iPGMv0DZmxwJ4huMOJiXM20i/IUUDc1dEgGKJ253u/AjAUGuO/deTf0vfNJHjAzlx/5zJ3zzj3nMk/QDkSHUoebDx64TKLUq27iiBKzDUkyQ1I4gmQ699XlsZ3GiVp3nnj7u/dJiIQUdJgYF0hHmU/UEr5JdHkWNzWkaH0GM96ZEo8bhrLfvPVH5Y6q6NhQKkpNDT8Sh4g6IZ2V1dIp51Z8Ebci1fubGr4lllxHRHQjOpQpi469Mz5IHC78oPc4zne0ETpiV+/MEs9mX5CSFlcfFY9FNmZzlBhfECpzQ5ockUL2E+Mvai3SGKFSVNZOp/fkmdZGOt3dTp1HWtXXB2jhQUEdyzRz7wExm+htVJJ7yCWQO3yxm850P1fz8aXCGv3w+980Mn6P/lLiGYoKdSKUbr7jmhI8fPG41ljM8OGbM5Sbz1PYibgZ7EYy6GhvpbEPztGL7S0UdrRFQ5YbyRXaVOz+ZNB1dAoc2qIRk72CWI64Hma0RV84+QKZ0NfzPIUZLdGItUjfTOg4cojCjKuToQltKucOM1qi88trxJihJRoLEOTEJmTnH1KY0Q4dqek5MuH2hENhRlt0cnK2PLO9gCfJ9BXxtKMtGpJvJDPkFggeVTWPsOMq65jI/EPDX8xoz85fVRUv/vHPoZ/NwHXOBdm5uTz1nTxK8XNdFOts2/Q4Zn5WFZFGx++WRTPruK7ebQULmQ5Vj0aejFo0z97aGK8iMINzhXCnbjpYWxmGHRZtCRZtidBUepAdxbrWj7aWg5sewwkcJQJkU371OLVFxzqfpYG+Y+SF7NxDuj05u+uY61de3SZAFyyIamU76NIPnH+ZBtWhW+bFz0FjOTkxW1fp2qLxR8fPdpEXOlQbbC/RaCyg7u2F9JYlfkWwl9Yb/obB86+Uj9T0n3Xr5O+b0LFUp1IseptJ1RD2+qQ9SfzsS+U23I2xjPFelX1zMswXHpMpiMPpj96oi+QK+Fl44q4Z9ExBYLIOzOSRd08bt9x2AmGo32PoBIERXa9wsRvYNrG1tqNLIERfv/Ka75IrrL9q3J/aAiH6hEo9bYEnFBmNW3hl6IGBcl7ublazaA9gm1v/6+5OjCzaIxd6jroaH9haB7o76AYt/FuoNpVRRuhTgs7UYR8gFjIIH0ua+X/gRGMp/qFaydVqo+G+5OT9cj6MTZummQraeenpea2xgQodqMChGbxXrxK1kcFPpz1vn6iASqAugRGNmfzezd+05WH8yPdm2yDcpJWBET2yQ6l0N5IT941mtZvQEwjREJz2uGUt9Yv3rW6hEz2mZqZXTPee6MoOhGiTwjzaVzYIhGiTpoGtDT+8MiQyTvN0YNFk5z8aWLQlWLQlWLQlWLQlWLQlWLQlWLQlWLQlWLQlWLQlWLQlWLQlWLQlWLQl9o3ojoC/ZRvPaEuwaEuwaEuwaEuwaEuwaEuwaEuwaEtob0THbiCv+9SyGm/UjTfzXvC4tStvuAHG6HcvP9IaZ/yeSoweHDoswaItAdEOMb4ipMxA9BQxvlIi4UTUx5+I8RVcvTPSvFZMC0mLxPiEdHDFzkjmVnyxJESCGH+QlMCn/6/QefUOrs7ZS0wdEVO5Ly+9ia+q6V3zajFOnIHUEemIxshQ5VZVNEIIiSLsTxFjiJhaaSmdyo7WuLjvk5QvJilKCeILSroCSUVJisTdry99vu2x3b4RwlVq0q9GRSVJvuBVbRxCFFBp8sqhYtr5LF4zg/sP2gLQd9Xcc1EAAAAASUVORK5CYII="
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        Linkedin</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="#!"><img
                                                                        src="data:image/png;base64,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"
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        Twitter</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="#!"><img
                                                                        src="data:image/png;base64,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"
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        Facebook</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="#!"><img
                                                                        src="/static/media/instagram.0c6a5c7e.png"
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        Instagram</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="#!"><img
                                                                        src="data:image/png;base64,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"
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        Pinterest</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="#!"><img
                                                                        src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFoAAABaCAYAAAA4qEECAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAmiSURBVHgB7Z3fcxvVFcfPubtS4mAbaZg+QCHZvMFAbKXTBAjtWH7DTYPtt8LQsfIX2Lx1hgQrJTzj/AWVp23gzU7AhDcrU5K0ganXpgyPXieZ8kLGyo+ZxLH2Hs5dSR5s67f2rlZYn4dYuV7v7nz33HPvPefcFUIbOHb9wZAgmSKgJP/XUm1EkEOELJCYv/m7/lloEmtuKtbf0ztBEpIImCidny9g8/VsQJH59g8fXoWAQQiQxOK6FYng31jQZI1DHRY83ajgRxbeH0UUM1ASt8r5N0kmvz/50RoEhICAOH7j/gSLvFSHyAoLUGZ+e+3eNNTJKwtnplnkeagtsnf+CAhbPRgIiEAs+ui/Hg5GRN6GJiDEqa9PPH2h2jFKZIGYhiZwBSS+e/PDZdBMIEIfv5ZbhfosrTymmbj5am9ZMV688hcrSpFVaB5HbDw4ao/P5EAj2l3H8a/uT0ArIjO0mZ+p9LsIGHW7lwpYcn/vJGhGv49GmYYWUX6dB9LYznZlzUgiBa1CmALNaBVazTKgRWsuEY0YuwauKBhD4A/W0YXzh0AjWoXu2Wf6d/NIVplGC3yCxOPDoBGtQufzed9uHsv0DF6QWOATEqhzLdo0zVZmA78otApNmA9s5RV2tAr979fjjhe/6KJ/eicB56GLfqGLy2cH9jiBBJWEoGEVBoU9TCBCe746YiZhD1t2YGFSFRRSls1z3wzsQUwIEGXZ/OP0azfWzxEJDuRQgl2KVc/fSuxs1xOo0CWKgr8He4jAXMdepyt0QHSFDoiqPvrEfx8dch9tqgErBhrhZXpOIuY2N/LL9nC8IwY9VdbQt69vEFFaPLA7eZJOtaz6LqFVJsOMikkBlMo/2rC8Rs2ZRVKX4H+iUVT5xXlCY+brE32B117Uw8CXZyZJwhhPU5NeAwlPnggKGPjirKMySisjH+0qk9gmdDFbzbGJckH2wBhDcseOfXUvs7kp3wuLhReTwIscvLGq2J3FwmdY8DRn18d+nl3f8tGvXrs/WiwJsCAEIFKKLXyxXK4waF7+8uwgi7wE9WtjGRLsgc8/mCg1eEKr3J4kmYHwkYhEcA7aiLJkFk1FIBt/4EgzLy2872VuPKGV5fCA1HbLKYfKgBdLFtpCsZzBgmZgTU0shBzE69cfDEFI3EUlCOQUtAE/yhnUoHnki7NDIi9lCkIOW3XiWMEgAoX9si+FNYIgJXjQSUBHIAO/T55x+nJNYvenfHRnCC2Dd2/ckyzwB6u7BC/CiyTtRY4OdABYJh5NiE2VApfDIHkP9OEooX27WZ1IKXctyUmSf/f++KE2HXglaQu2iiyEH+eb38ezOxuNDUMtcVvu8izEvM76aNZ4XmxuSBUAcSDEyAp5Rns8nVOrL2gRnnldAH04KyN/nRUqaIMg2rIgqBPnmzeePlfpl+Kx2VLdCEcNM/bI+Szoorjlw5t1/OeN/kvckobw4Zg9+5LVDlBWLdAYhmbEJrLxiaEvd4mUVtasPm5N7256VhMqsT2Rr/+mp2ahpD2SdhoVW9UEiifmsOd+dEA0tTJyfqsn7gqtvnZj3SIppokD/9AGChs7cebAAXkhe7TxWPTAlTPTxa0SVrnfI5BNKGZKllb9XGdXoc5yiK3zqweIkamlNz9Y3n7dCijBpdq6IMnCAIJOEsE2XLm8vxfsZgTeSeLKmaQEGGLRC1FJgY4gudyIP+YA/sf1RDXZKHmeLNfgcXReWw/p0qVLly7aqDgYrsbGYqL/qdFiRtyCmlDu0K1P6p6T3n7+7SEpMMHTDKtwJ5gTkrIv3Pmk5TKD1TkrFjP6BiVigkh/vJ1nSQ5JcAxzMxs/+X3Z6eguoe/8+t3BvHBn+K+T0BiOdetize1uawffniBAtRKtIAA5KClz6M6n56BBlMD9oneSp2/q/G3KgVLGMPLpnYJvE3rt4DuTnFVoNnZQVWjVQ7CvZ67+B0hOdBOTz/1wsa6dXT/MvWhFjOgihKVcgmT6mdH/bRnL1sqQRZ5uQeSqeCL39yw21kvQehKh7P+ffafmRsuwiazgXpW+e+mVrRcCeEIXujOkQROi78DHUHjtToMUxFYPqtpRYRO5hBJ7/fIRbw+7J7ROkW9bfx7i5GQKmgYt0bu/Yja6aDUWhBSXcGZ9LhETypr93Ly+60Ku23IIloSYqmTVbDUpCDOc4JWmnBBEOAaaWLVSMb6QH+ePmb09gzsbuVuGvvhHwRonVc1pEjRhgjsIPuHNuXe2NT4FbROUUD5a23yTXNe/c1OZUmIKZ71gGfTWdbgAcfALxE4RtSz+1XUQORA02CE1KQS24KVhFnwA21AfwiN5R9SkcG+0hRBGBnwgYqKWVWU14m99e5UzIKEXmwftWfGC8/er0GIRDVtz5rnV+mISfsNdMvAH3AjsNpxfnbKzhZUhuqeh+YofJ2LoW1nWIv7HFU6yUhZCCBtg7oBpJNVnT+jDzqcOZ4ebWMFhzjTEWLusuYThGuNqwIGQobYQ9pxcWit8LsJB+1kWTS0KnDrP40QNSjy/+g/tL1CtRXzc5qSBCM0rKpS72I9GgseQS6W2bfNoJZqKKfMNp6CS4OzPVQmZOq7dlvxzlNjPvLV8mmMfw3yP89AGWDf1sq40P/SjvaeWthlg2S3Kh279UxWXzK5af7L4EAtcaYEhHICH9mFnPtR1C2rg4R9ZFTHLm5DAwupR92Int+mC/ey47VQ6oOpecOW7oUNfz6MsHCA8r4Lrbq0IiK7QAdEVOiDa8k4lv7h7eYBzkfUlFlQhIqfsbNPIz1SqvdBJRwvNE6oY1f3KC1RVsUnXjUz9ePlI2doLnexR14EpNx/Jrn/2sm8ZoFrsXR/NSVOXjOz6wktaX9BdYq8PhjFl2RAA3VkHW/bdzwZ+AV8P0gEQkbaSixJdoT0wqWIjoJGu0EVUAAo00hW6CKLs3K8HMQDWwT+cXS3oX4kDkdC6eNFbQGNI37Iv5VJVPIj5Jk6vQK3fGaNVaD/j2aa5W2jOFfqSSVGpp1JuTxfafbQqRYAWqVTOUAjut54BF6A/i6//e1hEtOWvB6lWzmBga+/EU9YcH12puS+8VbQLfdjJeCUJ0CQoZbpaEjh+6rtlA6FpsfcJQ/tiRRHI9E5l1wV5ceOGErtK5Hq2wcVPrVxQ2WdoAFXcwkHq1M5stS4QAkRl1VGKejb2OPxgpg7evngJGmD984EJKSFNtc6PmH1KiJTuAXDbJaENrFrvJoWUE4TeztnSiszhu7GRRFaKh7OtlDUowV3CMSRKUrHUQNVc8OcsX3O2WJIQKD8BbilwavuueygAAAAASUVORK5CYII="
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        Slack</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="#!"><img
                                                                        src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFsAAABaCAYAAADXaio8AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAdDSURBVHgB5Z1NdhpHEMerewYljr3gBuYGxi+SXnbGJzCI+GslfAI5JzC+AT6BycqSX2TkE2iy8cuTlBjfQLkBWSR6L4gpV/UAHhAfw3x1z8xvocHSmIG//lRXV9e0BBhE9W29vHVL3B0JWRWIVQFQRhBVpCMIKAukow8UMACEAZ13Sf8c0HfoiI6QMDh/0vsdDEOAZnbeNx6gK+rAogqozgsaEYfE7wuJJyaIr0XsicAoRCtmcZeCyvXgSIldXcKnJjaHCPsHeUBh4WVaAi+DhZcgOtclPPnc/PA3pETiYpsk8iJI+K5bgnYaoicmtukiz5OG6ImIvfO+eeAitLMgsh8V1wW2/3za+xUSIFaxq+/qFVtYb+lhDTIMi04ur8XtcgkxwW62pPUZMi40I0BUrKG43DlsHkCMRHb2ODa/ohnGS8ghHMtHV+4v/RcnA4hIJLHHYaPHDyHHxBVWQovNQlvCOqUnqEABYMEtwPrZs94XCEkose9/aNyTQ+lkLduIgYEEtxZW8I3FLrDQE0ILvpHYGQkdDuXKTpATEak2E+69hBI8sNiZEJomJBdPP7wOevr2YfMUwqeqg1EJq5sMmoHybE7vTBda0AC2ZUMX0qMsh+CwNkH/QyCxOY82PeugWnj3U4oVPIYnP/YtlfoGYq3YPDM0fcKiwdV+akFnmivF5jjNBSUwHB2unrk+QGf3sHFv3XkrxeaikukpnmZXT3FBdteds1TsH4+a+5CBopKgDESnq31Ut4/2Xq06YaHYHD4gA+GDXX2WUO05FDS23T/eu7vsxwvFtqU8yELNg10NZsHpYHvZD2+I7bna/HKpca4eQ+lgi7sHFv3shtg0eVkZd0yAhRZbWIcIsKkwoU8vunKhWW2YewEUPlqQFIivXa97KRLfb8Hpp71epEGRQuU+jUsVSIY6x+75qfyM2LSs9YCTxuSQzl/Pf3NAM8rVXhEqMaxrZdqZOs1sGMlABhIHqSQANO7N102mYnNQL8KqS4oJQNm+JWYGyqnYritbUADSTQBmB0p/GKlBzkk8AVhwSX8oUWIXJYRoSGvLpdtiWqBSYtPIHClnzQIaXK3wes89vDCCItd9H4yuyRpl0nNi5zxe63I1w6s5k7gtl83j84TuEsQkbkta5ch1/4dOV09xpQrTEtx8x2sTCmsIWOGj5Lu0IKcY4WqFqPBXCTluIzOoXFzhLzbXdJOsfvkRwt2ndbq1A/KIFnCjtuea42oVRpShbcEDZKJlVf9FRSvItayh6vduQARMWgSh9M9L/YwMIyjeQARMcvWYsdjm4VxEXGAwdWnPPLFRBO5CXYSBrp5imtiRXW3bYm0bmC5s8LaRMCNuR3Q1c/G493H3qNlyxxOJlZcL3wy/KepOMxu9/Tq0iy0Au+fPjx2IgbOnx4H6SbYPmzVIQWxK/ZTYUgiIfH9fHJRK+V1sptTvko9SIPRBM+xqQ5ojk8JzNgrU7uw8u1ohUBlaui6EvokylteRf1fzSOyJbVmW1jCSe1czaP3DBzksDS9B0yBZCFcTk7mD7DdOOM/W4u5CuFrtwObhzSDHATxNiuJq3upu8kiJLQSeQMoUxNWktfw4eajEVvvcpRi3i+Jqbtr313p8hSjsQkoUxtW+eM1MxU4rlBQnVnN6LWdqNFOx0wolRXH1fAhh7NlTsEOntSG5FxDZ1ZPNGUUM98O4CS52L7ptcEbs6y33jf2/9TKp+vb8x2pTtg8bj1DILr++ONaok+wqoEUMZ/57Mys1aoKj3G0oQmZiF8xln+Aby2LsbjCkxu1HNYBiNra0WzYu3RDbVHejK9uQCbCzbFxauOBrmrvHbc01MBy1HUcJlhp1odjsbloua4MhZMXV67bjWNrKcP7kmLuSHNBMVlxNOOs2Lli9kw6OXugOJ5lwNWm0VcLWutNWiv3H85NLneFk5/1jzj5qYDiUjgbazWdtR5QKJ0JPduK6bqz7VycDds6fHQdqBA3UfkbZyWv6qKS6wLB71Ng3tWdvAmcfd67cwF1cgWesP72rV0bCOo24IQr/woKOATUwGBaaJi+1TWo9G5UHWPBr3mq/uDsMK8IIzWzUxcoDpiy5NROn86lB7523TApTvdy4Zfhsr/eFBRcxbD+UOUhofu+sAYQgdJUxphieGcKGDj+hm+E5pFg4elgEh9N77EcVmol05wELPvxudF9XHp4O2Ll9NXoYx7ppbIsVvPUz8oZeeclUeCCk9xN0whLsKWNEpYY5+HNXhMO1jri7ABJZhts9au6zyzM3eCbg5tmnTwhvAiSN31VeoeYN2Lnzn/vGieHPWi2/TMKMU8RXaGKdIyWRv10uJVh0V1oPjAgvKYv87bIa2H73c42WkNTO86kJr+IxdhHlxwtN+8FqEduPJ7z7CL1NZmoQF97NtH2a+fV1Cjz7kgyDxUeJZRLpntrlx+t+qoy36pjN4UlQddOs51pVvh0hfOH7hG7/O7xMM0QE4SvLVRKRfsQVJAAAAABJRU5ErkJggg=="
                                                                        width="40" height="40">
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">
                                                                        Deviantart</p>
                                                                </a></div>
                                                            <div class="col-4"><a
                                                                    class="d-block hover-bg-200 px-2 py-3 rounded-3 text-decoration-none"
                                                                    target="_blank" rel="noopener noreferrer"
                                                                    href="/events/event-detail">
                                                                    <div class="avatar avatar-2xl ">
                                                                        <div
                                                                            class="avatar-name rounded-circle fs-2 bg-soft-primary text-primary">
                                                                            <span>E</span>
                                                                        </div>
                                                                    </div>
                                                                    <p
                                                                        class="mb-0 fw-medium text-800 text-truncate fs--2">
                                                                        Events</p>
                                                                </a></div>
                                                            <div class="col-12"><a
                                                                    class="btn btn-outline-primary btn-sm mt-4"
                                                                    href="/e-commerce/product/product-list#!">Show
                                                                    more</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="simplebar-placeholder" style="width: 0px; height: 0px;"></div>
                                </div>
                                <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
                                    <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
                                </div>
                                <div class="simplebar-track simplebar-vertical" style="visibility: hidden;">
                                    <div class="simplebar-scrollbar"
                                        style="height: 0px; transform: translate3d(0px, 0px, 0px); display: none;">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="dropdown"><a class="pe-0 ps-2 nav-link toggle" id="react-aria7631882193-4"
                        aria-expanded="false" href="/e-commerce/product/product-list#!">
                        <div class="avatar avatar-xl "><img class="rounded-circle " src="/static/media/3.b3477e97.jpg"
                                alt=""></div>
                    </a>
                    <div aria-labelledby="react-aria7631882193-4" data-bs-popper="static"
                        class="dropdown-caret dropdown-menu-card  dropdown-menu-end dropdown-menu">
                        <div class="bg-white rounded-2 py-2 dark__bg-1000"><a href="#!" data-rr-ui-dropdown-item=""
                                class="fw-bold text-warning dropdown-item"><svg aria-hidden="true" focusable="false"
                                    data-prefix="fas" data-icon="crown" class="svg-inline--fa fa-crown fa-w-20 me-1"
                                    role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                                    <path fill="currentColor"
                                        d="M528 448H112c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h416c8.8 0 16-7.2 16-16v-32c0-8.8-7.2-16-16-16zm64-320c-26.5 0-48 21.5-48 48 0 7.1 1.6 13.7 4.4 19.8L476 239.2c-15.4 9.2-35.3 4-44.2-11.6L350.3 85C361 76.2 368 63 368 48c0-26.5-21.5-48-48-48s-48 21.5-48 48c0 15 7 28.2 17.7 37l-81.5 142.6c-8.9 15.6-28.9 20.8-44.2 11.6l-72.3-43.4c2.7-6 4.4-12.7 4.4-19.8 0-26.5-21.5-48-48-48S0 149.5 0 176s21.5 48 48 48c2.6 0 5.2-.4 7.7-.8L128 416h384l72.3-192.8c2.5.4 5.1.8 7.7.8 26.5 0 48-21.5 48-48s-21.5-48-48-48z">
                                    </path>
                                </svg><span>Go Pro</span></a>
                            <hr class="dropdown-divider" role="separator"><a href="#!" data-rr-ui-dropdown-item=""
                                class="dropdown-item">Set status</a><a data-rr-ui-dropdown-item="" class="dropdown-item"
                                href="/user/profile">Profile &amp; account</a><a href="#!" data-rr-ui-dropdown-item=""
                                class="dropdown-item">Feedback</a>
                            <hr class="dropdown-divider" role="separator"><a data-rr-ui-dropdown-item=""
                                class="dropdown-item" href="/user/settings">Settings</a><a data-rr-ui-dropdown-item=""
                                class="dropdown-item" href="/authentication/card/logout">Logout</a>
                        </div>
                    </div>
                </li>
            </ul>
        </nav>
        <div class="mb-3 card">
            <div class="card-body">
                <div class="flex-between-center row">
                    <div class="d-flex align-items-center mb-2 mb-sm-0 col-sm-auto"><select
                            class="form-select form-select-sm" style="max-width: 4.875rem;">
                            <option value="2">2</option>
                            <option value="4">4</option>
                            <option value="6">6</option>
                            <option value="9">All</option>
                        </select>
                        <h6 class="mb-0 ms-2">Showing 1-4 of 9 Products</h6>
                    </div>
                    <div class="col-sm-auto">
                        <div class="gx-2 align-items-center row">
                            <div class="col-auto">
                                <div class="gx-2 row">
                                    <div class="col-auto"><small>Sort by:</small></div>
                                    <div class="col-auto">
                                        <div class="input-group input-group-sm"><select class="pe-5 form-select">
                                                <option value="price" selected="">Price</option>
                                                <option value="rating">Rating</option>
                                                <option value="review">Review</option>
                                            </select><button type="button"
                                                class="input-group-text btn btn-secondary"><svg aria-hidden="true"
                                                    focusable="false" data-prefix="fas" data-icon="sort-amount-up"
                                                    class="svg-inline--fa fa-sort-amount-up fa-w-16 " role="img"
                                                    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                                    <path fill="currentColor"
                                                        d="M304 416h-64a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h64a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16zM16 160h48v304a16 16 0 0 0 16 16h32a16 16 0 0 0 16-16V160h48c14.21 0 21.38-17.24 11.31-27.31l-80-96a16 16 0 0 0-22.62 0l-80 96C-5.35 142.74 1.77 160 16 160zm416 0H240a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h192a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16zm-64 128H240a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h128a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16zM496 32H240a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h256a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16z">
                                                    </path>
                                                </svg></button></div>
                                    </div>
                                </div>
                            </div>
                            <div class="pe-0 col-auto"><a class="text-600 px-1"
                                    href="/e-commerce/product/product-grid"><svg aria-hidden="true" focusable="false"
                                        data-prefix="fas" data-icon="th" class="svg-inline--fa fa-th fa-w-16 "
                                        role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                        <path fill="currentColor"
                                            d="M149.333 56v80c0 13.255-10.745 24-24 24H24c-13.255 0-24-10.745-24-24V56c0-13.255 10.745-24 24-24h101.333c13.255 0 24 10.745 24 24zm181.334 240v-80c0-13.255-10.745-24-24-24H205.333c-13.255 0-24 10.745-24 24v80c0 13.255 10.745 24 24 24h101.333c13.256 0 24.001-10.745 24.001-24zm32-240v80c0 13.255 10.745 24 24 24H488c13.255 0 24-10.745 24-24V56c0-13.255-10.745-24-24-24H386.667c-13.255 0-24 10.745-24 24zm-32 80V56c0-13.255-10.745-24-24-24H205.333c-13.255 0-24 10.745-24 24v80c0 13.255 10.745 24 24 24h101.333c13.256 0 24.001-10.745 24.001-24zm-205.334 56H24c-13.255 0-24 10.745-24 24v80c0 13.255 10.745 24 24 24h101.333c13.255 0 24-10.745 24-24v-80c0-13.255-10.745-24-24-24zM0 376v80c0 13.255 10.745 24 24 24h101.333c13.255 0 24-10.745 24-24v-80c0-13.255-10.745-24-24-24H24c-13.255 0-24 10.745-24 24zm386.667-56H488c13.255 0 24-10.745 24-24v-80c0-13.255-10.745-24-24-24H386.667c-13.255 0-24 10.745-24 24v80c0 13.255 10.745 24 24 24zm0 160H488c13.255 0 24-10.745 24-24v-80c0-13.255-10.745-24-24-24H386.667c-13.255 0-24 10.745-24 24v80c0 13.255 10.745 24 24 24zM181.333 376v80c0 13.255 10.745 24 24 24h101.333c13.255 0 24-10.745 24-24v-80c0-13.255-10.745-24-24-24H205.333c-13.255 0-24 10.745-24 24z">
                                        </path>
                                    </svg></a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mb-3 card">
            <div class="p-0 overflow-hidden card-body">
                <div class="g-0 row">
                    <div class="p-card col-12">
                        <div class="row">
                            <div class="col-md-4 col-sm-5">
                                <div class="position-relative rounded-top overflow-hidden h-sm-100"><a
                                        class="d-block h-sm-100"
                                        href="/e-commerce/product/product-details/TN000005"><img
                                            src="/static/media/6.14365250.jpg" alt="Logitech G305 Gaming Mouse"
                                            class="h-100 w-100 fit-cover rounded"></a><span
                                        class="position-absolute top-0 end-0 me-2 mt-2 fs--2 z-index-2 badge rounded-pill bg-success">New</span>
                                </div>
                            </div>
                            <div class="col-md-8 col-sm-7">
                                <div class="h-100 row">
                                    <div class="col-lg-8">
                                        <h5 class="mt-3 mt-sm-0"><a class="text-dark fs-0 fs-lg-1"
                                                href="/e-commerce/product/product-details/TN000005">Logitech G305 Gaming
                                                Mouse</a></h5>
                                        <p class="fs--1 mb-2 mb-md-3"><a class="text-500"
                                                href="/e-commerce/product/product-list#!">Computer &amp; Accessories</a>
                                        </p>
                                        <ul class="list-unstyled d-none d-lg-block"></ul>
                                    </div>
                                    <div class="d-flex flex-column justify-content-between col-lg-4">
                                        <div>
                                            <h4 class="fs-1 fs-md-2 text-warning mb-0">$47.5</h4>
                                            <h5 class="fs--1 text-500 mb-0 mt-1"><del>$95</del><span
                                                    class="ms-2">-50%</span></h5>
                                            <div class="mb-2 mt-3"><span
                                                    style="display: inline-block; direction: ltr;"><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span
                                                            style="visibility: hidden;"><svg aria-hidden="true"
                                                                focusable="false" data-prefix="fas" data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 100%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span
                                                            style="visibility: hidden;"><svg aria-hidden="true"
                                                                focusable="false" data-prefix="fas" data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 100%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span
                                                            style="visibility: hidden;"><svg aria-hidden="true"
                                                                focusable="false" data-prefix="fas" data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 100%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 50%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 0%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span></span><span class="ms-1">(6)</span>
                                            </div>
                                            <div class="d-none d-lg-block">
                                                <p class="fs--1 mb-1">Shipping Cost: <strong>$20</strong></p>
                                                <p class="fs--1 mb-1">Stock: <strong
                                                        class="text-success">Available</strong>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="mt-2"><button type="button"
                                                class="d-lg-block me-2 me-lg-0 w-lg-100 border-300 btn btn-outline-secondary btn-sm"><svg
                                                    aria-hidden="true" focusable="false" data-prefix="far"
                                                    data-icon="heart" class="svg-inline--fa fa-heart fa-w-16 me-1"
                                                    role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                                    <path fill="currentColor"
                                                        d="M458.4 64.3C400.6 15.7 311.3 23 256 79.3 200.7 23 111.4 15.6 53.6 64.3-21.6 127.6-10.6 230.8 43 285.5l175.4 178.7c10 10.2 23.4 15.9 37.6 15.9 14.3 0 27.6-5.6 37.6-15.8L469 285.6c53.5-54.7 64.7-157.9-10.6-221.3zm-23.6 187.5L259.4 430.5c-2.4 2.4-4.4 2.4-6.8 0L77.2 251.8c-36.5-37.2-43.9-107.6 7.3-150.7 38.9-32.7 98.9-27.8 136.5 10.5l35 35.7 35-35.7c37.8-38.5 97.8-43.2 136.5-10.6 51.1 43.1 43.5 113.9 7.3 150.8z">
                                                    </path>
                                                </svg>Favourite</button><button type="button"
                                                class="d-lg-block mt-lg-2 w-lg-100 btn btn-primary btn-sm"><svg
                                                    aria-hidden="true" focusable="false" data-prefix="fas"
                                                    data-icon="cart-plus"
                                                    class="svg-inline--fa fa-cart-plus fa-w-18 me-1" role="img"
                                                    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                                    <path fill="currentColor"
                                                        d="M504.717 320H211.572l6.545 32h268.418c15.401 0 26.816 14.301 23.403 29.319l-5.517 24.276C523.112 414.668 536 433.828 536 456c0 31.202-25.519 56.444-56.824 55.994-29.823-.429-54.35-24.631-55.155-54.447-.44-16.287 6.085-31.049 16.803-41.548H231.176C241.553 426.165 248 440.326 248 456c0 31.813-26.528 57.431-58.67 55.938-28.54-1.325-51.751-24.385-53.251-52.917-1.158-22.034 10.436-41.455 28.051-51.586L93.883 64H24C10.745 64 0 53.255 0 40V24C0 10.745 10.745 0 24 0h102.529c11.401 0 21.228 8.021 23.513 19.19L159.208 64H551.99c15.401 0 26.816 14.301 23.403 29.319l-47.273 208C525.637 312.246 515.923 320 504.717 320zM408 168h-48v-40c0-8.837-7.163-16-16-16h-16c-8.837 0-16 7.163-16 16v40h-48c-8.837 0-16 7.163-16 16v16c0 8.837 7.163 16 16 16h48v40c0 8.837 7.163 16 16 16h16c8.837 0 16-7.163 16-16v-40h48c8.837 0 16-7.163 16-16v-16c0-8.837-7.163-16-16-16z">
                                                    </path>
                                                </svg>Add to Cart</button></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="p-card bg-100 col-12">
                        <div class="row">
                            <div class="col-md-4 col-sm-5">
                                <div class="position-relative rounded-top overflow-hidden h-sm-100"><a
                                        class="d-block h-sm-100"
                                        href="/e-commerce/product/product-details/TN000006"><img
                                            src="/static/media/5.09ac6a83.jpg" alt="Apple Watch Series 4 44mm GPS Only"
                                            class="h-100 w-100 fit-cover rounded"></a><span
                                        class="position-absolute top-0 end-0 me-2 mt-2 fs--2 z-index-2 badge rounded-pill bg-success">New</span>
                                </div>
                            </div>
                            <div class="col-md-8 col-sm-7">
                                <div class="h-100 row">
                                    <div class="col-lg-8">
                                        <h5 class="mt-3 mt-sm-0"><a class="text-dark fs-0 fs-lg-1"
                                                href="/e-commerce/product/product-details/TN000006">Apple Watch Series 4
                                                44mm GPS Only</a></h5>
                                        <p class="fs--1 mb-2 mb-md-3"><a class="text-500"
                                                href="/e-commerce/product/product-list#!">Watches &amp; Accessories</a>
                                        </p>
                                        <ul class="list-unstyled d-none d-lg-block"></ul>
                                    </div>
                                    <div class="d-flex flex-column justify-content-between col-lg-4">
                                        <div>
                                            <h4 class="fs-1 fs-md-2 text-warning mb-0">$360</h4>
                                            <h5 class="fs--1 text-500 mb-0 mt-1"><del>$400</del><span
                                                    class="ms-2">-10%</span></h5>
                                            <div class="mb-2 mt-3"><span
                                                    style="display: inline-block; direction: ltr;"><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span
                                                            style="visibility: hidden;"><svg aria-hidden="true"
                                                                focusable="false" data-prefix="fas" data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 100%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span
                                                            style="visibility: hidden;"><svg aria-hidden="true"
                                                                focusable="false" data-prefix="fas" data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 100%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span
                                                            style="visibility: hidden;"><svg aria-hidden="true"
                                                                focusable="false" data-prefix="fas" data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 100%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span
                                                            style="visibility: hidden;"><svg aria-hidden="true"
                                                                focusable="false" data-prefix="fas" data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 100%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span
                                                            style="visibility: hidden;"><svg aria-hidden="true"
                                                                focusable="false" data-prefix="fas" data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 100%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span></span><span class="ms-1">(4)</span>
                                            </div>
                                            <div class="d-none d-lg-block">
                                                <p class="fs--1 mb-1">Shipping Cost: <strong>$24</strong></p>
                                                <p class="fs--1 mb-1">Stock: <strong
                                                        class="text-success">Available</strong>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="mt-2"><button type="button"
                                                class="d-lg-block me-2 me-lg-0 w-lg-100 border-300 btn btn-outline-secondary btn-sm"><svg
                                                    aria-hidden="true" focusable="false" data-prefix="far"
                                                    data-icon="heart" class="svg-inline--fa fa-heart fa-w-16 me-1"
                                                    role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                                    <path fill="currentColor"
                                                        d="M458.4 64.3C400.6 15.7 311.3 23 256 79.3 200.7 23 111.4 15.6 53.6 64.3-21.6 127.6-10.6 230.8 43 285.5l175.4 178.7c10 10.2 23.4 15.9 37.6 15.9 14.3 0 27.6-5.6 37.6-15.8L469 285.6c53.5-54.7 64.7-157.9-10.6-221.3zm-23.6 187.5L259.4 430.5c-2.4 2.4-4.4 2.4-6.8 0L77.2 251.8c-36.5-37.2-43.9-107.6 7.3-150.7 38.9-32.7 98.9-27.8 136.5 10.5l35 35.7 35-35.7c37.8-38.5 97.8-43.2 136.5-10.6 51.1 43.1 43.5 113.9 7.3 150.8z">
                                                    </path>
                                                </svg>Favourite</button><button type="button"
                                                class="d-lg-block mt-lg-2 w-lg-100 btn btn-primary btn-sm"><svg
                                                    aria-hidden="true" focusable="false" data-prefix="fas"
                                                    data-icon="cart-plus"
                                                    class="svg-inline--fa fa-cart-plus fa-w-18 me-1" role="img"
                                                    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                                    <path fill="currentColor"
                                                        d="M504.717 320H211.572l6.545 32h268.418c15.401 0 26.816 14.301 23.403 29.319l-5.517 24.276C523.112 414.668 536 433.828 536 456c0 31.202-25.519 56.444-56.824 55.994-29.823-.429-54.35-24.631-55.155-54.447-.44-16.287 6.085-31.049 16.803-41.548H231.176C241.553 426.165 248 440.326 248 456c0 31.813-26.528 57.431-58.67 55.938-28.54-1.325-51.751-24.385-53.251-52.917-1.158-22.034 10.436-41.455 28.051-51.586L93.883 64H24C10.745 64 0 53.255 0 40V24C0 10.745 10.745 0 24 0h102.529c11.401 0 21.228 8.021 23.513 19.19L159.208 64H551.99c15.401 0 26.816 14.301 23.403 29.319l-47.273 208C525.637 312.246 515.923 320 504.717 320zM408 168h-48v-40c0-8.837-7.163-16-16-16h-16c-8.837 0-16 7.163-16 16v40h-48c-8.837 0-16 7.163-16 16v16c0 8.837 7.163 16 16 16h48v40c0 8.837 7.163 16 16 16h16c8.837 0 16-7.163 16-16v-40h48c8.837 0 16-7.163 16-16v-16c0-8.837-7.163-16-16-16z">
                                                    </path>
                                                </svg>Add to Cart</button></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="p-card col-12">
                        <div class="row">
                            <div class="col-md-4 col-sm-5">
                                <div class="position-relative rounded-top overflow-hidden h-sm-100"><a
                                        class="d-block h-sm-100"
                                        href="/e-commerce/product/product-details/TN000007"><img
                                            src="/static/media/8.5337a0bb.jpg" alt="Canon Standard Zoom Lens"
                                            class="h-100 w-100 fit-cover rounded"></a><span
                                        class="position-absolute top-0 end-0 me-2 mt-2 fs--2 z-index-2 badge rounded-pill bg-success">New</span>
                                </div>
                            </div>
                            <div class="col-md-8 col-sm-7">
                                <div class="h-100 row">
                                    <div class="col-lg-8">
                                        <h5 class="mt-3 mt-sm-0"><a class="text-dark fs-0 fs-lg-1"
                                                href="/e-commerce/product/product-details/TN000007">Canon Standard Zoom
                                                Lens</a></h5>
                                        <p class="fs--1 mb-2 mb-md-3"><a class="text-500"
                                                href="/e-commerce/product/product-list#!">Camera</a></p>
                                        <ul class="list-unstyled d-none d-lg-block"></ul>
                                    </div>
                                    <div class="d-flex flex-column justify-content-between col-lg-4">
                                        <div>
                                            <h4 class="fs-1 fs-md-2 text-warning mb-0">$400</h4>
                                            <h5 class="fs--1 text-500 mb-0 mt-1"><del>$500</del><span
                                                    class="ms-2">-20%</span></h5>
                                            <div class="mb-2 mt-3"><span
                                                    style="display: inline-block; direction: ltr;"><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span
                                                            style="visibility: hidden;"><svg aria-hidden="true"
                                                                focusable="false" data-prefix="fas" data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 100%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span
                                                            style="visibility: hidden;"><svg aria-hidden="true"
                                                                focusable="false" data-prefix="fas" data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 100%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span
                                                            style="visibility: hidden;"><svg aria-hidden="true"
                                                                focusable="false" data-prefix="fas" data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 100%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span
                                                            style="visibility: hidden;"><svg aria-hidden="true"
                                                                focusable="false" data-prefix="fas" data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 100%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 0%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span></span><span class="ms-1">(10)</span>
                                            </div>
                                            <div class="d-none d-lg-block">
                                                <p class="fs--1 mb-1">Shipping Cost: <strong>$60</strong></p>
                                                <p class="fs--1 mb-1">Stock: <strong
                                                        class="text-danger">Stock-Out</strong>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="mt-2"><button type="button"
                                                class="d-lg-block me-2 me-lg-0 w-lg-100 border-300 btn btn-outline-secondary btn-sm"><svg
                                                    aria-hidden="true" focusable="false" data-prefix="far"
                                                    data-icon="heart" class="svg-inline--fa fa-heart fa-w-16 me-1"
                                                    role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                                    <path fill="currentColor"
                                                        d="M458.4 64.3C400.6 15.7 311.3 23 256 79.3 200.7 23 111.4 15.6 53.6 64.3-21.6 127.6-10.6 230.8 43 285.5l175.4 178.7c10 10.2 23.4 15.9 37.6 15.9 14.3 0 27.6-5.6 37.6-15.8L469 285.6c53.5-54.7 64.7-157.9-10.6-221.3zm-23.6 187.5L259.4 430.5c-2.4 2.4-4.4 2.4-6.8 0L77.2 251.8c-36.5-37.2-43.9-107.6 7.3-150.7 38.9-32.7 98.9-27.8 136.5 10.5l35 35.7 35-35.7c37.8-38.5 97.8-43.2 136.5-10.6 51.1 43.1 43.5 113.9 7.3 150.8z">
                                                    </path>
                                                </svg>Favourite</button><button type="button"
                                                class="d-lg-block mt-lg-2 w-lg-100 btn btn-primary btn-sm"><svg
                                                    aria-hidden="true" focusable="false" data-prefix="fas"
                                                    data-icon="cart-plus"
                                                    class="svg-inline--fa fa-cart-plus fa-w-18 me-1" role="img"
                                                    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                                    <path fill="currentColor"
                                                        d="M504.717 320H211.572l6.545 32h268.418c15.401 0 26.816 14.301 23.403 29.319l-5.517 24.276C523.112 414.668 536 433.828 536 456c0 31.202-25.519 56.444-56.824 55.994-29.823-.429-54.35-24.631-55.155-54.447-.44-16.287 6.085-31.049 16.803-41.548H231.176C241.553 426.165 248 440.326 248 456c0 31.813-26.528 57.431-58.67 55.938-28.54-1.325-51.751-24.385-53.251-52.917-1.158-22.034 10.436-41.455 28.051-51.586L93.883 64H24C10.745 64 0 53.255 0 40V24C0 10.745 10.745 0 24 0h102.529c11.401 0 21.228 8.021 23.513 19.19L159.208 64H551.99c15.401 0 26.816 14.301 23.403 29.319l-47.273 208C525.637 312.246 515.923 320 504.717 320zM408 168h-48v-40c0-8.837-7.163-16-16-16h-16c-8.837 0-16 7.163-16 16v40h-48c-8.837 0-16 7.163-16 16v16c0 8.837 7.163 16 16 16h48v40c0 8.837 7.163 16 16 16h16c8.837 0 16-7.163 16-16v-40h48c8.837 0 16-7.163 16-16v-16c0-8.837-7.163-16-16-16z">
                                                    </path>
                                                </svg>Add to Cart</button></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="p-card bg-100 col-12">
                        <div class="row">
                            <div class="col-md-4 col-sm-5">
                                <div class="position-relative rounded-top overflow-hidden h-sm-100"><a
                                        class="d-block h-sm-100"
                                        href="/e-commerce/product/product-details/TN000003"><img
                                            src="/static/media/4.838e0aac.jpg"
                                            alt="Apple iPad Air 2019 (3GB RAM, 128GB ROM, 8MP Main Camera)"
                                            class="h-100 w-100 fit-cover rounded"></a></div>
                            </div>
                            <div class="col-md-8 col-sm-7">
                                <div class="h-100 row">
                                    <div class="col-lg-8">
                                        <h5 class="mt-3 mt-sm-0"><a class="text-dark fs-0 fs-lg-1"
                                                href="/e-commerce/product/product-details/TN000003">Apple iPad Air 2019
                                                (3GB
                                                RAM, 128GB ROM, 8MP Main Camera)</a></h5>
                                        <p class="fs--1 mb-2 mb-md-3"><a class="text-500"
                                                href="/e-commerce/product/product-list#!">Mobile &amp; Tabs</a></p>
                                        <ul class="list-unstyled d-none d-lg-block">
                                            <li><svg aria-hidden="true" focusable="false" data-prefix="fas"
                                                    data-icon="circle" class="svg-inline--fa fa-circle fa-w-16 "
                                                    role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                                                    style="transform-origin: 0.5em 0.5em;">
                                                    <g transform="translate(256 256)">
                                                        <g
                                                            transform="translate(0, 0)  scale(0.25, 0.25)  rotate(0 0 0)">
                                                            <path fill="currentColor"
                                                                d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"
                                                                transform="translate(-256 -256)"></path>
                                                        </g>
                                                    </g>
                                                </svg><span>3GB RAM</span></li>
                                            <li><svg aria-hidden="true" focusable="false" data-prefix="fas"
                                                    data-icon="circle" class="svg-inline--fa fa-circle fa-w-16 "
                                                    role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                                                    style="transform-origin: 0.5em 0.5em;">
                                                    <g transform="translate(256 256)">
                                                        <g
                                                            transform="translate(0, 0)  scale(0.25, 0.25)  rotate(0 0 0)">
                                                            <path fill="currentColor"
                                                                d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"
                                                                transform="translate(-256 -256)"></path>
                                                        </g>
                                                    </g>
                                                </svg><span>128GB ROM</span></li>
                                            <li><svg aria-hidden="true" focusable="false" data-prefix="fas"
                                                    data-icon="circle" class="svg-inline--fa fa-circle fa-w-16 "
                                                    role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                                                    style="transform-origin: 0.5em 0.5em;">
                                                    <g transform="translate(256 256)">
                                                        <g
                                                            transform="translate(0, 0)  scale(0.25, 0.25)  rotate(0 0 0)">
                                                            <path fill="currentColor"
                                                                d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"
                                                                transform="translate(-256 -256)"></path>
                                                        </g>
                                                    </g>
                                                </svg><span>Apple A12 Bionic (7 nm)</span></li>
                                            <li><svg aria-hidden="true" focusable="false" data-prefix="fas"
                                                    data-icon="circle" class="svg-inline--fa fa-circle fa-w-16 "
                                                    role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                                                    style="transform-origin: 0.5em 0.5em;">
                                                    <g transform="translate(256 256)">
                                                        <g
                                                            transform="translate(0, 0)  scale(0.25, 0.25)  rotate(0 0 0)">
                                                            <path fill="currentColor"
                                                                d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"
                                                                transform="translate(-256 -256)"></path>
                                                        </g>
                                                    </g>
                                                </svg><span>iOS 12.1.3</span></li>
                                        </ul>
                                    </div>
                                    <div class="d-flex flex-column justify-content-between col-lg-4">
                                        <div>
                                            <h4 class="fs-1 fs-md-2 text-warning mb-0">$562.5</h4>
                                            <h5 class="fs--1 text-500 mb-0 mt-1"><del>$750</del><span
                                                    class="ms-2">-25%</span></h5>
                                            <div class="mb-2 mt-3"><span
                                                    style="display: inline-block; direction: ltr;"><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span
                                                            style="visibility: hidden;"><svg aria-hidden="true"
                                                                focusable="false" data-prefix="fas" data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 100%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span
                                                            style="visibility: hidden;"><svg aria-hidden="true"
                                                                focusable="false" data-prefix="fas" data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 100%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 50%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 0%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span><span
                                                        style="cursor: inherit; display: inline-block; position: relative;"><span><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-300"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span><span
                                                            style="display: inline-block; position: absolute; overflow: hidden; top: 0px; left: 0px; width: 0%;"><svg
                                                                aria-hidden="true" focusable="false" data-prefix="fas"
                                                                data-icon="star"
                                                                class="svg-inline--fa fa-star fa-w-18 text-warning"
                                                                role="img" xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 576 512">
                                                                <path fill="currentColor"
                                                                    d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                                                                </path>
                                                            </svg></span></span></span><span class="ms-1">(14)</span>
                                            </div>
                                            <div class="d-none d-lg-block">
                                                <p class="fs--1 mb-1">Shipping Cost: <strong>$47</strong></p>
                                                <p class="fs--1 mb-1">Stock: <strong
                                                        class="text-success">Available</strong>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="mt-2"><button type="button"
                                                class="d-lg-block me-2 me-lg-0 w-lg-100 border-300 btn btn-outline-secondary btn-sm"><svg
                                                    aria-hidden="true" focusable="false" data-prefix="far"
                                                    data-icon="heart" class="svg-inline--fa fa-heart fa-w-16 me-1"
                                                    role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                                    <path fill="currentColor"
                                                        d="M458.4 64.3C400.6 15.7 311.3 23 256 79.3 200.7 23 111.4 15.6 53.6 64.3-21.6 127.6-10.6 230.8 43 285.5l175.4 178.7c10 10.2 23.4 15.9 37.6 15.9 14.3 0 27.6-5.6 37.6-15.8L469 285.6c53.5-54.7 64.7-157.9-10.6-221.3zm-23.6 187.5L259.4 430.5c-2.4 2.4-4.4 2.4-6.8 0L77.2 251.8c-36.5-37.2-43.9-107.6 7.3-150.7 38.9-32.7 98.9-27.8 136.5 10.5l35 35.7 35-35.7c37.8-38.5 97.8-43.2 136.5-10.6 51.1 43.1 43.5 113.9 7.3 150.8z">
                                                    </path>
                                                </svg>Favourite</button><button type="button"
                                                class="d-lg-block mt-lg-2 w-lg-100 btn btn-primary btn-sm"><svg
                                                    aria-hidden="true" focusable="false" data-prefix="fas"
                                                    data-icon="cart-plus"
                                                    class="svg-inline--fa fa-cart-plus fa-w-18 me-1" role="img"
                                                    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                                    <path fill="currentColor"
                                                        d="M504.717 320H211.572l6.545 32h268.418c15.401 0 26.816 14.301 23.403 29.319l-5.517 24.276C523.112 414.668 536 433.828 536 456c0 31.202-25.519 56.444-56.824 55.994-29.823-.429-54.35-24.631-55.155-54.447-.44-16.287 6.085-31.049 16.803-41.548H231.176C241.553 426.165 248 440.326 248 456c0 31.813-26.528 57.431-58.67 55.938-28.54-1.325-51.751-24.385-53.251-52.917-1.158-22.034 10.436-41.455 28.051-51.586L93.883 64H24C10.745 64 0 53.255 0 40V24C0 10.745 10.745 0 24 0h102.529c11.401 0 21.228 8.021 23.513 19.19L159.208 64H551.99c15.401 0 26.816 14.301 23.403 29.319l-47.273 208C525.637 312.246 515.923 320 504.717 320zM408 168h-48v-40c0-8.837-7.163-16-16-16h-16c-8.837 0-16 7.163-16 16v40h-48c-8.837 0-16 7.163-16 16v16c0 8.837 7.163 16 16 16h48v40c0 8.837 7.163 16 16 16h16c8.837 0 16-7.163 16-16v-40h48c8.837 0 16-7.163 16-16v-16c0-8.837-7.163-16-16-16z">
                                                    </path>
                                                </svg>Add to Cart</button></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-center border-top card-footer">
                <div><button type="button" disabled="" trigger="focus" class="me-2 btn btn-falcon-default btn-sm"><svg
                            aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chevron-left"
                            class="svg-inline--fa fa-chevron-left fa-w-10 " role="img"
                            xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                            <path fill="currentColor"
                                d="M34.52 239.03L228.87 44.69c9.37-9.37 24.57-9.37 33.94 0l22.67 22.67c9.36 9.36 9.37 24.52.04 33.9L131.49 256l154.02 154.75c9.34 9.38 9.32 24.54-.04 33.9l-22.67 22.67c-9.37 9.37-24.57 9.37-33.94 0L34.52 272.97c-9.37-9.37-9.37-24.57 0-33.94z">
                            </path>
                        </svg></button></div>
                <ul class="pagination mb-0">
                    <li class="active"><button type="button" class="page me-2 btn btn-falcon-default btn-sm">1</button>
                    </li>
                    <li class=""><button type="button" class="page me-2 btn btn-falcon-default btn-sm">2</button></li>
                    <li class=""><button type="button" class="page me-2 btn btn-falcon-default btn-sm">3</button></li>
                </ul>
                <div><button type="button" trigger="focus" class="btn btn-falcon-default btn-sm"><svg aria-hidden="true"
                            focusable="false" data-prefix="fas" data-icon="chevron-right"
                            class="svg-inline--fa fa-chevron-right fa-w-10 " role="img"
                            xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                            <path fill="currentColor"
                                d="M285.476 272.971L91.132 467.314c-9.373 9.373-24.569 9.373-33.941 0l-22.667-22.667c-9.357-9.357-9.375-24.522-.04-33.901L188.505 256 34.484 101.255c-9.335-9.379-9.317-24.544.04-33.901l22.667-22.667c9.373-9.373 24.569-9.373 33.941 0L285.475 239.03c9.373 9.372 9.373 24.568.001 33.941z">
                            </path>
                        </svg></button></div>
            </div>
        </div>
        <footer class="footer">
            <div class="justify-content-between text-center fs--1 mt-4 mb-3 row">
                <div class="col-sm-auto">
                    <p class="mb-0 text-600">Thank you for creating with Falcon <span class="d-none d-sm-inline-block">|
                        </span><br class="d-sm-none"> 2022 © <a href="https://themewagon.com">Themewagon</a></p>
                </div>
                <div class="col-sm-auto">
                    <p class="mb-0 text-600">v3.7.0</p>
                </div>
            </div>
        </footer>
    </div>
    </body>
</html>
