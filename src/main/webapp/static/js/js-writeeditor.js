//编辑区脚本
//设置编辑区 tab是标签-1九个标签都填充 对应标签0~8，temp是模板id -2代表只切换不填充编辑区，但填充编辑栏 -1代表清空 0代表通过当前编辑的项目id获取当前标签的内容  id是当前编辑项目的id
function seteditor(tab, temp, id, uid) {

    $("div[id^='content']").hide();
    $("div[id='content" + tab + "']").show();

    if (temp == 0 && id == "") { //temp是0.id是空初始化某个编辑区
        tryiniteditor(tab, temp, id, uid);
    }
    else if (temp == 0 && id != "") { //temp是0.id存在，获取内容到tab所在的编辑区，如果内容不存在则初始化，否则获取填充
        trygeteditor(tab, temp, id, uid);
    } else if (temp != 0) { //temp不是0则替换模版到当前XXX
        seteditorbyconfirm(tab, temp, id);
    }
    searchEditor(tab); setEditorWidth();

    //    setEditorTools();
}
//判断编辑区文本是否存在 存在要先提示清空再编辑
function seteditorbyconfirm(tab, tempid, id, tab6flag) {
    hidekeyupcidian();
    $("#cidiantishi").hide();
    if (tab == "0") {
        trysaveeditor0bytemp(tempid, id, true);
    }
    else if (tab == "1" || tab == "2" || tab == "4") {
        trysaveeditor124bytemp(tab, tempid, id, true);
    }
    else if (tab == "3") {
        trysaveeditor3bytemp(tab, tempid, id, true);
    }
    else if (tab == "6") {
        var editorid = $("#hidclaimid").val();
        if (tab6flag == undefined)
            tab6flag = 1;
        if (editorid != "") {
            trysaveeditor6bytemp(editorid, tempid, id, true, tab6flag);
        }
        else
            trysaveeditor6bytemp(tab, tempid, id, true, tab6flag);
    }
}
//初始化//temp是0，id如果为空是初始化
function tryiniteditor(tab, temp, id, uid) {
    $("#cidiantishi").hide();
    $("#editor" + tab).show();
    $("#hidselfhint").val("0");
    $("#hidselfexample").val("0");
    if (tab == "0") {
        //        var editorOption = {
        //            autoClearinitialContent: true,
        //            wordCount: false,
        //            elementPathEnabled: false,
        //            initialFrameHeight: 180,
        //            initialFrameWidth: 804,
        //            focus: false,
        //            autoClearinitialContent: false //是否自动清除编辑器初始内容，注意：如果focus属性设置为false
        //        };
        //        var editor_a = new baidu.editor.ui.Editor(editorOption);
        //        editor_a.render('txtmyEditor');

        UM.getEditor('myEditor' + tab, { toolbar: [
            'source | undo redo | fontfamily fontsize | bold italic underline | forecolor backcolor |',
            'justifyleft justifycenter justifyright justifyjustify | selfhint selfexample'
         ]
        });
        $(".edui-icon-selfhint").text("撰写提示");
        $(".edui-icon-selfexample").text("参考示例");
    } else {
        UM.getEditor('myEditor' + tab, { toolbar: [
            'source | undo redo | fontfamily fontsize | bold italic underline | forecolor backcolor |',
            'justifyleft justifycenter justifyright justifyjustify | image |  selfhint selfexample'
         ]
        });
        $(".edui-icon-selfhint").text("撰写提示");
        $(".edui-icon-selfexample").text("参考示例");
        //$(".edui-formula-wrapper").append("<div>aa</div>");
    }

    if (tab == "3") {
        UM.getEditor('myEditor3_1', { toolbar: [
            'source | undo redo | fontfamily fontsize | bold italic underline | forecolor backcolor |',
            'justifyleft justifycenter justifyright justifyjustify | image |  selfhint selfexample'
         ]
        });
        $(".edui-icon-selfhint").text("撰写提示");
        $(".edui-icon-selfexample").text("参考示例");
        UM.getEditor('myEditor3_2', { toolbar: [
            'source | undo redo | fontfamily fontsize | bold italic underline | forecolor backcolor |',
            'justifyleft justifycenter justifyright justifyjustify | image |  selfhint selfexample'
         ]
        });
        $(".edui-icon-selfhint").text("撰写提示");
        $(".edui-icon-selfexample").text("参考示例");
    }
    UM.getEditor("myEditor" + tab).setContent("<p style=\"font-family:microsoft yahei,宋体;font-size:16px;\">选择一个模板开始撰写吧</p>", false);
    if (tab == "3") {
        UM.getEditor("myEditor3_1").setContent("<p style=\"font-family:microsoft yahei,宋体;font-size:16px;\">选择一个模板开始撰写吧</p>", false);
        UM.getEditor("myEditor3_2").setContent("<p style=\"font-family:microsoft yahei,宋体;font-size:16px;\">选择一个模板开始撰写吧</p>", false);
        tryseteditor3tools("3");
    }
    if (tab == "0" || tab == "7") {
        showtextlimite(tab);
    }
    focustextlimite();
    focustishi(tab);
    keyupeditorcidian(tab);
    seteditorheight(tab);
}

//获取//temp是0，id如果存在则是获取，否则是初始化
function trygeteditor(tab, temp, id, uid) {
    $("#cidiantishi").hide();
    var patentType = getipcType();
    // alert("test"+patentType);
    if (tab == "0") {
        trygeteditor0(id);
    }
    else if (tab == "1" || tab == "2" || tab == "4") {
        trygeteditor124(tab, id);
    }
    else if (tab == "3") {
        trygeteditor3(tab, id);
    }
    else if (tab == "6") {

        //如果ele=1则返回到发明要素表，否则返回到权利要求
        var eleindex = getselfwriteEle();
        if (eleindex == "1") {
            //获取发明要素数量，并填充
            seteditor_claimelement();
            $("#content6").hide();
            $("#content6_ele").show();
            ScrollTop();
            //模版库变更
            var patentType = getipcType();
            showKindsDragModel(patentType, 10);
        } else {
            trygeteditor6(tab, id);
        }
    }
    else if (tab == "7") {
        trygeteditor7(tab, id);
    }
    focustextlimite();
    focustishi(tab);
    keyupeditorcidian(tab);
    seteditorheight(tab);
}

