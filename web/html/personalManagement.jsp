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
    <title>个人管理</title>
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
     <ul id="myTab" class="nav nav-tabs">
         <li class="active">
             <a href="#workingHours" data-toggle="tab">
                 工时
             </a>
         </li>
         <li><a href="#overTime" data-toggle="tab">加班</a></li>
         <li><a href="#salaryReport" data-toggle="tab">报表</a></li>
     </ul>
     <div id="myTabContent" class="tab-content">
         <div class="tab-pane fade in active" id="workingHours">
            <div class="atitle">已找到n个工时</div>
             <%--工时表--%>
             <div>
                 <table class="table table-bordered table-hover" style="text-align: center">
                    <thead style="background-color: deepskyblue">
                        <tr>
                            <td>周期</td>
                            <td>总工时</td>
                            <td>提交时间</td>
                            <td>状态</td>
                        </tr>
                    </thead>
                     <tbody>
                         <tr>
                             <td> <a> <span class="startTime">2017-10-01</span>~<span class="endTime">2017-11-01</span></a></td>
                             <td>22</td>
                             <td>2017-10-30</td>
                             <td>待审核</td>
                         </tr>
                     </tbody>
                 </table>
             </div>
         </div>
         <div class="tab-pane fade" id="overTime">
             <div class="atitle">已找到n条加班记录</div>
             <%--加班表--%>
             <table class="table table-bordered table-hover" style="text-align: center">
                 <thead style="background-color: deepskyblue">
                 <tr>
                     <td>周期</td>
                     <td>总时长</td>
                     <td>提交时间</td>
                     <td>状态</td>
                 </tr>
                 </thead>
                 <tbody>
                 <tr>
                     <td> <a> <span class="startTime">2017-10-01</span>~<span class="endTime">2017-11-01</span></a></td>
                     <td>22</td>
                     <td>2017-10-30</td>
                     <td>待审核</td>
                 </tr>
                 </tbody>
             </table>

         </div>
         <div class="tab-pane fade" id="salaryReport">
            <div>
                <form class="form-inline">
                    查询
                   <select class="form-control" id="monthsSelect">
                       <option>1月</option>
                       <option>2月</option>
                   </select>
                    工资报表
                </form>
                <%--工资表--%>
                <table class="table table-bordered table-hover" style="text-align: center">
                    <thead style="background-color: deepskyblue">
                    <tr>
                        <td>周期</td>
                        <td>实际工资</td>
                        <td>职务工资</td>
                        <td>补贴</td>
                        <td>加班</td>
                        <td>六险一金</td>
                        <td>总工资</td>
                        <td>状态</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>周期</td>
                        <td>实际工资</td>
                        <td>职务工资</td>
                        <td>补贴</td>
                        <td>加班</td>
                        <td>六险一金</td>
                        <td>总工资</td>
                        <td>状态</td>
                    </tr>
                    </tbody>
                </table>

            </div>
         </div>
     </div>
 </div>
</body>
</html>
