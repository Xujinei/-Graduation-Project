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
    <title>部门工资统计报表</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="css/common.css" rel="stylesheet">

    <style>
        .page_div {
            margin: 10px auto;
            text-align: center;
        }

    </style>

    <script src="js/my.js"></script>

    <script>

        /*格式化日期*/
        function getStrDate(date) {
            var entryDate = new Date(date);
            var year = entryDate.getFullYear();
            var month = entryDate.getMonth() + 1;
            var day = entryDate.getDate();
            var strDate = year + "-" + month;
            return strDate;
        }

        function initList() {
            var date = $("#workData").find("option:selected").val();
            if (date != null && "" != date && date != undefined) {
                date = date + "-01";
            }
            var upOrDown = $("#px").find("option:selected").val();

            var body = $("#listBody");
            body.children("tr").remove();
            $.ajax({
                type: "POST",
                data: {date: date, upOrDown: upOrDown},
                url: "../salary/departmentSalary",
                success: function (data) {
                    var body = $("#listBody");
                    var ed = $.parseJSON(data);
                    console.log(ed);

                    $("#chartDataBody").html("");
                    var chartData = $("#chartDataBody");
                    // define color
                    var COLORS = ["#0DA068","#194E9C","#ED9C13","#ED5713","#057249","#5F91DC","#F88E5D"];

                    $.each(ed, function (i, item) {
                        if(!("department" in item)){
                            return ;
                        }

                        var department = item.department.name;
                        var dId = item.department.id;
                        var date = item.workdata;
                        var ratio = item.status;
                        if (date != null && date != undefined && "" != date) {
                            date = getStrDate(date);
                        }
                        var total = item.total;

                        var tr = "<tr>" +
                            "<td class='department'>" + department + "<input type='hidden' class='departId' value='" + dId + "'/></td>" +
                            "<td class='date'>" + date + "</td>" +
                            "<td class='total'>" + total + "</td>" +
                            "<td id='" + ratio + "'>" + ratio + "%</td>" +
                            "<td>  <button class='btn btn-primary editDepartmentSalaryCheckBtn'>详情</button> </td>" +
                            "</tr>";
                        body.append(tr);

                        tr = '<tr style="color: '+COLORS[(i%COLORS.length)]+'"><td>'+department+'</td><td>'+total+'</td></tr>';
                        chartData.append(tr);
                        if((i+1)>=ed.length){
                            pieChart();
                        }
                    });



                }
            });
        };
        $(function(){
            initList();
        });



    </script>


    <!-- for chart start -->

    <style>
        .wideBox {
            clear: both;
            text-align: center;
            margin-bottom: 50px;
            padding: 10px;
            background: #ebedf2;
            border: 1px solid #333;
            line-height: 80%;
        }

        #container {
            width: 100%;
            height: 500px;
            margin: 0 auto;
            border: 1px solid #333;
            display: none;
        }

        #chart, #chartData {
            /*border: 1px solid #333;*/
            /*background: #ebedf2 url("images/gradient.png") repeat-x 0 0;*/
        }

        #chart {
            display: block;
            float: left;
            cursor: pointer;
        }

        #chartData {
            width: 200px;
            float: right;
            border-collapse: collapse;
            box-shadow: 0 0 1em rgba(0, 0, 0, 0.5);
            -moz-box-shadow: 0 0 1em rgba(0, 0, 0, 0.5);
            -webkit-box-shadow: 0 0 1em rgba(0, 0, 0, 0.5);
            background-position: 0 -100px;
        }

        #chartData th, #chartData td {
            padding: 0.5em;
            border: 1px dotted #666;
            text-align: left;
        }

        #chartData th {
            border-bottom: 2px solid #333;
            text-transform: uppercase;
        }

        #chartData td {
            cursor: pointer;
        }

        #chartData td.highlight {
            background: #e8e8e8;
        }

        #chartData tr:hover td {
            background: #f0f0f0;
        }
    </style>

    <!--[if IE]>
        <script src="http://explorercanvas.googlecode.com/svn/trunk/excanvas.js"></script>
    <![endif]-->

    <script>
        $(function(){

            $("#chartBtn").click(function(){
                var container = $("#container");
                if(container.is(':hidden')){　　//如果是隐藏的则显示元素，否则隐藏
                    container.show();
                }else{
                    container.hide();
                }
            });
        });
        function pieChart() {

            // Config settings
            var chartSizePercent = 55;                        // The chart radius relative to the canvas width/height (in percent)
            var sliceBorderWidth = 1;                         // Width (in pixels) of the border around each slice
            var sliceBorderStyle = "#fff";                    // Colour of the border around each slice
            var sliceGradientColour = "#ddd";                 // Colour to use for one end of the chart gradient
            var maxPullOutDistance = 25;                      // How far, in pixels, to pull slices out when clicked
            var pullOutFrameStep = 4;                         // How many pixels to move a slice with each animation frame
            var pullOutFrameInterval = 40;                    // How long (in ms) between each animation frame
            var pullOutLabelPadding = 65;                     // Padding between pulled-out slice and its label
            var pullOutLabelFont = "bold 16px 'Trebuchet MS', Verdana, sans-serif";  // Pull-out slice label font
            var pullOutValueFont = "bold 12px 'Trebuchet MS', Verdana, sans-serif";  // Pull-out slice value font
            var pullOutValuePrefix = "$";                     // Pull-out slice value prefix
            var pullOutShadowColour = "rgba( 0, 0, 0, .5 )";  // Colour to use for the pull-out slice shadow
            var pullOutShadowOffsetX = 5;                     // X-offset (in pixels) of the pull-out slice shadow
            var pullOutShadowOffsetY = 5;                     // Y-offset (in pixels) of the pull-out slice shadow
            var pullOutShadowBlur = 5;                        // How much to blur the pull-out slice shadow
            var pullOutBorderWidth = 2;                       // Width (in pixels) of the pull-out slice border
            var pullOutBorderStyle = "#333";                  // Colour of the pull-out slice border
            var chartStartAngle = -.5 * Math.PI;              // Start the chart at 12 o'clock instead of 3 o'clock

            // Declare some variables for the chart
            var canvas;                       // The canvas element in the page
            var currentPullOutSlice = -1;     // The slice currently pulled out (-1 = no slice)
            var currentPullOutDistance = 0;   // How many pixels the pulled-out slice is currently pulled out in the animation
            var animationId = 0;              // Tracks the interval ID for the animation created by setInterval()
            var chartData = [];               // Chart data (labels, values, and angles)
            var chartColours = [];            // Chart colours (pulled from the HTML table)
            var totalValue = 0;               // Total of all the values in the chart
            var canvasWidth;                  // Width of the canvas, in pixels
            var canvasHeight;                 // Height of the canvas, in pixels
            var centreX;                      // X-coordinate of centre of the canvas/chart
            var centreY;                      // Y-coordinate of centre of the canvas/chart
            var chartRadius;                  // Radius of the pie chart, in pixels

            // Set things up and draw the chart
            init();


            /**
             * Set up the chart data and colours, as well as the chart and table click handlers,
             * and draw the initial pie chart
             */

            function init() {

                // Get the canvas element in the page
                canvas = document.getElementById('chart');

                // Exit if the browser isn't canvas-capable
                if ( typeof canvas.getContext === 'undefined' ) return;

                // Initialise some properties of the canvas and chart
                canvasWidth = canvas.width;
                canvasHeight = canvas.height;
                centreX = canvasWidth / 2;
                centreY = canvasHeight / 2;
                chartRadius = Math.min( canvasWidth, canvasHeight ) / 2 * ( chartSizePercent / 100 );

                // Grab the data from the table,
                // and assign click handlers to the table data cells

                var currentRow = -1;
                var currentCell = 0;

                $('#chartData td').each( function() {
                    currentCell++;
                    if ( currentCell % 2 != 0 ) {
                        currentRow++;
                        chartData[currentRow] = [];
                        chartData[currentRow]['label'] = $(this).text();
                    } else {
                        var value = parseFloat($(this).text());
                        totalValue += value;
                        value = value.toFixed(2);
                        chartData[currentRow]['value'] = value;
                    }

                    // Store the slice index in this cell, and attach a click handler to it
                    $(this).data( 'slice', currentRow );
                    $(this).click( handleTableClick );

                    // Extract and store the cell colour
                    if ( rgb = $(this).css('color').match( /rgb\((\d+), (\d+), (\d+)/) ) {
                        chartColours[currentRow] = [ rgb[1], rgb[2], rgb[3] ];
                    } else if ( hex = $(this).css('color').match(/#([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2})/) ) {
                        chartColours[currentRow] = [ parseInt(hex[1],16) ,parseInt(hex[2],16), parseInt(hex[3], 16) ];
                    } else {
                        alert( "Error: Colour could not be determined! Please specify table colours using the format '#xxxxxx'" );
                        return;
                    }

                } );

                // Now compute and store the start and end angles of each slice in the chart data

                var currentPos = 0; // The current position of the slice in the pie (from 0 to 1)

                for ( var slice in chartData ) {
                    chartData[slice]['startAngle'] = 2 * Math.PI * currentPos;
                    chartData[slice]['endAngle'] = 2 * Math.PI * ( currentPos + ( chartData[slice]['value'] / totalValue ) );
                    currentPos += chartData[slice]['value'] / totalValue;
                }

                // All ready! Now draw the pie chart, and add the click handler to it
                drawChart();
                $('#chart').click ( handleChartClick );
            }


            /**
             * Process mouse clicks in the chart area.
             *
             * If a slice was clicked, toggle it in or out.
             * If the user clicked outside the pie, push any slices back in.
             *
             * @param Event The click event
             */

            function handleChartClick ( clickEvent ) {

                // Get the mouse cursor position at the time of the click, relative to the canvas
                var mouseX = clickEvent.pageX - this.offsetLeft;
                var mouseY = clickEvent.pageY - this.offsetTop;

                // Was the click inside the pie chart?
                var xFromCentre = mouseX - centreX;
                var yFromCentre = mouseY - centreY;
                var distanceFromCentre = Math.sqrt( Math.pow( Math.abs( xFromCentre ), 2 ) + Math.pow( Math.abs( yFromCentre ), 2 ) );

                if ( distanceFromCentre <= chartRadius ) {

                    // Yes, the click was inside the chart.
                    // Find the slice that was clicked by comparing angles relative to the chart centre.

                    var clickAngle = Math.atan2( yFromCentre, xFromCentre ) - chartStartAngle;
                    if ( clickAngle < 0 ) clickAngle = 2 * Math.PI + clickAngle;

                    for ( var slice in chartData ) {
                        if ( clickAngle >= chartData[slice]['startAngle'] && clickAngle <= chartData[slice]['endAngle'] ) {

                            // Slice found. Pull it out or push it in, as required.
                            toggleSlice ( slice );
                            return;
                        }
                    }
                }

                // User must have clicked outside the pie. Push any pulled-out slice back in.
                pushIn();
            }


            /**
             * Process mouse clicks in the table area.
             *
             * Retrieve the slice number from the jQuery data stored in the
             * clicked table cell, then toggle the slice
             *
             * @param Event The click event
             */

            function handleTableClick ( clickEvent ) {
                var slice = $(this).data('slice');
                toggleSlice ( slice );
            }


            /**
             * Push a slice in or out.
             *
             * If it's already pulled out, push it in. Otherwise, pull it out.
             *
             * @param Number The slice index (between 0 and the number of slices - 1)
             */

            function toggleSlice ( slice ) {
                if ( slice == currentPullOutSlice ) {
                    pushIn();
                } else {
                    startPullOut ( slice );
                }
            }


            /**
             * Start pulling a slice out from the pie.
             *
             * @param Number The slice index (between 0 and the number of slices - 1)
             */

            function startPullOut ( slice ) {

                // Exit if we're already pulling out this slice
                if ( currentPullOutSlice == slice ) return;

                // Record the slice that we're pulling out, clear any previous animation, then start the animation
                currentPullOutSlice = slice;
                currentPullOutDistance = 0;
                clearInterval( animationId );
                animationId = setInterval( function() { animatePullOut( slice ); }, pullOutFrameInterval );

                // Highlight the corresponding row in the key table
                $('#chartData td').removeClass('highlight');
                var labelCell = $('#chartData td:eq(' + (slice*2) + ')');
                var valueCell = $('#chartData td:eq(' + (slice*2+1) + ')');
                labelCell.addClass('highlight');
                valueCell.addClass('highlight');
            }


            /**
             * Draw a frame of the pull-out animation.
             *
             * @param Number The index of the slice being pulled out
             */

            function animatePullOut ( slice ) {

                // Pull the slice out some more
                currentPullOutDistance += pullOutFrameStep;

                // If we've pulled it right out, stop animating
                if ( currentPullOutDistance >= maxPullOutDistance ) {
                    clearInterval( animationId );
                    return;
                }

                // Draw the frame
                drawChart();
            }


            /**
             * Push any pulled-out slice back in.
             *
             * Resets the animation variables and redraws the chart.
             * Also un-highlights all rows in the table.
             */

            function pushIn() {
                currentPullOutSlice = -1;
                currentPullOutDistance = 0;
                clearInterval( animationId );
                drawChart();
                $('#chartData td').removeClass('highlight');
            }


            /**
             * Draw the chart.
             *
             * Loop through each slice of the pie, and draw it.
             */

            function drawChart() {

                // Get a drawing context
                var context = canvas.getContext('2d');

                // Clear the canvas, ready for the new frame
                context.clearRect ( 0, 0, canvasWidth, canvasHeight );

                // Draw each slice of the chart, skipping the pull-out slice (if any)
                for ( var slice in chartData ) {
                    if ( slice != currentPullOutSlice ) drawSlice( context, slice );
                }

                // If there's a pull-out slice in effect, draw it.
                // (We draw the pull-out slice last so its drop shadow doesn't get painted over.)
                if ( currentPullOutSlice != -1 ) drawSlice( context, currentPullOutSlice );
            }


            /**
             * Draw an individual slice in the chart.
             *
             * @param Context A canvas context to draw on
             * @param Number The index of the slice to draw
             */

            function drawSlice ( context, slice ) {

                // Compute the adjusted start and end angles for the slice
                var startAngle = chartData[slice]['startAngle']  + chartStartAngle;
                var endAngle = chartData[slice]['endAngle']  + chartStartAngle;

                if ( slice == currentPullOutSlice ) {

                    // We're pulling (or have pulled) this slice out.
                    // Offset it from the pie centre, draw the text label,
                    // and add a drop shadow.

                    var midAngle = (startAngle + endAngle) / 2;
                    var actualPullOutDistance = currentPullOutDistance * easeOut( currentPullOutDistance/maxPullOutDistance, .8 );
                    startX = centreX + Math.cos(midAngle) * actualPullOutDistance;
                    startY = centreY + Math.sin(midAngle) * actualPullOutDistance;
                    context.fillStyle = 'rgb(' + chartColours[slice].join(',') + ')';
                    context.textAlign = "center";
                    context.font = pullOutLabelFont;
                    context.fillText( chartData[slice]['label'], centreX + Math.cos(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ), centreY + Math.sin(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ) );
                    context.font = pullOutValueFont;
                    // context.fillText( pullOutValuePrefix + chartData[slice]['value'] + " (" + ( parseInt( chartData[slice]['value'] / totalValue * 100 + .5 ) ) +  "%)", centreX + Math.cos(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ), centreY + Math.sin(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ) + 20 );
                    context.fillText( chartData[slice]['value'] + " (" + ( parseInt( chartData[slice]['value'] / totalValue * 100 + .5 ) ) +  "%)", centreX + Math.cos(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ), centreY + Math.sin(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ) + 20 );
                    context.shadowOffsetX = pullOutShadowOffsetX;
                    context.shadowOffsetY = pullOutShadowOffsetY;
                    context.shadowBlur = pullOutShadowBlur;

                } else {

                    // This slice isn't pulled out, so draw it from the pie centre
                    startX = centreX;
                    startY = centreY;
                }

                // Set up the gradient fill for the slice
                var sliceGradient = context.createLinearGradient( 0, 0, canvasWidth*.75, canvasHeight*.75 );
                sliceGradient.addColorStop( 0, sliceGradientColour );
                sliceGradient.addColorStop( 1, 'rgb(' + chartColours[slice].join(',') + ')' );

                // Draw the slice
                context.beginPath();
                context.moveTo( startX, startY );
                context.arc( startX, startY, chartRadius, startAngle, endAngle, false );
                context.lineTo( startX, startY );
                context.closePath();
                context.fillStyle = sliceGradient;
                context.shadowColor = ( slice == currentPullOutSlice ) ? pullOutShadowColour : "rgba( 0, 0, 0, 0 )";
                context.fill();
                context.shadowColor = "rgba( 0, 0, 0, 0 )";

                // Style the slice border appropriately
                if ( slice == currentPullOutSlice ) {
                    context.lineWidth = pullOutBorderWidth;
                    context.strokeStyle = pullOutBorderStyle;
                } else {
                    context.lineWidth = sliceBorderWidth;
                    context.strokeStyle = sliceBorderStyle;
                }

                // Draw the slice border
                context.stroke();
            }


            /**
             * Easing function.
             *
             * A bit hacky but it seems to work! (Note to self: Re-read my school maths books sometime)
             *
             * @param Number The ratio of the current distance travelled to the maximum distance
             * @param Number The power (higher numbers = more gradual easing)
             * @return Number The new ratio
             */

            function easeOut( ratio, power ) {
                return ( Math.pow ( 1 - ratio, power ) + 1 );
            }

        };

    </script>

    <!-- for chart end -->


</head>
<body>
<div class="mycontain inerFrame">
    <ul id="myTab" class="nav nav-tabs">
        <li id="departmentSalaryLi">
            <a href="#departmentSalaryList" data-toggle="tab">各部门工资统计报表</a>
        </li>
        <li id="departmentInfoSalaryLi">
            <a href="#departmentInfoSalaryList" data-toggle="tab">部门工资明细</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content" style="padding: 2%">
        <div class="tab-pane fade" id="departmentSalaryList">
            <%--条件查询--%>
            <form class="form-inline" style="margin: 2%">
                <div class="form-group">
                    <label for="workData">月份</label>
                    <select class="form-control" id="workData" name="workData">

                    </select>
                </div>
                <div class="form-group">
                    <label for="px">排序方式</label>
                    <select class="form-control" id="px" name="department">
                        <option value="0">升序</option>
                        <option value="1">降序</option>
                    </select>
                </div>
                <button type="button" class="btn btn-primary" id="searchBtn">查询</button>
                <button type="button" class="btn btn-primary" id="chartBtn">总览</button>
            </form>

            <div id="container">

                    <canvas id="chart" width="600" height="500"></canvas>

                    <table id="chartData">
                        <thead>
                            <tr><th>部门</th><th>总支出</th></tr>
                        </thead>
                        <tbody id="chartDataBody">
                        <tr style="color: #0DA068">
                            <td>部门1</td><td>25</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            <%--各部门工资统计报表列表--%>
            <table class="table infoTable ">
                <thead>
                <tr>
                    <th>部门</th>
                    <th>时间</th>
                    <th>总工资支出</th>
                    <th>所占比例</th>
                    <th>详情</th>
                    <%--启用编辑后该按钮变为保存，点击保存才会保存修改--%>
                </tr>
                </thead>

                <tbody id="listBody">

                </tbody>
            </table>

        </div>
        <%--各部门薪酬报表列表结束--%>
        <%--部门内个人薪酬明细--%>
        <div class="tab-pane fade" id="departmentSalaryInfoList">
            <button class="btn btn-primary" id="extDepartmentSalaryInfoBtn">退出</button>
            <table class="table infoTable ">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>时间</th>
                    <th>工时</th>
                    <th>所在部门</th>
                    <th>基本工资</th>
                    <th>职务工资</th>
                    <th>基本补贴</th>
                    <th>加班工资</th>
                    <th>税收</th>
                    <th>应发总工资</th>
                    <%--启用编辑后该按钮变为保存，点击保存才会保存修改--%>
                </tr>
                </thead>
                <tbody id="salaryBody">

                </tbody>
            </table>
            <div class="page_div">
                <span class="list_count"></span>条 &nbsp;&nbsp;
                共<span class="page_count"></span>页&nbsp;&nbsp;

            </div>
        </div>
        <%--部门内个人薪酬明细结束--%>
    </div>
</div>




</body>
<script>
    // 查询
    $("#searchBtn").click(function () {
        initList();
    });

    /*生成时间*/
    var last_year_month = function () {
        var d = new Date();
        var result = [];
        for (var i = 0; i < 24; i++) {
            d.setMonth(d.getMonth());
            var m = d.getMonth() + 1;
            m = m < 10 ? "0" + m : m;
            //在这里可以自定义输出的日期格式
            result.push(d.getFullYear() + "-" + m);
            //result.push(d.getFullYear() + "年" + m + '月');
        }
        return result;
    }

    for (var allinfo = last_year_month(), i = 0; i < allinfo.length; i++) {
        $("#workData").append("<option value='" + allinfo[i] + "'>" + allinfo[i] + "</option>");
    }


    /*初始化详情列表*/
    function commonSuccess(data) {
        $("#salaryBody").children("tr").remove();
        $(".page_num").remove();
        var ed = $.parseJSON(data);
        console.log(ed);
        var salTbody = $("#salaryBody");

        $.each(ed.list, function (i, item) {
            var workdata = item.workdata;
            var workHours = item.workHours;
            var name = item.employeeEntity.name;
            var empId = item.employeeEntity.id;
            var department = item.department.name;
            var basesalary = item.basesalary;
            var positionsalary = item.positionsalary;
            var basesubsidy = item.basesubsidy;
            var tax = item.tax;
            var insurance = item.insurance; // 加班工资
            var total = item.total;

            if (workdata != null && workdata != undefined && workdata != "") {
                workdata = getStrDate(workdata); // 格式化时间
                if (name == undefined || name == null) {
                    name = "";
                }
                if (workHours == undefined || workHours == null) {
                    workHours = 0;
                }
                if (department == undefined || department == null) {
                    department = "";
                }
                if (basesalary == undefined || basesalary == null) {
                    basesalary = 0;
                }
                if (positionsalary == undefined || positionsalary == "") {
                    positionsalary = 0;
                }
                if (basesubsidy == undefined || basesubsidy == null) {
                    basesubsidy = 0;
                }
                if (tax == undefined || tax == null) {
                    tax = 0;
                }
                if (insurance == undefined || insurance == null) {
                    insurance = 0;
                }
                if (total == undefined || total == null) {
                    total = 0;
                }
                var tr = "<tr>" +
                    "<td id='name'>" + name + "<input type='hidden' id='empId' value='" + empId + "'> </td> " +
                    "<td id='workdata'>" + workdata + "</td> " +
                    "<td id='workHours'>" + workHours + "</td> " +
                    "<td id='department'>" + department + "</td> " +
                    "<td id='basesalary'>" + basesalary + "</td> " +
                    "<td id='positionsalary'>" + positionsalary + "</td>" +
                    "<td id='basesubsidy'>" + basesubsidy + "</td>" +
                    "<td id='insurance'>" + insurance + "</td>" +
                    "<td id='tax'>" + tax + "</td>" +
                    "<td id='total'>" + total + "</td>" +
                    "</tr>";

                salTbody.append(tr);
            }
        });
    };

    function detailList(a, b, department, date) {

        $.ajax({
            type: "POST",
            url: "../salary/getPage",
            data: {
                pageIndex: a,
                pageSize: b,
                time: date,
                upOrDown: null,
                departmentId: department
            },
            success: function (data) {
                console.log(data);
                commonSuccess(data);
                var ed = $.parseJSON(data);
                $(".list_count").text(ed.pageNumber);
                $(".page_count").text(ed.pageCount);
                var end = ed.pageCount;
                var page_div = $(".page_div");
                for (var i = 1; i <= end; i++) {
                    var skip = 0;
                    if (i > 1) {
                        skip = (i - 1) * 10;
                    }
                    var aSpan = " <span class='page_num'>" +
                        "<a href='javascript:detailList(" + skip + "," + 10 + "," +
                        department + "," + date +
                        ")'>" + i + "</a></span>";
                    page_div.append(aSpan);
                }
            }
        });
    };


    /*详情*/
    $("body").on("click", ".editDepartmentSalaryCheckBtn", function () {
        $("#departmentInfoSalaryLi").css("display", "block").addClass("active");
        $("#departmentSalaryInfoList").addClass("active in");
        $("#departmentSalaryLi").removeClass("active");
        $("#departmentSalaryList").removeClass("active in");
        var p = $(this).parent().parent();
        var department = p.find(".departId").val();
        var date = p.find(".date").text();

        if (date != null && "" != date && date != undefined) {
            date = date + "-01";
        }
        detailList(0, 10, department, date);

    });
</script>
</html>
