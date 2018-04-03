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
    Integer p = user.getPromission();
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
            <div class="col-md-2 col-md-offset-6">
                <div>

                    <form action="../login/loginOut" style="float:right;">
                        <button type="submit" class="btn btn-primary btn-sm pull-right">退出</button>
                    </form>
                    <span id="userName"
                          style="display: inline-block;float: right">欢迎您：<%=name%> &nbsp;&nbsp;&nbsp;</span>
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
                <%--个人管理模块结束--%>
                <%--通知模块--%>
                <%-- <div class="panel panel-primary">
                     <div class="panel-heading">
                         <h4 class="panel-title">
                             <a data-toggle="collapse" data-parent="#accordion"
                                href="#message">
                                 通知
                             </a>
                         </h4>
                     </div>
                     <div id="message" class="panel-collapse collapse">
                         <div class="panel-body">
                             <ul class="myUl">
                                 <li class="myLi"><a>薪资发放通知</a><span class="badge pull-right">新</span></li>
                             </ul>
                         </div>
                     </div>
                 </div>--%>
                <%--通知模块结束--%>

                <%--员工管理模块--%>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title" id="employeeManageTitle">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#employee">
                                员工管理
                            </a>
                        </h4>
                    </div>
                    <div id="employee" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="myUl">
                                <li class="myLi" id="employeeInfoLi"><a>员工信息管理</a></li>
                                <li class="myLi" id="employeeAccount"><a>员工账号管理</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <%--员工管理模块结束--%>
                <%--薪资福利管理模块--%>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#SWManage">
                                薪资福利管理
                            </a>
                        </h4>
                    </div>
                    <div id="SWManage" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="myUl">
                                <li class="myLi" id="salaryCheck"><a>薪资审核结算</a></li>
                                <li class="myLi" id="departmentSalary"><a>部门工资统计报表</a></li>
                                <li class="myLi" id="departmentSalaryInfo"><a>部门人员工资明细</a></li>
                                <li class="myLi" id="positionSalary"><a>职务工资统计报表</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <%--薪资福利管理模块结束--%>
                <%--系统管理模块--%>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#sysManage">
                                系统管理
                            </a>
                        </h4>
                    </div>
                    <div id="sysManage" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="myUl">
                                <li class="myLi" id="departmentManage"><a>部门管理</a></li>
                                <li class="myLi" id="positionManage"><a>职务管理</a></li>
                                <%--<li class="myLi"><a>补贴类型管理</a></li>--%>
                                <%--<li class="myLi" id="insuranceManage"><a>六险一金标准管理</a></li>--%>
                                <%--<li class="myLi"><a>账号管理</a></li>--%>
                            </ul>
                        </div>
                    </div>
                </div>
                <%--系统管理模块结束--%>

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
