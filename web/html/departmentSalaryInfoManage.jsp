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
    <script src="js/my.js"></script>

    <script>

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
                    <label for="workData">月份</label>
                    <select class="form-control" id="workData" name="workData">
                        <option>1</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="department">部门</label>
                    <select class="form-control" id="department" name="department">
                        <option>1</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">查询</button>
            </form>

            <%--各部门工资明细报表列表--%>
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
        <%--各部门薪酬报表列表结束--%>

    </div>
</div>
</body>
</html>
