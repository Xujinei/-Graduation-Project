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

    </style>
    <script src="js/my.js"></script>

    <script>

        function initList(a, b) {
            $.ajax({
                type: "POST",
                data: {pageIndex: a, pageSize: b},
                url: "../notice/getNotice",
                success: function (data) {
                    console.log(data);
                    var ed = $.parseJSON(data);
                    console.log("ed===" + ed);

                    $("#noticeUL").children("li").remove();
                    $(".page_num").remove();
                    $.each(ed.list, function (i, item) {
                        console.log("item===" + item);
                        var li = "<li class='list-group-item'>" + item.content + "</li>" +
                            "<button type='button' class='btn btn-danger' class='deleteNotice'>删除</button>";
                        $("#noticeUL").append(li);
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
    <ul id="myTab" class="nav nav-tabs">
        <li id="noticeListLi">
            <a href="#noticeList" data-toggle="tab">
                通知列表
            </a>
        </li>

    </ul>
    <div id="myTabContent" class="tab-content">
        <%--通知列表信息--%>
        <div class="tab-pane fade" id="noticeList" style="margin: 2%">
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
                <li class="list-group-item">免费域名注册</li>
                <li class="list-group-item">免费 Window 空间托管</li>
                <li class="list-group-item">图像的数量</li>
                <li class="list-group-item">24*7 支持</li>
                <li class="list-group-item">每年更新成本</li>
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

    /*全选*/

    $("#selectAll").change(function () {
        var checkAll = $("#selectAll").is(':checked');
        console.log(checkAll);
        if (checkAll) {
            $.each($('input[class=aCheckbox]'), function () {
                $(this).attr("checked", true);
            });
        } else {
            $.each($('input[class=aCheckbox]'), function () {
                $(this).attr("checked", false);
            });
        }
    });


    /*删除账号*/
    $("#deleteAccount").click(function () {
        var f = $(".aCheckbox").is(':checked');
        if (!f) {
            alert("请选择要删除的账号");
            return;
        } else {
            $.each($('input[class=aCheckbox]:checked'), function () {
                var id = $(this).val();
                console.log("id=====" + id);
                $.ajax({
                    type: "POST",
                    data: {id: id},
                    url: "../account/delete",
                    success: function (data) {
                        alert(data);
                        console.log(data);
                        initList(0, 10);
                    },
                    error: function () {
                        alert("初始化密码失败");
                    }
                });
            });
        }
    });


</script>
</html>
