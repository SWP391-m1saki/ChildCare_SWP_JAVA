<%-- 
    Document   : Paging
    Created on : Oct 6, 2022, 8:55:01 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="page" value="${requestScope.page}"/>
<div class="paging-product-list" id="paging-div">
    <form method="POST" id="main-form">
        <div id="pagger" class="pagger"></div>
        <div class="nrpp">
            <select name="pagesize" onchange="this.form.submit()">
                <c:forEach items="${requestScope.nrppArr}" var="p">
                    <option value="${p}" ${page.pagesize==p?'selected':''}>${p}</option>
                </c:forEach>
            </select>
            <span>Hiển thị ${(page.pageindex - 1) * page.pagesize + 1} –
                ${(page.totalrecords < page.pageindex * page.pagesize)?page.totalrecords:page.pageindex*page.pagesize}
                trong ${requestScope.page.totalrecords} kết quả</span>
            <input type="hidden" name="pageindex" value="${requestScope.page.pageindex}">
            <input type="hidden" name="totalpage" value="${requestScope.page.totalpage}">
        </div>
        <script>
            pagger('pagger',${requestScope.page.pageindex},${requestScope.page.totalpage}, 2, -1);
        </script>
    </form>
</div>

