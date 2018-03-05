<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2017/11/27
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="cj" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>部门管理</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet"/>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="css/common.css" rel="stylesheet">
    <script src="js/my.js"></script>

    <script>
        //全选
        /* console.log(document.getElementById("selectAll").innerHTML);
         $("#selectAll").change(function () {
             console.log("change");
         });
         if ($("#selectAll").is(':checked')) {
             console.log("select All");
             $(".aCheckbox").attr("checked", "checked");
         }
         ;*/


        /*初始化部门列表*/
        $.ajax({
            type: "POST",
            url: "../department/pageDepartment",
            data: {pageIndex: "1", pageSize: "15"},
            success: function (data) {

                var ed = $.parseJSON(data);

                var depTbody = $("#departmentInfoBody");
                $.each(ed.list, function (i, item) {
                    var id = item.id;
                    var name = item.name;
                    var leaderid = item.leaderid;
                    var createTime = item.createtime;
                    var remark = item.remark;
                    console.log(createTime);
                    if (id != null && id != undefined && id != "") {

                        if (leaderid == undefined || leaderid == null) {
                            leaderid = "";
                        }
                        if (createTime == undefined || createTime == null) {
                            createTime = "";
                        }
                        if (remark == undefined || remark == null) {
                            remark = "";
                        }
                        if (createTime != "") {

                            var timeTd = "<td>" + createTime + "</td>";
                        } else {
                            var timeTd = "<td>" + createTime + "</td>";
                        }
                        var tr = "<tr>" +

                            "<td>" + id + "</td> " +
                            "<td>" + name + "</td> " +
                            "<td>" + leaderid + "</td>" +
                            timeTd +
                            "<td>" + remark + "</td>" +
                            "<td><button class='btn btn-danger deletDepartmentBtn'>删除</button></td>" +
                            "<td><button class='btn btn-primary editDepartment'>详情</button> </td>" +
                            "</tr>";

                        depTbody.append(tr);
                    }
                });
            }
        });
        /*初始化部门列表结束*/
    </script>


</head>
<body>
<div class="mycontain inerFrame" onload="initDepartmentList()">
    <ul id="myTab" class="nav nav-tabs">
        <li id="departmentListLi">
            <a href="#departmentList" data-toggle="tab">
                部门列表
            </a>
        </li>
        <li id="editDepartmentLi">
            <a href="#departmentInfo" data-toggle="tab">
                部门信息详情
            </a>
        </li>
        <li id="addDepartmentLi">
            <a href="#addDepartment" data-toggle="tab">
                添加部门信息
            </a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <%--部门列表信息--%>
        <div class="tab-pane fade" id="departmentList" style="margin: 2%">
            <%--添加--%>
            <form class="form-inline">

                <button type="button" class="btn btn-primary" id="addDepartmentBtn">添加</button>
            </form>
            <%--部门列表--%>
            <table class="table infoTable">
                <thead>
                <tr>
                    <th>部门编号</th>
                    <th>部门名称</th>
                    <th>部门领导</th>
                    <th>成立时间</th>
                    <th>备注</th>
                    <th>删除</th>
                    <th>详情</th>
                </tr>
                </thead>
                <tbody id="departmentInfoBody">

                </tbody>
            </table>
        </div>
        <%--部门列表结束--%>
        <%--修改部门信息--%>
        <div class="tab-pane fade" id="departmentInfo" style="margin: 2%">
            <table class="table infoTable">
                <tbody>
                <tr>
                    <td>
                        <label>部门编号：</label>
                        <input value="id" name="departmentId" type="text" disabled="disabled"/>
                    </td>
                    <td>
                        <label>部门名称：</label>
                        <input value="name" name="departmentName" type="text"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>领导名字：</label>
                        <input value="name" name="leader" type="text"/>
                    </td>
                    <td>
                        <label>备注：</label>
                        <input value="name" name="remark" type="text"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>成立时间：</label>
                        <input value="createTime" name="createTime" type="text"/>
                    </td>
                    <td>
                        <label>介绍：</label>
                        <textarea value="introduction" name="introduction"></textarea>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <button type="button" class="btn btn-primary btn-sm">修改</button>
                    </td>
                    <td align="left">
                        <button type="button" class="btn btn-primary btn-sm" id="exitDepartment">退出</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <%--修改部门信息结束--%>
        <%--添加部门信息 --%>
        <div class="tab-pane fade" id="addDepartment" style="margin: 2%">
            <form id="addDepartmentForm">
                <table class="table infoTable">
                    <tbody>
                    <tr>
                        <td>
                            <label>部门名称：</label>
                            <input name="name" type="text"/>
                        </td>
                        <td>
                            <label>领导名字：</label>
                            <input name="leaderid" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>成立时间：</label>
                            <input name="createtime" type="text"/>
                        </td>
                        <td>
                            <label>备注：</label>
                            <input name="remark" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>介绍：</label>
                            <textarea name="introduction"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <button type="button" class="btn btn-primary btn-sm" id="addDepartmentSubmit">添加</button>
                        </td>
                        <td align="left">
                            <button type="button" class="btn btn-primary btn-sm" id="exitAdd">退出</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>

            <%--添加部门信息结束 --%>
    </div>
</div>
</body>
</html>
