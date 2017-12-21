$(function () {
    /*********************************主页：home.jsp*******************************/
    //个人管理
    $("#personalManageTitle").click(function () {
        $("#containFrame").attr("src", "personalManage.jsp");
    });


    //个人信息管理点击事件
    $("#personalManage1").click(function () {
        var containFrame = document.getElementById("containFrame");
        var win = containFrame.contentWindow;

        var date = new Array();
        date[0] = "personalInfoLi";
        date[1] = "personalInfo";
        win.postMessage(date, "*");

    });

    //个人账号管理点击事件
    $("#personalManage2").click(function () {

        var containFrame = document.getElementById("containFrame");
        var win = containFrame.contentWindow;

        var date = new Array();
        date[0] = "modifyPWLi";
        date[1] = "personalAccount";
        win.postMessage(date, "*");
    });

    //个人工资报表点击事件
    $("#personalManage3").click(function () {

        var containFrame = document.getElementById("containFrame");
        var win = containFrame.contentWindow;

        var date = new Array();
        date[0] = "salaryListLi";
        date[1] = "salaryReport";
        win.postMessage(date, "*");
    });

    //员工管理模块
    $("#employeeManageTitle , #employeeInfoLi").click(function () {
        $("#containFrame").attr("src", "employeeManage.jsp");
    });

    //员工账号管理
    $("#employeeAccount").click(function () {
        $("#containFrame").attr("src", "accountManage.jsp");
    });


    /**************************个人信息管理页面 personalManage.jsp*********************************/
    //初始化样式
    $("#personalInfoLi").addClass("active");
    $("#personalInfo").addClass("in active");

    //个人信息页面跨域配置
    window.onmessage = function (p1) {
        //显示个人信息lab，隐藏其他lab :跨域
        $("#" + p1.data[0]).siblings("li").each(function () {
            $(this).removeClass("active");
        });
        $("#" + p1.data[0]).addClass("active");

        $("#" + p1.data[1]).addClass("in active");
        $("#" + p1.data[1]).siblings(".tab-pane").each(function () {
            $(this).removeClass("in active");
        });
    }

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
    });

    //编辑员工按钮点击事件
    $("#editEmployeeInfoBtn").click(function () {
        $("#employeeList").removeClass("in active");
        $("#employeeListLab").removeClass("active");
        $("#employeeInfoLab").css("display", "block").addClass("active");
        $("#employeeInfo").addClass("in active");
    });
});