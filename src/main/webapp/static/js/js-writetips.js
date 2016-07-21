function doLong(str) {
    $('#' + str + 'L').show();
    $('#' + str + 'S').hide();
    var tab = getselfwriteTab();
    seteditorheight(tab);
    saveTipState("L");
}
function doShort(str) {
    $('#' + str + 'S').show();
    $('#' + str + 'L').hide();
    var tab = getselfwriteTab();
    seteditorheight(tab);
    saveTipState("S");
}
function setTips(whichTip) {//which:0-8  9个选项卡中的一个 
    $("div[name='tips_2']").hide(); //长的都隐藏起来
    $("div[name='tips']").hide();  //短的都隐藏起来 
    $("#whichTip").val(whichTip);
    //判断专利类型，专利类型不同，显示内容不同：0 未选择，1发明，2实用
    var patentType = getipcType();
    if (patentType == "0") { // 0116_默认没有选择专利类型时候不显示撰写小贴士 
        $("div[name='tips']").hide(); 
        return;
    }
   
    if (whichTip != 3 && whichTip != 5 && whichTip != 6) {
        $("div[name='tips']:eq(" + whichTip + ")").show().siblings().hide(); 
        var tab = getselfwriteTab();
        seteditorheight(tab);
        return;
    }
    
    //01、先用userid和whichTip查对应小贴士状态  空新建保存  不空按状态展示
    var url = _RootPath + "SelfWriteOperator.aspx";
    var userId = $("#hiduserid").val();
   
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: {
            action: "gettipsstatebyuid",
            uid: userId,
            tagtype: whichTip
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                //layer.alert(sender.ErrorInfo);
            }
            else {
                var obj = sender.Option;
                if (obj == "") {//说明这个选项卡的状态没有被保存过  现在只有3和6来保存了 因为别的都很短 不用保存
                    //1、显示小贴士，这时候状态就是短的S
                    $("div[name='tips']:eq(" + whichTip + ")").show().siblings().hide();
                    var tab = getselfwriteTab();
                    seteditorheight(tab);
                    //2、新增这个小贴士的状态为S（就是原来的显示）
                    $.ajax({
                        type: "post",
                        url: url,
                        dataType: "json", //返回值类型
                        data: {
                            action: "savetipsstate",
                            state: "1", //0L 隐藏 1S 显示------------注意和曾经的需求对照
                            userid: userId,
                            tagtype: whichTip//自己定选项卡  即自己定的怎么去库里保存
                        },
                        success: function (sender) {
                            if (sender.ReturnValue != '0') {
                                // layer.alert(sender.ErrorInfo);
                            }
                            else {
                                //成功后拿到这个小贴士的id  给隐藏域赋值  
                                $('#tipIdHid').val(sender.Option);
                            }
                        },
                        error: function (sender) { }
                    });
                }
                else {    //能走到这里一定是3或者6  根据这个小贴士的状态来L隐藏/S显示就可以了
                 
                    for (var key in obj) {
                        $('#tipIdHid').val(obj[key].ID); //隐藏域保存小贴士的id，后面修改小贴士状态的时候要用到   新：也就是3和6用了
                        if (obj[key].State == "1") { //是“隐藏”  对应新需求就是L 长的 
                            if (whichTip == 3) {
                                $('#farmingL').show(); //长的显示出来
                                var tab = getselfwriteTab();
                                seteditorheight(tab);
                            } else if (whichTip == 6) {
                                $('#quanliL').show(); //长的显示出来
                                var tab = getselfwriteTab();
                                seteditorheight(tab);
                            } else if (whichTip == 5) {
                                $('#futushuomingL').show(); //长的显示出来
                                var tab = getselfwriteTab();
                                seteditorheight(tab);
                            }
                        } else if (obj[key].State == "0") {
                            //是“显示” 对应新需求就是S 短的
                            $("div[name='tips']:eq(" + whichTip + ")").show().siblings().hide();
                            var tab = getselfwriteTab();
                            seteditorheight(tab);
                        }
                    }
                }
            }
        },
        error: function (sender) { }
    }); 
}
function saveTipState(lorS) {    //保存3和6的状态
    var patent_type = getipcType();
    var userId = $("#hiduserid").val();
    var whichTip = $("#whichTip").val();
    var tipId = $('#tipIdHid').val();
    var tipsValue = "";
    var url = _RootPath + "SelfWriteOperator.aspx";
    //L:保存中长的，下次还是显示成长的  保存成1 
    if (lorS=="L") {
        tipsValue = 1;
    } else if (lorS == "S") {
        tipsValue = 0;
    } 
     //1、要修改后台状态值  
        $.ajax({
            type: "post",
            url: url,
            dataType: "json", //返回值类型
            data: {
                action: "updatetipsstate",
                id: tipId,
                state: tipsValue,
                userid: userId,
                tagtype: whichTip
            },
            success: function (sender) { 
            },
            error: function (sender) {   }
        }); 
}