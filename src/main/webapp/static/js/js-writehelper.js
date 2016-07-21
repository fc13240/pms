
$(function () {

    /*======next======*/
    $(".next a").click(function () { nextscroll() });

    function nextscroll() {

        var vcon = $(".v_cont ");
        var offset = ($(".v_cont li").width()) * -1;

        vcon.stop().animate({ left: offset }, "slow", function () {

            var firstItem = $(".v_cont ul li").first();
            vcon.find("ul").append(firstItem);
            $(this).css("left", "0px");

            circle();

        });

    };


    function circle() {

        var currentItem = $(".v_cont ul li").first();
        var currentIndex = currentItem.attr("index");

        $(".circle li").removeClass("circle-cur");
        $(".circle li").eq(currentIndex).addClass("circle-cur");

    }

    //setInterval(nextscroll,2000)

    /*======prev======*/
    $(".prev a").click(function () {

        var vcon = $(".v_cont ");
        var offset = ($(".v_cont li").width() * -1);

        var lastItem = $(".v_cont ul li").last();
        vcon.find("ul").prepend(lastItem);
        vcon.css("left", offset);
        vcon.animate({ left: "0px" }, "slow", function () {
            circle();
        })

    });

    /*======btn====circle======*/
    var animateEnd = 1;

    $(".circle li").click(function () {

        if (animateEnd == 0) { return; }

        $(this).addClass("circle-cur").siblings().removeClass("circle-cur");

        var nextindex = $(this).index();
        var currentindex = $(".v_cont li").first().attr("index");
        var curr = $(".v_cont li").first().clone();

        if (nextindex > currentindex) {

            for (var i = 0; i < nextindex - currentindex; i++) {

                var firstItem = $(".v_cont li").first();
                $(".v_cont ul").append(firstItem);

            }

            $(".v_cont ul").prepend(curr);

            var offset = ($(".v_cont li").width()) * -1;

            if (animateEnd == 1) {

                animateEnd = 0;
                $(".v_cont").stop().animate({ left: offset }, "slow", function () {

                    $(".v_cont ul li").first().remove();
                    $(".v_cont").css("left", "0px");
                    animateEnd = 1;

                });

            }

        } else {

            var curt = $(".v_cont li").last().clone();

            for (var i = 0; i < currentindex - nextindex; i++) {
                var lastItem = $(".v_cont li").last();
                $(".v_cont ul").prepend(lastItem);
            }

            $(".v_cont ul").append(curt);

            var offset = ($(".v_cont li").width()) * -1;

            $(".v_cont").css("left", offset);


            if (animateEnd == 1) {

                animateEnd = 0;
                $(".v_cont").stop().animate({ left: "0px" }, "slow", function () {

                    $(".v_cont ul li").last().remove();
                    animateEnd = 1;

                });

            }

        }

    });

})

 
     
