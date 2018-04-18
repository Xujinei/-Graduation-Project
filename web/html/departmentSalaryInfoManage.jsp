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
    <title>部门工资明细报表</title>

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
        };

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
        })

        function commonSuccess(data) {
            $("#salaryBody").children("tr").remove();
            $(".page_num").remove();
            var ed = $.parseJSON(data);
            console.log(ed);
            var salTbody = $("#salaryBody");

            $.each(ed.list, function (i, item) {
                if(!("department" in item)){
                    return ;
                }

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

        /*初始化薪酬列表*/
        function initList(a, b) {

            var upOrDown = $("#px").find("option:selected").val();
            var departmentId = $("#selectDepartment").find("option:selected").val();
            var date = $("#workData").find("option:selected").val();
            if (date != null && "" != date && date != undefined) {
                date = date + "-01";
            }
            console.log(departmentId + "---" + date + "-----" + upOrDown);
            $.ajax({
                type: "POST",
                url: "../salary/getPage",
                data: {
                    pageIndex: a,
                    pageSize: b,
                    time: date,
                    upOrDown: upOrDown,
                    departmentId: departmentId
                },
                success: function (data) {
                    commonSuccess(data);
                    var ed = $.parseJSON(data);
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
                            "<a href='javascript:initList(" + skip + ")'>" + i + "</a></span>";
                        page_div.append(aSpan);
                    }
                }
            });
        };

        initList(0, 10);
    </script>
</head>
<body>
<div class="mycontain inerFrame">
    <ul id="myTab" class="nav nav-tabs">
        <li id="departmentSalaryInfoLi" class="active">
            <a href="#departmentSalaryInfoList" data-toggle="tab">部门工资明细报表</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content" style="padding: 2%">
        <div class="tab-pane fade active in" id="departmentSalaryInfoList">
            <%--条件查询--%>
            <form class="form-inline" style="margin: 2%">
                <div class="form-group">
                    <label for="workData">时间</label>
                    <select class="form-control" id="workData" name="workData">
                    </select>
                </div>
                <div class="form-group">
                    <label for="selectDepartment">部门</label>
                    <select class="form-control" id="selectDepartment" name="department">
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
                <button type="button" class="btn btn-primary" id="readOut">导出统计报表</button>
                <span>如需导出统计报表请先选择时间和部门信息</span>
            </form>

            <%--各部门工资明细报表列表--%>
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
        <%--各部门薪酬报表列表结束--%>

    </div>
</div>
</body>
<script>
    /*差寻*/
    $("#searchBtn").click(function () {

        initList(0, 10);
    });
    /*生成时间*/
    var last_year_month = function () {
        var d = new Date();
        var result = [];
        for (var i = 0; i < 24; i++) {
            d.setMonth(d.getMonth());
            var m = d.getMonth() + 1;
            m = m < 10 ? "0" + m : m;
            //在这里可以自定义输出的日期格式
            result.push(d.getFullYear() + "-" + m);
            //result.push(d.getFullYear() + "年" + m + '月');
        }
        return result;
    };

    for (var allinfo = last_year_month(), i = 0; i < allinfo.length; i++) {
        $("#workData").append("<option value='" + allinfo[i] + "'>" + allinfo[i] + "</option>");
    }

    /*导出报表*/
    $("#readOut").click(function () {
        var upOrDown = $("#px").find("option:selected").val();
        var departmentId = $("#selectDepartment").find("option:selected").val();
        var date = $("#workData").find("option:selected").val();
        if (departmentId == null && "" == departmentId) {
            alert("请先选择统计时间");
            return;
        }
        if (date == null && "" == date) {
            alert("请先选择统计时间");
            return;
        }
        if (date != null && "" != date && date != undefined) {
            date = date + "-01";
        }

        console.log(departmentId + "---" + date + "-----" + upOrDown);

        $.ajax({
            type: "POST",
            url: "../salary/export",
            data: {
                time: date,
                upOrDown: upOrDown,
                departmentId: departmentId
            },
            success: function (data) {
                if (data != null && "" != data) {
                    alert(data);
                }
            }
        });
    });


</script>
</html>
