<%@ page import="com.swm.entity.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Account user = (Account) request.getSession().getAttribute("account");
    String pw = user.getPassword();
%>
<html>
<head>
    <title>个人管理</title>

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
        .page_div {
            margin: 10px auto;
            text-align: center;
        }
    </style>
    <script src="js/my.js"></script>

    <script>
        $(function () {
            $(".personInfoTable tbody tr td input").attr("disabled", "disabled").css("background-color", "white");

        });

        /*格式化日期*/
        function getStrDate(date) {
            var entryDate = new Date(date);
            var year = entryDate.getFullYear();
            var month = entryDate.getMonth() + 1;
            var day = entryDate.getDate();
            var strDate = year + "-" + month + "-" + day;
            return strDate;
        }

        /*格式化日期没有日期*/
        function getStrDateNoDay(date) {
            var entryDate = new Date(date);
            var year = entryDate.getFullYear();
            var month = entryDate.getMonth() + 1;
            var strDate = year + "年" + month + "月";
            return strDate;
        }


        function init() {
            console.log("init");
            $.ajax({
                type: "POST",
                url: "../user/userInfo",
                success: function (data) {
                    var ed = $.parseJSON(data);

                    var infoTable = $(".personInfoTable");

                    var id = ed.id;
                    var name = ed.name;
                    var brithday = ed.brithday;
                    if (brithday != "" && null != brithday) {
                        brithday = getStrDate(brithday);
                    }
                    var email = ed.email;
                    var telphone = ed.telphone;
                    var address = ed.address;
                    var identificationid = ed.identificationid;
                    var education = ed.education;
                    var school = ed.school;
                    var profession = ed.profession;
                    var politicalstatus = ed.politicalstatus;
                    var entrytime = ed.entrytime;
                    if (entrytime != "" && null != entrytime) {
                        entrytime = getStrDate(entrytime);
                    }
                    var expiredate = ed.expiredate;
                    if (expiredate != "" && null != expiredate) {
                        expiredate = getStrDate(expiredate);
                    }
                    var department = ed.department.name;
                    var departmentid = ed.department.id;
                    var position = ed.position.name;
                    var positionid = ed.position.id;
                    var basesalary = ed.basesalary;
                    var positionsalary = ed.positionsalary;
                    var subsidy = ed.subsidy;
                    var sex = ed.sex;


                    infoTable.find("input[name='name']").val(name);
                    infoTable.find("input[name='id']").val(id);
                    infoTable.find("input[name='brithday']").val(brithday);
                    infoTable.find("input[name='email']").val(email);
                    infoTable.find("input[name='telphone']").val(telphone);
                    infoTable.find("input[name='address']").val(address);
                    infoTable.find("input[name='identificationid']").val(identificationid);
                    infoTable.find("input[name='education']").val(education);
                    infoTable.find("input[name='school']").val(school);
                    infoTable.find("input[name='profession']").val(profession);
                    infoTable.find("input[name='politicalstatus']").val(politicalstatus);
                    infoTable.find("input[name='entrytime']").val(entrytime);
                    infoTable.find("input[name='expiredate']").val(expiredate);
                    infoTable.find("input[name='department']").val(department);
                    infoTable.find("input[name='departmentid']").val(departmentid);
                    infoTable.find("input[name='position']").val(position);
                    infoTable.find("input[name='positionid']").val(positionid);
                    infoTable.find("input[name='basesalary']").val(basesalary);
                    infoTable.find("input[name='positionsalary']").val(positionsalary);
                    infoTable.find("input[name='subsidy']").val(subsidy);
                    infoTable.find("input[type='radio'][value='" + sex + "']").attr("checked", true);

                }
            });
        }

        init();

        /*初始化个人工资列表*/
        function initSelfSalary(a, b) {
            $.ajax({
                type: "POST",
                data: {pageIndex: a, pageSize: b},
                url: "../user/selfSalary",
                success: function (data) {
                    var ed = $.parseJSON(data);
                    var salaryInfo = $("#salaryInfo");

                    if (ed.list.length <= 0) {
                        $(".salaryCount").show();
                    }
                    $.each(ed.list, function (i, item) {
                        var time = item.workdata;
                        if (time != "" && time != null) {
                            time = getStrDateNoDay(time);
                        }
                        var tr = "<tr>" +
                            "<td>" + time + "</td>" +
                            "<td>" + item.basesalary + "</td>" +
                            "<td>" + item.positionsalary + "</td>" +
                            "<td>" + item.basesubsidy + "</td>" +
                            "<td>" + item.insurance + "</td>" +
                            "<td>" + item.tax + "</td>" +
                            "<td>" + item.total + "</td>" +
                            "</tr>";
                        salaryInfo.append(tr);

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

        initSelfSalary(1, 10);

    </script>


</head>
<body>
<div class="mycontain inerFrame">
    <ul id="myTab" class="nav nav-tabs">
        <li id="personalInfoLi">
            <a href="#personalInfo" data-toggle="tab" id="test">
                个人信息
            </a>
        </li>
        <li id="modifyPWLi"><a href="#personalAccount" data-toggle="tab">修改密码</a></li>
        <li id="salaryListLi"><a href="#salaryReport" data-toggle="tab">工资报表</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <%--个人信息--%>
        <div class="tab-pane fade" id="personalInfo" style="margin: 2%">
            <form id="infoForm">
                <table class="table infoTable personInfoTable">
                    <tbody>
                    <tr>
                        <td>
                            <label>姓名：</label>
                            <input name="name" type="text"/>
                            <input name="id" type="hidden"/>
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
                            <input name="brithday" type="text"/>
                        </td>
                        <td>
                            <label>联系电话：</label>
                            <input type="tel" name="telphone"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>邮箱：</label>
                            <input name="email" type="email"/>
                        </td>
                        <td>
                            <label>地址：</label>
                            <input type="text" name="address"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>身份证号：</label>
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
                            <label>入职时间：</label>
                            <input type="text" name="entrytime"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>合同到期时间：</label>
                            <input name="expiredate" type="text"/>
                        </td>
                        <td>
                            <label>所属部门：</label>
                            <input type="text" name="department"/>
                            <input type="hidden" name="departmentid"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>职务：</label>
                            <input type="text" name="position"/>
                            <input type="hidden" name="positionid"/>
                        </td>
                        <td>
                            <label>基本工资：</label>
                            <input name="basesalary" type="number" step="0.1"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>职务工资：</label>
                            <input type="number" name="positionsalary" step="0.1"/>
                        </td>
                        <td>
                            <label>基本补贴：</label>
                            <input name="subsidy" type="number" step="0.1"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" class="btn btn-primary btn-sm pull-right" id="editPersonalInfo">修改
                            </button>
                        </td>
                        <td>

                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <%--个人信息结束--%>
        <%--个人账号：修改密码--%>
        <div class="tab-pane fade" id="personalAccount" style="margin:4%;" align="center">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="oldPassword" class="control-label">原密码：</label>
                    <input type="password" name="password" id="oldPassword"/>
                </div>
                <div class="form-group">
                    <span class="redSpan" id="oldpwSpan" style="display:none;">原始密码不正确，请重新输入</span>
                </div>
                <div class="form-group">
                    <label for="password" class="control-label">新密码：</label>
                    <input type="password" name="password" id="password"/>
                </div>
                <div class="form-group">
                    <label for="ensurePassword" class="control-label">确认密码：</label>
                    <input type="password" name="password" id="ensurePassword"/>
                </div>
                <div class="form-group">
                    <span class="redSpan" id="ensureSpan" style="display:none;">密码不一致，请确认密码</span>
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-primary" id="updatePw">修改</button>
                </div>
            </form>
        </div>
        <%--个人账号结束--%>
        <%--工资报表--%>
        <div class="tab-pane fade" id="salaryReport">
            <div class="salaryCount" style="display: none">
                <p>暂无工资记录</p>
            </div>
            <table class="table infoTable">
                <thead>
                <tr>
                    <th>时间</th>
                    <th>基本工资</th>
                    <th>职务工资</th>
                    <th>基本补贴</th>
                    <th>加班工资</th>
                    <th>税收</th>
                    <th>应发总工资</th>
                </tr>
                </thead>
                <tbody id="salaryInfo">

                </tbody>

            </table>
            <div class="page_div">
                <span class="list_count"></span>条 &nbsp;&nbsp;
                共<span class="page_count"></span>页&nbsp;&nbsp;

            </div>
        </div>
        <%--工资报表结束--%>
    </div>
</div>
</body>
<script>
    // 个人信息修改页面修改按钮点击事件
    $("#editPersonalInfo").click(function () {

        var btHtml = $("#editPersonalInfo").html();
        alert(btHtml);
        if (btHtml == "修改") {
            alert(1);
            var infoTable = $(".personInfoTable");
            infoTable.find("input[name='telphone']").attr("disabled", false).css("background-color", "gray");
            infoTable.find("input[name='email']").attr("disabled", false).css("background-color", "gray");
            infoTable.find("input[name='address']").attr("disabled", false).css("background-color", "gray");
            $("#editPersonalInfo").html("保存");
        } else if ("保存" == btHtml) {
            $("#editPersonalInfo").html("修改");
            // 保存操作

            $(".personInfoTable").find("tbody tr td input").attr("disabled", false).css("background-color", "gray");
            var form = $("#infoForm").serialize();
            $.ajax({
                type: "POST",
                url: "../employInfo/update",
                data: form,
                success: function (date) {
                    alert(date)
                    $(".personInfoTable").find("tbody tr td input").attr("disabled", "disabled").css("background-color", "white");
                },
                error: function (date) {
                    alert("修改失败")
                }
            });
            console.log(form)
            $(".personInfoTable tbody tr td input").attr("disabled", "disabled").css("background-color", "white");

        }
    });

    var re = false;

    /*修改密码 :验证原始密码、新密码是否一致*/
    function checkOldPw() {
        var oldPs = $("#oldPassword").val();

        $.ajax({
            type: "POST",
            data: {password: oldPs},
            url: "../user/comparePw",
            success: function (data) {
                console.log(data);
                if (data == 0) {
                    $("#oldpwSpan").show();
                    re = false;
                    console.log("00000" + re);
                } else {
                    $("#oldpwSpan").hide();
                    re = true;
                    console.log("1111" + re);

                }
            }
        });
        return re;
    }

    $("#oldPassword").change(function () {
        checkOldPw();
    });

    /*确认新密码*/
    function checkNewPw() {
        var password = $("#password").val();
        var ensurePassword = $("#ensurePassword").val();

        if (password != ensurePassword) {
            $("#ensureSpan").show();
            return false;
        } else {
            $("#ensureSpan").hide();
            return true;
        }
    }

    $("#ensurePassword").change(function () {
        checkNewPw();
    });

    /*提交修改*/
    $("#updatePw").click(function () {
        var password = $("#password").val();
        if (password != "" && password != null) {
            var oldFlag = checkOldPw();
            var checkFalg = checkNewPw();
            console.log(re + "------" + checkFalg);
            if (oldFlag && checkFalg) {
                $.ajax({
                    type: "POST",
                    data: {password: password},
                    url: "../user/updatePw",
                    success: function (data) {
                        alert(data);
                    },
                    error: function () {
                        alert("修改失败");
                    }
                });
            }
        }

    });

</script>
</html>
