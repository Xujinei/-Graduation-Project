$(function () {
    // 设置高度
    var screenHeight = $(window).height();
    $(".myBottomRow , .myHomeRight , #containFrame").height(screenHeight * 0.6);

    // 折叠效果设置
    $(".collapse").on('show.bs.collapse', function () {
        $('.collapse').removeClass("in");
    });
});