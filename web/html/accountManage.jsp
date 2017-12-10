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
    <title>员工账号管理</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="css/common.css" rel="stylesheet">

    <script>

    </script>


</head>
<body>
<div class="mycontain inerFrame">
    <ul id="myTab" class="nav nav-tabs">
        <li class="active">
            <a href="#accountList" data-toggle="tab" id="test">
                账号列表
            </a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <%--账号信息--%>
        <div class="tab-pane fade in active" id="accountList" style="margin: 2%">
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
                        <input type="checkbox"> 全选
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
                    <td><input type="checkbox"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <button class="btn btn-primary">编辑</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <%--账号结束--%>
    </div>
</div>
</body>
</html>
