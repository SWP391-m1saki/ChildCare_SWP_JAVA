<%-- 
    Document   : createPost
    Created on : Oct 3, 2022, 3:13:22 PM
    Author     : Admin
--%>

<%-- 
    Document   : add-product
    Created on : Jun 26, 2022, 9:41:27 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Viết bài đăng</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/add-product.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/lib/bootstrap/responsive.css'>

        <script src='${pageContext.request.contextPath}/lib/tinymce/tinymce.min.js'></script>
        <script>
            tinymce.init({
                selector: '#myTextarea',
                height: 300,
                plugins: 'print preview paste importcss searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap quickbars emoticons',
                imagetools_cors_hosts: ['picsum.photos'],
                menubar: 'file edit view insert format tools table help',
                toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl',
                toolbar_sticky: false,
                autosave_ask_before_unload: true,
                autosave_interval: "30s",
                autosave_prefix: "{path}{query}-{id}-",
                autosave_restore_when_empty: false,
                autosave_retention: "2m",
                image_advtab: true,
                /*content_css: '//www.tiny.cloud/css/codepen.min.css',*/
                link_list: [
                    {title: 'My page 1', value: 'https://www.codexworld.com'},
                    {title: 'My page 2', value: 'https://www.xwebtools.com'}
                ],
                image_list: [
                    {title: 'My page 1', value: 'https://www.codexworld.com'},
                    {title: 'My page 2', value: 'https://www.xwebtools.com'}
                ],
                image_class_list: [
                    {title: 'None', value: ''},
                    {title: 'Some class', value: 'class-name'}
                ],
                importcss_append: true,
                file_picker_callback: function (callback, value, meta) {
                    /* Provide file and text for the link dialog */
                    if (meta.filetype === 'file') {
                        callback('https://www.google.com/logos/google.jpg', {text: 'My text'});
                    }

                    /* Provide image and alt text for the image dialog */
                    if (meta.filetype === 'image') {
                        callback('https://www.google.com/logos/google.jpg', {alt: 'My alt text'});
                    }

                    /* Provide alternative source and posted for the media dialog */
                    if (meta.filetype === 'media') {
                        callback('movie.mp4', {source2: 'alt.ogg', poster: 'https://www.google.com/logos/google.jpg'});
                    }
                },
                templates: [
                    {title: 'New Table', description: 'creates a new table', content: '<div class="mceTmpl"><table width="98%%"  border="0" cellspacing="0" cellpadding="0"><tr><th scope="col"> </th><th scope="col"> </th></tr><tr><td> </td><td> </td></tr></table></div>'},
                    {title: 'Starting my story', description: 'A cure for writers block', content: 'Once upon a time...'},
                    {title: 'New list with dates', description: 'New List with dates', content: '<div class="mceTmpl"><span class="cdate">cdate</span><br /><span class="mdate">mdate</span><h2>My List</h2><ul><li></li><li></li></ul></div>'}
                ],
                template_cdate_format: '[Date Created (CDATE): %m/%d/%Y : %H:%M:%S]',
                template_mdate_format: '[Date Modified (MDATE): %m/%d/%Y : %H:%M:%S]',
                image_caption: true,
                quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
                noneditable_noneditable_class: "mceNonEditable",
                toolbar_mode: 'sliding',
                contextmenu: "link image imagetools table"
            });
        </script>
        <!--        RichTextEditor
                <base href="${pageContext.request.contextPath}/lib/richtexteditor/richtexteditor"/>
                <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/richtexteditor/rte_theme_default.css" />
                <script type="text/javascript" src="${pageContext.request.contextPath}/lib/richtexteditor/richtexteditor/rte.js"></script>
                <script type="text/javascript" src='${pageContext.request.contextPath}/lib/richtexteditor/plugins/all_plugins.js'></script>-->
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <c:set var="context" value="${pageContext.request.contextPath}"/>
        <div class="page-wrapper">
            <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->

                <main class="main-admin-page">
                    <!--HEADER-->
                <jsp:include page="header.jsp"></jsp:include>
                    <!--HEADER-->

                    <section class="content-main" style="max-width: 980px">
                        <div class="content-header">
                            <h2 class="content-title">Tạo bài viết mới</h2>
                            <div>
                                <a href="${pageContext.request.getContextPath()}/manager/post" class="btn btn-danger fw-bold"> × Hủy</a>
                        </div>
                    </div>
                    <c:if test="${requestScope.mess != null}">
                        <div class="message">
                            <p class="text-danger">${requestScope.mess}</p>
                        </div>
                    </c:if>


                    <div class="content-body">
                        <div class="add-form">
                            <form method="POST" id="main-form">
                                <div class="form-item">
                                    <input type="text" name="title" required="required" placeholder="Tiêu đề bài viết" class="form-control fw-bold fs-5" value="${requestScope.post.title}">
                                </div>

                                <div class="form-row form-row-2">
                                    <div class="form-item">
                                        <label class="form-label fw-bold fs-6">Chọn danh mục</label>
                                        <select name="category" class="form-select">
                                            <c:forEach items="${requestScope.postCategory}" var="c">
                                                <option value="${c.cateId}" class="list-group-item p-2">${c.cateName}</option>
                                            </c:forEach>
                                        </select>     
                                    </div>
                                    <style>
                                        .fa-plus{
                                            height: fit-content;
                                            width: fit-content;
                                            padding: 3px;
                                            border-radius: 5px;
                                            margin: auto 0;
                                            border: 1px solid #e8e8e8;
                                            transition: ease-in-out 100ms;
                                        }
                                        .fa-plus:hover {
                                            background: #e8e8e8;
                                            transform: scaleX(1.1);
                                        }

                                        .list-category {
                                            max-width: 250px;
                                            max-height: 210px;
                                            overflow-y: scroll;
                                            text-overflow: ellipsis;
                                            white-space: nowrap;
                                        }

                                        input[name="new-category"] {
                                            max-width: 250px;
                                        }

                                        .add-category-div {
                                            display: none;
                                            width: 370px;
                                            background: #eeeeee;
                                            position: absolute;
                                            z-index: 2;
                                        }
                                    </style>
                                    <div class="form-item mt-4">
                                        <i class="fa-solid fa-plus fs-5 mt-2 text-primary fw-bold open"></i>
                                        <div class="add-category-div  px-4 py-2">
                                            <div>
                                                <span class="h5 my-2 me-3" style="display: inline-block">Thêm danh mục mới</span>
                                                <i class="fa-solid fa-xmark p-1 fs-5 border border-white rounded close bg-dark text-white"></i>
                                            </div>
                                            <div>
                                                <input type="text" name="new-category" required="required" placeholder="chuyên mục" class="form-control w-60 mb-3"
                                                       style="display: inline-block">
                                                <div class="btn btn-primary pb-1 btn-category-add">Thêm</div>
                                            </div>
                                            <ul class="list-group list-category">
                                                <c:forEach items="${requestScope.postCategory}" var="c">
                                                    <li value="${c.cateId}" class="list-group-item">
                                                        <span>${c.cateName}</span>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>

                                </div>

                                <div class="form-item">
                                    <label class="form-label fw-bold fs-6">Mô tả bài viết</label>
                                    <textarea name="description" class="form-control"
                                              style="min-height: 100px">${requestScope.post.description}</textarea>
                                </div>

                                <div class="form-item">
                                    <label class="form-label fw-bold fs-6" >Nội dung bài viết</label>
                                    <textarea name="content" id="myTextarea" class="form-control">
                                        ${requestScope.post.detail}
                                    </textarea>
                                </div>

                                <div class="form-row form-row-2">
                                    <div class="form-item">
                                        <label class="form-label fs-6 fw-bold">Hình ảnh chính</label>
                                        <input name="image" accept="image/*" class="form-control" type="file" 
                                               onchange="
                                            document.getElementById('image-preview').src = window.URL.createObjectURL(this.files[0]);
                                            document.getElementById('image-preview').style = 'visibility: visible';
                                               ">
                                        <img style="visibility: hidden" id="image-preview" alt="your image" width="150" />
                                    </div><!-- comment -->
                                </div> <!-- row.// -->

                                <button type="submit" form="main-form" class="btn btn-primary">Đăng bài</button>
                            </form>
                        </div>
                    </div> <!-- card end// -->
                </section>
            </main>
        </div>
        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">
//            var editor1 = new RichTextEditor("#div_editor1");
            const expandBtn = document.querySelector('.open');
            const closeBtn = document.querySelector('.close');
            const addCategoryDiv = document.querySelector('.add-category-div');

            expandBtn.addEventListener('click', function (e) {
                e.target.style.display = "none";
                addCategoryDiv.style.display = "block";
            });

            closeBtn.addEventListener('click', function (e) {
                addCategoryDiv.style.display = "none";
                expandBtn.style.display = "block";
            });

            function ajaxCall() {
                $.ajax({
                    url: '/Childcare/ajax/post/create-category',
                    type: "POST",
                    data: {
                        new_category: document.querySelector('input[name="new-category"]').value
                    },
                    async: true,
                    success: function (data) {
                        var row = document.querySelector('select[name="category"]');
                        row.innerHTML = data;
                    }
                });

            }

            document.querySelector('.btn-category-add').addEventListener('click', function () {
                ajaxCall();
                addCategoryDiv.style.display = "none";
                expandBtn.style.display = "block";
            });
            
            document.querySelector('button[type="submit"]').addEventListener('click', () =>{
                document.querySelector('form').submit();
            });
        </script>
    </body>
</html>

