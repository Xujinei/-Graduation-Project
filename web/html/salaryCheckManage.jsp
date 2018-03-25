<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2017/11/27
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>薪酬福利审核</title>

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

        /*格式化日期*/
        function getStrDate(date) {
            var entryDate = new Date(date);
            var year = entryDate.getFullYear();
            var month = entryDate.getMonth();
            var day = entryDate.getDate();
            var strDate = year + "-" + month;
            return strDate;
        }

        function commonSuccess(data) {
            $("#salaryBody").children("tr").remove();
            $(".page_num").remove();
            var ed = $.parseJSON(data);
            console.log(ed);
            var salTbody = $("#salaryBody");

            $.each(ed.list, function (i, item) {
                var workdata = item.workdata;
                var workHours = item.workHours;
                var name = item.employeeEntity.name;
                var empId = item.employeeEntity.id;
                var department = item.department.name;
                var basesalary = item.basesalary;
                var positionsalary = item.positionsalary;
                var basesubsidy = item.basesubsidy;
                var tax = item.tax;
                var insurance = item.insurance; // 加班工资
                var total = item.total;

                if (workdata != null && workdata != undefined && workdata != "") {
                    workdata = getStrDate(workdata); // 格式化时间
                    if (name == undefined || name == null) {
                        name = "";
                    }
                    if (workHours == undefined || workHours == null) {
                        workHours = 0;
                    }
                    if (department == undefined || department == null) {
                        department = "";
                    }
                    if (basesalary == undefined || basesalary == null) {
                        basesalary = 0;
                    }
                    if (positionsalary == undefined || positionsalary == "") {
                        positionsalary = 0;
                    }
                    if (basesubsidy == undefined || basesubsidy == null) {
                        basesubsidy = 0;
                    }
                    if (tax == undefined || tax == null) {
                        tax = 0;
                    }
                    if (insurance == undefined || insurance == null) {
                        insurance = 0;
                    }
                    if (total == undefined || total == null) {
                        total = 0;
                    }
                    var tr = "<tr>" +
                        "<td id='name'>" + name + "<input type='hidden' id='empId' value='" + empId + "'> </td> " +
                        "<td id='workdata'>" + workdata + "</td> " +
                        "<td id='workHours'>" + workHours + "</td> " +
                        "<td id='department'>" + department + "</td> " +
                        "<td id='basesalary'>" + basesalary + "</td> " +
                        "<td id='positionsalary'>" + positionsalary + "</td>" +
                        "<td id='basesubsidy'>" + basesubsidy + "</td>" +
                        "<td id='insurance'>" + insurance + "</td>" +
                        "<td id='tax'>" + tax + "</td>" +
                        "<td id='total'>" + total + "</td>" +
                        "<td> <button class='btn btn-primary' id='editSalaryCheckBtn'>编辑</button> </td>" +
                        "</tr>";

                    salTbody.append(tr);
                }
            });


        };

        /*初始化部门薪酬列表*/
        function initList(a, b) {

            $.ajax({
                type: "POST",
                url: "../salary/getPage",
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
        /*初始化部门列表结束*/
    </script>
</head>
<body>
<div class="mycontain inerFrame">
    <ul id="myTab" class="nav nav-tabs">
        <li id="salaryCheckLi">
            <a href="#salaryCheckList" data-toggle="tab">薪酬福利审核</a>
        </li>
        <li id="salaryInfoLi">
            <a href="#salaryInfo" data-toggle="tab">
                员工薪酬福利详细信息
            </a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">

        <div class="tab-pane fade" id="salaryCheckList">
            <%--带审核薪酬福利列表--%>
            <div class="tipInfo"> 在审核前请先导入当月员工工时</div>
            <form class="form-inline" id="uploadForm" enctype="multipart/form-data" style="margin-left: 2%">
                <div class="form-group">
                    <label for="workTime">上传工时</label>
                    <input type="file" id="workTime" name="workTime"/>
                </div>
                <%--   <div class="form-group">
                       <label for="subsidy">上传补贴</label>
                       <input type="file" id="subsidy" name="subside"/>
                   </div>--%>
                <button type="button" class="btn btn-primary" id="uploadFile">导入并结算</button>
                <span class="tipInfo"></span>
            </form>
            <%--条件查询--%>
            <form class="form-inline InitCommon" id="selectForm" style="margin-left: 2%">
                <div class="form-group">
                    <label for="workData">时间</label>
                    <input class="form-control" type="month" id="workData" name="workData" placeholder="如：2018-01-01">
                    <%--  <select class="form-control" id="workData" name="workData">
                          <option>1</option>
                      </select>--%>
                </div>
                <div class="form-group">
                    <label for="department">部门</label>
                    <select class="form-control" id="department" name="departmentid">
                    </select>
                </div>
                <button type="button" class="btn btn-primary" id="selectByKey">查询</button>
            </form>

            <%--待审核列表列表--%>
            <table class="table infoTable ">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>月份</th>
                    <th>工时</th>
                    <th>所在部门</th>
                    <th>基本工资</th>
                    <th>职务工资</th>
                    <th>基本补贴</th>
                    <th>加班工资</th>
                    <th>税收</th>
                    <th>应发总工资</th>
                    <th>编辑</th>
                    <%--启用编辑后该按钮变为保存，点击保存才会保存修改--%>
                </tr>
                </thead>
                <tbody id="salaryBody">

                </tbody>
            </table>
            <div class="page_div">
                <span class="list_count"></span>条 &nbsp;&nbsp;
                共<span class="page_count"></span>页&nbsp;&nbsp;

            </div>
        </div>
        <%--带审核薪酬福利列表结束--%>
        <%--薪酬福利详细信息--%>
        <div class="tab-pane fade" id="salaryInfo" style="margin: 2%">
            <form id="editSalaryForm">
                <table class="table infoTable">
                <tbody>
                <tr>
                    <td>
                        <label>姓名：</label>
                        <input name="name" type="text" readonly="readonly"/>
                        <input type="hidden" name="employeeId"/>
                    </td>
                    <td>
                        <label>时间：</label>
                        <input name="workdata" type="text" readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>所在部门：</label>
                        <input name="department" type="text" readonly="readonly"/>
                    </td>
                    <td>
                        <label>工时：</label>
                        <input name="workHours" type="number" step="0.1" readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>职务工资：</label>
                        <input name="positionsalary" type="number" step="0.1"/>
                    </td>
                    <td>
                        <label>基本工资：</label>
                        <input name="basesalary" type="number" step="0.1"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>基本补贴：</label>
                        <input type="number" name="basesubsidy" step="0.1"/>
                    </td>
                    <td>
                        <label>加班工资：</label>
                        <input name="insurance" type="number" step="0.1"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>税收：</label>
                        <input type="number" name="tax" step="0.1"/>
                    </td>
                    <td>
                        <label>应发总工资：</label>
                        <input type="number" name="total" step="0.1"/>
                    </td>
                </tr>
                <%--  <tr align="center">
                      <td colspan="2">
                          补贴详情
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <label>补贴类型：</label>
                          <input value="类型" name="subsidyType" type="text"/>
                      </td>
                      <td>
                          <label>补贴额度：</label>
                          <input type="text" name="subsidyNum" value="45"/>
                      </td>
                  </tr>--%>
                <tr>
                    <td align="center">
                        <button type="button" class="btn btn-primary btn-sm">修改</button>
                    </td>
                    <td align="left">
                        <button type="button" class="btn btn-primary btn-sm" id="exitSalaryInfo">退出</button>
                    </td>
                </tr>
                </tbody>
            </table>
            </form>
        </div>
        <%--薪酬福利详细信息结束--%>

    </div>
</div>
</body>
<script>
    /*上传文件*/
    $("#uploadFile").click(function () {
        var workTime = $("#workTime").val();
//        var subsidy = $("#subsidy").val();
        if ((workTime == "" || workTime.length == 0)) {
            alert("请选择上传的文件");
            return;
        } else {
            var form = new FormData($("#uploadForm")[0]);
            $.ajax({
                type: "post",
                url: "../upload/upload",
                data: form,
                processData: false,
                contentType: false,
                success: function (data) {
                    $(".tipInfo").text(data);
                    initList(1, 10);
                    console.log(data);
                }
            });
        }
    });

    /*查看详情*/
    $("body").on("click", "#editSalaryCheckBtn", function () {
        $("#salaryInfoLi").css("display", "block").addClass("active");
        $("#salaryInfo").addClass("active in");
        $("#salaryCheckLi").removeClass("active");
        $("#salaryCheckList").removeClass("active in");


        var p = $(this).parent().parent();
        var workdata = p.find("#workdata").text();
        var workHours = p.find("#workHours").text();
        var name = p.find("#name").text();
        var empId = p.find("#empId").val();
        var department = p.find("#department").text();
        var basesalary = p.find('#basesalary').text();
        var positionsalary = p.find('#positionsalary').text();
        var basesubsidy = p.find('#basesubsidy').text();
        var insurance = p.find('#insurance').text();
        var tax = p.find('#tax').text();
        var total = p.find('#total').text();

        $("#editSalaryForm").find("input[name='employeeId']").val(empId);
        $("#editSalaryForm").find("input[name='name']").val(name);
        $("#editSalaryForm").find("input[name='workdata']").val(workdata);
        $("#editSalaryForm").find("input[name='workHours']").val(workHours);
        $("#editSalaryForm").find("input[name='department']").val(department);
        $("#editSalaryForm").find("input[name='positionsalary']").val(positionsalary);
        $("#editSalaryForm").find("input[name='basesalary']").val(basesalary);
        $("#editSalaryForm").find("input[name='insurance']").val(insurance);
        $("#editSalaryForm").find("input[name='basesubsidy']").val(basesubsidy);
        $("#editSalaryForm").find("input[name='tax']").val(tax);
        $("#editSalaryForm").find("input[name='total']").val(total);
    });


    function searchSalary(a, b, time, departmentId) {
        $.ajax({
            type: "POST",
            url: "../salary/getPage",
            data: {pageIndex: a, pageSize: b, departmentId: departmentId, time: time},
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
                        "<a href='javascript:searchSalary(" + skip + "," + 10 + "," + departmentId + "," + time + ")'>" + i + "</a></span>";
                    page_div.append(aSpan);
                }
            }
        });
    }

    /*查询*/
    $("#selectByKey").click(function () {
        var time = $("#selectForm").find("input[name='workData']").val();
        console.log("time========" + time);
        var department = $("#selectForm").find("#department option:selected").val();
        console.log("department=====" + department);
        searchSalary(1, 10, time, department);
    });
</script>
</html>
