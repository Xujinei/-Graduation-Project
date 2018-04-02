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
    <title>职务工资统计报表</title>

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
            var month = entryDate.getMonth() + 1;
            var day = entryDate.getDate();
            var strDate = year + "-" + month;
            return strDate;
        }

        function initList() {
            var date = $("#workData").find("option:selected").val();
            if (date != null && "" != date && date != undefined) {
                date = date + "-01";
            }
            var upOrDown = $("#px").find("option:selected").val();

            console.log("upOrDown" + upOrDown);
            var body = $("#listBody");
            body.children("tr").remove();
            $.ajax({
                type: "POST",
                data: {date: date, upOrDown: upOrDown},
                url: "../salary/positionSalary",
                success: function (data) {
                    var body = $("#listBody");
                    var ed = $.parseJSON(data);
                    console.log(ed);
                    $.each(ed, function (i, item) {
                        var department = item.position.name;
                        var deId = item.position.id;
                        var ratio = item.status;
                        var date = item.workdata;
                        if (date != null && date != undefined && "" != date) {
                            date = getStrDate(date);
                        }
                        var total = item.total;

                        var tr = "<tr>" +
                            "<td id='department'>" + department + "<input type='hidden' class='dId' value='" + deId + "'/></td>" +
                            "<td id='date'>" + date + "</td>" +
                            "<td id='total'>" + total + "</td>" +
                            "<td id='ratio'>" + ratio + "%</td>" +
                            "<td>  <button class='btn btn-primary' id='editPositionSalaryCheckBtn'>详情</button> </td>" +
                            "</tr>";
                        body.append(tr);
                    });
                }
            });
        };

        initList();


    </script>
</head>
<body>
<div class="mycontain inerFrame">
    <ul id="myTab" class="nav nav-tabs">
        <li id="positionSalaryLi">
            <a href="#positionSalaryList" data-toggle="tab">各职务工资统计报表</a>
        </li>
        <li id="positionInfoSalaryLi">
            <a href="#positionInfoSalaryList" data-toggle="tab">职务工资明细</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content" style="padding: 2%">
        <div class="tab-pane fade" id="positionSalaryList">
            <%--条件查询--%>
            <form class="form-inline" style="margin: 2%">
                <div class="form-group">
                    <label for="workData">时间</label>
                    <select class="form-control" id="workData" name="workData">

                    </select>
                </div>
                <div class="form-group">
                    <label for="px">排序方式</label>
                    <select class="form-control" id="px" name="department">
                        <option value="0">升序</option>
                        <option value="1">降序</option>
                    </select>
                </div>
                <button type="button" class="btn btn-primary" id="searchBtn">查询</button>
            </form>

            <%--各部门工资统计报表列表--%>
            <table class="table infoTable ">
                <thead>
                <tr>
                    <th>职务</th>
                    <th>月份</th>
                    <th>总工资支出</th>
                    <th>所占比例</th>
                    <th>详情</th>
                    <%--启用编辑后该按钮变为保存，点击保存才会保存修改--%>
                </tr>
                </thead>
                <tbody id="listBody">

                </tbody>
            </table>
        </div>
        <%--各部门薪酬报表列表结束--%>
        <%--部门内个人薪酬明细--%>
        <div class="tab-pane fade" id="positionSalaryInfoList">
            <button class="btn btn-primary" id="extPositionSalaryInfoBtn">退出</button>
            <table class="table infoTable ">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>时间</th>
                    <th>工时</th>
                    <th>所在部门</th>
                    <th>基本工资</th>
                    <th>职务工资</th>
                    <th>基本补贴</th>
                    <th>加班工资</th>
                    <th>税收</th>
                    <th>应发总工资</th>
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
        <%--部门内个人薪酬明细结束--%>
    </div>
</div>
</body>
<script>
    // 查询
    $("#searchBtn").click(function () {
        initList();
    });
    /*生成时间*/
    var last_year_month = function () {
        var d = new Date();
        var result = [];
        for (var i = 0; i < 24; i++) {
            d.setMonth(d.getMonth() - 1);
            var m = d.getMonth() + 1;
            m = m < 10 ? "0" + m : m;
            //在这里可以自定义输出的日期格式
            result.push(d.getFullYear() + "-" + m);
            //result.push(d.getFullYear() + "年" + m + '月');
        }
        return result;
    }

    for (var allinfo = last_year_month(), i = 0; i < allinfo.length; i++) {
        $("#workData").append("<option value='" + allinfo[i] + "'>" + allinfo[i] + "</option>");
    }


    /*初始化详情列表*/
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
                    "</tr>";

                salTbody.append(tr);
            }
        });
    };

    function detailList(a, b, positionId, date) {

        $.ajax({
            type: "POST",
            url: "../salary/getPage",
            data: {
                pageIndex: a,
                pageSize: b,
                time: date,
                upOrDown: null,
                positon: positionId
            },
            success: function (data) {
                console.log(data);
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
                        "<a href='javascript:detailList(" + skip + "," + 10 + "," +
                        positionId + "," + date +
                        ")'>" + i + "</a></span>";
                    page_div.append(aSpan);
                }
            }
        });
    }


    /*详情*/
    $("body").on("click", "#editPositionSalaryCheckBtn", function () {
        $("#positionInfoSalaryLi").css("display", "block").addClass("active");
        $("#positionSalaryInfoList").addClass("active in");
        $("#positionSalaryLi").removeClass("active");
        $("#positionSalaryList").removeClass("active in");
        var p = $(this).parent().parent();
        var positionId = p.find(".dId").val();
        var date = p.find("#date").text();

        if (date != null && "" != date && date != undefined) {
            date = date + "-01";
        }

        detailList(1, 10, positionId, date);

    });

</script>
</html>
