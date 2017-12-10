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

    <script>

    </script>


</head>
<body>
<div class="mycontain inerFrame">
    <ul id="myTab" class="nav nav-tabs">
        <li class="active">
            <a href="#personalInfo" data-toggle="tab" id="test">
                员工详细信息
            </a>
        </li>
        <li><a href="#personalAccount" data-toggle="tab">修改密码</a></li>
        <li><a href="#salaryReport" data-toggle="tab">工资报表</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <%--个人信息--%>
        <div class="tab-pane fade in active" id="personalInfo" style="margin: 2%">
            <table class="table infoTable personInfoTable">
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
                    <td>
                        <button type="button" class="btn btn-primary btn-sm pull-right">修改</button>
                    </td>
                    <td>

                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <%--个人信息结束--%>
        <%--个人账号：修改密码--%>
        <div class="tab-pane fade" id="personalAccount" style="margin:4%;" align="center">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="oldPassword" class="control-label">原密码：</label>
                    <input type="password" name="password" value="123456" id="oldPassword"/>
                </div>
                <div class="form-group">
                    <label for="password" class="control-label">新密码：</label>
                    <input type="password" name="password" value="123456" id="password"/>
                </div>
                <div class="form-group">
                    <label for="ensurePassword" class="control-label">确认密码：</label>
                    <input type="password" name="password" value="123456" id="ensurePassword"/>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">修改</button>
                </div>
            </form>
        </div>
        <%--个人账号结束--%>
        <%--工资报表--%>
        <div class="tab-pane fade" id="salaryReport">
            <div class="salaryCount">
                <p>已找到<span>n</span>条工资记录 </p>
            </div>
            <table class="table infoTable">
                <thead>
                <tr>
                    <th>时间</th>
                    <th>基本工资</th>
                    <th>职务工资</th>
                    <th>基本补贴</th>
                    <th>其他补贴</th>
                    <th>税收</th>
                    <th>五险一金</th>
                    <th>发放时间</th>
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
                </tr>
                </tbody>

            </table>
        </div>
        <%--工资报表结束--%>
    </div>
</div>
</body>
</html>