//发明名称 
//获取当前id的发明名称
function trygeteditor0(id) {
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: {
            action: "getpatent",
            id: id
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                var obj = sender.Option;
                if (obj.Title == "") {
                    UM.getEditor('myEditor0').setContent("", false);
                } else {
                    UM.getEditor('myEditor0').setContent(obj.Title, false);
                }
                //alert("testtest" + obj.Title);
                setselfhint(); setselfexample();
                showtextlimite(0); focustextlimite();
                $("#editor0").attr("thistempid", obj.TemplateID); //设置当前模版id
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
    UM.getEditor('myEditor0', { toolbar: [
            'source | undo redo | fontfamily fontsize | bold italic underline | forecolor backcolor |',
            'justifyleft justifycenter justifyright justifyjustify | selfhint selfexample'
         ]
    });
    $(".edui-icon-selfhint").text("撰写提示");
    $(".edui-icon-selfexample").text("参考示例");
    $("#editor0").show();
}

//保存发明名称
function trysaveeditor0(id, isasync) {

    var returnvalue = false;
    if (isasync == undefined) { isasync = true; }
    var tempid = $("#editor0").attr("thistempid");
    if (tempid == "" || tempid == undefined)
        tempid = 0;
    var userid = $("#hiduserid").val();
    var simple_title = $.trim(UM.getEditor("myEditor0").getPlainTxt());
    var title = UM.getEditor("myEditor0").getContent();
    if (simple_title == "" || simple_title == "选择一个模板开始撰写吧") {
        title = "";
        simple_title = "";
    }

    $("#hiddivselfhint").html($("#myEditor0").html());
    $("#hiddivselfhint").find("abbr[id='highlight']:hidden").remove();
    $("#hiddivselfhint").find("abbr[id='highlight1']:hidden").remove();
    simple_title = $.trim($("#hiddivselfhint").text());
    $("#hiddivselfhint").html("");
    var patent_type = getipcType();
    if (patent_type == "0") {
        alert2();
        return;
    }
    //    var error_content = $.trim($("#error_content0").html());
    //   
    //    if (error_content.indexOf("已经超过上限") > -1) {
    //      layer.alert(error_content); return false;
    //    }
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";

    var datas;
    if (id == "") {
        datas = { action: "savepatent", templateid: tempid, title: encodeURIComponent(title), simple_title: encodeURIComponent(simple_title), userid: userid, patent_type: patent_type };
    } else {
        datas = { action: "updatepatent", id: id, templateid: tempid, title: encodeURIComponent(title), simple_title: encodeURIComponent(simple_title), userid: userid, patent_type: patent_type };
    }
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        async: isasync,
        data: datas,
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo); returnvalue = false;
            }
            else {
                returnvalue = true;
                if (id == "") {
                    id = sender.Option; //@通过接口得到新增的项目文件ID值
                    var tabindex = $("#tabWrap").find(".tab1").attr("value");
                    window.location.hash = "#1=1&id=" + id + "&tab=" + tabindex;
                    addeditor7(id); //创建专利时候增加摘要记录，而后操作时候都是修改 
                    addnewclaimelement(false); //创建专利时候增加一个发明要素表
                }
                AddPatentItem(id, $.trim(UM.getEditor("myEditor0").getPlainTxt()));
                //   alert("专利标题等基本信息修改成功！");
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); returnvalue = false; }
    });
    return returnvalue;
}
//获取某模版的内容填充当前文本框发明名称并保存
function trysaveeditor0bytemp(tempid, id, isasync) {
    var returnvalue = false;
    if (isasync == undefined) { isasync = true; }

    var jointitle = geteditor0bytemp(tempid);
    jointitle = ("<p>" + jointitle + "</p>");
    tempid = $("#hidtempid").val();
    $("#editor0").attr("thistempid", tempid);
    var userid = $("#hiduserid").val();
    var title = UM.getEditor("myEditor0").getContent();

    if (jointitle == null)
        jointitle = "";
    if ($.trim(UM.getEditor("myEditor0").getPlainTxt()) != "" && $.trim(UM.getEditor("myEditor0").getPlainTxt()) != "选择一个模板开始撰写吧")
        title = title + "<br/><br/><br/>" + jointitle;
    else
        title = jointitle;
    if (title == "") {
        UM.getEditor('myEditor0').setContent("", false);

    } else {
        UM.getEditor("myEditor0").setContent(title, false);
        setselfhint(); setselfexample();
    }
    var simple_title = $.trim(UM.getEditor("myEditor0").getPlainTxt());
    showtextlimite(0);
    var patent_type = getipcType();
    if (patent_type == "0") {
        alert2();
        return;
    }
    returnvalue = true;
    //    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";

    //    var datas;
    //    if (id == "") {
    //        datas = { action: "savepatent", templateid: tempid, title: encodeURIComponent(title), simple_title: encodeURIComponent(simple_title), userid: userid, patent_type: patent_type };
    //    } else {
    //        datas = { action: "updatepatent", id: id, templateid: tempid, title: encodeURIComponent(title), simple_title: encodeURIComponent(simple_title), userid: userid, patent_type: patent_type };
    //    }
    //    $.ajax({
    //        type: "post",
    //        url: url,
    //        dataType: "json", //返回值类型
    //        async: isasync,
    //        data: datas,
    //        success: function (sender) {
    //            if (sender.ReturnValue != '0') {
    //                layer.alert(sender.ErrorInfo); returnvalue = false;
    //            }
    //            else {
    //                returnvalue = true;
    //                if (id == "") {
    //                    id = sender.Option; //@通过接口得到新增的项目文件ID值
    //                    //获取编辑区内容并保存edit项目文件 id 
    //                    var tabindex = $("#tabWrap").find(".tab1").attr("value");
    //                    window.location.hash = "#1=1&id=" + id + "&tab=" + tabindex;
    //                    addeditor7(id); //创建专利时候增加摘要记录，而后操作时候都是修改
    //                    addnewclaimelement(); //创建专利时候增加一个发明要素表
    //                }
    //                AddPatentItem(id, $.trim(UM.getEditor("myEditor0").getPlainTxt()));
    //            }
    //        },
    //        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); returnvalue = false; }
    //    });
    return returnvalue;
}
function geteditor0bytemp(tempid) {
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    var returnvalue = "";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        async: false,
        data: {
            action: "gettemplatebyno",
            template_no: tempid
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                var obj = sender.Option;
                if (obj != null) {
                    returnvalue = obj.Title.replace(/<\/abbr>/g, "</abbr><bbbb class=\"magin-abbr\">&nbsp;</bbbb>").replace(/<abbr/g, "<bbbb class=\"magin-abbr\">&nbsp;</bbbb><abbr").replace(/<bbbb class="magin-abbr">&nbsp;<\/bbbb><bbbb class="magin-abbr">&nbsp;<\/bbbb>/g, "<bbbb class=\"magin-abbr\">&nbsp;</bbbb><bbbb class=\"magin-abbr\">&nbsp;</bbbb>").replace(/<bbbb class=/g, "<abbr class=").replace(/<\/bbbb>/g, "</abbr>");
                    $("#hidtempid").val(obj.ID);
                }
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
    return returnvalue;
}

function trysaveeditor0byfirst(keywords) {
    var swid = getselfwriteID();
    var returnvalue = false;
    var tempid = 0;
    var userid = $("#hiduserid").val();

    var patent_type = getipcType();
    if (patent_type == "0") {
        alert2();
        return;
    }
    //    var error_content = $.trim($("#error_content0").html());
    //   
    //    if (error_content.indexOf("已经超过上限") > -1) {
    //      layer.alert(error_content); return false;
    //    }
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";

    var datas;
    if (swid == "") {
        datas = { action: "savepatent", templateid: tempid, title: "", simple_title: "", userid: userid, patent_type: patent_type };
        $.ajax({
            type: "post",
            url: url,
            dataType: "json", //返回值类型
            async: false,
            data: datas,
            success: function (sender) {
                if (sender.ReturnValue != '0') {
                    layer.alert(sender.ErrorInfo); returnvalue = false;
                }
                else {
                    returnvalue = true;
                    if (swid == "") {
                        swid = sender.Option; //@通过接口得到新增的项目文件ID值
                        var tabindex = $("#tabWrap").find(".tab1").attr("value");
                        window.location.hash = "#1=1&id=" + swid + "&tab=" + tabindex;
                        addeditor7(swid); //创建专利时候增加摘要记录，而后操作时候都是修改 
                        addnewclaimelement(false); //创建专利时候增加一个发明要素表
                    }
                    AddPatentItem(swid, $.trim(keywords));
                    //   alert("专利标题等基本信息修改成功！");
                }
            },
            error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); returnvalue = false; }
        });

    } else returnvalue = true;

    return returnvalue;
}
//技术领域、背景技术、具体实施方式
//获取当前id的XXX
function trygeteditor124(tab, id) {
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    var datas;
    var returnvalue = "";
    if (tab == "1") {
        datas = { action: "getpatentipcbypid", pid: id };
    }
    else if (tab == "2") {
        datas = { action: "getpatenttechnologybypid", pid: id };
    }
    else if (tab == "4") {
        datas = { action: "getpatentwaybypid", pid: id };
    }

    UM.getEditor("myEditor" + tab, { toolbar: [
            'source | undo redo | fontfamily fontsize | bold italic underline | forecolor backcolor |',
            'justifyleft justifycenter justifyright justifyjustify | image |  selfhint selfexample'
         ]
    });
    $(".edui-icon-selfhint").text("撰写提示");
    $(".edui-icon-selfexample").text("参考示例");

    var showvalue = "";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: datas,
        success: function (sender) {

            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                var obj = sender.Option;
                if (obj.length == 0) { //没有则显示“选择一个模板开始撰写吧” 
                    UM.getEditor("myEditor" + tab).setContent("<p style=\"font-family:microsoft yahei,宋体;font-size:16px;\">选择一个模板开始撰写吧</p>", false);
                    $("#editor" + tab).attr("thistempid", "0");
                    $("#editor" + tab).attr("thisid", ""); //设置当前id
                }
                else { //有则获取
                    if (tab == "1") {
                        showvalue = obj[0].Ipc;
                    }
                    if (tab == "2") {
                        showvalue = obj[0].Technology;
                    }
                    if (tab == "3") {
                        showvalue = obj[0].Content;
                    }
                    if (tab == "4") {
                        showvalue = obj[0].Implementation_Way;
                    }
                    $("#editor" + tab).show();
                    if (showvalue == "") {
                        UM.getEditor("myEditor" + tab).setContent("", false);
                    } else {
                        UM.getEditor("myEditor" + tab).setContent(showvalue, false);
                    }
                    setselfhint(); setselfexample();
                    $("#editor" + tab).attr("thistempid", obj[0].TemplateID); //设置当前模版id
                    $("#editor" + tab).attr("thisid", obj[0].ID); //设置当前id
                }

            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
}
//保存XXX
function trysaveeditor124(tab, id, isasync) {
    var returnvalue = false;
    if (isasync == undefined) { isasync = true; }
    var thisid = $("#editor" + tab).attr("thisid");
    var tempid = $("#editor" + tab).attr("thistempid");
    if (tempid == "" || tempid == undefined)
        tempid = 0;
    var textvalue = UM.getEditor("myEditor" + tab).getContent();
    if ($.trim(UM.getEditor("myEditor" + tab).getPlainTxt()) == "" || $.trim(UM.getEditor("myEditor" + tab).getPlainTxt()) == "选择一个模板开始撰写吧") {
        textvalue = "";
    }
    var datas;

    if (thisid == "") { //新增
        if (tab == "1") {
            datas = { action: "savepatentipc", patentid: id, templateid: tempid, ipc: encodeURIComponent(textvalue) };
        }
        if (tab == "2") {
            datas = { action: "savepatenttechnology", patentid: id, templateid: tempid, technology: encodeURIComponent(textvalue) };
        }
        if (tab == "4") {
            datas = { action: "savepatentway", patentid: id, templateid: tempid, implementation_way: encodeURIComponent(textvalue) };
        }
    } else {//修改
        if (tab == "1") {
            datas = { action: "updatepatentipc", id: thisid, patentid: id, templateid: tempid, ipc: encodeURIComponent(textvalue) };
        }
        if (tab == "2") {
            datas = { action: "updatepatenttechnology", id: thisid, patentid: id, templateid: tempid, technology: encodeURIComponent(textvalue) };
        }
        if (tab == "4") {
            datas = { action: "updatepatentway", id: thisid, patentid: id, templateid: tempid, implementation_way: encodeURIComponent(textvalue) };
        }
    }

    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: datas,
        async: isasync,
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                returnvalue = true;
                if (thisid == "") {
                    thisid = sender.Option; //@通过接口得到新增的ID
                    $("#editor" + tab).attr("thisid", thisid); //新增的ID
                }
                AddPatentItem(id, $.trim(UM.getEditor("myEditor" + tab).getPlainTxt()));
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
    return returnvalue;
}

//获取某模版的内容填充当前文本框的XXX
function trysaveeditor124bytemp(tab, tempid, id, isasync) {

    var returnvalue = false;
    if (isasync == undefined) { isasync = true; }

    var jointitle = geteditor124bytemp(tab, tempid);
    jointitle = ("<p>" + jointitle + "</p>");
    tempid = $("#hidtempid").val();

    if (tempid == "" || tempid == undefined)
        tempid = 0;
    $("#editor" + tab).attr("thistempid", tempid);
    var textvalue = UM.getEditor("myEditor" + tab).getContent();
    if (jointitle == null)
        jointitle = "";
    if ($.trim(UM.getEditor("myEditor" + tab).getPlainTxt()) != "" && $.trim(UM.getEditor("myEditor" + tab).getPlainTxt()) != "选择一个模板开始撰写吧")
        textvalue = textvalue + "<br/><br/><br/>" + jointitle;
    else
        textvalue = jointitle;
    if (textvalue == "") {
        UM.getEditor("myEditor" + tab).setContent("", false);
    } else {

        UM.getEditor("myEditor" + tab).setContent(textvalue, false);
        setselfhint(); setselfexample();
    }
    var patent_type = getipcType();
    if (patent_type == "0") {
        alert2();
        return;
    }
    var thisid = $("#editor" + tab).attr("thisid");

    if ($.trim(UM.getEditor("myEditor" + tab).getPlainTxt()) == "" || $.trim(UM.getEditor("myEditor" + tab).getPlainTxt()) == "选择一个模板开始撰写吧") {
        textvalue = "";
    }
    var datas;
    if (thisid == "") { //新增
        if (tab == "1") {
            datas = { action: "savepatentipc", patentid: id, templateid: tempid, ipc: encodeURIComponent(textvalue) };
        }
        if (tab == "2") {
            datas = { action: "savepatenttechnology", patentid: id, templateid: tempid, technology: encodeURIComponent(textvalue) };
        }
        if (tab == "4") {
            datas = { action: "savepatentway", patentid: id, templateid: tempid, implementation_way: encodeURIComponent(textvalue) };
        }
    } else {//修改
        if (tab == "1") {
            datas = { action: "updatepatentipc", id: thisid, patentid: id, templateid: tempid, ipc: encodeURIComponent(textvalue) };
        }
        if (tab == "2") {
            datas = { action: "updatepatenttechnology", id: thisid, patentid: id, templateid: tempid, technology: encodeURIComponent(textvalue) };
        }
        if (tab == "4") {
            datas = { action: "updatepatentway", id: thisid, patentid: id, templateid: tempid, implementation_way: encodeURIComponent(textvalue) };
        }
    }

    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: datas,
        async: isasync,
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                returnvalue = true;
                if (thisid == "") {
                    thisid = sender.Option; //@通过接口得到新增的项目文件ID值 
                    $("#editor" + tab).attr("thisid", thisid); //新增的ID
                }
                AddPatentItem(id, $.trim(UM.getEditor("myEditor" + tab).getPlainTxt()));
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
    return returnvalue;
}

//保存技术领域、背景技术、发明内容、具体实施方式
function geteditor124bytemp(tab, tempid) {
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    var returnvalue = "";
    var datas;
    if (tab == "1") {
        datas = { action: "getipctemplatebyno", template_no: tempid };
    }
    if (tab == "2") {
        datas = { action: "getbacktemplatebyno", template_no: tempid };
    }
    if (tab == "4") {
        datas = { action: "getimplementtemplatebyno", template_no: tempid };
    }
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
                if (obj != null && obj.length > 0) {
                    returnvalue = obj[0].Content.replace(/<\/abbr>/g, "</abbr><bbbb class=\"magin-abbr\">&nbsp;</bbbb>").replace(/<abbr/g, "<bbbb class=\"magin-abbr\">&nbsp;</bbbb><abbr").replace(/<bbbb class="magin-abbr">&nbsp;<\/bbbb><bbbb class="magin-abbr">&nbsp;<\/bbbb>/g, "<bbbb class=\"magin-abbr\">&nbsp;</bbbb><bbbb class=\"magin-abbr\">&nbsp;</bbbb>").replace(/<bbbb class=/g, "<abbr class=").replace(/<\/bbbb>/g, "</abbr>");
                    $("#hidtempid").val(obj[0].ID);
                }
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
    return returnvalue;
}


//发明内容-技术问题、发明内容-技术方案、发明内容-有益效果
//获取当前id的XXX
function trygeteditor3(tab, id) {
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    var datas = { action: "getpatentcontentbypid", pid: id };
    var returnvalue = "";
    UM.getEditor("myEditor3", { toolbar: [
            'source | undo redo | fontfamily fontsize | bold italic underline | forecolor backcolor |',
            'justifyleft justifycenter justifyright justifyjustify | image |  selfhint selfexample'
         ]
    });
    $(".edui-icon-selfhint").text("撰写提示");
    $(".edui-icon-selfexample").text("参考示例");
    UM.getEditor("myEditor3_1", { toolbar: [
            'source | undo redo | fontfamily fontsize | bold italic underline | forecolor backcolor |',
            'justifyleft justifycenter justifyright justifyjustify | image |  selfhint selfexample'
         ]
    });
    $(".edui-icon-selfhint").text("撰写提示");
    $(".edui-icon-selfexample").text("参考示例");
    UM.getEditor("myEditor3_2", { toolbar: [
            'source | undo redo | fontfamily fontsize | bold italic underline | forecolor backcolor |',
            'justifyleft justifycenter justifyright justifyjustify | image |  selfhint selfexample'
         ]
    });
    $(".edui-icon-selfhint").text("撰写提示");
    $(".edui-icon-selfexample").text("参考示例");
    var showvalue = "";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: datas,
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                var obj = sender.Option;
                if (obj.length == 0) { //没有则显示“选择一个模板开始撰写吧” 
                    UM.getEditor("myEditor3").setContent("<p style=\"font-family:microsoft yahei,宋体;font-size:16px;\">选择一个模板开始撰写吧</p>", false);
                    $("#editor3").attr("thistempid", "0");
                    $("#editor3").attr("thisid", ""); //设置当前id 

                    UM.getEditor("myEditor3_1").setContent("<p style=\"font-family:microsoft yahei,宋体;font-size:16px;\">选择一个模板开始撰写吧</p>", false);
                    $("#editor3_1").attr("thistempid", "0");
                    $("#editor3_1").attr("thisid", ""); //设置当前id

                    UM.getEditor("myEditor3_2").setContent("<p style=\"font-family:microsoft yahei,宋体;font-size:16px;\">选择一个模板开始撰写吧</p>", false);
                    $("#editor3_2").attr("thistempid", "0");
                    $("#editor3_2").attr("thisid", ""); //设置当前id
                }
                else { //有则获取
                    for (var i = 0; i < obj.length && i < 3; i++) {
                        showvalue = obj[i].Content;
                        if (i == 0) {
                            $("#editor3").show();
                            if (showvalue == "") {
                                UM.getEditor("myEditor3").setContent("", false);
                            } else {
                                UM.getEditor("myEditor3").setContent(showvalue, false);
                            }
                            $("#editor3").attr("thistempid", obj[0].TemplateID); //设置当前模版id
                            $("#editor3").attr("thisid", obj[0].ID); //设置当前id
                        } else {
                            $("#editor3_" + i).show();
                            if (showvalue == "") {
                                UM.getEditor("myEditor3_" + i).setContent("", false);
                            } else {
                                UM.getEditor("myEditor3_" + i).setContent(showvalue, false);
                            }
                            setselfhint(); setselfexample();

                            $("#editor3_" + i).attr("thistempid", obj[i].TemplateID); //设置当前模版id
                            $("#editor3_" + i).attr("thisid", obj[i].ID); //设置当前id
                        }
                    }
                }

            }
            seteditorheight(3);
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
    searchEditor("3_1");
    searchEditor("3_2");
}
//获取某模版的内容填充当前文本框XXX
function trysaveeditor3(tab, id, isasync) {
    var returnvalue = false;
    if (isasync == undefined) { isasync = true; }
    var thisid = $("#editor" + tab).attr("thisid");

    var datas;
    var editorid = "";
    for (var i = 0; i < 3; i++) {
        if (i != 0) {
            editorid = "_" + i;
        }
        var tempid = $("#editor3" + editorid).attr("thistempid");
        if (tempid == "" || tempid == undefined)
            tempid = 0;
        var textvalue = UM.getEditor("myEditor3" + editorid).getContent();
        if ($.trim(UM.getEditor("myEditor3" + editorid).getPlainTxt()) == "" || $.trim(UM.getEditor("myEditor3" + editorid).getPlainTxt()) == "选择一个模板开始撰写吧") {
            textvalue = "";
        }
        thisid = $("#editor3" + editorid).attr("thisid");
        if (thisid == "") { //新增,增加三个 
            datas = { action: "savepatentcontent", patentid: id, templateid: tempid, content: encodeURIComponent(textvalue) };
        } else {//修改,三个 
            datas = { action: "updatepatentcontent", id: thisid, patentid: id, templateid: tempid, content: encodeURIComponent(textvalue) };
        }
        var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
        $.ajax({
            type: "post",
            url: url,
            dataType: "json", //返回值类型
            data: datas,
            async: false,
            success: function (sender) {
                if (sender.ReturnValue != '0') {
                    layer.alert(sender.ErrorInfo); returnvalue = false;
                }
                else {
                    returnvalue = true;
                    if (thisid == "") {
                        thisid = sender.Option; //@通过接口得到新增的ID
                        $("#editor3" + editorid).attr("thisid", thisid); //新增的ID
                    }
                    AddPatentItem(id, $.trim(UM.getEditor("myEditor3" + editorid).getPlainTxt()));
                }
            },
            error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); returnvalue = false; }
        });
    }
    return returnvalue;
}

