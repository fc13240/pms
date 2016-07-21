
function setEditorToolsOfClaim(id, index) {
    $('#myEditor' + id).focus(function () {//#input换成你的input的ID  
        $(".edui-toolbar").css({
            "top": (60) + "px"
            , "z-index": -9,
            "margin-left": "100px"
        });
        var topvalue = (-211 - (204 * index));
        if (index == 0)
            topvalue = -211;
        $("#editor" + id).find(".edui-toolbar").css({
            "top": topvalue + "px", "z-index": 1000,
            "margin-left": "0px"

        }).show();
        $("#editor" + id).find(".edui-toolbar").find(".edui-btn-toolbar").find(".div").show();
        // alert("focus" + $("#hidclaimid").val());
    }); $("#myEditor" + id).focus();


}
function seteditor_claimelement() {
    //项目id和tab获取当前标签的已保存内容
    var url = _RootPath + "SelfWriteOperator.aspx";
    var swid = getselfwriteID();
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: {
            action: "getcelistbypid",
            pid: swid
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                var obj = sender.Option;
                if (obj.length == 0) {
                    var editorid = "";
                    editorid = "6_ele1"; //editor6_ele1 
                    for (var j = 1; j <= 3; j++) { //_ele1
                        $('#claimselement' + editorid + '_' + j).val('');
                    }
                    //增加sel的option的个数length，然后赋值选中项
                    //  alert($("#sel" + editorid ).length);
                    //汇总5--7的2）要素1没有要素关系
                    $("#sel" + editorid).html("");
                    $("#sel" + editorid).hide();
                } else {
                    var editorid = "";
                    var length = obj.length; //总数 

                    for (var i = 1; i <= length; i++) {
                        editorid = "6_ele" + (i);
                        if ($("#content6_ele_table").find("tr[id='editor" + editorid + "']").length == 0) {
                            $("#editor6_elevalue").find("td[name='ele_index']").text(i);
                            var text = $("#div_element").find("tbody:eq(0)").html();
                            text = text.replace(/value/gi, i);

                            $("#content6_ele_table").find("tbody:eq(0)").append(text);
                            $('#claimselement' + editorid + '_1').val(obj[i - 1].Title);
                            $('#claimselement' + editorid + '_2').val(obj[i - 1].Description);
                            $('#claimselement' + editorid + '_3').val(obj[i - 1].Limiting);
                            //其他的要素关系都需要补充当前这个要素的序号
                            //                            for (var ii = 1; ii < length; ii++) {
                            //                                var text = $("#sel6_ele" + ii).html();
                            //                                var selectedvalue = $("#sel6_ele" + ii).val();
                            //                                $("#sel6_ele" + ii).html(text + "<option value='" + length + "'>" + length + "</option>");
                            //                                $("#sel6_ele" + ii + " option").filter("[value='" + selectedvalue + "']").attr("selected", true);
                            //              
                            if (i == 1) {//汇总5--7的2）要素1没有要素关系
                                $("#sel" + editorid).html("");
                                $("#sel" + editorid).parent().hide();
                            } else {
                                $("#sel" + editorid).html((obj[i - 1].Relation == "0" ? "" : obj[i - 1].Relation));
                            }
                        }
                        else {

                            $('#claimselement' + editorid + '_1').val(obj[i - 1].Title);
                            $('#claimselement' + editorid + '_2').val(obj[i - 1].Description);
                            $('#claimselement' + editorid + '_3').val(obj[i - 1].Limiting);
                            if (i == 1) {//汇总5--7的2）要素1没有要素关系
                                $("#sel" + editorid).html("");
                                $("#sel" + editorid).parent().hide();
                            } else {
                                $("#sel" + editorid).html((obj[i - 1].Relation == "0" ? "" : obj[i - 1].Relation));
                            }
                        }

                        $("#content6_ele_table").find("tr[id='editor" + editorid + "']").attr("thisid", obj[i - 1].ID);

                    } seteditorheight(10);
                }
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
}


function addfirstclaimsid() {
    var thistempid = $("#content6").find("div[id='editor6']").attr("thistempid");
    if (thistempid == "")
        thistempid = 0;
    var textvalue = UM.getEditor("myEditor6").getContent();
    if ($.trim(UM.getEditor("myEditor6").getPlainTxt()) == "" || $.trim(UM.getEditor("myEditor6").getPlainTxt()) == "选择一个模板开始撰写吧") {
        textvalue = "";
    }
    var returnvalue = 0;
    var swid = getselfwriteID();
    var url = _RootPath + "SelfWriteOperator.aspx";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        async: false,
        data: {
            action: "saveclaim",
            patentid: swid,
            templateid: thistempid,
            content: encodeURIComponent(textvalue),
            is_mainclaim: 1
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {

            }
            else {
                $("#content6").find("div[id='editor6']").attr("thisid", sender.Option);
                returnvalue = true; // getnewclaimsid();
                AddPatentItem(swid, $.trim(UM.getEditor("myEditor6").getPlainTxt()));
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
    return returnvalue;
}

function getnewclaimsid() {
    var returnvalue = 0;
    var swid = getselfwriteID();
    var url = _RootPath + "SelfWriteOperator.aspx";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        async: false,
        data: {
            action: "saveclaim",
            patentid: swid,
            templateid: "0",
            content: "",
            is_mainclaim: 0
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {

            }
            else {
                returnvalue = sender.Option;
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
    return returnvalue;
}
//增加权利要求发明要素
function addnewclaimelement(flag) {
    if (flag == undefined) flag = true;
    if (checkelemax() && flag)//超过限额10个
    {
        layer.alert("发明要素超过10个不允许添加。");
        return;
    }
    if (checkelenameisnull() && flag) {
        layer.alert("要素名称不能为空。");
        return;
    }
    if (checkeleothersisnull() && flag) {
        layer.alert("同一条要素的要素描述、要素限定二者之一不为空。");
        return;
    }  //
    var swid = getselfwriteID();
    //补充add接口调用 
    var url = _RootPath + "SelfWriteOperator.aspx";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: {
            action: "saveclaimelement",
            patentid: swid,
            title: "",
            description: "",
            limiting: "",
            relation: ""
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                var i = $("#content6_ele_table").find("tr[id^='editor6_ele']").length;
                var editorid = "6_ele" + (i + 1);
                if ($("#content6_ele_table").find("tr[id='editor" + editorid + "']").length == 0) {
                    $("#editor6_elevalue").find("td[name='ele_index']").text((i + 1));
                    var text = $("#div_element").find("tbody:eq(0)").html();
                    text = text.replace(/value/gi, (i + 1));
                    $("#content6_ele_table").find("tbody:eq(0)").append(text);

                    $("#sel" + editorid).html("");

                }
                $("#content6_ele_table").find("tr[id='editor" + editorid + "']").attr("thisid", sender.Option);
                seteditorheight(10);
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
}
//跳转到发明要素表编辑区
function showclaimelement() {
    var swid = getselfwriteID();
    if (swid != "")
        window.location.hash = "#1=1&id=" + swid + "&tab=6&ele=1";
    else
        window.location.hash = "#1=1&tab=6&ele=1";
    save_selfwritebyTab(6);
    //获取发明要素数量，并填充
    seteditor_claimelement();
    $("#content6").hide();
    $("#content6_ele").show();
    ScrollTop();
    seteditorheight(10);
    //模版库变更
    var patentType = getipcType();
    showKindsDragModel(patentType, 10);
}
//看看别人怎么写：先保存再当前页面跳转
function showhelper(index) {
    var returnvalue = false;
    if (index == 2) {
        var flagvalue = checkeleinit();
        if (!flagvalue && checkelenameisnull()) {
            layer.alert("要素名称不能为空。");
            return;
        }
        if (!flagvalue && checkeleothersisnull()) {
            layer.alert("同一条要素的要素描述、要素限定二者之一不为空。");
            return;
        }  //

        returnvalue = save_selfwritebyTab(10, false);
    }
    else
        returnvalue = save_selfwritebyTab(6, false);
    var id = getselfwriteID();
    if (returnvalue)
        locationwin(_SelfWriteUrl + 'self/selfhelper_claim.aspx?index=' + index + '&id=' + id);
}

//查找发明要素
function selectelements(flag) {
    if (flag != undefined && !flag) {//如果传入flag是flase，则不显示要素关系列表，汇总5--7的5）  
        $("#content6").find("div[name='claims_ele']").hide();
        $("#content6").find("div[name='claims_ele']").html("");
        return;
    }
    var url = _RootPath + "SelfWriteOperator.aspx";
    var swid = getselfwriteID();
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: {
            action: "getcelistbypid",
            pid: swid
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                var obj = sender.Option;
                if (obj.length == 0) {
                    $("#content6").find("div[name='claims_ele']").hide();
                    $("#noele").show();
                    $("#hasele").hide();

                } else {
                    var s = [];
                    var showtext = "";
                    for (var i = 0; i < obj.length; i++) {
                        s.push(' <tr> ');
                        s.push('<td width="10%" align="center" valign="top">' + (i + 1) + ' </td>');
                        s.push('<td width="16%" align="left" valign="top"> ' + obj[i].Title + '  </td>');
                        s.push('<td width="28%" align="left" valign="top">  ' + obj[i].Description + ' </td>');
                        s.push('<td width="28%" align="left" valign="top"> ' + obj[i].Limiting + ' </td>');
                        if (obj[i].Relation == "" || obj[i].Relation == "0")
                            s.push(' <td width="18%" align="center" valign="top">无</td>');
                        else
                            s.push(' <td width="18%" align="center" valign="top"> ' + obj[i].Relation + ' </td>');
                        s.push('</tr>  ');
                        showtext += $.trim(obj[i].Title) + $.trim(obj[i].Description) + $.trim(obj[i].Limiting);
                    }
                    var s2 = [];
                    s2.push('<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center">');
                    s2.push('<tr><th width="10%" align="center" class="ptd">编号 </th>');
                    s2.push(' <th width="16%" align="left" class="ptd">要素名称</th>');
                    s2.push('<th width="28%" align="left" class="ptd">要素描述</th>');
                    s2.push(' <th width="28%" align="left" class="ptd">要素特征</th>');
                    s2.push('<th width="18%" align="center" class="ptd">要素关系</th> </tr> ');
                    var s3 = [];
                    s3.push('</table>');
                    if (showtext == "") {
                        s = [];
                        s2 = [];
                        s3 = [];
                        $("#noele").show();
                        $("#hasele").hide();
                        $("#content6").find("div[name='claims_ele']").hide();
                        $("#content6").find("div[name='claims_ele']").html("");
                    } else {
                        $("#noele").hide();
                        $("#hasele").show();
                        $("#content6").find("div[name='claims_ele']").html(s2.join("") + s.join("") + s3.join(""));
                        $("#content6").find("div[name='claims_ele']").show();
                    }


                    seteditorheight(6);
                }
                //setEditorWidth();
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
}
//设置切换回权利要求时，判断是否发明要素为空的loading
var loadishowclaimstips;
function setshowclaimstips() {
    loadishowclaimstips = layer.load('发明要素添加为空……正在跳转……');
    setTimeout(clearshowclaimstips, 2000);
}
function clearshowclaimstips() {
    layer.close(loadishowclaimstips);
    var id = getselfwriteID();
    trygeteditor6(6, id);
    selectelements(false);
    seteditorheight(6);
    $("#content6").show();
    $("#content6_ele").hide();
    ScrollTop();
    var patentType = getipcType();
    showKindsDragModel(patentType, 6);
}
//添加到权利要求按钮
function showclaims() {

    if (checkelenameisnull()) {
        layer.alert("要素名称不能为空。");
        return;
    }
    if (checkeleothersisnull()) {
        layer.alert("同一条要素的要素描述、要素限定二者之一不为空。");
        return;
    }  //

    var swid = getselfwriteID();
    if (swid != "")
        window.location.hash = "#1=1&id=" + swid + "&tab=6&ele=0";
    else
        window.location.hash = "#1=1&tab=6&ele=0";

    save_selfwritebyTab(10, false);
    var claimflag = checkclaimsisnull();
    //返回0直接覆盖，没有旧的，不用提示,不删除直接覆盖；返回1要求为空不用提示先删除再覆盖；返回2，先提示，确定，删除再覆盖，取消，不删除不覆盖
    if (claimflag == 2) {
        var showclaimsconfirm = layer.confirm('新生成的权利要求将替换现有的，是否确定要添加？', function (index) {
            tosetclaims(claimflag); layer.close(showclaimsconfirm);
        }, function (index) {
          //  toshowclaims(false);
        });
    } else {
        tosetclaims(claimflag);
    }
}
function tosetclaims(claimflag) {
    var swid = getselfwriteID();

    if (claimflag != 0)//不是0先删除
    {
        var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
        $.ajax({
            type: "post",
            url: url,
            dataType: "json", //返回值类型
            data: {
                action: "deleteclaim",
                patentid: swid
            },
            async: false,
            success: function (sender) {
                if (sender.ReturnValue != '0') {

                }
                else {

                }
            },
            error: function (sender) { }
        });
    }
    var elecount = 0;
    var index = 0;
    //claimselement
    var eleid = "";
    var txtvalue1 = ""; var txtvalue2 = ""; var txtvalue3 = ""; var txtvalue4 = "";
    $("#content6_ele_table").find("tr[id^='editor6_ele']").each(function () {
        index++;
        eleid = $(this).attr("id").replace("editor", "");
        txtvalue1 = $.trim($("#claimselement" + eleid + "_1").val());
        if (txtvalue1 != "")
            elecount = 1;
        txtvalue2 = $.trim($("#claimselement" + eleid + "_2").val());
        if (txtvalue2 != "")
            elecount = 1;
        txtvalue3 = $.trim($("#claimselement" + eleid + "_3").val());
        if (txtvalue3 != "")
            elecount = 1;
        txtvalue4 = $("#sel" + eleid).text();
        // alert("test" + txtvalue1 + txtvalue2 + txtvalue3 + txtvalue4);
        toaddclaimbyele(swid, index, txtvalue1, txtvalue2, txtvalue3, txtvalue4);
    });
    if (elecount == 0) {
        $("#noele").show();
        $("#hasele").hide();
        selectelements(false);
    }
    else {
        $("#noele").hide();
        $("#hasele").show();
        selectelements();
    }
    trygeteditor6(6, swid);
    seteditorheight(6);
    $("#content6").show();
    $("#content6_ele").hide();
    ScrollTop();
    var patentType = getipcType();
    showKindsDragModel(patentType, 6);
}
//通过要素生成权利要求 汇总5--7的7） 要素覆盖权利要求规则
function toaddclaimbyele(swid, index, txt1, txt2, txt3, txt4) {
    if (txt4 == undefined)
        txt4 = "";

    //a)要素关系为多：N.根据权利要求（2，3,6）所述的（第一个引用关系的要素名称），其特征在于（要素名称），（要素描述），（要素限定）。
    //b)要素关系为一个：N.根据权利要求（引用关系的要素序号）所述的（引用关系的要素名称），其特征在于（要素名称），（要素描述），（要素限定）。
    //c)要素关系为无:N.一种（要素名称），（要素描述），其特征在于（要素限定）。  
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    var txt5 = "";
    var content = "";
    if (txt4 == "" || txt4 == "0" || txt4 == "无") {//无关系
        content = index + ".一种" + txt1 + "，" + txt2 + "，其特征在于" + txt3 + "。";
    }
    else if (txt4.indexOf(',') > -1) {//关系为多
        //alert("1testtest" + txt4.substring(0, txt4.indexOf(',')));
        txt5 = $.trim($("#claimselement6_ele" + txt4.substring(0, txt4.indexOf(',')) + "_1").val());
        var txtv = txt4.replace(/,/g, "，");
        content = index + ".根据权利要求" + txtv + "所述的" + txt5 + "，其特征在于" + txt1 + "，" + txt2 + "，" + txt3 + "。";
    }
    else {//关系为1
        txt5 = $.trim($("#claimselement6_ele" + txt4 + "_1").val());
        content = index + ".根据权利要求" + txt4 + "所述的" + txt5 + "，其特征在于" + txt1 + "，" + txt2 + "，" + txt3 + "。";
    }
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        async: false,
        data: {
            action: "saveclaim",
            patentid: swid,
            templateid: "0",
            content: content,
            is_mainclaim: (index == 1 ? 0 : 1)
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
            }
            else {
            }
        },
        error: function (sender) { }
    });
}
//取消，不删除不覆盖
function toshowclaims(flag) {
    var elecount = 0;
    //claimselement
    var eleid = "";
    var txtvalue = "";
    $("#content6_ele_table").find("tr[id^='editor6_ele']").each(function () {
        eleid = $(this).attr("id").replace("editor", "");
        txtvalue = $.trim($("#claimselement" + eleid + "_1").val());
        if (txtvalue != "")
            elecount = 1;
        txtvalue = $.trim($("#claimselement" + eleid + "_2").val());
        if (txtvalue != "")
            elecount = 1;
        txtvalue = $.trim($("#claimselement" + eleid + "_3").val());
        if (txtvalue != "")
            elecount = 1;
    });
    if (elecount == 0)//如果要素为空，提示“发明要素添加为空……正在跳转……”，2s后返回没有发明要素表的权利要求编辑区2.18；
    {
        $("#noele").show();
        $("#hasele").hide();
        setshowclaimstips();
    }
    else {
        $("#noele").hide();
        $("#hasele").show();
        var id = getselfwriteID();
        trygeteditor6(6, id);
        selectelements(flag);
        seteditorheight(6);
        $("#content6").show();
        $("#content6_ele").hide();
        ScrollTop();
        var patentType = getipcType();
        showKindsDragModel(patentType, 6);
    }
}
//返回权利要求编辑按钮
function returnclaims() {
    var flagvalue = checkeleinit();
    if (!flagvalue && checkelenameisnull()) {
        layer.alert("要素名称不能为空。");
        return;
    }
    if (!flagvalue && checkeleothersisnull()) {
        layer.alert("同一条要素的要素描述、要素限定二者之一不为空。");
        return;
    }  //

    var swid = getselfwriteID();
    if (swid != "")
        window.location.hash = "#1=1&id=" + swid + "&tab=6&ele=0";
    else
        window.location.hash = "#1=1&tab=6&ele=0";

    save_selfwritebyTab(10, false);
    var elecount = 0;
    //claimselement
    var eleid = "";
    var txtvalue = "";
    $("#content6_ele_table").find("tr[id^='editor6_ele']").each(function () {
        eleid = $(this).attr("id").replace("editor", "");
        txtvalue = $.trim($("#claimselement" + eleid + "_1").val());
        if (txtvalue != "")
            elecount = 1;
        txtvalue = $.trim($("#claimselement" + eleid + "_2").val());
        if (txtvalue != "")
            elecount = 1;
        txtvalue = $.trim($("#claimselement" + eleid + "_3").val());
        if (txtvalue != "")
            elecount = 1;
    });
    if (elecount == 0)//如果要素为空，提示“发明要素添加为空……正在跳转……”，2s后返回没有发明要素表的权利要求编辑区2.18；
    {
        $("#noele").show();
        $("#hasele").hide();
        setshowclaimstips();
    }
    else {
        $("#noele").hide();
        $("#hasele").show();
        var id = getselfwriteID();
        trygeteditor6(6, id);
        selectelements(false);
        seteditorheight(6);
        $("#content6").show();
        $("#content6_ele").hide();
        ScrollTop();
        var patentType = getipcType();
        showKindsDragModel(patentType, 6);
    }
}

//检查是否要素数量超过最大限额10个，返回true/false
function checkelemax() {
    var flag = false;
    var count = $("#content6_ele_table").find("tr[id^='editor6_ele']").length;
    if (count >= 10)
        flag = true;
    return flag;
}

//汇总5--7的3）中的检查验证方法
//检查是否是初始化，只有一个要素，且名称、要素描述、要素限定都为空，返回true/false
function checkeleinit() {
    var flag = false;
    var count = $("#content6_ele_table").find("tr[id^='editor6_ele']").length;
    if (count > 1 || count == 0)
        return flag;
    var txt1 = $.trim($("#claimselement6_ele1_1").val());
    var txt2 = $.trim($("#claimselement6_ele1_2").val());
    var txt3 = $.trim($("#claimselement6_ele1_3").val());
    if (txt1 == "" && txt2 == "" && txt3 == "" && count == 1)
        flag = true;
    return flag;
}
//检查要素名称文本框是否有空的，返回true/false
//claimselement6_ele1_1
function checkelenameisnull() {
    var flag = false;
    var index = 0;
    $("#content6_ele_table").find("tr[id^='editor6_ele']").each(function () {
        index++;
        if ($.trim($("#claimselement6_ele" + index + "_1").val()) == "")
            flag = true;
    });
    return flag;
}
//检查每一条要素的要素描述、要素限定二者有一个不为空，返回true/false
//claimselement6_ele1_2  claimselement6_ele1_3
function checkeleothersisnull() {
    var flag = false;
    var index = 0;
    $("#content6_ele_table").find("tr[id^='editor6_ele']").each(function () {
        index++;
        if ($.trim($("#claimselement6_ele" + index + "_2").val()) == "" && $.trim($("#claimselement6_ele" + index + "_3").val()) == "")
            flag = true;
    });
    return flag;
}

var claimslist;
//检查是否权利要求为空   //汇总5--7的4）如果权利要求为空，不提示直接覆盖；如果不为空，提示是否覆盖
function checkclaimsisnull() {//返回0直接覆盖，没有旧的，不用提示；返回1先删除再覆盖，但要求为空，不用提示；返回2，先提示，删除再覆盖
    var flag = 1;
    var textvalue = "";
    var swid = getselfwriteID();
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    var datas = { action: "getclaimbypid", pid: swid };
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: datas,
        async: false,
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                flag = 1;
            }
            else {
                var obj = sender.Option;
                if (obj.length == 0) { //没有则显示“选择一个模板开始撰写吧” 
                    flag = 0;
                }
                else { //有则获取
                    for (var i = 0; i < obj.length; i++) {
                        if (flag == 2) break;
                        $("#hiddivselfhint").html(obj[i].Content);
                        $("#hiddivselfhint").find("abbr[id='highlight']:hidden").remove();
                        $("#hiddivselfhint").find("abbr[id='highlight1']:hidden").remove();
                        textvalue = $.trim($("#hiddivselfhint").text());
                        if (textvalue != "") {
                            flag = 2;
                        }
                        if (flag == 1 && $("#hiddivselfhint").find("img").length > 0)
                            flag = 2;
                        $("#hiddivselfhint").html("");
                    }
                }
            }
        }
    });
    return flag;
}

