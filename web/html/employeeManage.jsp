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
    <script src="js/my.js"></script>

    <script>

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
            <form class="form-inline">
                <div class="form-group">
                    <label for="name">姓名</label>
                    <input type="text" class="form-control" id="name" placeholder="请输入员工姓名" name="name">
                </div>
                <div class="form-group">
                    <label for="position">职务</label>
                    <select class="form-control" id="position" name="position">
                        <option>1</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="department">部门</label>
                    <select class="form-control" id="department" name="department">
                        <option>1</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="employeeStatus">状态</label>
                    <select class="form-control" id="employeeStatus" name="employeeStatus">
                        <option>1</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">查询</button>
            </form>
            <%--选择删除--%>
            <form class="form-inline">
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> 全选
                    </label>
                </div>
                <button type="submit" class="btn btn-danger">删除</button>
                <button type="button" class="btn btn-primary" id="addEmployeeBtn">添加</button>
            </form>
            <%--账号列表--%>
            <table class="table infoTable personInfoTable">
                <thead>
                <tr>
                    <th>选择</th>
                    <th>姓名</th>
                    <th>姓名</th>
                    <th>所在部门</th>
                    <th>职务</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>基本工资</th>
                    <th>职务工资</th>
                    <th>入职时间</th>
                    <th>编辑</th>
                    <%--启用编辑后该按钮变为保存，点击保存才会保存修改--%>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="checkbox"></td>
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
                        <button class="btn btn-primary" id="editEmployeeInfoBtn">编辑</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <%--员工列表结束--%>
        <%--员工详细信息--%>
        <div class="tab-pane fade" id="employeeInfo" style="margin: 2%">
            <table class="table infoTable">
                <tbody>
                <tr>
                    <td>
                        <label>姓名：</label>
                        <input value="name" name="name" type="text"/>
                    </td>
                    <td>
                        <label>性别：</label>
                        <input type="radio" name="sex" value=""/>男
                        <input type="radio" name="sex" value=""/>女
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>出生日期：</label>
                        <input value="1998-10-10" name="brithday" type="text"/>
                    </td>
                    <td>
                        <label>联系电话：</label>
                        <input type="tel" name="telPhone" value="199878979"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>邮箱：</label>
                        <input value="199878979@qq.com" name="email" type="email"/>
                    </td>
                    <td>
                        <label>地址：</label>
                        <input type="text" name="address" value="湖南长沙"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>身份证号：</label>
                        <input value="4299889090986890" name="identificationId" type="text"/>
                    </td>
                    <td>
                        <label>学历：</label>
                        <input type="text" name="education" value="本科"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>毕业学校：</label>
                        <input value="吉首大学" name="school" type="text"/>
                    </td>
                    <td>
                        <label>专业：</label>
                        <input type="text" name="profession" value="软件工程"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>政治面貌：</label>
                        <input value="团员" name="politicalStatus" type="text"/>
                    </td>
                    <td>
                        <label>入职时间：</label>
                        <input type="text" name="entryTime" value="1990-19-10"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>合同到期时间：</label>
                        <input value="1999-10-10" name="expireDate" type="text"/>
                    </td>
                    <td>
                        <label>所属部门：</label>
                        <input type="text" name="departmentId" value="技术部"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>职务：</label>
                        <input type="text" name="positionId" value="java开发工程师"/>
                    </td>
                    <td>
                        <label>基本工资：</label>
                        <input value="8999" name="baseSalary" type="text"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>职务工资：</label>
                        <input type="text" name="positionSalary" value="5633"/>
                    </td>
                    <td>
                        <label>基本补贴：</label>
                        <input value="8999" name="subsidy" type="text"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <button type="button" class="btn btn-primary btn-sm">修改</button>
                    </td>
                    <td align="left">
                        <button type="button" class="btn btn-primary btn-sm" id="exitInfo">退出</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <%--员工详细信息结束--%>
        <%--添加员工信息--%>
        <div class="tab-pane fade" id="addemployee" style="margin: 2%">
            <form id="addEmployeeForm">
                <table class="table infoTable">
                    <tbody>
                    <tr>
                        <td>
                            <label>姓名：</label>
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
                            <label>联系电话：</label>
                            <input type="tel" name="telPhone"/>
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
                            <input type="date" name="entrytime"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>合同到期时间：</label>
                            <input name="expiredate" type="date"/>
                        </td>
                        <td>
                            <label>所属部门：</label>
                            <select name="departmentid">

                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>职务：</label>
                            <select name="positionid">

                            </select>
                        </td>
                        <td>
                            <label>基本工资：</label>
                            <input name="basesalary" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>职务工资：</label>
                            <input type="text" name="positionsalary"/>
                        </td>
                        <td>
                            <label>基本补贴：</label>
                            <input name="subsidy" type="text"/>
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
    $("#addEmployeeSub").click(function () {
        var name = $("#addEmployeeForm").find("input[name='name']").val();
        var telPhone = $("#addEmployeeForm").find("input[name='telPhone']").val();
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
</script>
</html>