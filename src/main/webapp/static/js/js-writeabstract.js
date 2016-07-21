//自动生成摘要
function autoabstract() {
    var swid = getselfwriteID();
    //发明名称、技术领域、背景技术、发明内容、具体实施方式
    //已经编辑了一部分的摘要，则需要清除内容之后，才能生成

    var txtvalue1 = gettxt1(swid, 1);
    var txtvalue2 = gettxt2(swid, 2);

    var msg = "";

    if (txtvalue1 == "") {
        msg += "、技术领域";
    }
    if (txtvalue2 == "") {
        msg += "、主权项";
    }
    if (msg.length > 1) {
        msg = msg.substring(1) + "内容为空，请添加后才能生成摘要。";
        layer.alert(msg);
        return;
    }
    var txtvalue7 = $.trim(UM.getEditor('myEditor7').getPlainTxt()); //获取带格式的纯文本
    if (txtvalue7 != "") {
        var msg1 = "自动生成摘要时，当前已编辑摘要部分内容将被全部清空，请确认是否继续生成摘要？";
        var test = layer.confirm(msg1, function () {
            UM.getEditor('myEditor7').setContent(txtvalue1 + txtvalue2, false);
            setselfhint(); setselfexample();
            showtextlimite(7);
            layer.close(test);
            return false;
        }, function () {
            return false;
        });
    }
    else {
        UM.getEditor('myEditor7').setContent(txtvalue1 + txtvalue2, false);
        setselfhint(); setselfexample();
        showtextlimite(7);
    } 
}
function gettxt2(id) {
    var returnvalue = "";
    var url = _RootPath + "SelfWriteOperator.aspx";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        async: false,
        data: {
            action: "getclaimbypid",
            pid: id
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                var obj = sender.Option; 
                if (obj.length > 0 && obj[0].Content != "") {
                    returnvalue = obj[0].Content;
                }
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
    return returnvalue;
}


function gettxt1(id, tab) {
    var returnvalue = "";
    var url = _RootPath + "SelfWriteOperator.aspx";
    var datas = { action: "getpatentipcbypid", pid: id };

    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        async: false,
        data: datas,
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                var obj = sender.Option;
                for (var key in obj) {
                   // UM.getEditor('myEditor7_tools').setContent(obj[key].Ipc, false);
                   // $('#myEditor7_tools').parent().parent().hide();
                    returnvalue += obj[key].Ipc; // UM.getEditor('myEditor7_tools').getContentTxt();
                }
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
    return returnvalue;
}