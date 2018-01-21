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
    <title>六险一金标准管理</title>

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
        <li id="insuranceListLi">
            <a href="#insuranceList" data-toggle="tab">
                标准列表
            </a>
        </li>
        <li id="editInsuranceLi">
            <a href="#insuranceInfo" data-toggle="tab">
                部门信息详情
            </a>
        </li>
        <li id="addInsuranceLi">
            <a href="#addInsurance" data-toggle="tab">
                添加部门信息
            </a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <%--六险一金标准列表信息--%>
        <div class="tab-pane fade" id="insuranceList" style="margin: 2%">
            <%--选择删除--%>
            <form class="form-inline">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" id="selectAll"/> 全选
                    </label>
                </div>
                <button type="submit" class="btn btn-danger">删除</button>
                <button type="button" class="btn btn-primary" id="addInsuranceBtn">添加</button>
            </form>
            <%--六险一金标准列表--%>
            <table class="table infoTable">
                <thead>
                <tr>
                    <th>选择</th>
                    <th>标准编号</th>
                    <th>标准名称</th>
                    <th>养老保险</th>
                    <th>医疗保险</th>
                    <th>失业保险</th>
                    <th>工伤保险</th>
                    <th>生育保险</th>
                    <th>住房公积金</th>
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
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <button class="btn btn-primary" id="editInsurance">详情</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <%--六险一金标准列表结束--%>
        <%--修改标准信息--%>
        <div class="tab-pane fade" id="insuranceInfo" style="margin: 2%">
            <table class="table infoTable">
                <tbody>
                <tr>
                    <td>
                        <label>标准编号：</label>
                        <input value="id" name="insuranceId" type="text" disabled="disabled"/>
                    </td>
                    <td>
                        <label>标准名称：</label>
                        <input value="name" name="insuranceName" type="text"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>养老保险：</label>
                        <input value="pension" name="pension" type="text"/>
                    </td>
                    <td>
                        <label>医疗保险：</label>
                        <input value="medical" name="medical" type="text"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>失业保险：</label>
                        <input value="Unemployment" name="Unemployment" type="text"/>
                    </td>
                    <td>
                        <label>工伤保险：</label>
                        <textarea value="injury" name="injury"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>生育保险：</label>
                        <input value="Maternity" name="Maternity" type="text"/>
                    </td>
                    <td>
                        <label>住房公积金：</label>
                        <textarea value="housing" name="housing"></textarea>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <button type="button" class="btn btn-primary btn-sm">修改</button>
                    </td>
                    <td align="left">
                        <button type="button" class="btn btn-primary btn-sm" id="exitInsurance">退出</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <%--修改标准信息结束--%>
        <%--添加标准信息 --%>
        <div class="tab-pane fade" id="addInsurance" style="margin: 2%">
            <table class="table infoTable">
                <tbody>
                <tr>

                    <td colspan="2">
                        <label>标准名称：</label>
                        <input value="name" name="insuranceName" type="text"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>养老保险：</label>
                        <input value="pension" name="pension" type="text"/>
                    </td>
                    <td>
                        <label>医疗保险：</label>
                        <input value="medical" name="medical" type="text"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>失业保险：</label>
                        <input value="Unemployment" name="Unemployment" type="text"/>
                    </td>
                    <td>
                        <label>工伤保险：</label>
                        <textarea value="injury" name="injury"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>生育保险：</label>
                        <input value="Maternity" name="Maternity" type="text"/>
                    </td>
                    <td>
                        <label>住房公积金：</label>
                        <textarea value="housing" name="housing"></textarea>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <button type="button" class="btn btn-primary btn-sm">修改</button>
                    </td>
                    <td align="left">
                        <button type="button" class="btn btn-primary btn-sm" id="exitAddInsurance">退出</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <%--添加标准信息结束 --%>
    </div>
</div>
</body>
</html>