//帮助提示
function helperv1(flag) {
    var helperv1 = $.layer({
        type: 1,
        title: false,
        offset: ['', ''],
        border: false,
        bgcolor: 'none', //设置层背景色
        area: ['120px', '520px'],
        page: { dom: '#helperv1' },
        closeBtn: false
    });
    var helpertop = $("#tabWrap").offset().top - 100;
    var helperleft = $("#tabWrap").offset().left + 60;
    $(".xubox_layer").css("top", helpertop + "px").css("left", helperleft + "px");
    //自设关闭
    $('#nextv1').on('click', function () {
        layer.close(helperv1);
        helperv1_2(flag);
    });

    // title[ '你好，layer。', 'border:none; background:#61BA7A; color:#fff;' ]
}
function helperv1_2(flag) {
    var helperv1_2 = $.layer({
        type: 1,
        title: false,
        offset: ['', ''],
        border: false,
        bgcolor: 'none', //设置层背景色
        area: ['1000px', '105px'],
        page: { dom: '#helperv1_2' },
        closeBtn: false
    });
    var helpertop = $(".center").offset().top - 35;
    var helperleft = $(".center").offset().left + 310;
    $(".xubox_layer").css("top", helpertop + "px").css("left", (helperleft) + "px");
    //自设关闭
    $('#nextv1_2').on('click', function () {
        layer.close(helperv1_2);
        helperv1_3(flag);
    });
}
function helperv1_3(flag) {
    var helperv1_3 = $.layer({
        type: 1,
        title: false,
        offset: ['', ''],
        border: false,
        bgcolor: 'none', //设置层背景色
        area: ['370px', '650px'],
        page: { dom: '#helperv1_3' },
        closeBtn: false
    });
    var helpertop = $(".right1").offset().top - 32;
    var helperleft = $(".right1").offset().left + 230;
    $(".xubox_layer").css("top", helpertop + "px").css("left", (helperleft) + "px");
    //自设关闭
    $('#nextv1_3').on('click', function () {
        layer.close(helperv1_3);
        if (flag == "1")//1代表不可操作
            helperv3();
        else
            helperv2();
    });
}
//引导操作--可操作
function helperv2() {
    var helperv2 = $.layer({
        type: 1,
        title: false,
        offset: ['', ''],
        border: false,
        bgcolor: 'none', //设置层背景色
        area: ['500px', '500px'],
        page: { dom: '#helperv2' },
        closeBtn: false
    });

    var helpertop = $("#div_ipctype").offset().top - 45;
    var helperleft = $("#div_ipctype").offset().left + 230;
    $(".xubox_layer").css("top", helpertop + "px").css("left", helperleft + "px");
    //自设关闭
    $("#helperv2").find(".step3").show();
    $("#helperv3").find(".step3").hide();
    $('#nextv2').on('click', function () {

        if (getipcType() != "0") {
            layer.close(helperv2);
            helperv2_2();
        }
        else {
            alert2();
        }
    });
}
function helperv2_2() {
    var helperv2_2 = $.layer({
        type: 1,
        title: false,
        offset: ['', ''],
        border: false,
        bgcolor: 'none', //设置层背景色
        area: ['600px', '600px'],
        page: { dom: '#helperv2_2' },
        closeBtn: false
    });
    //自设关闭
    $('#nextv2_2').on('click', function () {
        layer.close(helperv2_2);
        helperv2();
    });
    //自设关闭
    $('#nextv2_3').on('click', function () {
        layer.close(helperv2_2);
        //helperv4();
    });
}
//引导操作--不可操作
function helperv3() {
    var helperv3 = $.layer({
        type: 1,
        title: false,
        offset: ['', ''],
        border: false,
        bgcolor: 'none', //设置层背景色
        area: ['500px', '500px'],
        page: { dom: '#helperv3' },
        closeBtn: false
    });   //自设关闭

    var helpertop = $("#div_ipctype").offset().top - 42;
    var helperleft = $("#div_ipctype").offset().left + 230;
    $(".xubox_layer").css("top", helpertop + "px").css("left", helperleft + "px");

    $("#helperv2").find(".step3").remove();
    $("#helperv3").find(".step3").show();
    $('#nextv3').on('click', function () {
        layer.close(helperv3);
        helperv3_1();
    });
}
function helperv3_1() {
    var helperv3_1 = $.layer({
        type: 1,
        title: false,
        offset: ['', ''],
        border: false,
        bgcolor: 'none', //设置层背景色
        area: ['500px', '500px'],
        page: { dom: '#helperv3_1' },
        closeBtn: false
    });   //自设关闭
    $('#nextv3_1').on('click', function () {
        layer.close(helperv3_1);
    });
}
//新手上路
function helperv4(flag) {
    if (flag == false)//点击新手上路按钮，不查询是否提示新手上路，直接展示提示内容
    {
        var helperv4 = $.layer({
            type: 1,
            title: false,
            offset: ['', ''],
            border: false,
            bgcolor: '#eee', //设置层背景色
            area: ['500px', '500px'],
            page: { dom: '#helperv4' },
            closeBtn: [0, true]
        });
        //自设关闭
        $('#nextv4').on('click', function () {
            layer.close(helperv4);
        });
        $("#nohintv4").hide();
    }
    else {
        $(function () {
            //如果是新建项目判断是否首次进入
            var url = _UserUrl + "default.aspx?jsoncallback=?";
            var postData = {
                action: "getnowpagesessionuser",
                jsonmethod: "Cross_domain"
            };
            var id = getselfwriteID();
            $.getJSON(url, postData, function (sender) {
                if (sender.ReturnValue != '0') {

                }
                else {
                    //获取用户是否提示新手上路，默认提示sender.Option.UID 
                    var helperv4 = $.layer({
                        type: 1,
                        title: false,
                        offset: ['', ''],
                        border: false,
                        bgcolor: '#eee', //设置层背景色
                        area: ['500px', '500px'],
                        page: { dom: '#helperv4' },
                        closeBtn: [0, true]
                    });
                    //自设关闭
                    $('#nextv4').on('click', function () {
                        layer.close(helperv4); cleartempBorder();
                    });
                }
            });
            $("#nohintv4").show();
        });

    }
}
//新手上路--不再提示操作方法@@@接口设置用户是否不再提示
function nohintv4() {

    $(function () {
        //如果是新建项目判断是否首次进入
        var url = _UserUrl + "default.aspx?jsoncallback=?";
        var postData = {
            action: "getnowpagesessionuser",
            jsonmethod: "Cross_domain"
        };
        var id = getselfwriteID();
        $.getJSON(url, postData, function (sender) {
            if (sender.ReturnValue != '0') {

            }
            else {
                if ($("#nohintv4").is(":checked")) {
                    alert("用户：" + sender.Option.UID + "不再提示");
                }
                else {

                    alert("用户：" + sender.Option.UID + "提示");
                }
            }

        });
    });

}
//提示用户先选专利类型
function helperv5() {
    var helperv5 = $.layer({
        type: 1,
        title: ['用户帮助', 'border:none; background:#61BA7A; color:#fff;'],
        offset: ['', ''],
        border: false,
        bgcolor: '#eee', //设置层背景色
        area: ['280px', '235px'],
        page: { dom: '#helperv5' },
        closeBtn: [0, true]
    });
    //自设关闭
    $('#nextv5').on('click', function () {
        layer.close(helperv5);
        //helperv4();
    });
}

