<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>通知</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet"/>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="css/common.css" rel="stylesheet">
    <style>
        .deleteNotice {
            margin-left: 50%;
        }

        .page_div {
            margin: 10px auto;
            text-align: center;
        }
    </style>
    <script src="js/my.js"></script>

    <script>

        function initList(a, b) {
            $.ajax({
                type: "POST",
                data: {pageIndex: a, pageSize: b},
                url: "../notice/getNotice",
                success: function (data) {
                    var ed = $.parseJSON(data);
                    $("#noticeUL").children("li").remove();
                    $(".page_num").remove();

                    var ul = $("#noticeUL");

                    $.each(ed.list, function (i, item) {

                        var li = "<li class='list-group-item'>" + item.content +
                            "<input type='hidden' value='" + item.id + "' class='noticeId'/>" +
                            "<button type='button' class='btn btn-danger deleteNotice' >删除</button>" +
                            "</li>";
                        ul.append(li);

                    });

                    $(".list_count").text(ed.pageNumber);
                    $(".page_count").text(ed.pageCount);
                    var end = ed.pageCount;
                    var page_div = $(".page_div");
                    for (var i = 1; i <= end; i++) {
                        var skip = 0;
                        if (i > 1) {
                            skip = (i - 1) * 10;
                        }
                        var aSpan = " <span class='page_num'>" +
                            "<a href='javascript:initList(" + skip + "," + 10 + ")'>" + i + "</a></span>";
                        page_div.append(aSpan);
                    }
                }
            });
        }

        initList(0, 7);

    </script>


</head>
<body>
<div class="mycontain inerFrame">
    <ul id="myTab" class="nav nav-tabs active">
        <li id="noticeListLi">
            <a href="#noticeList" data-toggle="tab">
                通知列表
            </a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <%--通知列表信息--%>
        <div class="tab-pane in active" id="noticeList" style="margin: 2%">
            <%--选择删除--%>
            <%--<form class="form-inline">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" id="selectAll"/> 全选
                    </label>
                </div>
                <button type="button" class="btn btn-danger" id="deleteNotice">删除</button>
            </form>--%>
            <%--通知列表--%>

            <ul class="list-group" id="noticeUL">
            </ul>
            <%--通知列表结束--%>
            <div class="page_div">
                <span class="list_count"></span>条 &nbsp;&nbsp;
                共<span class="page_count"></span>页&nbsp;&nbsp;

            </div>
        </div>
        <%--通知列表结束--%>

    </div>
</div>
</body>

<script>

    /*删除账号*/
    $("body").on("click", ".deleteNotice", function () {
        var id = $(this).parent().find(".noticeId").val();
        $.ajax({
            type: "POST",
            data: {id: id},
            url: "../notice/delete",
            success: function (data) {
                alert(data);
                initList(0, 7);
            },
            error: function () {
                alert("删除失败");
            }
        });
    })


</script>
</html>
