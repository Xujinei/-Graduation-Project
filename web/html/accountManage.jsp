<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2017/11/27
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>员工账号管理</title>

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
        .page_div {
            margin: 10px auto;
            text-align: center;
        }
    </style>
    <script src="js/my.js"></script>

    <script>

        /*初始化部门下拉框*/
        $.ajax({
            type: 'POST',
            scriptCharset: 'utf-8',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            url: '../department/allDepartment',
            success: function (data) {
                var departmentSelect = $("#selectDepartment");
                departmentSelect.children("option").remove();
                var option = "<option value=''>所有</option>";
                departmentSelect.append(option);
                var d = eval(data);
                $.each(d, function (i, item) {
                    option = "<option value=" + item.id + ">" + item.name + "</option>";
                    departmentSelect.append(option);
                })
            }
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


        /*公共方法*/
        function commonSuccess(data) {
            $("#accountListBody").children("tr").remove();
            $(".page_num").remove();
            var ed = $.parseJSON(data);
            console.log(ed);
            var Tbody = $("#accountListBody");

            $.each(ed.list, function (i, item) {
                var id = item.id;
                var username = item.username;
                var employeeId = "未分配";
                var department = "暂无";
                if("employeeId" in item){
                    employeeId = item.employeeId.name;
                    if("departmentid" in item.employeeId){
                        department = item.employeeId.departmentid;
                    }
                }
                var lastLoginTime = "未知";
                if("lastLoginTime" in item){
                    lastLoginTime = item.lastLoginTime;
                }

                var status = item.status;
                var promission = item.promission;


                if (id != null && id != undefined && id != "") {

                    if (department != undefined && department != null && "" != department) {
                        if("暂无"!= department) {
                            department = $("#selectDepartment option[value='" + department + "']").text();
                        }
                        console.log("department======" + department);
                    }
                    if (lastLoginTime != undefined && lastLoginTime != null && "未知" != lastLoginTime) {
                        lastLoginTime = getStrDate(lastLoginTime);
                    }
                    if (status == 1) {
                        status = '可用';
                    } else {
                        status = '不可用';
                    }
                    if (promission == 1) {
                        promission = '超级管理员';
                    } else if (promission == 0) {
                        promission = '普通用户';
                    }

                    var tr = "<tr>" +
                        "<td><input type='checkbox' class='aCheckbox' name='" + id + "' value='" + id + "'></td>" +
                        "<td id='username'>" + username + "<input type='hidden' id='id' value='" + id + "'> </td> " +
                        "<td id='employeeId'>" + employeeId + "</td> " +
                        "<td id='department'>" + department + "</td> " +
                        "<td id='lastLoginTime'>" + lastLoginTime + "</td> " +
                        "<td id='status'>" + status + "<input type='hidden' id='statusVal' value='" + status + "'/> </td>" +
                        "<td id='promission'>" + promission + "<input type='hidden' id='promissionVal' value='" + promission + "'/> </td>" +
                        "<td>  <button class='btn btn-primary' id='editAccount'>编辑</button> </td>" +
                        "</tr>";
                    Tbody.append(tr);
                }
            });


        };

        /*初始化账号信息列表*/
        function initList(a, b) {
            $.ajax({
                type: "POST",
                url: "../account/getPage",
                data: {pageIndex: a, pageSize: b},
                success: function (data) {
                    commonSuccess(data);
                    var ed = $.parseJSON(data);
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
        /*初始化账号信息列表结束*/

    </script>


</head>
<body>
<div class="mycontain inerFrame">
    <ul id="myTab" class="nav nav-tabs">
        <li id="accountListLi">
            <a href="#accountList" data-toggle="tab">
                账号列表
            </a>
        </li>
        <li id="editAccountLi">
            <a href="#accountInfo" data-toggle="tab">
                修改账号信息
            </a>
        </li>
        <li id="addAccountLi">
            <a href="#addAccountInfo" data-toggle="tab">
                添加账号信息
            </a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <%--账号列表信息--%>
        <div class="tab-pane fade" id="accountList" style="margin: 2%">
            <%--条件查询账号--%>
            <form class="form-inline" id="searchForm">
                <div class="form-group">
                    <label for="account">账号</label>
                    <input type="text" class="form-control" id="account" placeholder="请输入账号" name="username">
                </div>
                <div class="form-group">
                    <label for="promission">权限</label>
                    <select class="form-control" id="promission" name="promission">
                        <option value="">所有</option>
                        <option value="1">超级管理员</option>
                        <option value="0">普通员工</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="selectDepartment">部门</label>
                    <select class="form-control" id="selectDepartment" name="department">

                    </select>
                </div>
                <div class="form-group">
                    <label for="status">状态</label>
                    <select class="form-control" id="status" name="status">
                        <option value="">所有</option>
                        <option value="1">可用</option>
                        <option value="0">不可用</option>
                    </select>
                </div>
                <button type="button" class="btn btn-primary" id="searchBtn">查询</button>
            </form>
            <%--选择删除--%>
            <form class="form-inline">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" id="selectAll"/> 全选
                    </label>
                </div>
                <button type="button" class="btn btn-danger" id="deleteAccount">删除</button>
                &nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-warning" id="initPassword">初始化密码</button>
                &nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-primary" id="addAccount">添加</button>
            </form>
            <%--账号列表--%>
            <table class="table infoTable personInfoTable">
                <thead>
                <tr>
                    <th>选择</th>
                    <th>用户名</th>
                    <th>员工姓名</th>
                    <th>所在部门</th>
                    <th>最近登陆时间</th>
                    <th>状态</th>
                    <th>权限</th>
                    <th>编辑</th>
                    <%--启用编辑后该按钮变为保存，点击保存才会保存修改--%>
                </tr>
                </thead>
                <tbody id="accountListBody">

                </tbody>
            </table>
            <div class="page_div">
                <span class="list_count"></span>条 &nbsp;&nbsp;
                共<span class="page_count"></span>页&nbsp;&nbsp;

            </div>
        </div>
        <%--账号列表结束--%>
        <%--修改账号信息--%>
        <div class="tab-pane fade" id="accountInfo" style="margin: 2%">
            <form id="editAccountForm">
                <table class="table infoTable">
                    <tbody>
                    <tr>
                        <td>
                            <label>用户名：</label>
                            <input name="username" type="text" disabled="disabled"/>
                            <input type="hidden" name="id"/>
                        </td>
                        <td>
                            <label>员工姓名：</label>
                            <input name="name" type="text" disabled="disabled"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>所在部门：</label>
                            <input name="department" type="text" disabled="disabled"/>
                        </td>
                        <td>
                            <label>权限：</label>
                            <select class="form-control" style="width: 50%;display: inline-block" name="promission">
                                <option value="1">超级管理员</option>
                                <option value="0">普通员工</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>状态：</label>
                            <select class="form-control" style="width: 50%;display: inline-block" name="status">
                                <option value="1">可用</option>
                                <option value="0">不可用</option>
                            </select>
                        </td>
                        <td>
                            <label>最近登陆时间：</label>
                            <input name="lastLoginTime" type="text" disabled="disabled"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <button type="button" class="btn btn-primary btn-sm" id="updateBtn">修改</button>
                        </td>
                        <td align="left">
                            <button type="button" class="btn btn-primary btn-sm" id="exitAccount">退出</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <%--修改账号信息结束--%>

        <%--新增账号信息并关联用户--%>
        <div class="tab-pane fade" id="addAccountInfo" style="margin: 2%">
            <form id="addAccountForm">
                <table class="table infoTable">
                    <tbody>
                    <tr>
                        <td>
                            <label>用户名：</label>
                            <input name="username" type="text"/>
                        </td>
                        <td>
                            <label>员工姓名：</label>
                            <select class="form-control" style="width: 50%;display: inline-block" name="name">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>权限：</label>
                            <select class="form-control" style="width: 50%;display: inline-block" name="promission">
                                <option value="1">超级管理员</option>
                                <option value="0">普通员工</option>
                            </select>
                        </td>
                        <td>
                            <label>状态：</label>
                            <select class="form-control" style="width: 50%;display: inline-block" name="status">
                                <option value="1">可用</option>
                                <option value="0">不可用</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <button type="button" class="btn btn-primary btn-sm" id="addBtn">添加</button>
                        </td>
                        <td align="left">
                            <button type="button" class="btn btn-primary btn-sm" id="exitAddAccount">退出</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <%--修改账号信息结束--%>
    </div>
</div>
</body>

<script>
    //编辑按钮点击事件 : 隐藏账号列表页，显示修改页
    $("body").on("click", "#editAccount", function () {
        $("#editAccountLi").css("display", "block");
        $("#accountListLi").removeClass("active");
        $("#accountList").removeClass("in active");
        $("#accountInfo").addClass("in active");
        $("#editAccountLi").addClass("active");

        var p = $(this).parent().parent();
        var id = p.find("#id").val();
        var username = p.find("#username").text();
        var employeeId = p.find("#employeeId").text();
        var department = p.find('#department').text();
        var lastLoginTime = p.find('#lastLoginTime').text();
        var status = p.find('#statusVal').val();
        var promission = p.find('#promissionVal').val();

        $("#editAccountForm").find("input[name='id']").val(id);
        $("#editAccountForm").find("input[name='username']").val(username);
        $("#editAccountForm").find("input[name='name']").val(employeeId);
        $("#editAccountForm").find("input[name='department']").val(department);
        $("#editAccountForm").find("input[name='lastLoginTime']").val(lastLoginTime);

        $("#editAccountForm").find("select[name='status']").find("option[value='" + status + "']").attr("selected", true);
        $("#editAccountForm").find("select[name='promission']").find("option[value='" + promission + "']").attr("selected", true);
    });

    // 提交修改
    $("#updateBtn").click(function () {
        $("#editAccountForm").find("input[name='username']").removeAttr("disabled");
        $("#editAccountForm").find("input[name='name']").removeAttr("disabled");
        $("#editAccountForm").find("input[name='department']").removeAttr("disabled");
        $("#editAccountForm").find("input[name='lastLoginTime']").removeAttr("disabled");
        console.log($("#editAccountForm").serialize());
        $.ajax({
            type: "POST",
            url: "../account/update",
            data: $("#editAccountForm").serialize(),
            success: function (data) {
                alert(data);
                initList(1, 10);
            },
            error: function () {
                alert("修改失败");
            }
        });
        $("#editAccountForm").find("input[name='username']").attr("disabled", "disabled");
        $("#editAccountForm").find("input[name='name']").attr("disabled", "disabled");
        $("#editAccountForm").find("input[name='department']").attr("disabled", "disabled");
        $("#editAccountForm").find("input[name='lastLoginTime']").attr("disabled", "disabled");
    });


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

    /*初始化账号密码*/
    $("#initPassword").click(function () {
        var f = $(".aCheckbox").is(':checked');
        if (!f) {
            alert("请选择要初始化密码的账号");
            return;
        } else {
            var re = "初始化成功";
            $.each($('input[class=aCheckbox]:checked'), function () {
                var id = $(this).val();
                console.log("id=====" + id);
                $.ajax({
                    type: "POST",
                    data: {id: id},
                    url: "../account/initPassword",
                    success: function (data) {
                        re = data;
                        console.log(data);
                    },
                    error: function () {
                        alert("初始化密码失败");
                    }
                });
            });
            alert(re);
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
                        initList(1, 10);
                    },
                    error: function () {
                        alert("初始化密码失败");
                    }
                });
            });
        }
    });

    /*查询*/
    function selectAccount(a, b) {
        var userName = $("#searchForm").find("input[name='username']").val();
        var promission = $('#promission option:selected').val();
        var department = $('#selectDepartment option:selected').val();
        var status = $('#status option:selected').val();
//        console.log(userName+"=========="+promission+"============="+department+"=============="+status);
        $.ajax({
            type: "POST",
            data: {
                pageIndex: a,
                pageSize: b,
                accountName: userName,
                promission: promission,
                department: department,
                status: status
            },
            url: "../account/getPage",
            success: function (data) {
                commonSuccess(data);
                var ed = $.parseJSON(data);
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
                        "<a href='javascript:selectAccount(" + skip + "," + 10 + ")'>" + i + "</a></span>";
                    page_div.append(aSpan);
                }
            }
        });
    };

    $("#searchBtn").click(function () {
        selectAccount(1, 10);
    });


    /*添加按钮*/
    $("#addAccount").click(function () {
        $("#addAccountLi").css("display", "block");
        $("#accountListLi").removeClass("active");
        $("#accountList").removeClass("in active");
        $("#addAccountInfo").addClass("in active");
        $("#addAccountLi").addClass("active");
        var empSelect = $("#addAccountForm").find("select[name='name']");
        empSelect.children("option").remove();
        /*初始化员工*/
        $.ajax({
            type: "POST",
            url: "../account/selectNoAccountEmp",
            success: function (data) {
                var d = eval(data);
                $.each(d, function (i, item) {
                    option = "<option value=" + item.id + ">" + item.name + "</option>";
                    empSelect.append(option);
                })
            }
        });
    });

    /*提交添加*/
    $("#addBtn").click(function () {
        var userName = $("#addAccountForm").find("input[name='username']").val();
        var name = $("#addAccountForm select").find('option:selected').val();
        var promission = $("#addAccountForm").find("input[name='promission']").val();
        var status = $("#addAccountForm").find("input[name='status']").val();

        if (userName == null || "" == userName) {
            alert("请输入用户名");
            return;
        }
        $.ajax({
            type: "POST",
            data: {
                accountName: userName,
                promission: promission,
                status: status,
                empId: name
            },
            url: "../account/add",
            success: function (data) {
                alert(data);
            },
            error: function () {
                alert("添加失败");
            }
        });

    });

    //退出添加按钮点击事件
    $("#exitAddAccount").click(function () {
        $("#addAccountLi").css("display", "none");
        $("#accountListLi").addClass("active");
        $("#accountList").addClass("in active");
        $("#addAccountInfo").removeClass("in active");
        initList(1, 10);
    });
</script>
</html>