//保存XXX
function trysaveeditor3bytemp(tab, tempid, id, isasync) {

    var hideditorid = $("#hideditor3id").val();
    if (hideditorid == "")
        hideditorid = "3";
    // alert(hideditorid + "," + tab + "," + tempid + "," + id);
    var returnvalue = false;
    if (isasync == undefined) { isasync = true; }

    var datas;
    var editorid = "";
    var thisid = $("#editor" + tab).attr("thisid"); //先增加再修改当前填充项
    var flag = false;
    if (thisid == "") { //新增,增加三个
        var flag = trysaveeditor3(tab, id, false);
    }
    else {
        flag = true;
    }
    if (flag)// 修改,单个  
    {
        var jointitle = geteditor3bytemp(hideditorid, tempid);
        jointitle = ("<p>" + jointitle + "</p>");
        tempid = $("#hidtempid").val();

        if (tempid == "" || tempid == undefined)
            tempid = 0;
        $("#editor" + hideditorid).attr("thistempid", tempid);
        var textvalue = UM.getEditor("myEditor" + hideditorid).getContent();
        if (jointitle == null)
            jointitle = "";
        if ($.trim(UM.getEditor("myEditor" + hideditorid).getPlainTxt()) != "" && $.trim(UM.getEditor("myEditor" + hideditorid).getPlainTxt()) != "选择一个模板开始撰写吧")
            textvalue = textvalue + "<br/><br/><br/>" + jointitle;
        else
            textvalue = jointitle;
        if (textvalue == "") {
            UM.getEditor("myEditor" + hideditorid).setContent("", false);
        } else {
            UM.getEditor("myEditor" + hideditorid).setContent(textvalue, false);
            setselfhint(); setselfexample();
        }

        var patent_type = getipcType();
        if (patent_type == "0") {
            alert2();
            return false;
        }
        thisid = $("#editor" + hideditorid).attr("thisid");

        if ($.trim(UM.getEditor("myEditor" + hideditorid).getPlainTxt()) == "" || $.trim(UM.getEditor("myEditor" + hideditorid).getPlainTxt()) == "选择一个模板开始撰写吧") {
            textvalue = "";
        }
        datas = { action: "updatepatentcontent", id: thisid, patentid: id, templateid: tempid, content: encodeURIComponent(textvalue) };
        var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
        $.ajax({
            type: "post",
            url: url,
            dataType: "json", //返回值类型
            data: datas,
            async: isasync,
            success: function (sender) {
                if (sender.ReturnValue != '0') {
                    layer.alert(sender.ErrorInfo); returnvalue = false;
                }
                else {
                    returnvalue = true;
                    AddPatentItem(id, $.trim(UM.getEditor("myEditor3" + hideditorid).getPlainTxt()));
                }
            },
            error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); returnvalue = false; }
        });
    }
    return returnvalue;
}

