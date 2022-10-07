<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-lg-4">
    <!-- Search Form Start -->
    <div class="mb-5">
        <form action="chuyen-muc">
            <div class="input-group">
                <input type="text" name="search" class="form-control p-3" placeholder="Tìm bài viết"/>
                <c:if test="${requestScope.postDetail == null && requestScope.cid != -1}">
                </c:if>
                <button class="btn btn-primary px-3"><i class="fa fa-search"></i></button>
                <input type="hidden" name="cid" value="${requestScope.cid}"/>
            </div>
        </form>
    </div>
    <!-- Search Form End -->

    <!-- Category Start -->
    <div class="mb-5">
        <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 mb-4">Danh mục</h4>                       
        <div class="d-flex flex-column justify-content-start">
            <c:forEach items="${requestScope.categoryList}" var="c">
                <a class="h5 bg-light rounded py-2 px-3 mb-2" href="chuyen-muc?cid=${c.cateId}">
                    <i class="fa fa-angle-right me-2"></i>${c.cateName}
                </a>
            </c:forEach>

        </div>
    </div>
    <!-- Category End -->

    <!-- Recent Post Start -->        
    <div class="mb-5">
        <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 mb-4">Bài viết gần đây</h4>
        <c:forEach items="${requestScope.postRecent}" var="rcPost" >
            <c:if test="${post.postId != rcPost.postId}">
                <div class="d-flex rounded overflow-hidden mb-3">
                    <img class="img-fluid" src="${pageContext.request.contextPath}/img/${rcPost.image}" style="width: 100px; height: 100px; object-fit: cover;" alt="">
                    <a href="" class="h5 d-flex align-items-center bg-light px-3 mb-0">${rcPost.title}
                    </a>
                </div>
            </c:if>
        </c:forEach>


    </div>
    <!-- Recent Post End -->

    <!-- Image Start -->
    <div class="mb-5">
        <img src="img/blog-1.jpg" alt="" class="img-fluid rounded">
    </div>
    <!-- Image End -->

    <!-- Tags Start -->
    <div class="mb-5">
        <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 mb-4">Tag Cloud</h4>
        <div class="d-flex flex-wrap m-n1">
            <a href="" class="btn btn-primary m-1">Design</a>
            <a href="" class="btn btn-primary m-1">Development</a>
            <a href="" class="btn btn-primary m-1">Marketing</a>
            <a href="" class="btn btn-primary m-1">SEO</a>
            <a href="" class="btn btn-primary m-1">Writing</a>
            <a href="" class="btn btn-primary m-1">Consulting</a>
            <a href="" class="btn btn-primary m-1">Design</a>
            <a href="" class="btn btn-primary m-1">Development</a>
            <a href="" class="btn btn-primary m-1">Marketing</a>
            <a href="" class="btn btn-primary m-1">SEO</a>
            <a href="" class="btn btn-primary m-1">Writing</a>
            <a href="" class="btn btn-primary m-1">Consulting</a>
        </div>
    </div>
    <!-- Tags End -->

</div>
<!-- Sidebar End -->