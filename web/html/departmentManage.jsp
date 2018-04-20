<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2017/11/27
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="cj" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>部门管理</title>

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


        /*初始化部门列表*/

        function initList(a, b) {
            $("#departmentInfoBody").children("tr").remove();
            $(".page_num").remove();
            $.ajax({
                type: "POST",
                url: "../department/pageDepartment",
                data: {pageIndex: a, pageSize: b},
                success: function (data) {
                    var ed = $.parseJSON(data);

                    var depTbody = $("#departmentInfoBody");
                    $.each(ed.list, function (i, item) {
                        var id = item.id;
                        var name = item.name;
                        var leader = "无";
                        var lid = ""
                        if ("leader" in item) {
                            leader = item.leader.name;
                            lid = item.leader.id;
                        }

                        var createTime = item.createtime;
                        var remark = item.remark;
                        var introduction = item.introduction;
                        var overTimePay = item.overTimePay;
                        console.log(createTime);
                        if (id != null && id != undefined && id != "") {

                            if (leader == undefined || leader == null) {
                                leader = "";
                            }
                            if (createTime == undefined || createTime == null) {
                                createTime = "";
                            }
                            if (remark == undefined || remark == null) {
                                remark = "";
                            }
                            if (createTime != "") {

                                var timeTd = "<td>" + createTime + "</td>";
                            } else {
                                var timeTd = "<td>" + createTime + "</td>";
                            }
                            if (introduction == undefined || introduction == null) {
                                introduction = "";
                            }
                            if (overTimePay == undefined || overTimePay == null) {
                                overTimePay = "";
                            }
                            var tr = "<tr>" +
                                "<td id='id'>" + id + "</td> " +
                                "<td id='name'>" + name + "</td> " +
                                "<td id='leaderid'>" + leader + "<input type='hidden' id='lid' value='" + lid + "'/></td>" +
                                "<td id='introduction'>" + introduction + "</td>" +
                                "<td id='overTimePay'>" + overTimePay + "</td>" +
                                "<td id='remark'>" + remark + "</td>" +
                                "<td><button class='btn btn-danger deletDepartmentBtn'>删除</button></td>" +
                                "<td><button class='btn btn-primary editDepartment'>详情</button> </td>" +
                                "</tr>";

                            depTbody.append(tr);
                        }
                    });

                    $(".list_count").text(ed.pageNumber);
                    $(".page_count").text(ed.pageCount);
                    var end = ed.pageCount;
                    var page_div = $(".page_div");
                    for (var i = 1; i <= end; i++) {
                        var skip = 1;
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

        initList(1, 10);
        /*初始化部门列表结束*/
    </script>


</head>
<body>
<div class="mycontain inerFrame" onload="initDepartmentList()">
    <ul id="myTab" class="nav nav-tabs">
        <li id="departmentListLi">
            <a href="#departmentList" data-toggle="tab">
                部门列表
            </a>
        </li>
        <li id="editDepartmentLi">
            <a href="#departmentInfo" data-toggle="tab">
                部门信息详情
            </a>
        </li>
        <li id="addDepartmentLi">
            <a href="#addDepartment" data-toggle="tab">
                添加部门信息
            </a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <%--部门列表信息--%>
        <div class="tab-pane fade" id="departmentList" style="margin: 2%">
            <%--添加--%>
            <form class="form-inline">

                <button type="button" class="btn btn-primary" id="addDepartmentBtn">添加</button>
            </form>
            <%--部门列表--%>
            <table class="table infoTable">
                <thead>
                <tr>
                    <th>部门编号</th>
                    <th>部门名称</th>
                    <th>部门领导</th>
                    <th>介绍</th>
                    <th>加班工资</th>
                    <th>备注</th>
                    <th>删除</th>
                    <th>详情</th>
                </tr>
                </thead>
                <tbody id="departmentInfoBody">

                </tbody>
            </table>
                <div class="page_div">
                    <span class="list_count"></span>条 &nbsp;&nbsp;
                    共<span class="page_count"></span>页&nbsp;&nbsp;

                </div>
        </div>
        <%--部门列表结束--%>
        <%--修改部门信息--%>
        <div class="tab-pane fade" id="departmentInfo" style="margin: 2%">
            <form id="editDepartForm">
                <table class="table infoTable">
                    <tbody id="editDepartBody">
                    <tr>
                        <td>
                            <label>部门编号：</label>
                            <input name="id" type="text" disabled="disabled"/>
                        </td>
                        <td>
                            <label>部门名称：</label>
                            <input name="name" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>领导名字：</label>
                            <select name="leaderid" class="leaderSelect"></select>
                        </td>
                        <td>
                            <label>加班工资：</label>
                            <input name="overTimePay" type="number" step="0.1"></input>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>备注：</label>
                            <textarea name="remark"></textarea>
                        </td>
                        <td>
                            <label>介绍：</label>
                            <textarea name="introduction"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <button type="button" class="btn btn-primary btn-sm" id="editDepartBut">修改</button>
                        </td>
                        <td align="left">
                            <button type="button" class="btn btn-primary btn-sm" id="exitDepartment">退出</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <%--修改部门信息结束--%>
        <%--添加部门信息 --%>
        <div class="tab-pane fade" id="addDepartment" style="margin: 2%">
            <form id="addDepartmentForm">
                <table class="table infoTable">
                    <tbody>
                    <tr>
                        <td>
                            <label>部门名称：</label>
                            <input name="name" type="text"/>
                        </td>
                        <td>
                            <label>领导名字：</label>
                            <select name="leaderid" class="leaderSelect"></select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>备注：</label>
                            <input name="remark" type="text"/>
                        </td>
                        <td>
                            <label>介绍：</label>
                            <textarea name="introduction"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>加班工资：</label>
                            <input name="overTimePay" type="number" step="0.1"/>
                        </td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <button type="button" class="btn btn-primary btn-sm" id="addDepartmentSubmit">添加</button>
                        </td>
                        <td align="left">
                            <button type="button" class="btn btn-primary btn-sm" id="exitAdd">退出</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <%--添加部门信息结束 --%>
    </div>
</div>
</body>

<script>


    /*初始化部门领导人员信息*/
    function initLeaderSelect() {
        var empSelect = $(".leaderSelect");
        empSelect.find("option").remove();
        $.ajax({
            type: "POST",
            url: "../employInfo/getAll",
            success: function (data) {
                var d = eval(data);
                $.each(d, function (i, item) {
                    option = "<option value=" + item.id + ">" + item.name + "</option>";
                    empSelect.append(option);
                })
            }
        });
    }

    // 添加部门按钮点击事件
    $("#addDepartmentBtn").click(function () {
        $("#addDepartmentLi").css("display", "block").addClass("active");
        $("#addDepartment").addClass("in active");
        $("#departmentInfo").removeClass("in active");
        $("#departmentListLi").removeClass("active");
        $("#departmentList").removeClass("in active");
        initLeaderSelect();

    });

    // 查看部门详情
    $("body").on("click", ".editDepartment", function () {
        $("#editDepartmentLi").css("display", "block").addClass("active");
        $("#departmentInfo").addClass("in active");

        $("#departmentListLi").removeClass("active");
        $("#departmentList").removeClass("in active");
        initLeaderSelect();
        var p = $(this).parent().parent();
        var id = p.find("#id").text();
        var name = p.find("#name").text();
        var leaderid = p.find("#leaderid").text();
        var lid = p.find("#lid").val();
        var remark = p.find('#remark').text();
        var introduction = p.find('#introduction').text();
        var overTimePay = p.find('#overTimePay').text();


        $("#editDepartBody").find("input[name='id']").val(id);
        $("#editDepartBody").find("input[name='name']").val(name);
        $("#editDepartBody").find("input[name='overTimePay']").val(overTimePay);
        $("#editDepartBody").find("select[name='leaderid']").find("option[value='" + lid + "']").attr("selected", true);
        $("#editDepartBody").find("textarea[name='remark']").val(remark);
        $("#editDepartBody").find("textarea[name='introduction']").val(introduction);


    });

    // 提交部门修改
    $("#editDepartBut").click(function () {
        $("#editDepartBody").find("input[name='id']").removeAttr("disabled");
        $.ajax({
            type: "POST",
            data: $("#editDepartForm").serialize(),
            url: "../department/updateDepartment",
            success: function (data) {
                alert(data);
                $("#editDepartBody").find("input[name='id']").attr("disabled", "disabled");
            }
        });
    });
    //退出编辑按钮点击事件
    $("#exitDepartment").click(function () {
        $("#editDepartmentLi").css("display", "none");
        $("#departmentListLi").addClass("active");
        $("#departmentList").addClass("in active");
        $("#departmentInfo").removeClass("in active");

        initList(1, 10);
    });

    // 删除职务
    $("body").on("click", ".deletDepartmentBtn", function () {
        var p = $(this).parent().parent();
        var id = p.find("#id").text();
        $.ajax({
            data: {id: id},
            url: "../department/deletDepartment",
            success: function () {

                initList(1, 10);
            }
        });
    });

    // 退出添加
    $("#exitAdd").click(function () {
        $("#addDepartmentLi").css("display", "none");
        $("#departmentListLi").addClass("active");
        $("#departmentList").addClass("in active");
        $("#addDepartment").removeClass("in active");
        initList(1, 10);
    });
</script>
</html>
