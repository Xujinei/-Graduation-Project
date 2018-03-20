<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2017/11/27
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib prefix="cj" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>员工管理</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="css/common.css" rel="stylesheet">
    <style>
        .redSpan {
            color: red;
        }

        .page_div {
            margin: 10px auto;
            text-align: center;
        }
    </style>
    <script src="js/my.js"></script>

    <script>

        /*绘制用户列表公共方法*/
        function successEach(data) {
            var ed = $.parseJSON(data);
            var depTbody = $("#EmployeeListBody");
            $.each(ed.list, function (i, item) {
                var id = item.id;
                var name = item.name;
                var positionid = item.position.name;
                var sex = item.sex;
                var entrytime = item.entrytime;
                var departmentid = item.department.name;
                var basesalary = item.basesalary;
                var positionsalary = item.positionsalary;
                var email = item.email;

                if (id != null && id != undefined && id != "") {

                    if (positionid == undefined || positionid == null) {
                        positionid = "";
                    }
                    if (sex == undefined || sex == null) {
                        sex = "";
                    }
                    if (entrytime == undefined || entrytime == null) {
                        entrytime = "";
                    }
                    if (departmentid == undefined || departmentid == null) {
                        departmentid = "";
                    }
                    if (basesalary == undefined || basesalary == null) {
                        basesalary = "";
                    }
                    if (positionsalary == undefined || positionsalary == null) {
                        positionsalary = "";
                    }
                    if (email == undefined || email == null) {
                        email = "";
                    }

                    var tr = "<tr>" +
                        "<td><input type='checkbox' class='aEmpCheck' value='" + id + "'/> </td>" +
                        "<td class='name'>" + name + "</td> " +
                        "<td class='departmentid'>" + departmentid + "</td>" +
                        "<td class='positionid'>" + positionid + "</td>" +
                        "<td class='sex'>" + sex + "</td>" +
                        "<td class='email'>" + email + "</td>" +
                        "<td class='basesalary'>" + basesalary + "</td>" +
                        "<td class='positionsalary'>" + positionsalary + "</td>" +
                        "<td><button class='btn btn-primary editEmployeeInfoBtn'>详情</button> </td>" +
                        "</tr>";

                    depTbody.append(tr);
                }
            });
        };


        /*初始化员工列表*/
        function initList(a, b) {
            $("#EmployeeListBody").children("tr").remove();
            $(".page_num").remove();
            $.ajax({
                type: "POST",
                url: "../employInfo/pageEmployee",
                data: {pageIndex: a, pageSize: b},
                success: function (data) {
                    var ed = $.parseJSON(data);
                    successEach(data);
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

        /*初始化员工列表*/
        initList(1, 10);
    </script>

</head>
<body>
<div class="mycontain inerFrame">
    <ul id="myTab" class="nav nav-tabs">
        <li id="employeeListLab"><a href="#employeeList" data-toggle="tab">员工信息列表</a></li>
        <li id="employeeInfoLab">
            <a href="#employeeInfo" data-toggle="tab">
                员工详细信息
            </a>
        </li>
        <li id="addEmployeeLab">
            <a href="#addemployee" data-toggle="tab">
                新增员工
            </a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <%--员工列表--%>
        <div class="tab-pane fade" id="employeeList" style="margin:4%;" align="center">
            <%--条件查询账号--%>
            <form class="form-inline InitCommon" id="selectForm">
                <div class="form-group">
                    <label for="name">姓名</label>
                    <input type="text" class="form-control" id="name" placeholder="请输入员工姓名" name="name">
                </div>
                <div class="form-group">
                    <label for="position">职务</label>
                    <select class="form-control" id="position" name="positionid">

                    </select>
                </div>
                <div class="form-group">
                    <label for="department">部门</label>
                    <select class="form-control" id="department" name="departmentid">

                    </select>
                </div>
                <%-- <div class="form-group">
                     <label for="employeeStatus">状态</label>
                     <select class="form-control" id="employeeStatus" name="employeeStatus">
                         <option>1</option>
                     </select>
                 </div>--%>
                <button type="button" class="btn btn-primary" id="selectEmpByKey">查询</button>
            </form>
            <%--选择删除--%>
            <form class="form-inline">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" class="checkAll"> 全选
                    </label>
                </div>
                <button type="button" class="btn btn-danger" id="deleteEmployeeBtn">删除</button>
                <button type="button" class="btn btn-primary" id="addEmployeeBtn">添加</button>
            </form>
            <%--账号列表--%>
            <table class="table infoTable personInfoTable">
                <thead>
                <tr>
                    <th>选择</th>
                    <th>姓名</th>
                    <th>所在部门</th>
                    <th>职务</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>基本工资</th>
                    <th>职务工资</th>

                    <th>编辑</th>
                    <%--启用编辑后该按钮变为保存，点击保存才会保存修改--%>
                </tr>
                </thead>
                <tbody id="EmployeeListBody">

                </tbody>
            </table>
            <div class="page_div">
                <span class="list_count"></span>条 &nbsp;&nbsp;
                共<span class="page_count"></span>页&nbsp;&nbsp;

            </div>
        </div>
        <%--员工列表结束--%>
        <%--员工详细信息--%>
        <div class="tab-pane fade" id="employeeInfo" style="margin: 2%">
            <form id="updateForm">
                <table class="table infoTable">
                    <tbody id="infoBody">
                    <tr>
                        <td>
                            <label>编号：</label>
                            <input name="id" type="text" disabled="disabled"/>
                        </td>
                        <td>
                            <label>姓名：</label>
                            <input name="name" type="text"/>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <label>性别：</label>
                            <input type="radio" name="sex" value="男"/>男
                            <input type="radio" name="sex" value="女"/>女
                        </td>
                        <td>
                            <label>出生日期：</label>
                            <input name="brithday" type="text"/>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <label>联系电话：</label>
                            <input type="tel" name="telphone"/>
                        </td>
                        <td>
                            <label>邮箱：</label>
                            <input name="email" type="email"/>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <label>地址：</label>
                            <input type="text" name="address"/>
                        </td>
                        <td>
                            <label>身份证号：</label>
                            <input name="identificationid" type="text"/>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <label>学历：</label>
                            <input type="text" name="education"/>
                        </td>
                        <td>
                            <label>毕业学校：</label>
                            <input name="school" type="text"/>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <label>专业：</label>
                            <input type="text" name="profession"/>
                        </td>
                        <td>
                            <label>政治面貌：</label>
                            <input name="politicalstatus" type="text"/>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <label>入职时间：</label>
                            <input type="text" name="entrytime"/>
                        </td>
                        <td>
                            <label>合同到期时间：</label>
                            <input name="expiredate" type="text"/>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <label>所属部门：</label>
                            <select name="departmentid">

                            </select>
                        </td>
                        <td>
                            <label>职务：</label>
                            <select name="positionid">

                            </select>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <label>基本工资：</label>
                            <input name="basesalary" type="number" step="0.1"/>
                        </td>
                        <td>
                            <label>职务工资：</label>
                            <input type="number" name="positionsalary" step="0.1"/>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <label>基本补贴：</label>
                            <input name="subsidy" type="number" step="0.1"/>
                        </td>
                        <td>
                            <label>补贴标准：</label>
                            <select name="insurancestandard">

                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <button type="button" class="btn btn-primary btn-sm updateEmployeeBtn">修改</button>
                        </td>
                        <td align="left">
                            <button type="button" class="btn btn-primary btn-sm" id="exitInfo">退出</button>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </form>
        </div>
        <%--员工详细信息结束--%>
        <%--添加员工信息--%>
        <div class="tab-pane fade" id="addemployee" style="margin: 2%">
            <form id="addEmployeeForm" class="InitCommon">
                <table class="table infoTable">
                    <tbody>
                    <tr>
                        <td>
                            <label><span class="redSpan">*</span> 姓名：</label>
                            <input name="name" type="text"/>
                        </td>
                        <td>
                            <label>性别：</label>
                            <input type="radio" name="sex" value="男"/>男
                            <input type="radio" name="sex" value="女"/>女
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>出生日期：</label>
                            <input name="brithday" type="date"/>
                        </td>
                        <td>
                            <label><span class="redSpan">*</span> 联系电话：</label>
                            <input type="tel" name="telphone"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><span class="redSpan">*</span> 邮箱：</label>
                            <input name="email" type="email"/>
                        </td>
                        <td>
                            <label>地址：</label>
                            <input type="text" name="address"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><span class="redSpan">*</span> 身份证号：</label>
                            <input name="identificationid" type="text"/>
                        </td>
                        <td>
                            <label>学历：</label>
                            <input type="text" name="education"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>毕业学校：</label>
                            <input name="school" type="text"/>
                        </td>
                        <td>
                            <label>专业：</label>
                            <input type="text" name="profession"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>政治面貌：</label>
                            <input name="politicalstatus" type="text"/>
                        </td>
                        <td>
                            <label><span class="redSpan">*</span> 入职时间：</label>
                            <input type="date" name="entrytime"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>合同到期时间：</label>
                            <input name="expiredate" type="date"/>
                        </td>
                        <td>
                            <label><span class="redSpan">*</span> 所属部门：</label>
                            <select name="departmentid">

                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><span class="redSpan">*</span> 职务：</label>
                            <select name="positionid">

                            </select>
                        </td>
                        <td>
                            <label><span class="redSpan">*</span> 基本工资：</label>
                            <input name="basesalary" type="number" step="0.01"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>职务工资：</label>
                            <input type="number" name="positionsalary" step="0.01"/>
                        </td>
                        <td>
                            <label>基本补贴：</label>
                            <input name="subsidy" type="number" step="0.01"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>补贴标准：</label>
                            <select name="insurancestandard">

                            </select>
                        </td>

                    </tr>
                    <tr>
                        <td align="center">
                            <button type="button" class="btn btn-primary btn-sm" id="addEmployeeSub">添加</button>
                        </td>
                        <td align="left">
                            <button type="button" class="btn btn-primary btn-sm" id="exitAdd">退出</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <%--添加员工信息结束--%>
    </div>
</div>
</body>
<script>

    /*查询*/
    function selectByKey(a, b) {
        $("#EmployeeListBody").children("tr").remove();
        $(".page_num").remove();
        console.log($("#selectForm").serialize());
        $.ajax({
            type: "POST",
            data: {employeeinfoParam: $("#selectForm").serialize(), pageIndex: a, pageSize: b},
            url: "../employInfo/selectByKey",
            success: function (data) {
                var ed = $.parseJSON(data);

                successEach(data);
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
                        "<a href='javascript:selectByKey(" + skip + "," + 10 + ")'>" + i + "</a></span>";
                    page_div.append(aSpan);
                }
            },
            error: function () {

            }
        });
    }

    $("#selectEmpByKey").click(function () {
        selectByKey(1, 10);
    });





    /*添加员工信息*/
    $("#addEmployeeSub").click(function () {
        var name = $("#addEmployeeForm").find("input[name='name']").val();
        var telPhone = $("#addEmployeeForm").find("input[name='telphone']").val();
        var email = $("#addEmployeeForm").find("input[name='email']").val();
        var identificationid = $("#addEmployeeForm").find("input[name='identificationid']").val();
        var entrytime = $("#addEmployeeForm").find("input[name='entrytime']").val();
        var basesalary = $("#addEmployeeForm").find("input[name='basesalary']").val();

        if (name == null || name == "") {
            alert("请输入员工姓名");
            return;
        } else if (telPhone == null || telPhone == "") {
            alert("请输入员工联系电话");
            return;
        } else if (email == null || email == "") {
            alert("请输入员工邮件");
            return;
        } else if (identificationid == null || identificationid == "") {
            alert("请输入员工身份证号");
            return;
        } else if (entrytime == null || entrytime == "") {
            alert("请输入员工入职时间");
            return;
        } else if (basesalary == null || basesalary == "") {
            alert("请输入员工基本工资");
            return;
        } else {

            console.log($("#addEmployeeForm").serialize());
            $.ajax({
                type: "POST",
                data: $("#addEmployeeForm").serialize(),
                url: "../employInfo/add",
                success: function (data) {
                    alert(data);
                },
                error: function () {
                    alert("添加失败");
                }
            });
        }
    });

    //退出员工添加面板
    $("#exitAdd").click(function () {
        $("#addEmployeeLab").css("display", "none");
        $("#addemployee").removeClass("in active");
        $("#employeeList").addClass("in active");
        $("#employeeListLab").addClass("active");
        initList(1, 10);
    });

    //编辑员工按钮点击事件，查看员工详情
    $("body").on("click", ".editEmployeeInfoBtn", function () {
        $("#employeeList").removeClass("in active");
        $("#employeeListLab").removeClass("active");
        $("#employeeInfoLab").css("display", "block").addClass("active");
        $("#employeeInfo").addClass("in active");


        // 初始化新增员工信息页面 ： 部门信息，职务信息,补贴标准
        var positionSelect = $("#infoBody").find("select[name='positionid']");
        positionSelect.children("option").remove();
        var departmentSelect = $("#infoBody").find("select[name='departmentid']");
        departmentSelect.children("option").remove();
        var insurancestandardSelect = $("#infoBody").find("select[name='insurancestandard']");
        insurancestandardSelect.children("option").remove();
        $.ajax({
            type: 'POST',
            scriptCharset: 'utf-8',
            url: '../position/allPosition',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function (data) {

                var d = eval(data);

                $.each(d, function (i, item) {
                    var option = "<option value=" + item.id + ">" + item.name + "</option>";
                    positionSelect.append(option);
                })
            }
        });
        $.ajax({
            type: 'POST',
            scriptCharset: 'utf-8',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            url: '../department/allDepartment',
            success: function (data) {
                var d = eval(data);

                $.each(d, function (i, item) {
                    var option = "<option value=" + item.id + ">" + item.name + "</option>";
                    departmentSelect.append(option);
                })
            }
        });

        $.ajax({
            type: 'POST',
            scriptCharset: 'utf-8',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            url: '../insurance/getAll',
            success: function (data) {
                var d = eval(data);

                $.each(d, function (i, item) {
                    var option = "<option value=" + item.id + ">" + item.name + "</option>";
                    insurancestandardSelect.append(option);
                })
            }
        });

        var p = $(this).parent().parent();
        var id = p.find(".id").val();

        /*设置表单值*/
        $.ajax({
            type: "POST",
            data: {id: id},
            url: "../employInfo/detail",
            success: function (data) {
                var info = $.parseJSON(data);

                var strBriDate = getStrDate(info.brithday);
                var strentryDate = getStrDate(info.entrytime);
                var strExpDate = getStrDate(info.expiredate);

                $("#infoBody").find("input[name='id']").val(info.id);
                $("#infoBody").find("input[name='name']").val(info.name);
                $("#infoBody").find("input[name='brithday']").val(strBriDate);
                $("#infoBody").find("input[name='telphone']").val(info.telphone);
                $("#infoBody").find("input[name='email']").val(info.email);
                $("#infoBody").find("input[name='identificationid']").val(info.identificationid);
                $("#infoBody").find("input[name='address']").val(info.address);
                $("#infoBody").find("input[name='education']").val(info.education);
                $("#infoBody").find("input[name='school']").val(info.school);
                $("#infoBody").find("input[name='profession']").val(info.profession);
                $("#infoBody").find("input[name='politicalstatus']").val(info.politicalstatus);
                <%--$("#infoBody").find("input[name='entrytime']").val("<fmt:formatDate value="+entryDate+" pattern='yyyy-MM-dd'/>");--%>
                $("#infoBody").find("input[name='entrytime']").val(strentryDate);


                $("#infoBody").find("input[name='expiredate']").val(strExpDate);
                $("#infoBody").find("input[name='basesalary']").val(info.basesalary);
                $("#infoBody").find("input[name='positionsalary']").val(info.positionsalary);
                $("#infoBody").find("input[name='subsidy']").val(info.subsidy);

                //设置radio的值
                $("#infoBody").find("input[type='radio'][value='" + info.sex + "']").attr("checked", true);
                // 设置下拉框的值
                $("#infoBody").find("select[name='departmentid']").find("option[value='" + info.departmentid + "']").attr("selected", true);
                $("#infoBody").find("select[name='positionid']").find("option[value='" + info.positionid + "']").attr("selected", true);
                $("#infoBody").find("select[name='insurancestandard']").find("option[value='" + info.insurancestandard + "']").attr("selected", true);
            },
            error: function () {

            }
        });
    });

    // 提交修改

    $(".updateEmployeeBtn").click(function () {
        $("#infoBody").find("input[name='id']").removeAttr("disabled");
        $.ajax({
            type: "POST",
            data: $("#updateForm").serialize(),
            url: "../employInfo/update",
            success: function (data) {
                alert(data);
                $("#infoBody").find("input[name='id']").attr("disabled", "disabled");
            }
        });
    });

    //退出员工详情面板
    $("#exitInfo").click(function () {
        $("#employeeInfoLab").css("display", "none");
        $("#employeeInfo").removeClass("in active");
        $("#employeeList").addClass("in active");
        $("#employeeListLab").addClass("active");
        initList(1, 10);
    });


    /*格式化日期*/
    function getStrDate(date) {
        var entryDate = new Date(date);
        var year = entryDate.getFullYear();
        var month = entryDate.getMonth();
        var day = entryDate.getDate();
        var strDate = year + "-" + month + "-" + day;
        return strDate;
    }

    /*全选*/

    $(".checkAll").change(function () {
        var checkAll = $(".checkAll").is(':checked');
        console.log(checkAll);
        if (checkAll) {
            $.each($('input[class=aEmpCheck]'), function () {
                $(this).attr("checked", true);
            });
        } else {
            $.each($('input[class=aEmpCheck]'), function () {
                $(this).attr("checked", false);
            });
        }
    });


    /*删除员工*/
    $("#deleteEmployeeBtn").click(function () {

        var f = $(".aEmpCheck").is(':checked');
        if (!f) {
            alert("请选择要删除的员工");
        } else {
            $.each($('input[class=aEmpCheck]:checked'), function () {
                var id = $(this).val();
                $.ajax({
                    type: "POST",
                    data: {id: id},
                    url: "../employInfo/delete",
                    success: function (data) {
                        console.log(data);
                    }
                });
            });
            initList(1, 10);
        }
    });
</script>
</html>
