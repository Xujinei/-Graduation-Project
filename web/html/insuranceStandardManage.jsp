<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2017/11/27
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="cj" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>六险一金标准管理</title>

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
            $("#insuranceBody").children("tr").remove();
            $.ajax({
                type: "POST",
                url: "../insurance/pageInsurance",
                data: {pageIndex: a, pageSize: b},
                success: function (data) {

                    var ed = $.parseJSON(data);

                    var itbody = $("#insuranceBody");

                    $.each(ed.list, function (i, item) {
                        var id = item.id;
                        var name = item.name;
                        var pension = item.pension;
                        var medical = item.medical;
                        var unemployment = item.unemployment;
                        var injury = item.injury;
                        var maternity = item.maternity;
                        var housing = item.housing;


                        if (pension == undefined || pension == null) {
                            pension = "";
                        }
                        if (medical == undefined || medical == null) {
                            medical = "";
                        }
                        if (unemployment == undefined || unemployment == null) {
                            unemployment = "";
                        }
                        if (injury == undefined || injury == null) {
                            injury = "";
                        }
                        if (maternity == undefined || maternity == null) {
                            maternity = "";
                        }
                        if (housing == undefined || housing == null) {
                            housing = "";
                        }

                        var tr = "<tr>" +
                            "<td id='id'>" + id + "</td> " +
                            "<td id='name'>" + name + "</td> " +
                            "<td id='pension'>" + pension + "</td>" +
                            "<td id='medical'>" + medical + "</td>" +
                            "<td id='unemployment'>" + unemployment + "</td>" +
                            "<td id='injury'>" + injury + "</td>" +
                            "<td id='maternity'>" + maternity + "</td>" +
                            "<td id='housing'>" + housing + "</td>" +
                            "<td><button class='btn btn-danger deletInsBtn'>删除</button></td>" +
                            "<td><button class='btn btn-primary editIns'>详情</button> </td>" +
                            "</tr>";
                        itbody.append(tr);
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

        // 初始化页面列表
        init(1, 10);

    </script>


</head>
<body>
<div class="mycontain inerFrame">
    <ul id="myTab" class="nav nav-tabs">
        <li id="insuranceListLi">
            <a href="#insuranceList" data-toggle="tab">
                标准列表
            </a>
        </li>
        <li id="editInsuranceLi">
            <a href="#insuranceInfo" data-toggle="tab">
                信息详情
            </a>
        </li>
        <li id="addInsuranceLi">
            <a href="#addInsurance" data-toggle="tab">
                添加信息
            </a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <%--六险一金标准列表信息--%>
        <div class="tab-pane fade" id="insuranceList" style="margin: 2%">
            <%--选择删除--%>
            <form class="form-inline">

                <button type="button" class="btn btn-primary" id="addInsuranceBtn">添加</button>
            </form>
            <%--六险一金标准列表--%>
            <table class="table infoTable">
                <thead>
                <tr>
                    <th>标准编号</th>
                    <th>标准名称</th>
                    <th>养老保险</th>
                    <th>医疗保险</th>
                    <th>失业保险</th>
                    <th>工伤保险</th>
                    <th>生育保险</th>
                    <th>住房公积金</th>
                    <th>删除</th>
                    <th>详情</th>
                </tr>
                </thead>
                <tbody id="insuranceBody">

                </tbody>
            </table>
                <div class="page_div">
                    <span class="list_count"></span>条 &nbsp;&nbsp;
                    共<span class="page_count"></span>页&nbsp;&nbsp;

                </div>
        </div>
        <%--六险一金标准列表结束--%>
        <%--修改标准信息--%>
        <div class="tab-pane fade" id="insuranceInfo" style="margin: 2%">
            <form id="editInsForm">
                <table class="table infoTable">
                    <tbody id="insInfoBody">
                    <tr>
                        <td>
                            <label>标准编号：</label>
                            <input name="id" type="number" disabled="disabled"/>
                        </td>
                        <td>
                            <label>标准名称：</label>
                            <input name="name" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>养老保险：</label>
                            <input name="pension" type="number"/>
                        </td>
                        <td>
                            <label>医疗保险：</label>
                            <input name="medical" type="number"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>失业保险：</label>
                            <input name="unemployment" type="number"/>
                        </td>
                        <td>
                            <label>工伤保险：</label>
                            <input name="injury" type="number"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>生育保险：</label>
                            <input name="maternity" type="number"/>
                        </td>
                        <td>
                            <label>住房公积金：</label>
                            <input name="housing" type="number"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <button type="button" class="btn btn-primary btn-sm" id="editInsSubmit">修改</button>
                        </td>
                        <td align="left">
                            <button type="button" class="btn btn-primary btn-sm" id="exitInsurance">退出</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <%--修改标准信息结束--%>
        <%--添加标准信息 --%>
        <div class="tab-pane fade" id="addInsurance" style="margin: 2%">
            <form id="addInsForm">
                <table class="table infoTable">
                    <tbody>
                    <tr>

                        <td colspan="2">
                            <label>标准名称：</label>
                            <input name="name" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>养老保险：</label>
                            <input name="pension" type="number"/>
                        </td>
                        <td>
                            <label>医疗保险：</label>
                            <input name="medical" type="number"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>失业保险：</label>
                            <input name="unemployment" type="number"/>
                        </td>
                        <td>
                            <label>工伤保险：</label>
                            <input name="injury" type="number"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>生育保险：</label>
                            <input name="maternity" type="number"/>
                        </td>
                        <td>
                            <label>住房公积金：</label>
                            <input name="housing" type="number"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <button type="button" class="btn btn-primary btn-sm" id="addInsBtn">添加</button>
                        </td>
                        <td align="left">
                            <button type="button" class="btn btn-primary btn-sm" id="exitAddInsurance">退出</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <%--添加标准信息结束 --%>
    </div>
</div>
</body>

<script>

    // 查看标准详情
    $("body").on("click", ".editIns", function () {
        $("#editInsuranceLi").css("display", "block");
        $("#insuranceListLi").removeClass("active");
        $("#insuranceList").removeClass("in active");
        $("#insuranceInfo").addClass("in active");
        $("#editInsuranceLi").addClass("active");

        var p = $(this).parent().parent();
        var id = p.find("#id").text();
        var name = p.find("#name").text();
        var pension = p.find("#pension").text();
        var medical = p.find('#medical').text();
        var unemployment = p.find('#unemployment').text();
        var injury = p.find('#injury').text();
        var maternity = p.find('#maternity').text();
        var housing = p.find('#housing').text();


        $("#insInfoBody").find("input[name='id']").val(id);
        $("#insInfoBody").find("input[name='name']").val(name);
        $("#insInfoBody").find("input[name='pension']").val(pension);
        $("#insInfoBody").find("input[name='unemployment']").val(unemployment);
        $("#insInfoBody").find("input[name='medical']").val(medical);
        $("#insInfoBody").find("input[name='injury']").val(injury);
        $("#insInfoBody").find("input[name='maternity']").val(maternity);
        $("#insInfoBody").find("input[name='housing']").val(housing);

    });

    // 提交职务修改
    $("#editInsSubmit").click(function () {
        $("#insInfoBody").find("input[name='id']").removeAttr("disabled");
        $.ajax({
            type: "POST",
            data: $("#editInsForm").serialize(),
            url: "../insurance/updateIns",
            success: function (data) {
                alert(data);
                $("#editInsForm").find("input[name='id']").attr("disabled", "disabled");
            }
        });
    });
    //退出编辑按钮点击事件
    $("#exitInsurance").click(function () {
        $("#editInsuranceLi").css("display", "none");
        $("#insuranceListLi").addClass("active");
        $("#insuranceList").addClass("in active");
        $("#insuranceInfo").removeClass("in active");

        init(1, 10);
    });

    // 删除职务
    $("body").on("click", ".deletInsBtn", function () {
        var p = $(this).parent().parent();
        var id = p.find("#id").text();
        $.ajax({
            data: {id: id},
            url: "../insurance/delet",
            success: function () {

                init(1, 10);
            }
        });
    });
    // //退出添加标准
    $("#exitAddInsurance").click(function () {
        $("#addInsuranceLi").css("display", "none");
        $("#insuranceListLi").addClass("active");
        $("#insuranceList").addClass("in active");
        $("#addInsurance").removeClass("in active");

        init(1, 10);
    });
</script>
</html>
