$(function () {

    // 登录验证
    /* var username=$("#username").val();
     var password=$("#password").val();
     var legalInput=/^[a-zA-Z][a-zA-Z0-9_@*]{5,20}$/;
     if(!legalInput.test(username) ){
         $("#username").setCustomValidity("请输入5到20个数字或字母组合");
     }
     if(!legalInput.test(password)){
         $("#password").setCustomValidity("请输入5到20个数字或字母组合");
     }*/


    //记住密码功能
    var str = getCookie("loginInfo");
    str = str.substring(1, str.length - 1);
    var username = str.split(",")[0];
    var password = str.split(",")[1];
    //自动填充用户名和密码
    $("#username").val(username);
    $("#password").val(password);

//获取cookie
    function getCookie(cname) {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') c = c.substring(1);
            if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
        }
        return "";
    }


});