function geteditor3bytemp(hideditorid, tempid) {
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    var returnvalue = "";
    var datas;
    if (hideditorid == "3")
        datas = { action: "getcontenttemplatebyno", template_no: tempid };
    else if (hideditorid == "3_1")
        datas = { action: "getcontentwaytemplatebyno", template_no: tempid };
    else if (hideditorid == "3_2")
        datas = { action: "getcontenteffecttemplatebyno", template_no: tempid };
    else return returnvalue;
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
                if (obj != null && obj.length > 0) {
                    returnvalue = obj[0].Content.replace(/<\/abbr>/g, "</abbr><bbbb class=\"magin-abbr\">&nbsp;</bbbb>").replace(/<abbr/g, "<bbbb class=\"magin-abbr\">&nbsp;</bbbb><abbr").replace(/<bbbb class="magin-abbr">&nbsp;<\/bbbb><bbbb class="magin-abbr">&nbsp;<\/bbbb>/g, "<bbbb class=\"magin-abbr\">&nbsp;</bbbb><bbbb class=\"magin-abbr\">&nbsp;</bbbb>").replace(/<bbbb class=/g, "<abbr class=").replace(/<\/bbbb>/g, "</abbr>");
                    $("#hidtempid").val(obj[0].ID);
                }
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
    return returnvalue;
}
//发明内容的编辑区要设置三个的编辑栏的显示隐藏
function tryseteditor3tools(editorid) {
    $("div[id='content" + tab + "']").find("#editor3").find(".edui-toolbar").hide();
    $("div[id='content" + tab + "']").find("#editor" + editorid).find(".edui-toolbar").show();
}

//摘要-
//获取当前id的XXX
function trygeteditor7(tab, id) {
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    var datas = { action: "getabstractbypid", pid: id };
    var returnvalue = "";

    UM.getEditor("myEditor" + tab, { toolbar: [
            'source | undo redo | fontfamily fontsize | bold italic underline | forecolor backcolor |',
            'justifyleft justifycenter justifyright justifyjustify | image |  selfhint selfexample'
         ]
    });
    $(".edui-icon-selfhint").text("撰写提示");
    $(".edui-icon-selfexample").text("参考示例");

    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: datas,
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                var obj = sender.Option;
                if (obj == null) { //没有则显示为空 
                    UM.getEditor("myEditor" + tab).setContent("", false);
                    showtextlimite(7); focustextlimite();
                    $("#editor" + tab).attr("thisid", ""); //设置当前id
                    $("#editor" + tab).attr("photo_fid", "");
                }
                else { //有则获取 
                    if (obj.Content == "") {
                        UM.getEditor('myEditor' + tab).setContent("", false);
                    } else {
                        UM.getEditor('myEditor' + tab).setContent(obj.Content, false);
                    }
                    setselfhint(); setselfexample();
                    showtextlimite(7); focustextlimite();
                    $("#editor" + tab).attr("thisid", obj.ID);
                    $("#editor" + tab).attr("photo_fid", obj.Fid);
                    $("#editor" + tab).show();
                }

            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
}
//获取内容填充当前文本框XXX

function addeditor7(id) {
    var datas = { action: "saveabstract", patentid: id, templateid: 0, content: "", fid: "" };
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: datas,
        async: false,
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                returnvalue = true;
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
}
function trysaveeditor7(tab, id, isasync) {
    var returnvalue = false;
    if (isasync == undefined) { isasync = true; }

    var thisid = $("#editor" + tab).attr("thisid");
    var photo_fid = $("#editor" + tab).attr("photo_fid");
    var textvalue = UM.getEditor("myEditor" + tab).getContent();
    if ($.trim(UM.getEditor("myEditor" + tab).getPlainTxt()) == "") {
        textvalue = "";
    }
    //@@@@0205是否需要补一个获取单曲图片id的方法
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    var datas = { action: "getabstract", id: thisid };
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: datas,
        async: isasync,
        success: function (sender1) {
            var obj1 = sender1.Option;
            if (obj1.Fid != null) {
                $("#editor" + tab).attr("photo_fid", obj1.Fid)
                photo_fid = $("#editor" + tab).attr("photo_fid");
            }
            datas = { action: "updateabstract", id: thisid, patentid: id, templateid: 0, content: encodeURIComponent(textvalue), fid: photo_fid };
            $.ajax({
                type: "post",
                url: url,
                dataType: "json", //返回值类型
                data: datas,
                async: isasync,
                success: function (sender) {
                    if (sender.ReturnValue != '0') {
                        layer.alert(sender.ErrorInfo);
                    }
                    else {
                        returnvalue = true;
                        AddPatentItem(id, $.trim(UM.getEditor("myEditor" + tab).getPlainTxt()));
                    }
                },
                error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
            });

        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });


    return returnvalue;
}

