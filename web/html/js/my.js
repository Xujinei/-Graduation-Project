$(function () {
    /*********************************主页：home.jsp*******************************/
    //个人管理


    //个人信息管理点击事件
    $("#personalManage1").click(function () {
        if ($("#containFrame").attr("src") != "personalManage.jsp") {
            $("#containFrame").attr("src", "personalManage.jsp");
        }

        var containFrame = document.getElementById("containFrame");
        var win = containFrame.contentWindow;
        var date = new Array();
        date[0] = "personalInfoLi";
        date[1] = "personalInfo";
        $.ajax({
            url: "../user/userInfo",
            success: function (data) {

            }
        });
        win.postMessage(date, "*");

    });

    //个人账号管理点击事件
    $("#personalManage2").click(function () {
        if ($("#containFrame").attr("src") != "personalManage.jsp") {
            $("#containFrame").attr("src", "personalManage.jsp");
        }
        var containFrame = document.getElementById("containFrame");
        var win = containFrame.contentWindow;

        var date = new Array();
        date[0] = "modifyPWLi";
        date[1] = "personalAccount";


        win.postMessage(date, "*");
    });

    //个人工资报表点击事件
    $("#personalManage3").click(function () {
        if ($("#containFrame").attr("src") != "personalManage.jsp") {
            $("#containFrame").attr("src", "personalManage.jsp");
        }
        var containFrame = document.getElementById("containFrame");
        var win = containFrame.contentWindow;

        var date = new Array();
        date[0] = "salaryListLi";
        date[1] = "salaryReport";
        win.postMessage(date, "*");
    });

    //----------------------------------员工管理

    //员工管理模块
    $("#employeeInfoLi").click(function () {
        $("#containFrame").attr("src", "employeeManage.jsp");
    });

    //员工账号管理
    $("#employeeAccount").click(function () {
        $("#containFrame").attr("src", "accountManage.jsp");
    });

    //--------------------------------薪酬福利管理
    // 薪酬福利审核
    $("#salaryCheck").click(function () {
        $("#containFrame").attr("src", "salaryCheckManage.jsp");
    });

    // 各部门薪酬福利统计报表
    $("#departmentSalary").click(
        function () {
            $("#containFrame").attr("src", "departmentSalaryCountManage.jsp");
        }
    );

    // 各职务薪酬福利统计报表
    $("#positionSalary").click(
        function () {
            $("#containFrame").attr("src", "positionSalaryCountManage.jsp");
        }
    );
    // 部门薪酬福利明细报表
    $("#departmentSalaryInfo").click(
        function () {
            $("#containFrame").attr("src", "departmentSalaryInfoManage.jsp");
        }
    );


    //---------------------------------系统管理
    // 部门管理
    $("#departmentManage").click(function () {
        $("#containFrame").attr("src", "departmentManage.jsp");


    });
    //职务管理
    $("#positionManage").click(function () {
        $("#containFrame").attr("src", "positionManage.jsp");
    });
    // 六险一金标准管理
    $("#insuranceManage").click(function () {
        $("#containFrame").attr("src", "insuranceStandardManage.jsp");
    });


    /**************************个人信息管理页面 personalManage.jsp*********************************/
    //初始化样式
    $("#personalInfoLi").addClass("active");
    $("#personalInfo").addClass("in active");

    //个人信息页面跨域配置
    window.onmessage = function (p1) {
        //显示个人信息lab，隐藏其他lab :跨域
        $("#containFrame").attr("src", "personalManage.jsp");

        $("#" + p1.data[0]).siblings("li").each(function () {

            $(this).removeClass("active");
        });
        $("#" + p1.data[1]).siblings(".tab-pane").each(function () {
            $(this).removeClass("in active");
        });


        $("#" + p1.data[0]).addClass("active");
        $("#" + p1.data[1]).addClass("in active");


    };

    // 个人信息修改页面修改按钮点击事件
    $("#editPersonalInfo").click(function () {
        var btHtml = $("#editPersonalInfo").html();
        if (btHtml == "修改") {
            $(".personInfoTable tbody tr td input").attr("disabled", false).css("background-color", "gray");
            $("#editPersonalInfo").html("保存");
        } else {
            $("#editPersonalInfo").html("修改");
            // 保存操作
            $(".personInfoTable tbody tr td input").attr("disabled", "disabled").css("background-color", "white");

        }

    });

    /***************************员工信息管理页面************************/

    //样式初始化
    $("#employeeList").addClass("in active");
    $("#employeeListLab").addClass("active");
    $("#employeeInfoLab").css("display", "none");
    $("#addEmployeeLab").css("display", "none");


    //新增员工按钮点击事件
    $("#addEmployeeBtn").click(function () {
        $("#employeeList").removeClass("in active");
        $("#employeeListLab").removeClass("active");
        $("#addEmployeeLab").css("display", "block").addClass("active");
        $("#addemployee").addClass("in active");

        // 初始化新增员工信息页面 ： 部门信息，职务信息
        $.ajax({
            type: 'POST',
            scriptCharset: 'utf-8',
            url: '../position/allPosition',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function (data) {

                var d = eval(data);

                var positionSelect = $("select[name=position]");
                $.each(d, function (i, item) {
                    var option = "<option value=" + i + ">" + item.name + "</option>";
                    positionSelect.append(option);
                })
            }
        });
        $.ajax({
            type: 'POST',
            scriptCharset: 'utf-8',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            url: '../department/allDepartment',
            success: function (data) {
                var d = eval(data);
                var departmentSelect = $("select[name=department]");
                $.each(d, function (i, item) {
                    var option = "<option value=" + i + ">" + item.name + "</option>";
                    departmentSelect.append(option);
                })
            }
        });


    });

    //编辑员工按钮点击事件
    $("#editEmployeeInfoBtn").click(function () {
        $("#employeeList").removeClass("in active");
        $("#employeeListLab").removeClass("active");
        $("#employeeInfoLab").css("display", "block").addClass("active");
        $("#employeeInfo").addClass("in active");
    });

    //退出员工添加面板
    $("#exitAdd").click(function () {
        $("#addEmployeeLab").css("display", "none");
        $("#addemployee").removeClass("in active");
        $("#employeeList").addClass("in active");
        $("#employeeListLab").addClass("active");
    });

    //退出员工详情面板
    $("#exitInfo").click(function () {
        $("#employeeInfoLab").css("display", "none");
        $("#employeeInfo").removeClass("in active");
        $("#employeeList").addClass("in active");
        $("#employeeListLab").addClass("active");
    });


    /*************************员工账号页面： accountManage.jsp***************************/

    //初始化员工账号页面： 隐藏账号修改tab/显示账号列表页/

    $("#accountListLi").addClass("active");
    $("#accountList").addClass("in active");
    $("#editAccountLi").css("display", "none");

    //编辑按钮点击事件 : 隐藏账号列表页，显示修改页
    $("#editAccount").click(function () {
        $("#editAccountLi").css("display", "block");
        $("#accountListLi").removeClass("active");
        $("#accountList").removeClass("in active");
        $("#accountInfo").addClass("in active");
        $("#editAccountLi").addClass("active");
    });

    //退出编辑按钮点击事件
    $("#exitAccount").click(function () {
        $("#editAccountLi").css("display", "none");
        $("#accountListLi").addClass("active");
        $("#accountList").addClass("in active");
        $("#accountInfo").removeClass("in active");
    });

    /*******************************部门管理页面： departmentMange.jsp***********************************/

    //初始化部门管理页面
    $("#departmentListLi").addClass("active");
    $("#departmentList").addClass("in active");
    $("#editDepartmentLi").css("display", "none");
    $("#addDepartmentLi").css("display", "none");

    //编辑按钮点击事件 : 隐藏账号列表页，显示修改页
    $("#editDepartment").click(function () {
        $("#editDepartmentLi").css("display", "block").addClass("active");
        $("#departmentInfo").addClass("in active");

        $("#departmentListLi").removeClass("active");
        $("#departmentList").removeClass("in active");

    });

    // 提交部门添加
    $("#addDepartmentSubmit").click(function () {

        var departmentName = $("#addDepartmentForm").find("input[name='name']").val();

        if (departmentName == null || departmentName == "") {
            alert("请输入部门信息");
        } else {
            alert($("#addDepartmentForm").serialize())
            $.ajax({
                type: "POST",
                data: $("#addDepartmentForm").serialize(),
                url: "../department/addDepartment",
                success: function (data) {
                    alert(data);
                },
                error: function () {
                    alert("添加失败");
                }
            });
        }

    });

    //退出编辑按钮点击事件
    $("#exitDepartment").click(function () {
        $("#editDepartmentLi").css("display", "none");
        $("#departmentListLi").addClass("active");
        $("#departmentList").addClass("in active");
        $("#departmentInfo").removeClass("in active");
    });

    // 添加部门按钮点击事件
    $("#addDepartmentBtn").click(function () {
        $("#addDepartmentLi").css("display", "block").addClass("active");
        $("#addDepartment").addClass("in active");
        $("#departmentInfo").removeClass("in active");
        $("#departmentListLi").removeClass("active");
        $("#departmentList").removeClass("in active");

    });

    // 退出添加
    $("#exitAdd").click(function () {
        $("#addDepartmentLi").css("display", "none");
        $("#departmentListLi").addClass("active");
        $("#departmentList").addClass("in active");
        $("#addDepartment").removeClass("in active");
    });


    /*******************************职务管理页面： positionMange.jsp***********************************/

    //初始化职务管理页面
    $("#positionListLi").addClass("active");
    $("#positionList").addClass("in active");
    $("#editPositionLi").css("display", "none");
    $("#addPositionLi").css("display", "none");


    // 添加职务点击按钮
    $("#addPositionBtn").click(function () {
        $("#addPositionLi").css("display", "block").addClass("active");
        $("#addPosition").addClass("in active");
        $("#positionListLi").removeClass("active");
        $("#positionList").removeClass("in active");
    });


    // 提交职务添加
    $("#submintAddPos").click(function () {

        var name = $("#addPosiForm").find("input[name='name']").val();

        if (name == null || name == "") {
            alert("请输入职务信息");
        } else {
            $.ajax({
                type: "POST",
                data: $("#addPosiForm").serialize(),
                url: "../position/addPosition",
                success: function (data) {
                    alert(data);
                },
                error: function () {
                    alert("添加失败");
                }
            });
        }

    });


    /**************************六险一金标准管理页面： insuranceStandardManage.jsp******************************/
    //初始化六险一金管理页面
    $("#insuranceListLi").addClass("active");
    $("#insuranceList").addClass("in active");
    $("#editInsuranceLi").css("display", "none");
    $("#addInsuranceLi").css("display", "none");

    //编辑按钮点击事件 : 隐藏账号列表页，显示修改页
    $("#editInsurance").click(function () {
        $("#editInsuranceLi").css("display", "block");
        $("#insuranceListLi").removeClass("active");
        $("#insuranceList").removeClass("in active");
        $("#insuranceInfo").addClass("in active");
        $("#editInsuranceLi").addClass("active");
    });

    //退出编辑按钮点击事件
    $("#exitInsurance").click(function () {
        $("#editInsuranceLi").css("display", "none");
        $("#insuranceListLi").addClass("active");
        $("#insuranceList").addClass("in active");
        $("#insuranceInfo").removeClass("in active");
    });

    // 添加标准点击按钮
    $("#addInsuranceBtn").click(function () {
        $("#addInsuranceLi").css("display", "block").addClass("active");
        $("#addInsurance").addClass("in active");
        $("#insuranceListLi").removeClass("active");
        $("#insuranceList").removeClass("in active");
    });


    // 提交添加
    $("#addInsBtn").click(function () {
        var name = $("#addInsForm").find("input[name='name']").val();
        var pension = $("#addInsForm").find("input[name='pension']").val();
        var medical = $("#addInsForm").find("input[name='medical']").val();
        var unemployment = $("#addInsForm").find("input[name='unemployment']").val();
        var injury = $("#addInsForm").find("input[name='injury']").val();
        var maternity = $("#addInsForm").find("input[name='maternity']").val();
        var housing = $("#addInsForm").find("input[name='housing']").val();

        if (name == null || name == "") {
            alert("请输入标准名称");
        } else if (pension == null || pension == '') {
            alert("请输入养老保险比例");
        } else if (medical == null || medical == '') {
            alert("请输入医疗保险比例");
        } else if (unemployment == null || unemployment == '') {
            alert("请输入失业保险比例");
        } else if (injury == null || injury == '') {
            alert("请输入工伤保险比例");
        } else if (maternity == null || maternity == '') {
            alert("请输入生育保险比例");
        } else if (housing == null || housing == '') {
            alert("请输入住房公积金比例");
        } else {
            $.ajax({
                type: "POST",
                data: $("#addInsForm").serialize(),
                url: "../insurance/addIns",
                success: function (data) {
                    alert(data);
                },
                error: function () {
                    alert("添加失败");
                }
            });
        }

    });

    /*************************薪酬审核管理页面：salaryCheckManage.jsp*******************/
    //初始化页面
    $("#salaryCheckLi").addClass("active");
    $("#salaryCheckList").addClass("active in");
    $("#salaryInfoLi").css("display", "none");

    //详情按钮
    $("#editSalaryCheckBtn").click(function () {
        $("#salaryInfoLi").css("display", "block").addClass("active");
        $("#salaryInfo").addClass("active in");
        $("#salaryCheckLi").removeClass("active");
        $("#salaryCheckList").removeClass("active in");

    });
    // 退出详情页按钮
    $("#exitSalaryInfo").click(function () {
        $("#salaryCheckLi").addClass("active");
        $("#salaryCheckList").addClass("active in");
        $("#salaryInfoLi").css("display", "none");
        $("#salaryInfo").removeClass("active in");

    });

    /**********************部门工资统计报表： departmentSalaryCountManage**********************************/
    //初始化页面
    $("#departmentSalaryLi").addClass("active");
    $("#departmentSalaryList").addClass("active in");
    $("#departmentInfoSalaryLi").css("display", "none");

    //详情按钮
    $("#editDepartmentSalaryCheckBtn").click(function () {
        $("#departmentInfoSalaryLi").css("display", "block").addClass("active");
        $("#departmentSalaryInfoList").addClass("active in");
        $("#departmentSalaryLi").removeClass("active");
        $("#departmentSalaryList").removeClass("active in");

    });
    // 退出详情页按钮
    $("#extDepartmentSalaryInfoBtn").click(function () {
        $("#departmentSalaryLi").addClass("active");
        $("#departmentSalaryList").addClass("active in");
        $("#departmentInfoSalaryLi").css("display", "none");
        $("#departmentSalaryInfoList").removeClass("active in");

    });

    /**********************职务工资统计报表： positionSalaryCountManage**********************************/
    //初始化页面
    $("#positionSalaryLi").addClass("active");
    $("#positionSalaryList").addClass("active in");
    $("#positionInfoSalaryLi").css("display", "none");

    //详情按钮
    $("#editPositionSalaryCheckBtn").click(function () {
        $("#positionInfoSalaryLi").css("display", "block").addClass("active");
        $("#positionSalaryInfoList").addClass("active in");
        $("#positionSalaryLi").removeClass("active");
        $("#positionSalaryList").removeClass("active in");

    });
    // 退出详情页按钮
    $("#extPositionSalaryInfoBtn").click(function () {
        $("#positionSalaryLi").addClass("active");
        $("#positionSalaryList").addClass("active in");
        $("#positionInfoSalaryLi").css("display", "none");
        $("#positionSalaryInfoList").removeClass("active in");

    });

});