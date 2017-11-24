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

    <link href="css/common.css" rel="stylesheet">
  </head>
  <body>
      <div class="mycontain">
          <div class="container-fluid">
            <div class="row" style="margin-top: 150px">
              <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-primary">
                  <div class="panel-heading loginPanelHead">
                    企业薪资福利管理系统登录
                  </div>
                  <div class="panel-body">
                    <form class="form-horizontal">
                      <div class="form-group">
                        <div class="col-md-10 welcom">欢迎使用企业薪资福利管理系统!</div>
                      </div>
                      <div class="form-group">
                        <label for="username" class="col-md-2 control-label">账号</label>
                        <div class="col-md-10">
                          <input type="text" class="form-control" id="username" placeholder="请输入账号">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="password" class="col-md-2 control-label">密码</label>
                        <div class="col-md-10">
                          <input type="password" class="form-control" id="password" placeholder="请输入密码">
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                          <div class="checkbox">
                            <label>
                              <input type="checkbox"> 记住密码
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