//权利要求-
//获取当前id的XXX
function trygeteditor6(tab, id) {
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    var datas = { action: "getclaimbypid", pid: id };
    var returnvalue = "";
    UM.getEditor("myEditor6", { toolbar: [
            'source | undo redo | fontfamily fontsize | bold italic underline | forecolor backcolor |',
            'justifyleft justifycenter justifyright justifyjustify | image |  selfhint selfexample'
         ]
    });
    $(".edui-icon-selfhint").text("撰写提示");
    $(".edui-icon-selfexample").text("参考示例");
    var showvalue = "";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: datas,
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                var obj = sender.Option;
                if (obj.length == 0) { //没有则显示“选择一个模板开始撰写吧” 
                    UM.getEditor("myEditor6").setContent("<p style=\"font-family:microsoft yahei,宋体;font-size:16px;\">选择一个模板开始撰写吧</p>", false);
                    $("#editor6").attr("thistempid", "0");
                    $("#editor6").attr("thisid", ""); //设置当前id 
                }
                else { //有则获取
                    for (var i = 0; i < obj.length; i++) {
                        // alert("test" + obj.length);
                        if (i == 0)
                            editorid = "" + tab;
                        else
                            editorid = "" + tab + "_" + i;
                        if ($("#content6").find("div[id='editor" + editorid + "']").length == 0) {
                            $("#content6").find(".cl").append('<div id="editor' + editorid + '" thisid="' + obj[i].ID + '" thistempid="' + obj[i].TemplateID + '"> <div class="instru"><div class="title2"></div></div><div class="textarea" name="tooltip">   <script type="text/plain" id="myEditor' + editorid + '" style="width: 800px; height: 140px;"> </script> </div></div>');
                        } else {
                            $("#content6").find("div[id='editor" + editorid + "']").attr("thisid", obj[i].ID);
                            $("#content6").find("div[id='editor" + editorid + "']").attr("thistempid", obj[i].TemplateID);
                        }
                        if (i != 0) {
                            $("#content6").find("div[id='editor" + editorid + "']").find(".title2").html("从属权利要求：<br/>①从属权利要求的技术主题要与被其引用的权利要求的技术主题相同。<br/>②从属权利要求只能引用在前权利要求。<br/>③从属权利要求引用在前的多个权利要求时，被引的编号应当用“或”或者其他与“或”同义的择一引用方式表达，不明白不用担心我有模板神器。<br/>蓝色标记文字为撰写提示，例如<span class=\"title2span1\">（产品类型的名称）</span>；草绿色标记文字为参考示例，例如<span class=\"title2span2\">[碳石墨环轴密封结构]</span>。");
                        }

                        $("#content6").find("div[id='editor" + editorid + "']").show();
                        UM.getEditor('myEditor' + editorid, { toolbar: [
            'source | undo redo | fontfamily fontsize | bold italic underline | forecolor backcolor |',
            'justifyleft justifycenter justifyright justifyjustify | image |  selfhint selfexample'
         ]
                        });
                        $(".edui-icon-selfhint").text("撰写提示");
                        $(".edui-icon-selfexample").text("参考示例");
                        bindAcceptDrag('myEditor' + editorid);
                        tab6focus(editorid);
                        if ($("#editor" + editorid).find(".instru").find(".title1").length == 1) {
                            $("#editor" + editorid).find(".title1").html("权利要求" + (i + 1));
                        } else {
                            var objevent = $("#editor" + editorid).find(".instru").find(".title2");
                            $("<div class='title1'>权利要求" + (i + 1) + "</div>").insertBefore(objevent);
                        }

                        if (obj[i].Content == "") {
                            UM.getEditor('myEditor' + editorid).setContent("", false);
                        } else {
                            UM.getEditor('myEditor' + editorid).setContent(obj[i].Content, false);
                        }

                        setselfhint(); setselfexample();
                        searchEditor(editorid);
                        //setEditorToolsOfClaim(editorid, i);
                        setEditorWidth();
                    }
                }
                seteditorheight(6);
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
    selectelements(false);
}


//增加新的权利要求
function addnewclaim() {
    //补充add接口调用
    var widthvalue = 800;
   
    var i = $("#content6").find("div[id^='editor6']:visible").length;
    var editorid = "6_" + (i);
    var firstid = $("#content6").find("div[id='editor6']").attr("thisid");

    var infocontennull = false; //汇总5--7的8）添加权利要求按钮：权利要求信息不能为空
    
    $("#content6").find("div[id^='myEditor6']").each(function () {
        if (infocontennull) return;
        $("#hiddivselfhint").html($(this).html());
        $("#hiddivselfhint").find("abbr[id='highlight']:hidden").remove();
        $("#hiddivselfhint").find("abbr[id='highlight1']:hidden").remove();
        infocontennull = $.trim($("#hiddivselfhint").text());
        if (infocontennull == "" || infocontennull == "选择一个模板开始撰写吧") {
            infocontennull = true;
        }
        else
            infocontennull = false;
        if (infocontennull && $("#hiddivselfhint").find("img").length == 0)
            infocontennull = true;
        else
            infocontennull = false;
        $("#hiddivselfhint").html("");

       
    });

    if (infocontennull) {
        layer.alert("权利要求信息不能为空");
        return;
    }
    var addid = "";
    if (firstid == "") {
        if (addfirstclaimsid()) {  //先添加了第一个记录，然后再添加第二个记录
            addid = getnewclaimsid();
        }
    }
    else
        addid = getnewclaimsid(); //添加新记录

    if ($("#content6").find("div[id='editor" + editorid + "']").length == 0) {
        $("#content6").find(".cl").append('<div id="editor' + editorid + '" thisid="' + addid + '" thistempid=""> <div class="instru"><div class="title1">权利要求' + (i + 1) + '</div><div class="title2"></div></div><div class="textarea" name="tooltip">   <script type="text/plain" id="myEditor' + editorid + '" style="width: ' + widthvalue + 'px; height: 140px;"> </script></div></div>');
    }
    else {
        $("#content6").find("div[id='editor" + editorid + "']").attr("thisid", addid);
    }
    $("#content6").find("div[id='editor" + editorid + "']").find(".title2").html("从属权利要求：<br/>①从属权利要求的技术主题要与被其引用的权利要求的技术主题相同。<br/>②从属权利要求只能引用在前权利要求。<br/>③从属权利要求引用在前的多个权利要求时，被引的编号应当用“或”或者其他与“或”同义的择一引用方式表达，不明白不用担心我有模板神器。<br/>蓝色标记文字为撰写提示，例如<span class=\"title2span1\">（产品类型的名称）</span>；草绿色标记文字为参考示例，例如<span class=\"title2span2\">[碳石墨环轴密封结构]</span>。");
    $("#content6").find("div[id='editor" + editorid + "']").show();
    UM.getEditor('myEditor' + editorid, { toolbar: [
            'source | undo redo | fontfamily fontsize | bold italic underline | forecolor backcolor |',
            'justifyleft justifycenter justifyright justifyjustify | image |  selfhint selfexample'
         ]
    });
    $(".edui-icon-selfhint").text("撰写提示");
    $(".edui-icon-selfexample").text("参考示例");
    bindAcceptDrag('myEditor' + editorid);
    tab6focus(editorid);
    UM.getEditor('myEditor' + editorid).setContent('', false);

    //setEditorToolsOfClaim(editorid, i);
    //    $("#myEditor" + editorid).focus(function () {//#input换成你的input的ID
    //        $("#hidclaimid").val(editorid);
    //    });

    searchEditor(editorid);
    setEditorWidth();
    seteditorheight(6);
}


//获取某模版的内容填充当前文本框XXX
function trysaveeditor6(tab, id, isasync) {
    var returnvalue = false;
    if (isasync == undefined) { isasync = true; }
    $("#content" + tab).find("div[id^='editor" + tab + "']:visible").each(function () {
        var myeditorid = $(this).attr("id").replace("editor", "");
        var thisid = $(this).attr("thisid");
        if (thisid == "") {
            addfirstclaimsid();
        } else {
            var thistempid = $(this).attr("thistempid");
            if (thistempid == "")
                thistempid = 0;

            var textvalue = UM.getEditor('myEditor' + myeditorid).getContent();
            if ($.trim(UM.getEditor("myEditor" + myeditorid).getPlainTxt()) == "" || $.trim(UM.getEditor("myEditor" + myeditorid).getPlainTxt()) == "选择一个模板开始撰写吧") {
                textvalue = "";
            }

            //alert(textvalue);
            var is_mainclaim = 0;
            if (myeditorid == "6") is_mainclaim = 1;

            returnvalue = save6(myeditorid, textvalue, thisid, id, tab, thistempid, is_mainclaim, isasync);
        }
    });
    return returnvalue;
}

