<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2017/11/27
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="cj" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String pageCount = (String) request.getAttribute("pagetCount");

%>

<html>
<head>
    <title>职务管理 "<%=pageCount%>" </title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet"/>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="css/common.css" rel="stylesheet">
    <style type="text/css">
        .page_div {
            margin: 10px auto;
            text-align: center;
        }
    </style>
    <script src="js/my.js"></script>

    <script>
        //全选
        /* console.log(document.getElementById("selectAll").innerHTML);
         $("#selectAll").change(function () {
             console.log("change");
         });
         if ($("#selectAll").is(':checked')) {
             console.log("select All");
             $(".aCheckbox").attr("checked", "checked");
         }
         ;*/


        function init(a, b) {
            $("#positionBody").children("tr").remove();
            $(".page_num").remove();
            $.ajax({
                type: "POST",
                url: "../position/pagePosition",
                data: {pageIndex: a, pageSize: b},
                success: function (data) {

                    var ed = $.parseJSON(data);

                    console.log(ed);
                    var tbody = $("#positionBody");

                    $(".list_count").text(ed.pageNumber);
                    $(".page_count").text(ed.pageCount);

                    $.each(ed.list, function (i, item) {
                        var id = item.id;
                        var name = item.name;
                        var duty = item.duty;
                        var required = item.required;
                        var remark = item.remark;

                        if (id != null && id != undefined && id != "") {

                            if (duty == undefined || duty == null) {
                                duty = "";
                            }
                            if (required == undefined || required == null) {
                                required = "";
                            }
                            if (remark == undefined || remark == null) {
                                remark = "";
                            }
                            var tr = "<tr>" +
                                "<td id='id'>" + id + "</td> " +
                                "<td id='name'>" + name + "</td> " +
                                "<td id='duty'>" + duty + "</td>" +
                                "<td id='required'>" + required + "</td>" +
                                "<td id='remark'>" + remark + "</td>" +
                                "<td><button class='btn btn-danger deletPositionBtn'>删除</button></td>" +
                                "<td><button class='btn btn-primary editPosition'>详情</button> </td>" +
                                "</tr>";
                            tbody.append(tr);

                        }
                    });
                    var end = ed.pageCount;
                    var page_div = $(".page_div");
                    for (var i = 1; i <= end; i++) {
                        var skip = 1;
                        if (i > 1) {
                            skip = (i - 1) * 10;
                        }
                        var aSpan = " <span class='page_num'>" +
                            "<a href='javascript:init(" + skip + "," + 10 + ")'>" + i + "</a></span>";
                        page_div.append(aSpan);
                    }
                }
            });

        };

        /*初始化职务列表*/
        init(1, 10);
        /*初始化职务列表结束*/
    </script>


