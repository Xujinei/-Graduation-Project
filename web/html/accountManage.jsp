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
    </ul>
    <div id="myTabContent" class="tab-content">
        <%--账号列表信息--%>
        <div class="tab-pane fade" id="accountList" style="margin: 2%">
            <%--条件查询账号--%>
            <form class="form-inline">
                <div class="form-group">
                    <label for="account">账号</label>
                    <input type="text" class="form-control" id="account" placeholder="请输入账号" name="username">
                </div>
                <div class="form-group">
                    <label for="promission">权限</label>
                    <select class="form-control" id="promission" name="promission">
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
                    <label for="status">状态</label>
                    <select class="form-control" id="status" name="status">
                        <option>1</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">查询</button>
            </form>
            <%--选择删除--%>
            <form class="form-inline">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" id="selectAll"/> 全选
                    </label>
                </div>
                <button type="submit" class="btn btn-danger">删除</button>
                &nbsp;&nbsp;&nbsp;
                <button type="submit" class="btn btn-warning">初始化密码</button>
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
                    <th>权限</th>
                    <th>状态</th>
                    <th>编辑</th>
                    <%--启用编辑后该按钮变为保存，点击保存才会保存修改--%>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="checkbox" class="aCheckbox"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <button class="btn btn-primary" id="editAccount">编辑</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <%--账号列表结束--%>
        <%--修改账号信息--%>
        <div class="tab-pane fade" id="accountInfo" style="margin: 2%">
            <table class="table infoTable">
                <tbody>
                <tr>
                    <td>
                        <label>用户名：</label>
                        <input value="name" name="username" type="text"/>
                    </td>
                    <td>
                        <label>员工姓名：</label>
                        <input value="name" name="name" type="text"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>所在部门：</label>
                        <select class="form-control" style="width: 50%;display: inline-block" name="department">
                            <option>1</option>
                        </select>
                    </td>
                    <td>
                        <label>权限：</label>
                        <select class="form-control" style="width: 50%;display: inline-block" name="promission">
                            <option>1</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>状态：</label>
                        <select class="form-control" style="width: 50%;display: inline-block" name="status">
                            <option>1</option>
                        </select>
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <button type="button" class="btn btn-primary btn-sm">修改</button>
                    </td>
                    <td align="left">
                        <button type="button" class="btn btn-primary btn-sm" id="exitAccount">退出</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <%--修改账号信息结束--%>
    </div>
</div>
</body>
</html>
