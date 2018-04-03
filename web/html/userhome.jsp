<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2017/11/24
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="com.swm.entity.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="cj" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/html/";
    Account user = (Account) request.getSession().getAttribute("account");
    String name = user.getUsername();

%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>主页</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="css/common.css" rel="stylesheet">

    <script src="js/home.js"></script>
    <script src="js/my.js"></script>
</head>
<body>
<div class="mycontain">
    <div class="container-fluid">
        <div class="row myTopRow">
            <div class="col-md-4">
                <div style="color: deepskyblue;font-size: 20px;font-weight: bold"> 薪酬福利管理系统</div>
            </div>
            <div class="col-md-6 col-md-offset-2">
                <div>
                    <form action="../login/loginOut" style="float:right;">
                        <button type="submit" class="btn btn-primary btn-sm pull-right">退出</button>
                    </form>
                    <span id="userName" style="display: inline-block;float: right">欢迎您：<%=name%> &nbsp;&nbsp;</span>
                </div>
            </div>
        </div>
        <div class="row myBottomRow">
            <%--左边导航栏--%>
            <div class="col-md-3 myHomeLeft">
                <%--个人管理模块--%>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title" id="personalManageTitle">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#personManage">
                                个人管理
                            </a>
                        </h4>
                    </div>
                    <div id="personManage" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="myUl">
                                <li class="myLi" id="personalManage1"><a>个人信息管理</a></li>
                                <li class="myLi" id="personalManage2"><a>个人账号管理</a></li>
                                <li class="myLi" id="personalManage3"><a>个人薪酬报表</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <%--左边导航栏结束--%>
            <%--右边内容--%>
            <div class="col-md-9 myHomeRight">

                <iframe width="100%" height="840px" src="${base}welcome.jsp" id="containFrame"></iframe>
            </div>
            <%--右边内容结束--%>
        </div>
    </div>
</div>

</body>
</html>
