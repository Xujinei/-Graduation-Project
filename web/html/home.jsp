<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2017/11/24
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
</head>
<body>
<div class="mycontain">
    <div class="container-fluid">
        <div class="row myTopRow">
            <div class="col-md-4">薪酬福利管理系统</div>
            <div class="col-md-4 col-md-offset-8">
                欢迎您：
            </div>
        </div>
        <div class="row myBottomRow">
            <%--左边导航栏--%>
            <div class="col-md-3 myHomeLeft">
                <%--个人管理模块--%>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#personManage">
                                个人管理
                            </a>
                        </h4>
                    </div>
                    <div id="personManage" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="myUl">
                                <li class="myLi"><a> 工时填报</a></li>
                                <li class="myLi"><a>加班填报</a></li>
                                <li class="myLi"><a>个人信息管理</a></li>
                                <li class="myLi"><a>工资报表</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <%--个人管理模块结束--%>
                <%--通知模块--%>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#message">
                                通知
                            </a>
                        </h4>
                    </div>
                    <div id="message" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="myUl">
                                <li class="myLi"><a>工时审核通知</a></li>
                                <li class="myLi"><a>加班审核通知</a></li>
                                <li class="myLi"><a>薪资发放通知</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <%--通知模块结束--%>
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
                    <div id="SWManage" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="myUl">
                                <li class="myLi"><a>工时审核</a></li>
                                <li class="myLi"><a>加班审核</a></li>
                                <li class="myLi"><a>薪资审核</a></li>
                                <li class="myLi"><a>部门工资统计报表</a></li>
                                <li class="myLi"><a>部门人员工资明细</a></li>
                                <li class="myLi"><a>职务工统计资明细</a></li>
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
                    <div id="sysManage" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="myUl">
                                <li class="myLi"><a>部门管理</a></li>
                                <li class="myLi"><a>职务管理</a></li>
                                <li class="myLi"><a>补贴类型管理</a></li>
                                <li class="myLi"><a>六险一金标准管理</a></li>
                                <li class="myLi"><a>账号管理</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <%--系统管理模块结束--%>
            </div>
            <%--左边导航栏结束--%>
            <%--右边内容--%>
            <div class="col-md-9 myHomeRight">neirong</div>
            <%--右边内容结束--%>
        </div>
    </div>
</div>

</body>
</html>
