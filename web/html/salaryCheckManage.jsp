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
    <script src="js/my.js"></script>

    <script>

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
            <div class="tipInfo"> 在审核前请先导入当月员工工时与员工补贴</div>
            <form class="form-inline" id="uploadForm" enctype="multipart/form-data" style="margin-left: 2%">
                <div class="form-group">
                    <label for="workTime">上传工时</label>
                    <input type="file" id="workTime" name="workTime"/>
                </div>
                <div class="form-group">
                    <label for="subsidy">上传补贴</label>
                    <input type="file" id="subsidy" name="subside"/>
                </div>
                <button type="button" class="btn btn-primary" id="uploadFile">上传</button>
            </form>
            <%--条件查询--%>
            <form class="form-inline" style="margin-left: 2%">
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

            <%--待审核列表列表--%>
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
                    <th>应发总工资</th>
                    <th>编辑</th>
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
                    <td>
                        <button class="btn btn-primary" id="editSalaryCheckBtn">编辑</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <%--带审核薪酬福利列表结束--%>
        <%--薪酬福利详细信息--%>
        <div class="tab-pane fade" id="salaryInfo" style="margin: 2%">
            <table class="table infoTable">
                <tbody>
                <tr>
                    <td>
                        <label>姓名：</label>
                        <input value="name" name="name" type="text"/>
                    </td>
                    <td>
                        <label>时间：</label>
                        <input value="workData" name="workData" type="text"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>工时：</label>
                        <input value="56" name="workTime" type="text"/>
                    </td>
                    <td>
                        <label>六险一金：</label>
                        <input value="565" name="insurance" type="text"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>所在部门：</label>
                        <input value="部门" name="department" type="text"/>
                    </td>
                    <td>
                        <label>基本工资：</label>
                        <input type="text" name="baseSalary" value="565"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>职务工资：</label>
                        <input value="199" name="positionSalary" type="text"/>
                    </td>
                    <td>
                        <label>基本补贴：</label>
                        <input type="text" name="baseSubsidy" value="56"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>其他补贴：</label>
                        <input value="40" name="otherSubsidy" type="text"/>
                    </td>
                    <td>
                        <label>税收：</label>
                        <input type="text" name="tax" value="45"/>
                    </td>
                </tr>
                <tr align="center">
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
                </tr>
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
        </div>
        <%--薪酬福利详细信息结束--%>

    </div>
</div>
</body>
<script>
    $("#uploadFile").click(function () {
        var workTime = $("#workTime").val();
        var subsidy = $("#subsidy").val();
        if ((workTime == "" || workTime.length == 0) && (subsidy == "" || subsidy.length == 0)) {
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
                    console.log(data);
                }
            });
        }
    });
</script>
</html>