//
function helperv6() {
    var helperv6 = $.layer({
        type: 1,
        title: false,
        offset: ['', ''],
        border: false,
        bgcolor: 'none', //设置层背景色
        area: ['700px', '450px'],
        page: { dom: '#helperv6' },
        closeBtn: false
    });
    //自设关闭
    $('#helperv6cancel').on('click', function () {
        layer.close(helperv6);
        //helperv4();
    });
    $('#close_tc').on('click', function () {
        layer.close(helperv6); 
    });
    
//    var helperv6 = $.layer({
//        type: 1,
//        title: ['选择专利类型', 'border:none; background:#61BA7A; color:#fff;'],
//        offset: ['', ''],
//        border: false,
//        bgcolor: '#eee', //设置层背景色
//        area: ['675px', '422px'],
//        page: { dom: '#helperv6' },
//        closeBtn: [0, true]
//    }); 
}

//通过帮助--引导操作中的浮层操作的编号设置专利类型,id 1发明，2实用
function setipcTypeByID(id, eve) {
    if ($(eve).attr("class") == "bt")//已经是选中状态无效果
    {
        return;
    }
    $(eve).parent().find(".bt").attr("class", "bth");
    $(eve).attr("class", "bt");
    //获取选中的专利类型的备选大类模板 id
    var url = _RootPath + "SelfWriteOperator.aspx";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: {
            action: "gettemplatelist",
            patenttype: id
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                var obj = sender.Option;
                var s = [];
                for (var i = 0; i < obj.length && i < 3; i++) {
                    s.push(' <div class="step51" onclick="seltemp(\'' + obj[i].Template_No + '\');"> ' + clearkbfontcolor(obj[i].Title) + '></div>');
                }
                $("#helper_templist").html(s.join(""));
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });


    if (id == 1) {
        $("#div_ipctype").find("div:eq(0)").click();
    }
    else if (id == 2) {
        $("#div_ipctype").find("div:eq(1)").click();
    }
}

//选择一个备选模板
function seltemp(value) {
    $('#nextv2_3').click(); //选择了大类模板后，关闭浮层
     sethidKBTemplet("2");
    //高亮显示知识库--模板库
    settempBorder();
    //选择了一个备选模板大类，填充编辑区，同时知识库-模板库--专利类型下的发明名称小类模板，填充知识库--模板库 
    //保存大类模板的内容到当前专利项目
    trysaveeditor0bytemp(value, "", true);
}

//设置模板库高亮显示 2s
function settempBorder() {
    setTimeout(cleartempBorder, 3000);
    $(".right_right_bot").find(".model").css({
        "border": "2px solid #0085d0"
    });
    //border:2px solid #0085d0;
}
function cleartempBorder() {
    $(".right_right_bot").find(".model").css({
        "border": "none"
    });
    //border:2px solid #0085d0;
}



//非首次进入，选择专利类型的引导操作--可操作
function helperv7() {
    var helperv7 = $.layer({
        type: 1,
        title: false,
        offset: ['', ''],
        border: false,
        bgcolor: 'none', //设置层背景色
        area: ['500px', '500px'],
        page: { dom: '#helperv7' },
        closeBtn: false
    });
    var helpertop = $("#div_ipctype").offset().top - 45;
    var helperleft = $("#div_ipctype").offset().left + 230;
    $(".xubox_layer").css("top", helpertop + "px").css("left", helperleft + "px");

    $('#nextv7').on('click', function () {
        if (getipcType() != "0") {
            layer.close(helperv7);
            //编辑框提示语“选择一个模板开始撰写吧”
        }
        else {
            alert2();
        }
    });
}