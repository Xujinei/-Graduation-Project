<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="UTF-8">
    <title>登录</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <script src="js/login.js"></script>

    <link href="css/common.css" rel="stylesheet">

  </head>
  <body>
      <div class="mycontain">
          <div class="container-fluid">
            <div class="row" style="margin-top: 150px">
              <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-primary">
                    <div class="panel-heading loginPanelHead" id="test">
                    企业薪资福利管理系统登录
                  </div>
                  <div class="panel-body">
                      <form class="form-horizontal" action="../login/userLogin" method="post">
                      <div class="form-group">
                          <div class="col-md-10 welcome">欢迎使用企业薪资福利管理系统!</div>
                      </div>
                          <font color="red">${requestScope.message }</font>
                      <div class="form-group">
                        <label for="username" class="col-md-2 control-label">账号</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="username" name="username" value="${username }"
                                   placeholder="请输入账号" required="required" pattern="^[a-zA-Z][a-zA-Z0-9_@*.]{4,20}$"
                                   oninvalid="setCustomValidity('请输入5到20个由数字和英文字母组成的用户名')"
                                   oninput="setCustomValidity('')">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="password" class="col-md-2 control-label">密码</label>
                        <div class="col-md-10">
                            <input type="password" class="form-control" id="password" name="password"
                                   value="${password }" placeholder="请输入密码" required="required"
                                   pattern="^[a-zA-Z][a-zA-Z0-9_@*.]{4,20}$"
                                   oninvalid="setCustomValidity('请输入5到20个由数字和英文字母组成的密码')"
                                   oninput="setCustomValidity('')">
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                          <div class="checkbox">
                            <label>
                                <input type="checkbox" name="remember"> 记住密码
                            </label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <button type="submit" class="btn btn-primary">登录</button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </div>
  </body>
</html>