function save6(myeditorid, textvalue, thisid, id, tab, thistempid, is_mainclaim, isasync) {

    var datas;
    var returnvalue = "";
    datas = { action: "updateclaim", id: thisid, patentid: id, templateid: thistempid, content: encodeURIComponent(textvalue), is_mainclaim: is_mainclaim };
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        async: isasync,
        data: datas,
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                returnvalue = false;   // alert(sender.ErrorInfo);
            }
            else {
                returnvalue = true; // alert("修改成功！");
                AddPatentItem(id, $.trim(UM.getEditor("myEditor" + myeditorid).getPlainTxt()));
            }
        },
        error: function (sender) {
            returnvalue = false; //layer.alert("出现未知错误，请重新打开页面。");
        }
    });
    return returnvalue;
}
//保存XXX
function trysaveeditor6bytemp(tab, tempid, id, isasync, tab6flag) {
    var returnvalue = false;
    if (isasync == undefined) { isasync = true; }


    var jointitle = geteditor6bytemp(tab, tempid, tab6flag);
    jointitle = ("<p>" + jointitle + "</p>");
    tempid = $("#hidtempid").val();

    if (tempid == "" || tempid == undefined)
        tempid = 0;
    $("#editor" + tab).attr("thistempid", tempid);
    var textvalue = UM.getEditor("myEditor" + tab).getContent();
    if (jointitle == null)
        jointitle = "";
    if ($.trim(UM.getEditor("myEditor" + tab).getPlainTxt()) != "" && $.trim(UM.getEditor("myEditor" + tab).getPlainTxt()) != "选择一个模板开始撰写吧")
        textvalue = textvalue + "<br/><br/><br/>" + jointitle;
    else
        textvalue = jointitle;
    if (textvalue == "") {
        UM.getEditor("myEditor" + tab).setContent("", false);
    } else {
        UM.getEditor("myEditor" + tab).setContent(textvalue, false);
        setselfhint(); setselfexample();
    }

    var patent_type = getipcType();
    if (patent_type == "0") {
        alert2();
        return;
    }
    var thisid = $("#editor" + tab).attr("thisid");
    if (thisid == "") { //新增
        addfirstclaimsid();
    } else {//修改 
        var is_mainclaim = 0;
        if (tab == "6") is_mainclaim = 1;


        var datas = { action: "updateclaim", id: thisid, patentid: id, templateid: tempid, content: encodeURIComponent(textvalue), is_mainclaim: is_mainclaim };
        var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
        $.ajax({
            type: "post",
            url: url,
            dataType: "json", //返回值类型
            data: datas,
            async: isasync,
            success: function (sender) {
                if (sender.ReturnValue != '0') {
                    layer.alert(sender.ErrorInfo);
                }
                else {
                    returnvalue = true;
                    AddPatentItem(id, $.trim(UM.getEditor("myEditor" + tab).getPlainTxt()));
                }
            },
            error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
        });
    }
    return returnvalue;
}

function geteditor6bytemp(tab, tempid, tab6flag) {
    var returnvalue = "";
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    var datas;
    if (tab6flag == 1) {
        datas = { action: "getclaimtemplatebyno", template_no: tempid };
    }
    else {
        datas = { action: "getfollowclaimtemplatebyno", template_no: tempid };
    }
    //通过tempid获取技术领域的模板内容的集合，循环下面方法插入技术领域模板内容 
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
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
                if (obj != null && obj.length > 0) {
                    returnvalue = obj[0].Content.replace(/<\/abbr>/g, "</abbr><bbbb class=\"magin-abbr\">&nbsp;</bbbb>").replace(/<abbr/g, "<bbbb class=\"magin-abbr\">&nbsp;</bbbb><abbr").replace(/<bbbb class="magin-abbr">&nbsp;<\/bbbb><bbbb class="magin-abbr">&nbsp;<\/bbbb>/g, "<bbbb class=\"magin-abbr\">&nbsp;</bbbb><bbbb class=\"magin-abbr\">&nbsp;</bbbb>").replace(/<bbbb class=/g, "<abbr class=").replace(/<\/bbbb>/g, "</abbr>");
                    $("#hidtempid").val(obj[0].ID);
                }
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
    return returnvalue;
}

//权利要求-发明要素 
//保存权利要素
function trysaveeditor10(tab, id, isasync) {

    if (isasync == undefined) { isasync = true; }
    var returnvalue = "";
    var textvalue1 = "";
    var textvalue2 = "";
    var textvalue3 = "";
    var textvalue4 = "";
    //遍历每一个页面上面的发明要素
    $("#content6_ele").find("tr[id^='editor6_ele']:visible").each(function () {
        var myeditorid = $(this).attr("id").replace("editor", ""); //6_ele4  claimselement6_ele4_1
        var thisid = $(this).attr("thisid");
        textvalue1 = $.trim($("#claimselement" + myeditorid + "_1").val());
        textvalue2 = $.trim($("#claimselement" + myeditorid + "_2").val());
        textvalue3 = $.trim($("#claimselement" + myeditorid + "_3").val());
        textvalue4 = $.trim($("#sel" + myeditorid).text());

        returnvalue = save8(textvalue1, textvalue2, textvalue3, textvalue4, thisid, id, isasync);
    });
    return returnvalue;
}
function save8(textvalue1, textvalue2, textvalue3, textvalue4, thisid, id, isasync) {
    var datas;
    var returnvalue = "";
    datas = { action: "updateclaimelement", id: thisid, patentid: id, title: encodeURIComponent(textvalue1), description: encodeURIComponent(textvalue2), limiting: encodeURIComponent(textvalue3), relation: textvalue4 };
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        async: isasync,
        data: datas,
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                returnvalue = true;
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });
    return returnvalue;
}



//字数限制判断,设置focus字数变化
function focustextlimite() {
    $('#myEditor0').keyup(function () {
        showtextlimite(0);
    });


    $('#myEditor7').keyup(function () {
        showtextlimite(7);
    });
}

function showtextlimite(tab) {

    //alert("showtextlimite");
    var count = 0;
    $("#editor" + tab).find("abbr[id='highlight']:hidden").each(function () {
        count += $.trim($(this).html()).length;
    }); //   alert("selfhint");

    $("#editor" + tab).find("abbr[id='highlight1']:hidden").each(function () {
        count += $.trim($(this).html()).length;
    });
    var nowtext = $.trim(UM.getEditor("myEditor" + tab).getContentTxt());
    nowtext = (nowtext.replace(/\r\n/g, ''));
    var errortext = "";

    if (nowtext == "选择一个模板开始撰写吧")
        nowtext = "";
    if (tab == "7" && (nowtext.length - count) > 300) {
        errortext = "已经超过上限" + (nowtext.length - 300 - count) + "字";
    } else if (tab == "7") {
        errortext = "还可以输入" + (300 - nowtext.length + count) + "字";
    } else if (tab == "0" && (nowtext.length - count) > 40) {
        errortext = "已经超过上限" + (nowtext.length - 40 - count) + "字";
    }
    else if (tab == "0") {
        errortext = "还可以输入" + (40 - nowtext.length + count) + "字";
    }
    $("#error_content" + tab).text(errortext);
}
//新建项目并复制该项目的内容
function copynewselfwrite(id, ptype) {

    var loadi = layer.load('加载中…'); //先清空  
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: {
            action: "getpatent",
            id: id
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
            }
            else {
                var obj = sender.Option;
                $.ajax({
                    type: "post",
                    url: url,
                    dataType: "json", //返回值类型
                    data: {
                        action: "copypatent",
                        patentid: id, //要复制的专利ID
                        patent_type: ptype, //专利类别
                        uid: obj.UserID //当前用户ID 
                    },
                    success: function (addsender) {
                        if (addsender.ReturnValue != '0') {
                        }
                        else {
                            var newid = addsender.Option;
                            layer.close(loadi);
                            locationwin(_SelfWriteUrl + "self/selfwrite.aspx?id=" + newid);
                        }
                    },
                    error: function (addsender) { }
                });
            }
        },
        error: function (sender) { }
    });
}




//通过id保存词条
function savedicbyid(id) {

}
//通过id和文本，获取提示词条，五条
function getdicbytext(value, id) {

}

//编辑区focus
function tab6focus(id) {

    $('#myEditor' + id).focus(function () {
        $("#hidfocusid").val(id);
        var editorid = $(this).attr("id");
        $("#hidclaimid").val(id);
    });
    $('#myEditor' + id).blur(function () {
        $("#hidfocusid").val("");
        hidekeyupcidian();
    });
    $('#myEditor' + id).keyup(function () {
        var editorid = $(this).attr("id");
        keyupcidian(editorid);
    });
    seteditorheight(6);
}

