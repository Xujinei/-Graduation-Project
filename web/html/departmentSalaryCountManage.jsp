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
    <title>部门工资统计报表</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="css/common.css" rel="stylesheet">
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

        function initList() {
            var date = $("#workData").find("option:selected").val();
            var upOrDown = $("#px").find("option:selected").val();

            var body = $("#listBody");
            body.children("tr").remove();
            $.ajax({
                type: "POST",
                data: {date: date, upOrDown: upOrDown},
                url: "../salary/departmentSalary",
                success: function (data) {
                    var body = $("#listBody");
                    var ed = $.parseJSON(data);
                    console.log(ed);
                    $.each(ed, function (i, item) {
                        var department = item.department.name;
                        var date = item.workdata;
                        if (date != null && date != undefined && "" != date) {
                            date = getStrDate(date);
                        }
                        var total = item.total;

                        var tr = "<tr>" +
                            "<td id='" + department + "'>" + department + "</td>" +
                            "<td id='" + date + "'>" + date + "</td>" +
                            "<td id='" + total + "'>" + total + "</td>" +
                            "<td>  <button class='btn btn-primary' id='editDepartmentSalaryCheckBtn'>详情</button> </td>" +
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
        <li id="departmentSalaryLi">
            <a href="#departmentSalaryList" data-toggle="tab">各部门工资统计报表</a>
        </li>
        <li id="departmentInfoSalaryLi">
            <a href="#departmentInfoSalaryList" data-toggle="tab">部门工资明细</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content" style="padding: 2%">
        <div class="tab-pane fade" id="departmentSalaryList">
            <%--条件查询--%>
            <form class="form-inline" style="margin: 2%">
                <div class="form-group">
                    <label for="workData">月份</label>
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
                    <th>部门</th>
                    <th>时间</th>
                    <th>总工资支出</th>
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
        <div class="tab-pane fade" id="departmentSalaryInfoList">
            <button class="btn btn-primary" id="extDepartmentSalaryInfoBtn">退出</button>
            <table class="table infoTable ">
                <thead>
                <tr>

                    <th>姓名</th>
                    <th>月份</th>
                    <th>所在部门</th>
                    <th>基本工资</th>
                    <th>职务工资</th>
                    <th>基本补贴</th>
                    <th>其他补贴</th>
                    <th>税收</th>
                    <th>五险一金</th>
                    <th>总薪资</th>
                    <%--启用编辑后该按钮变为保存，点击保存才会保存修改--%>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
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
</script>
</html>
