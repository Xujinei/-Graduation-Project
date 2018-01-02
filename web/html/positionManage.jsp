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
    <title>职务管理</title>

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
        <li id="positionListLi">
            <a href="#positionList" data-toggle="tab">
                职务列表
            </a>
        </li>
        <li id="editPositionLi">
            <a href="#positionInfo" data-toggle="tab">
                职务信息详情
            </a>
        </li>
        <li id="addPositionLi">
            <a href="#addPosition" data-toggle="tab">
                添加职务
            </a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <%--职务列表信息--%>
        <div class="tab-pane fade" id="positionList" style="margin: 2%">
            <%--选择删除--%>
            <form class="form-inline">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" id="selectAll"/> 全选
                    </label>
                </div>
                <button type="submit" class="btn btn-danger">删除</button>
                <button type="button" class="btn btn-primary" id="addPositionBtn">添加</button>
            </form>
            <%--职务列表--%>
            <table class="table infoTable">
                <thead>
                <tr>
                    <th>选择</th>
                    <th>职务编号</th>
                    <th>职务名称</th>
                    <th>职责</th>
                    <th>要求</th>
                    <th>备注</th>
                    <th>详情</th>
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
                    <td>
                        <button class="btn btn-primary" id="editPosition">详情</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <%--职务列表结束--%>
        <%--修改职务信息--%>
        <div class="tab-pane fade" id="positionInfo" style="margin: 2%">
            <table class="table infoTable">
                <tbody>
                <tr>
                    <td>
                        <label>职务编号：</label>
                        <input value="id" name="positionId" type="text" disabled="disabled"/>
                    </td>
                    <td>
                        <label>职务名称：</label>
                        <input value="name" name="positionName" type="text"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>职责：</label>
                        <textarea value="duty" name="duty"></textarea>
                    </td>
                    <td>
                        <label>要求：</label>
                        <textarea value="required" name="required"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>备注：</label>
                        <input value="ramark" name="remark" type="text"/>
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <button type="button" class="btn btn-primary btn-sm">修改</button>
                    </td>
                    <td align="left">
                        <button type="button" class="btn btn-primary btn-sm" id="exitPosition">退出</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <%--修改职务信息结束--%>
        <%--添加职务信息--%>
        <div class="tab-pane fade" id="addPosition" style="margin: 2%">
            <table class="table infoTable">
                <tbody>
                <tr>
                    <td>
                        <label>职务编号：</label>
                        <input value="id" name="positionId" type="text" disabled="disabled"/>
                    </td>
                    <td>
                        <label>职务名称：</label>
                        <input value="name" name="positionName" type="text"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>职责：</label>
                        <textarea value="duty" name="duty"></textarea>
                    </td>
                    <td>
                        <label>要求：</label>
                        <textarea value="required" name="required"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>备注：</label>
                        <input value="ramark" name="remark" type="text"/>
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <button type="button" class="btn btn-primary btn-sm">修改</button>
                    </td>
                    <td align="left">
                        <button type="button" class="btn btn-primary btn-sm" id="exitAddPosition">退出</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <%--添加职务信息结束--%>
    </div>
</div>
</body>
</html>