//提示语消失
function focustishi(tab) {
    $('#myEditor' + tab).focus(function () {
        $("#hidfocusid").val(tab);
        var editorid = $(this).attr("id");
        if ($.trim(UM.getEditor(editorid).getPlainTxt()) == "选择一个模板开始撰写吧") {
            UM.getEditor(editorid).setContent("", false);
            UM.getEditor(editorid).focus();
        }
        if (tab == "6") {
            $('#myEditor6').focus(function () {
                $("#hidclaimid").val("6");
            });
        }
        else if (tab == "3") {
            $("#hideditor3id").val("3");
            getcontenttemplatelist(); //技术问题
        }
    });
    $('#myEditor' + tab).blur(function () {
        var myEditorid = $(this).attr("id");
        var editor = $(this).attr("id").replace("myEditor", "editor");
        var thistempid = $("#" + editor).attr("thistempid");

        if (tab!="7"&&(thistempid == "0" || thistempid == "") && $.trim(UM.getEditor(myEditorid).getPlainTxt()) == "") {
            UM.getEditor(myEditorid).setContent("<p style=\"font-family:microsoft yahei,宋体;font-size:16px;\">选择一个模板开始撰写吧</p>", false);
        }
        $("#hidfocusid").val("");
        hidekeyupcidian();
    });
    if (tab == "3") {
        $('#myEditor3_1').focus(function () {

            $("#hidfocusid").val("3_1");
            var editorid = $(this).attr("id");
            if ($.trim(UM.getEditor(editorid).getPlainTxt()) == "选择一个模板开始撰写吧") {
                UM.getEditor(editorid).setContent("", false);
                UM.getEditor(editorid).focus();
            }
            $("#hideditor3id").val("3_1");
            getcontentwaytemplatelist(); //技术方案
        });
        $('#myEditor3_1').blur(function () {

            $("#hidfocusid").val("");
            var myEditorid = $(this).attr("id");
            var editor = $(this).attr("id").replace("myEditor", "editor");
            var thistempid = $("#" + editor).attr("thistempid");

            if ((thistempid == "0" || thistempid == "") && $.trim(UM.getEditor(myEditorid).getPlainTxt()) == "") {
                UM.getEditor(myEditorid).setContent("<p style=\"font-family:microsoft yahei,宋体;font-size:16px;\">选择一个模板开始撰写吧</p>", false);
            }
            hidekeyupcidian();
        });
        $('#myEditor3_2').focus(function () {
            $("#hidfocusid").val("3_2");
            var editorid = $(this).attr("id");
            if ($.trim(UM.getEditor(editorid).getPlainTxt()) == "选择一个模板开始撰写吧") {
                UM.getEditor(editorid).setContent("", false);
                UM.getEditor(editorid).focus();
            }
            $("#hideditor3id").val("3_2");
            getcontenteffecttemplatelist(); //有益效果
        });
        $('#myEditor3_2').blur(function () {
            $("#hidfocusid").val("");
            var myEditorid = $(this).attr("id");
            var editor = $(this).attr("id").replace("myEditor", "editor");
            var thistempid = $("#" + editor).attr("thistempid");

            if ((thistempid == "0" || thistempid == "") && $.trim(UM.getEditor(myEditorid).getPlainTxt()) == "") {
                UM.getEditor(myEditorid).setContent("<p style=\"font-family:microsoft yahei,宋体;font-size:16px;\">选择一个模板开始撰写吧</p>", false);
            }
            hidekeyupcidian();
        });
    }
}
function keyupeditorcidian(tab) {
    $('#myEditor' + tab).keyup(function () {
        var editorid = $(this).attr("id");
        if ($.trim(UM.getEditor(editorid).getPlainTxt()) != "选择一个模板开始撰写吧") {
            keyupcidian(editorid);
        }
    });

    //    $('#myEditor' + tab).keypress(function (e) {
    //        //        var rtext = UM.getEditor('myEditor' + tab).selection.getText();
    //        //        if (rtext=="")
    //        //            alert(rtext); 
    //        if (document.selection) {
    //            downpageX = document.selection.createRange().offsetLeft;
    //            downpageY = document.selection.createRange().offsetTop;
    //        }
    ////        else if (window.getSelection()) {
    ////            r = window.getSelection();
    ////        }
    //             // alert(e.view.downpageX + "," + e.view.downpageY);
    //        
    //    });


    if (tab == "3") {
        $('#myEditor3_1').keyup(function () {
            var editorid = $(this).attr("id");
            if ($.trim(UM.getEditor(editorid).getPlainTxt()) != "选择一个模板开始撰写吧") {
                keyupcidian(editorid);
            }
        });
        $('#myEditor3_2').keyup(function () {
            var editorid = $(this).attr("id");
            if ($.trim(UM.getEditor(editorid).getPlainTxt()) != "选择一个模板开始撰写吧") {
                keyupcidian(editorid);
            }
        });
    }
}
function hidekeyupcidian() {

    $("#tooltip").remove();
    //    $("#cidiantishi").html("");
    //    $("#cidiantishi").hide();
}
function keyupcidian(editorid) {
    var textvalue = $.trim(UM.getEditor(editorid).getPlainTxt());

    //  alert(downpageY + "," + downpageX);
    //（目前按照：逗号、句号、冒号、分号）进行句子切分
    var index = -1;
    var index1 = textvalue.lastIndexOf('，');
    if (index1 > index)
        index = index1;
    index1 = textvalue.lastIndexOf('。');
    if (index1 > index)
        index = index1;
    index1 = textvalue.lastIndexOf('：');
    if (index1 > index)
        index = index1;
    index1 = textvalue.lastIndexOf('；');
    if (index1 > index)
        index = index1;
    index1 = textvalue.lastIndexOf(',');
    if (index1 > index)
        index = index1;
    index1 = textvalue.lastIndexOf('.');
    if (index1 > index)
        index = index1;
    index1 = textvalue.lastIndexOf(':');
    if (index1 > index)
        index = index1;
    index1 = textvalue.lastIndexOf(';');
    if (index1 > index)
        index = index1;
    index1 = textvalue.lastIndexOf('\n');
    if (index1 > index)
        index = index1;
    //   alert(textvalue + "testtest" + index1);
    index1 = textvalue.lastIndexOf(' ');
    if (index1 > index)
        index = index1;
    if (textvalue.length > index && index > -1)
        textvalue = textvalue.substring(index + 1);
    else if (index == -1)
        textvalue = textvalue;
    else
        textvalue = "";
    var swid = getselfwriteID();

    if (textvalue == "" || swid == "") {
        $("#cidiantishi").html("");
        $("#cidiantishi").hide();
    }
    else {

        var s = [];
        var url = _SelfWriteUrl + "Default.aspx";
        $.ajax({
            type: "post",
            url: url,
            dataType: "json", //返回值类型
            data: { action: 'getpatentitembystart', patentid: swid, key: textvalue },
            success: function (sender) {
                if (sender.ReturnValue != '0') {

                }
                else {
                    var obj = sender.Option;

                    if (obj == null || obj.length == 0) {
                        $("#cidiantishi").html("");
                        $("#cidiantishi").hide();
                    }
                    else {
                        s.push('<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" id="table_show_titles"><tbody>');
                        for (var i = 0; i < obj.length; i++) {
                            s.push('<tr><td>');
                            if (obj[i].length > 20)
                                s.push('<div style="color:#7a77c8" onclick="replacecidian(\'' + editorid + '\',\'' + index + '\',\'' + encodeURIComponent(obj[i]) + '\');" class="off">' + obj[i].substring(0, 20) + "...");
                            else
                                s.push('<div style="color:#7a77c8" onclick="replacecidian(\'' + editorid + '\',\'' + index + '\',\'' + encodeURIComponent(obj[i]) + '\');" class="off">' + obj[i]);

                            s.push('</div>');
                            s.push('</td></tr>');
                        }
                        s.push('</tbody></table>');
                        $("#cidiantishi").html(s.join('')).show();
                        ;
                        var x = 10, y = 20;
                        if ($("#cidiantishi").is(":visible")) {
                            $("#cidiantishi").css({
                                "top": (downpageY + y) + "px",
                                "left": (downpageX + x) + "px",
                                "z-index": "1111"
                            }).show();
                        }
                        $("#tooltip").hide();
                    }

                }
            },
            error: function (sender) { //alert('error');
            }
        });




    }
}