</head>
<body>
<div class="mycontain inerFrame">
    <ul id="myTab" class="nav nav-tabs">
        <li id="positionListLi">
            <a href="#positionList" data-toggle="tab">
                职务列表
            </a>
        </li>
        <li id="editPositionLi">
            <a href="#positionInfo" data-toggle="tab">
                职务信息详情
            </a>
        </li>
        <li id="addPositionLi">
            <a href="#addPosition" data-toggle="tab">
                添加职务
            </a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <%--职务列表信息--%>
        <div class="tab-pane fade" id="positionList" style="margin: 2%">
            <%--选择删除--%>
            <form class="form-inline">
                <button type="button" class="btn btn-primary" id="addPositionBtn">添加</button>
            </form>
            <%--职务列表--%>
            <table class="table infoTable">
                <thead>
                <tr>
                    <th>职务编号</th>
                    <th>职务名称</th>
                    <th>职责</th>
                    <th>要求</th>
                    <th>备注</th>
                    <th>删除</th>
                    <th>详情</th>
                </tr>
                </thead>
                <tbody id="positionBody">

                </tbody>
            </table>
            <div class="page_div">
                <span class="list_count"></span>条 &nbsp;&nbsp;
                共<span class="page_count"></span>页&nbsp;&nbsp;

            </div>
        </div>
        <%--职务列表结束--%>
        <%--修改职务信息--%>
        <div class="tab-pane fade" id="positionInfo" style="margin: 2%">
            <form id="editPosiForm">
                <table class="table infoTable">
                    <tbody id="eidtPositionBody">
                    <tr>
                        <td>
                            <label>职务编号：</label>
                            <input name="id" type="text" disabled="disabled"/>
                        </td>
                        <td>
                            <label>职务名称：</label>
                            <input name="name" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>职责：</label>
                            <textarea name="duty"></textarea>
                        </td>
                        <td>
                            <label>要求：</label>
                            <textarea name="required"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>备注：</label>
                            <input name="remark" type="text"/>
                        </td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <button type="button" class="btn btn-primary btn-sm" id="submintEditPosi">修改</button>
                        </td>
                        <td align="left">
                            <button type="button" class="btn btn-primary btn-sm" id="exitPosition">退出</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <%--修改职务信息结束--%>
        <%--添加职务信息--%>
        <div class="tab-pane fade" id="addPosition" style="margin: 2%">
            <form id="addPosiForm">
                <table class="table infoTable">
                    <tbody>
                    <tr>
                        <td>
                            <label>职务名称：</label>
                            <input name="name" type="text"/>
                        </td>
                        <td>
                            <label>备注：</label>
                            <input name="remark" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>职责：</label>
                            <textarea name="duty"></textarea>
                        </td>
                        <td>
                            <label>要求：</label>
                            <textarea name="required"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <button type="button" class="btn btn-primary btn-sm" id="submintAddPos">添加</button>
                        </td>
                        <td align="left">
                            <button type="button" class="btn btn-primary btn-sm" id="exitAddPosition">退出</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <%--添加职务信息结束--%>
    </div>
</div>
</body>

<script>

    // 查看职务详情
    $("body").on("click", ".editPosition", function () {

        $("#editPositionLi").css("display", "block");
        $("#positionListLi").removeClass("active");
        $("#positionList").removeClass("in active");
        $("#positionInfo").addClass("in active");
        $("#editPositionLi").addClass("active");


        var p = $(this).parent().parent();
        var id = p.find("#id").text();
        var name = p.find("#name").text();
        var remark = p.find("#remark").text();
        var required = p.find('#required').text();
        var duty = p.find('#duty').text();

        $("#eidtPositionBody").find("input[name='id']").val(id);
        $("#eidtPositionBody").find("input[name='name']").val(name);
        $("#eidtPositionBody").find("input[name='remark']").val(remark);
        $("#eidtPositionBody").find("textarea[name='required']").val(required);
        $("#eidtPositionBody").find("textarea[name='duty']").text(duty);

    });


    // 提交职务修改
    $("#submintEditPosi").click(function () {
        $("#editPosiForm").find("input[name='id']").removeAttr("disabled");
        $.ajax({
            type: "POST",
            data: $("#editPosiForm").serialize(),
            url: "../position/updatePosition",
            success: function (data) {
                alert(data);
                $("#editPosiForm").find("input[name='id']").attr("disabled", "disabled");
            }
        });
    });


    //退出添加职务
    $("#exitAddPosition").click(function () {
        $("#addPositionLi").css("display", "none");
        $("#positionListLi").addClass("active");
        $("#positionList").addClass("in active");
        $("#addPosition").removeClass("in active");
        init(1, 10);
    });


    //退出编辑按钮点击事件
    $("#exitPosition").click(function () {
        $("#editPositionLi").css("display", "none");
        $("#positionListLi").addClass("active");
        $("#positionList").addClass("in active");
        $("#positionInfo").removeClass("in active");

        init(1, 10);
    });

    // 删除职务
    $("body").on("click", ".deletPositionBtn", function () {
        // alert(1);
        var p = $(this).parent().parent();
        var id = p.find("#id").text();
        $.ajax({
            data: {id: id},
            url: "../position/deletPostion",
            success: function () {

                init(1, 10);
            }
        });
    });

</script>
</html>
