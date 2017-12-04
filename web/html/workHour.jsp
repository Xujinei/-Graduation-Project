<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2017/11/27
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>工时表</title>
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
    <div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <c:forEach begin="1" end="30" var="day">
                    <td>${day}</td>
                </c:forEach>
            </tr>
            </thead>
            <tbody>
            <tr>
                <c:forEach begin="1" end="30" var="day">
                    <td>0.0</td>
                </c:forEach>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