//词典的入库
function AddPatentItem(patentid, vcontent) {
    if (vcontent == "" || vcontent == "选择一个模板开始撰写吧")
        return;
    var url = _SelfWriteUrl + "Default.aspx";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: { action: 'addpatentitem', patentid: patentid, content: encodeURIComponent(vcontent) },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                //alert(sender.ErrorInfo);
            }
            else {
                //var obj = sender.Option;
                // alert(obj);
            }
        },
        error: function (sender) {//alert('error');
        }
    });
}
//替换词典文件
function replacecidian(editorid, index, value) {
    //  layer.alert(value);
    $("#cidiantishi").html("");
    $("#cidiantishi").hide();
    //  var textvalue = $.trim(UM.getEditor(editorid).getContent()).replace(/<[^>]+>/g, "@@"); //;
    var realtextvalue = $.trim(UM.getEditor(editorid).getContent());

    var textvalue = $.trim(UM.getEditor(editorid).getContent()).replace(/<[^>]+>/g, function (substr, submatch) {
        //  alert("test" + substr); 
        var replacevalue = "";
        for (var i = 0; i < substr.length; i++) {
            replacevalue = replacevalue + "@";
        }
        if (substr == "</p>") {

            replacevalue = replacevalue.substring(2) + "/n";
        }
        return replacevalue;
    });
    if (textvalue.lastIndexOf('/n') == textvalue.length - 2) {

        textvalue = textvalue.substring(0, textvalue.length - 2) + "@@";
    }

    var index = -1;
    var index1 = textvalue.lastIndexOf('，');
    if (index1 > index)
        index = index1;
    index1 = textvalue.lastIndexOf('。');
    if (index1 > index)
        index = index1;
    index1 = textvalue.lastIndexOf('：');
    if (index1 > index)
        index = index1;
    index1 = textvalue.lastIndexOf('；');
    if (index1 > index)
        index = index1;
    index1 = textvalue.lastIndexOf(',');
    if (index1 > index)
        index = index1;
    index1 = textvalue.lastIndexOf('.');
    if (index1 > index)
        index = index1;
    index1 = textvalue.lastIndexOf(':');
    if (index1 > index)
        index = index1;
    index1 = textvalue.lastIndexOf(';');
    if (index1 > index)
        index = index1;

    index1 = textvalue.lastIndexOf(' ');
    if (index1 > index)
        index = index1;
    index1 = textvalue.lastIndexOf('/n');
    if (index1 > index)
        index = index1 + 1;
    var textvalue1 = "";
    var textvalue2 = "";
    if (textvalue.length > index && index > -1) {//替换时
        textvalue1 = realtextvalue.substring(0, index + 1);

        UM.getEditor(editorid).setContent((textvalue1 + decodeURIComponent(value)), false);
    }
    else if (index == -1) {
        textvalue1 = "";
        UM.getEditor(editorid).setContent((textvalue1 + decodeURIComponent(value)), false);
    }
    if (editorid == "myEditor0") {
        focustextlimite();
        showtextlimite(0);
    } else if (editorid == "myEditor7") {
        focustextlimite();
        showtextlimite(7);
    }
    //UM.getEditor(editorid).execCommand('anchor', 'anchor1');
    //UM.getEditor(editorid).setContent(decodeURIComponent(value), true); //.execCommand('insertHtml', decodeURIComponent(value)); //.setContent(decodeURIComponent(value), true);
    UM.getEditor(editorid).focus(true);   //$("#" + ).focus();
}


function seteditorheight(tab) {
    var minheight = $(window).height() - 38 - 48 - 43;
    $(".left").css({
        "height": (minheight) + "px"// 
    });
    $(".center").css({
        "height": (minheight) + "px"// ,
        //     "overflow-x": "hidden", "overflow-y": "auto"
    });
    $("#overflowcenter").css({
        "height": (minheight - $(".center_top").height()) + "px",
        "overflow-x": "hidden", "overflow-y": "auto"// 
    });
    $(".right1").css({
        "height": (minheight + 5) + "px"// 
    });
    $(".right_right_bot").css({
        "height": (minheight - $(".data_title").height() + 5) + "px", "overflow-x": "hidden", "overflow-y": "auto"// 
    });
    //    
    //    if (tab == "6") {
    //        $("#modelWrap").css({
    //            "height": (minheight - $(".data_title").height() - $(".data_menu").height() - $(".keyword").height()) + "px"// 
    //        });
    //    } else {
    //        $("#modelWrap").css({
    //            "height": (minheight - $(".data_title").height() - $(".data_menu").height()) + "px"// 
    //        });
    //        
    //    }
    //    $("#content" + tab).css({
    //        "height": (minheight) - $(".center_top").height() - $("#tipsList").height() + "px",
    //        "overflow-x": "hidden", "overflow-y": "auto"// 
    //    });
    //    if (tab == "5") { 
    //    $("#content5_build").css({
    //        "height": (minheight) - $(".center_top").height() - $("#tipsList").height() + "px",
    //        "overflow-x": "hidden", "overflow-y": "auto"// 
    //    });   
    //    }

    //    var right1height = $("#modelWrap").height(); //模版库的高度


    //    if ($("#pNlWrap").is(':visible')) { //如果是附图及说明则用pNlWrap的高度+80
    //        right1height = $("#pNlWrap").height() + 50;
    //    } if ($(".patentWrap").is(':visible')) {
    //        right1height = $(".patentWrap").height();
    //    }
    //    var testheight = $(".data_title").height() + $(".data_menu").height();
    //    right1height = right1height + testheight;


    //    var editorheight = 0; //编辑区的高度
    //    var centertop = $(".center_top").height();
    //    if (tab != undefined && tab == 6) {
    //        editorheight = $("#tipsList").height() + $("#content6").height() + centertop;
    //        right1height = right1height + $(".keyword").height() + 30;

    //    }
    //    else if (tab != undefined && tab == 10)
    //        editorheight = $("#tipsList").height() + $("#content6_ele").find(".box").height() + centertop + 126;
    //    else if (tab != undefined && tab == 5) {
    //        if ($("#content5").is(':visible')) {
    //            editorheight = $("#tipsList").height() + $("#content5").find(".box").height() + centertop + 126;
    //        } else {
    //            editorheight = $("#tipsList").height() + $("#content5_build").height() + centertop + 126;
    //        }
    //    }
    //    else
    //        editorheight = $("#tipsList").height() + $("#content" + tab).height() + centertop;

    //    var minheight = $(window).height();
    //    minheight = minheight - 90;
    //    // alert("testtest" + right1height);
    //    scrolkb();
    //    var righttop = $(".right1").css("top").replace("px", "");
    //    if (righttop == undefined || righttop == "") righttop = 0;
    //    righttop = parseInt(righttop);
    //    //    if (tab != undefined && tab == 3) { alert("testtest" + editorheight + "," + right1height + "," + minheight + "," + righttop); }
    //    if (editorheight < right1height && minheight < right1height) {
    //        $(".center").css({
    //            "height": (right1height) + "px"//
    //        });


    //        $("#content" + tab).css({
    //            "min-height": (right1height - $("#center_top").height() - $("#tipsList").height() - 100) + "px"//
    //        });
    //        $(".left").css({
    //            "height": (right1height - 20) + "px"// 
    //        });
    //        $(".right1").css({
    //            "height": (right1height - righttop + 20) + "px"
    //        });

    //    } else if (editorheight >= right1height && minheight < editorheight) {
    //        $(".center").css({
    //            "height": (editorheight) + "px"//
    //        });

    //        $("#content" + tab).css({
    //            "min-height": (editorheight - $("#center_top").height() - $("#tipsList").height() - 100) + "px"//
    //        });

    //        $(".right1").css({
    //            "height": (editorheight - righttop + 20) + "px"// 
    //        });
    //        $(".left").css({
    //            "height": (editorheight - 20) + "px"//
    //        });
    //    } else {
    //        // 
    //        $(".right1").css({
    //            "height": (minheight - righttop + 20) + "px"//
    //        });
    //        $(".left").css({
    //            "height": (minheight - 20) + "px"//
    //        });
    //        $(".center").css({
    //            "height": (minheight) + "px"//
    //        });

    //        $("#content" + tab).css({
    //            "min-height": (minheight - $("#center_top").height() - $("#tipsList").height() - 100) + "px"//
    //        });
    //    }

}
function scrolkb() {
    $(window).scroll(function () {
        $("#modelbutton").hide();
        var _scroll = $(this).scrollTop();
        if (_scroll > 40) {
            _scroll = _scroll - 40;
        } else _scroll = 0;

        $(".right1").css("top", _scroll + "px");
        //       var right1height = $(".center").height();
        //        $(".right1").css({
        //            "height": (right1height - _scroll) + "px"
        //        });

        var modelWrapheight = $("#modelWrap").height();

        if ($("#pNlWrap").is(':visible')) { //如果是附图及说明则用pNlWrap的高度+80
            modelWrapheight = $("#pNlWrap").height();
        } if ($(".patentWrap").is(':visible')) {
            modelWrapheight = $(".patentWrap").height();
        }
        var testheight = $(".data_title").height() + $(".data_menu").height();
        var centertop = $(".center_top").height();
        var tab = getselfwriteTab();
        var editorheight = 0; //编辑区的高度
        var centertop = $(".center_top").height();
        if (tab != undefined && tab == 6)
            editorheight = $("#tipsList").height() + $("#content6").height() + centertop - testheight - $(".keyword").height() - 25;
        else if (tab != undefined && tab == 10)
            editorheight = $("#tipsList").height() + $("#content6_ele_table").height() + centertop + 126 - testheight;
        else if (tab != undefined && tab == 5)
            editorheight = $("#tipsList").height() + $("#content5").find(".box").height() + centertop + 126 - testheight;
        else
            editorheight = $("#tipsList").height() + $("#content" + tab).height() + centertop - testheight;

        //   alert("testtest" + editorheight + "," + modelWrapheight + "," + _scroll);
        if (editorheight < modelWrapheight + _scroll) {
            if (editorheight - modelWrapheight < 0) {
                $(".right1").css({
                    "height": ($(".left").height() + 40) + "px"
                });
                $(".right1").css("top", 0 + "px"); $(".shousou").css("top", 300 + "px");
            }
            else {
                $(".right1").css("top", (editorheight - modelWrapheight) + "px");
                $(".right1").css({
                    "height": ($(".left").height() + 40 - (editorheight - modelWrapheight)) + "px"
                });
                $(".shousou").css("top", (editorheight - modelWrapheight) + 300 + "px");
            }

        } else {

            if (_scroll < 0)
                _scroll = 0;
            $(".right1").css("top", _scroll + "px");
            $(".right1").css({
                "height": ($(".left").height() + 40 - _scroll) + "px"
            });
            //  $(".shousou").css("top", _scroll + 300 + "px");
        }




    });
}