//展开要素关系选择框
function showrelation(eve) {
    var reid = $(eve).prev().attr("id");
    var topvalue = $("#" + reid).offset().top - 20;
    var leftvalue = $("#" + reid).offset().left - 180;
    var count = $("#content6_ele_table").find("tr[id^='editor6_ele']").length;
    var nowid = reid.replace("sel6_ele", "");
    var nowrelation = $(eve).prev().text() + ",";
    var s = [];

    s.push('<li>');
    if (nowrelation == "无,") {
        s.push(' <div> <input type="checkbox" onclick="checknorelation(this);" checked="checked" name="relation"  value="" />无</div>');
    } else {
        s.push(' <div> <input type="checkbox" onclick="checknorelation(this);" name="relation"  value="" />无</div>');
    }
    s.push('</li>');
    for (var i = 1; i <= count; i++) {
        s.push('<li>');
        if (i == nowid) {
            s.push(' <div style="color:Gray"> <input type="checkbox" disabled="disabled" name="" value="' + i + '" />' + i + '</div>');
        }
        else if (nowrelation == "无,") {
            s.push(' <div style="color:Gray"> <input type="checkbox" name="relation" disabled="disabled" name="" value="' + i + '" />' + i + '</div>');
        } else if (nowrelation.indexOf(i + ',') > -1) {
            s.push(' <div> <input type="checkbox" name="relation" checked="checked" value="' + i + '" />' + i + '</div>');
        } else {
            s.push(' <div> <input type="checkbox" name="relation"  value="' + i + '" />' + i + '</div>');
        }
        s.push('</li>');
    }

    $("#ulrelation").html(s.join(""));
    $("#divrelation").css({ "top": topvalue + "px", "left": (leftvalue-122) + "px", "position": "absolute", "z-index": "9999999" }).show();
    $("#divrelation").attr("value", reid);
}
function checknorelation(eve) {
    if ($(eve).is(":checked")) { //选择了无 
        $("#divrelation").find("input[name='relation']").each(function () {
            if ($(this).attr("value") != "") {
                $(this).attr("disabled", "disabled");
                $(this).parent().attr("style", "color:Gray");
                $(this).removeAttr("checked");
            }
        });
    } else {
        $("#divrelation").find("input[name='relation']").each(function () {
            if ($(this).attr("value") != "") {
                $(this).attr("disabled", false);
                $(this).parent().attr("style", "");
            }
        });
    }
}
function initshowrelation() {
    $(document).click(function (event) {
        var e = event || window.event;
        var elem = e.srcElement || e.target;
        while (elem) {
            if (elem.id == "divrelation" || elem.id == "relationicon") {
                return;
            }
            elem = elem.parentNode;
        }
        if ($('#divrelation').is(':visible')) {
            $('#relationclose').click();
        }
    });
}

function relationclose() {
    $('#divrelation').hide();
}
function relationsubmit() {
    var reid = $("#divrelation").attr("value");
    var relatvalue = "";
    $('input:checkbox[name=relation]:checked').each(function () {
        if ($(this).attr("value") == "")
            relatvalue += ",无";
        else
            relatvalue += "," + $(this).attr("value");
    });
    if (relatvalue.length > 0)
        relatvalue = relatvalue.substring(1);
    $("#" + reid).text(relatvalue);
    $('#divrelation').hide();
   // $("#showrelation").attr("title", relatvalue);
}