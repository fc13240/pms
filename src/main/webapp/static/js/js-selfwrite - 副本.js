$(function () {
    $('html, body').css({
        "background": "#FFFFFF"
    });
    initshowrelation();
    //如果是新建项目判断是否首次进入
    var url = _UserUrl + "default.aspx?jsoncallback=?";
    var postData = {
        action: "getnowpagesessionuser",
        jsonmethod: "Cross_domain"
    };
    var id = getselfwriteID();
    $.getJSON(url, postData, function (sender) {
        if (sender.ReturnValue != '0') {
            var returnurl = _UserUrl + "user/login.aspx?referrUrl=" + encodeURI(_SelfWriteUrl + "self/selfwrite.aspx?id=" + id);
            if (id == "")
                returnurl = _UserUrl + "user/login.aspx?referrUrl=" + encodeURI(_SelfWriteUrl + "self/selfwrite.aspx");
            locationwin(returnurl);
        }
        else { //如果登录了的操作，不登陆上面做了跳转到登录页面的处理 
            $("#hiduserid").val(sender.Option.UID);
            //新建项目文件

            //如果id为空，且desvalue和destype存在、则先导入desvalue所在的创意描述内容
            var desvalue = getselfwritedesvalue();
            
            if (desvalue != "" && id == "") {
                showideaselfwrite(desvalue, sender.Option.UID);
            }
            else if (id == "") {
                $.ajax({
                    type: 'post',
                    url: _RootPath + 'self/selfwritemsg.aspx?command=cookie&uid=' + sender.Option.UID,
                    dateType: 'text',
                    success: function (data) {
                        if (data == "true") {//true显示帮助提示 
                            //帮助提示,引导操作 --可操作
                            helperv1();
                            //页面操作
                            shownewselfwrite(sender.Option.UID);
                        }
                        else { //false不显示提示 
                            //1、用户通过引导提示选择专利类型，选择完成后可以进行撰写。
                            //用户不选择专利类型浮层不关掉，不可以进行其他操作。 
                            helperv7();
                            //页面操作
                            shownewselfwrite(sender.Option.UID);
                        }
                    },
                    error: function () { }
                });
            }
            else {//编辑项目
                var tab = getselfwriteTab();
                //设置自动保存
                setautosave();
                //@@@@设置了模版的-1,没用了
                //  sethidKBTemplet("-1");
                showeditselfwrite(tab, id, sender.Option.UID);
            }
        }
    });
});
var addscheme;
function showideaselfwrite(desvalue, uid) {

    addscheme = layer.load("正在导入...");
    var destype = getselfwritedestype();
    //获取并设置专利类型 
    $("#div_ipctype").find("div:eq(" + (parseInt(destype) - 1) + ")").click();
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";

    var datas = { action: "savepatent", templateid: 0, title: "", simple_title: "", userid: uid, patent_type: parseInt(destype) };
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        async: false,
        data: datas,
        success: function (sender) {
            if (sender.ReturnValue != '0') {

            }
            else {

                window.location.hash = "#1=1&id=" + sender.Option + "&tab=0";
                addeditor7(sender.Option); //创建专利时候增加摘要记录，而后操作时候都是修改 
                addnewclaimelement(false); //创建专利时候增加一个发明要素表
                UM.getEditor('myEditor0', { toolbar: [
            'source | undo redo | fontfamily fontsize | bold italic underline | forecolor backcolor |',
            'justifyleft justifycenter justifyright justifyjustify | selfhint selfexample'
         ]
                });
                //设置自动保存
                GetScheme(desvalue, 1);

                // tabChange(0, false);
                // setTips(0);
            }
        },
        error: function (sender) { }
    });
}

function tuiAgency() {//simple_title
    var tab = getselfwriteTab();
    var nameSearch = "";
    if (tab == "0") {
        $("#hiddivselfhint").html($("#myEditor0").html());
        $("#hiddivselfhint").find("abbr[id='highlight']:hidden").remove();
        $("#hiddivselfhint").find("abbr[id='highlight1']:hidden").remove();
        nameSearch = $.trim($("#hiddivselfhint").text());
    } else {
        var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
        var id = getselfwriteID();
        $.ajax({
            type: "post",
            url: url,
            dataType: "json", //返回值类型 
            async: false,
            data: {
                action: "getpatent",
                id: id
            },
            success: function (sender) {
                if (sender.ReturnValue != '0') {
                }
                else {
                    var obj = sender.Option;
                    nameSearch = obj.Simple_Title
                }
            },
            error: function (sender) { //layer.alert("出现未知错误，请重新打开页面。"); 
            }
        });
    }
    if (nameSearch == "选择一个模板开始撰写吧" || nameSearch == "") {
        layer.alert("发明名称/实用新型名称为空，请添加后才能推荐相关领域代理所");
    } else {

        //限制200个汉字 否则会报404错误
        var sum = 0;
        var newnameSearch = "";
        var strLimit = "";
        var strLimitBeg = 0; 
        for (var i = 0; i < nameSearch.length; i++) {
            if ((nameSearch.charCodeAt(i) >= 0) && (nameSearch.charCodeAt(i) <= 255)) {
                sum += 0.5;
                if (sum < 201) {//可以是200个汉字加一个英文字母
                    strLimit += nameSearch.substring(parseInt(strLimitBeg), parseInt(i + 1));
                    strLimitBeg++;
                } 
            } else {
                sum += 1;
                if (sum < 201) { //可以是200个汉字加一个英文字母
                    strLimit += nameSearch.substring(parseInt(strLimitBeg), parseInt(i + 1));
                    strLimitBeg++;
                } 
            }
        }
        if (sum > 200) {
            newnameSearch = strLimit; 
        } else {
            newnameSearch = nameSearch;
        }

        locationwin(_AgencyUrl + 'apply/applyresult.aspx?tPoints=' + encodeURI(newnameSearch) + '&ipcText=&pType=0&pro=&city=');
    }
}

//获取当前页面的项目文件ID
function getselfwriteID() {
    var url = window.location.href;
    var swID = "";
    if (url.indexOf("&id=") > -1) {
        swID = /id=[^&]*/.exec(url)[0].replace('id=', '');
        if (swID.indexOf('&') > -1)
            swID = swID.substring(0, swID.indexOf('&'));
        if (swID.indexOf('#') > -1)
            swID = swID.substring(0, swID.indexOf('#'));
    }
    if (swID == "" && url.indexOf("?id=") > -1) {
        swID = /id=[^?]*/.exec(url)[0].replace('id=', '');
        if (swID.indexOf('&') > -1)
            swID = swID.substring(0, swID.indexOf('&'));
        if (swID.indexOf('#') > -1)
            swID = swID.substring(0, swID.indexOf('#'));
    }
    if (swID == "" && url.indexOf("#id=") > -1) {
        swID = /id=[^#]*/.exec(url)[0].replace('id=', '');
        if (swID.indexOf('&') > -1)
            swID = swID.substring(0, swID.indexOf('&'));
        if (swID.indexOf('#') > -1)
            swID = swID.substring(0, swID.indexOf('#'));
    }
    return swID;

}
//获取当前页面的标签值，页面参数tab的值。默认1
function getselfwriteTab() {
    var url = window.location.href;
    var tabvalue = "0";
    if (url.lastIndexOf("&tab=") > -1) {
        tabvalue = /tab=[^&]*/.exec(url.substring(url.lastIndexOf("&tab=")))[0].replace('tab=', '');
    }
    if (tabvalue == "" && url.indexOf("?tab=") > -1) {
        tabvalue = /tab=[^?]*/.exec(url)[0].replace('tab=', '');
    }
    if (tabvalue == "" && url.indexOf("#tab=") > -1) {
        tabvalue = /tab=[^#]*/.exec(url)[0].replace('tab=', '');
    }
    if (tabvalue.indexOf('#') > -1)
        tabvalue = tabvalue.substring(0, tabvalue.indexOf('#'));
    if (tabvalue == undefined || tabvalue == "")
        tabvalue = "0";
  
  //  alert(/tab=[^&]*/.exec(url.substring(url.lastIndexOf("&tab="))));
    return tabvalue;
}

//获取当前页面的desvalue值
function getselfwritedesvalue() {
    var url = window.location.href;
    var desvalue = "";
    if (url.indexOf("&desvalue=") > -1) {
        desvalue = /desvalue=[^&]*/.exec(url)[0].replace('desvalue=', '');
    }

    if (url.indexOf("?desvalue=") > -1) {
        desvalue = /desvalue=[^&]*/.exec(url)[0].replace('desvalue=', '');
    }
    return desvalue;
}

//获取当前页面的destype值
function getselfwritedestype() {
    var url = window.location.href;
    var destype = "";
    if (url.indexOf("&destype=") > -1) {
        destype = /destype=[^&]*/.exec(url)[0].replace('destype=', '');
    }
    return destype;
}

//获取当前页面的ele标签值，用于判断是显示权利要求还是权利要求发明要素表
function getselfwriteEle() {
    var url = window.location.href;
    var elevalue = "0";
    if (url.lastIndexOf("&ele=") > -1) {
        elevalue = url.substring(url.lastIndexOf("&ele=") + 5, url.lastIndexOf("&ele=") + 6);
    }

    return elevalue;
}
//#region 2.3 撰写页面--新建项目
//新建项目文件的页面操作
function shownewselfwrite(uid) {
    //九个标签--发明名称  //撰写小贴士--发明名称,获取是否收起 
    setTips(0);
    tabChange(0, false);
    //@@@@0205编辑栏--获取用户的编辑栏设置 uid  
}
//#endregion

//#region 2.4 撰写页面--编辑项目
//编辑项目文件的页面操作
function showeditselfwrite(tab, id, uid) {
    if (tab == undefined || tab == "")
        tab = "0";
    //项目如果不存在
    var url = _RootPath + "SelfWriteOperator.aspx";
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
                if (obj == null || obj.ID == 0 || obj.UserID != uid) {
                    alert5(); return;
                }
                //获取并设置专利类型 
                $("#div_ipctype").find("div:eq(" + (obj.Patent_Type - 1) + ")").click();
                //获取当前九个标签的选择项，参数tab 默认=0  
                //撰写小贴士--当前标签，获取是否收起 
                tabChange(tab, false);
                //@@@@0205编辑栏--获取用户的编辑栏设置 uid
                //获取当前标签的编辑区内容
                if (tab == 5) {
                    $("div[id^='content']").hide();
                    if (1 == 1) {
                        $("#content5").show();
                        piclistShow();
                    }
                    else {
                        $("#content5_build").show();
                        addPic();
                    }
                } else if (tab == 8) {
                    $("div[id^='content']").hide();
                    tabChange2();
                } else {
                    seteditor(tab, 0, id, uid);
                }
                //知识库--模板库--当前专利类型下的当前标签的小类模板   
            }
        },
        error: function (sender) { layer.alert("出现未知错误，请重新打开页面。"); }
    });



}
//#endregion

//#region 2.5、撰写页面--帮助 js-writehelper.js
//

//#endregion

//#region 2.6、撰写页面--保存 
//保存项目文件--增加或编辑
function fileClose2() {
    $('#closefile2').click();
}
function export_inst() {
    fileClose2();
    export_selfwrite();
}


function save_selfwrite(isasync) {
    var save_selfwriteload = layer.load("");
    var flag = false;
    if (isasync == undefined) { flag = true; isasync = false; } //flag是用来判断是否是保存按钮true是【保存】按钮操作，flase则是其他的保存异步操作
    var patent_type = getipcType();
    if (patent_type == "0") {
        alert2();
        return false;
    }
    //    var modelType = gethidKBTemplet();
    //    if ((modelType == 0 || modelType == 1)) {  //0 没选择模板 
    //        alert3();
    //        return false;
    //    }

    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    var title = UM.getEditor('myEditor0').getContent();
    var userid = $("#hiduserid").val();
    var id = getselfwriteID();

    //修改项目文件
    //获取编辑区内容并保存edit项目文件 id 
    var tabindex = $("#tabWrap").find(".tab1").attr("value");
    if (!checktext08(tabindex)) return false;
    var returnvalue;
    //如果ele=1则返回到发明要素表，否则返回到权利要求
    var eleindex = getselfwriteEle();
    if (eleindex == "1" && tabindex == "6" && flag) {//汇总5--7的6）在要素关系切换标签保存要素信息
        if (checkelenameisnull()) {
            layer.alert("要素名称不能为空。"); layer.close(save_selfwriteload);
            return false;
        }
        if (checkeleothersisnull()) {
            layer.alert("同一条要素的要素描述、要素限定二者之一不为空。"); layer.close(save_selfwriteload);
            return false;
        }
        returnvalue = save_selfwritebyTab(10, isasync);
        if (returnvalue)
            layer.alert("保存成功");
        layer.close(save_selfwriteload);

    } else {
        if (eleindex != "1")
            returnvalue = save_selfwritebyTab(tabindex, isasync);
        else
            returnvalue = true;
        if (returnvalue && flag) {//这里面是【保存】按钮成功后的提示内容
            var showBg2 = $.layer({
                type: 1,
                title: false,
                offset: ['', ''],
                border: false,
                bgcolor: 'none', //设置层背景色
                area: ['420px', '520px'],
                page: { dom: '#exportFile2' },
                closeBtn: false
            });

            //自设关闭 
            $('#closefile2').on('click', function () {
                layer.close(showBg2);
            });

            layer.close(save_selfwriteload);
        }
        else {
            layer.close(save_selfwriteload);
        }
    }
    return returnvalue;
}
//十分钟自动保存
function autosave_selfwrite() {
    //获取编辑区内容并保存edit项目文件 id 
    var tabindex = $("#tabWrap").find(".tab1").attr("value");

    var returnvalue = save_selfwritebyTab(tabindex, true);
}
function setautosave() {
    //循环执行，每隔10分钟钟执行一次保存（save_selfwrite） 
    window.setInterval(autosave_selfwrite, 600000);
}

//保存当前标签 ，切换离开的标签标识0~8
function save_selfwritebyTab(tab, isasync) {
    $("#cidiantishi").hide();
    if (isasync == undefined) { isasync = true; }
    var patent_type = getipcType();
    if (patent_type == "0") {
        alert2();
        return false;
    }
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    var id = getselfwriteID();
    var userid = $("#hiduserid").val();
    //修改项目文件的tab标签内容
    //获取tab标签编辑区内容并保存edit项目文件 id
    var returnvalue = "";
    if (tab == 0) {
        returnvalue = trysaveeditor0(id, isasync);
    }
    else if (tab == 1 || tab == 2 || tab == 4) {//技术领域,背景技术、具体实施方式
        returnvalue = trysaveeditor124(tab, id, isasync);
    }
    else if (tab == 3) {//发明内容三种
        returnvalue = trysaveeditor3(tab, id, isasync);
    }
    else if (tab == 7) {//摘要
        returnvalue = trysaveeditor7(tab, id, isasync);
    }
    else if (tab == 6) {//权利要求

        returnvalue = trysaveeditor6(tab, id, isasync);

    }
    else if (tab == 10) {//权利要求要素表  
        returnvalue = trysaveeditor10(tab, id, isasync);
    } else if (tab == 5 || tab == 8) {
        returnvalue = true;
    }
    return returnvalue;
}


//#endregion

//#region 2.7、撰写页面--预览
//预览--先保存再预览
function preview_selfwrite() {
    if (getipcType() == "0") {
        alert2();
        return;
    }
    //    var modelType = gethidKBTemplet();
    //    if ((modelType == 0 || modelType == 1)) {  //0 没选择模板 
    //        alert3();
    //        return;
    //    }

    var isflag = save_selfwrite(false);

    if (!isflag) {
        //alert4();
        return false;
    }
    var id = getselfwriteID();
    openwin(_SelfWriteUrl + "self/swpreview.aspx?id=" + id);
}


//#endregion

//#region 2.8、撰写页面--导出申请文件
//导出文件--先保存再预览
function export_selfwrite() {
    if (getipcType() == "0") {
        alert2();
        return;
    }
    //    var modelType = gethidKBTemplet();
    //    if ((modelType == 0 || modelType == 1)) {  //0 没选择模板 
    //        alert3();
    //        return;
    //    }
    var isflag = save_selfwrite(false);
    if (!isflag) {
        return false;
    }
    var id = getselfwriteID();
    //@导出申请文件方法
    exportLayerShow();
}
//#endregion

//#region 2.9、撰写页面--修改专利类型 （专利类型相关）

//选择一个专利类型--参数是专利类型value 1发明，2实用
function setipcType(value, eve) {
    if ($(eve).attr("class") == "bt")//已经是选中状态无效果
    {
        return;
    }
    var id = getselfwriteID();

    if (id != "") { //模板库选择的是大类还是小类，0 没选择模板；1大类；2小类
        //if ($("#hidKBTemplet").val() == "2") { //模板库选择的是大类还是小类，0 没选择模板；1大类；2小类
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
                    if (obj.Patent_Type != value) {
                        changipcType(eve, id, value);

                    } else {
                        //修改专利类型时候设置一下第一个名称标签的文字
                        settabNameBytype(value);
                        $(eve).parent().find(".bt").attr("class", "bth");
                        $(eve).attr("class", "bt");
                        var tab = getselfwriteTab();
                        setTips(tab);
                        setEditorWidth();
                        // showInitDragModel(value);
                    }
                }
            },
            error: function (sender) { }
        });
    }
    else {
        //修改专利类型时候设置一下第一个名称标签的文字
        settabNameBytype(value);
        $(eve).parent().find(".bt").attr("class", "bth");
        $(eve).attr("class", "bt");
        setTips(0);
        setEditorWidth();
        showInitDragModel(value);
    }
}

//获取当前选择的专利类型value 0 未选择，1发明，2实用
function getipcType() {
    var value = 0;
    if ($("#div_ipctype").find(".bt").length == 1) {
        value = $("#div_ipctype").find(".bt").attr("value");
    }
    else {
        var id = getselfwriteID();
        if (id != "") { //模板库选择的是大类还是小类，0 没选择模板；1大类；2小类
            //if ($("#hidKBTemplet").val() == "2") { //模板库选择的是大类还是小类，0 没选择模板；1大类；2小类
            var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
            $.ajax({
                type: "post",
                url: url,
                dataType: "json", //返回值类型
                data: {
                    action: "getpatent",
                    id: id
                },
                async: false,
                success: function (sender) {
                    if (sender.ReturnValue != '0') {
                    }
                    else {
                        var obj = sender.Option;
                        if (obj != null)
                            value = obj.Patent_Type;
                    }
                },
                error: function (sender) { }
            });
        }
    }
    return value;
}
//切换专利类型提示
function changipcType(eve, id, ptype) {
    var msg = "您将要变更专利类型：<br/>1.点击确定按钮，保存并新建，将该项目保存到历史文档中，新建项目并复制该项目的内容；<br/>2.取消，继续当前内容编辑。";
    var index = layer.confirm(msg, function (index) {
        //确定的话
        if (getipcType() == "0") {
            alert2();
            return;
        }
        var isflag = save_selfwrite(false);
        if (!isflag) {
            alert4(); return false;
        }
        //新建项目并复制该项目的内容
        copynewselfwrite(id, ptype);
        $(eve).parent().find(".bt").attr("class", "bth");
        $(eve).attr("class", "bt");
        settabNameBytype(ptype);
        showInitDragModel(ptype);
    }, function (index) {
        return false;
    });
    return;

    //重点：用户设置完专利类型后，下次打开时保持最后一次保持的类型。保持当前状态。
}


//#endregion



//#region 3.1提示语--alert提示
//当用户未选择专利类型，直接选择模板时
function alert1() {
    layer.alert("选择专利类型之后才可以使用模板，请先选择专利类型");
    return;
}
//当用户未选择专利类型，，此时点击保存或者其他操作时
function alert2() {
    layer.alert("请选择专利类型后，才可以进行操作");
    return;
}
//选择了专利类型而不选择模板，此时点击保存或者其他操作时
function alert3() {
    layer.alert("请选择一个模板，开始撰写");
    return;
}
//保存失败等错误提示
function alert4() {
    layer.alert("出现未知错误，请重新打开页面。");
    return;
}

//如果页面传入的id项目文件不存在，页面提示不存在跳转回2.2撰写列表页面；
function alert5() {
    layer.alert("抱歉，您查找的项目文件不存在");
    return;
}


//#endregion


//#region 编辑区 
var downpageY = 0;
var downpageX = 0;
//标题选择将复制内容增加到检索框
function searchEditor(tab) {

    $('div[name="tooltip"]').find(".edui-editor-body").mousedown(function (e) {
        //        var rtext = UM.getEditor('myEditor' + tab).selection.getText();
        //        if (rtext=="")
        //            alert(rtext);
        $("#hidtooltip").val('');
        downpageY = e.pageY;
        downpageX = e.pageX; // alert(downpageX + "," + downpageY);
        //        if (window.getSelection) {  // all browsers, except IE before version 9
        //            var selection = window.getSelection();
        //            selection.deleteFromDocument();

        //            /* The deleteFromDocument does not work in Opera.
        //            Work around this bug.*/
        //            if (!selection.isCollapsed) {
        //                var selRange = selection.getRangeAt(0);
        //                selRange.deleteContents();
        //            }

        //            // The deleteFromDocument works in IE,
        //            // but a part of the new content becomes selected
        //            // prevent the selection
        //            if (selection.anchorNode) {
        //                selection.collapse(selection.anchorNode, selection.anchorOffset);
        //            }
        //        }
        //        else {
        //            if (document.selection) {    // Internet Explorer
        //                document.selection.clear();
        //            }
        //        }
    });
    $('div[name="tooltip"]').find(".edui-editor-body").mouseup(function (e) {
        //alert("test");
        var x = 10, y = 20;
        var r = "";
        if (document.selection) {
            r = document.selection.createRange().text;
        }
        else if (window.getSelection()) {
            r = window.getSelection();
        }
        r = UM.getEditor('myEditor' + tab).selection.getNative();
        var rtext = UM.getEditor('myEditor' + tab).selection.getText();
        // if ($.trim(rtext)== "") alert("【" + rtext + "】");
        if ($.trim(r) != "" && $.trim(rtext) != "" && e.target.attributes["name"] != "tooptipbtn1" && e.target.attributes["name"] != "tooltip") {
            if ($("#tooltip").length == 0) {
                var tooltip = "<div class='texta_bt' id='tooltip' > <div class='texta_bt2'><div name='tooptipbtn2'  id='tooptipbtn2'  class='bt1'> 查词典</div><div name='tooptipbtn1' id='tooptipbtn1' class='bt2' >搜专利</div></div> <div class='texta_bt1'> </div></div> ";
                $("body").append(tooltip);
            }
            //if (downpageY <= $("#myEditor0").parent().offset().top + 30) {
            // downpageY = downpageY + 50;
            //  }
            //  else {
            //downpageY = downpageY - 10;
            //}
            if ($("#hidtooltip").val() != rtext) {
                $("#tooltip").css({
                    "top": (downpageY + y) + "px",
                    "left": (downpageX + x) + "px",
                    "position": "absolute",
                    "z-index": "200000000"
                }).show("fast");
            } else {
                $("#tooltip").hide();
            }
            $("#cidiantishi").hide();
            $("#tooptipbtn1").mousedown(function (e) {
                showtooltip(1, tab, rtext);
                //  UM.getEditor('myEditor' + tab).selection.clearRange();
                // UM.getEditor('myEditor' + tab).blur(); //编辑器离开焦点
            });
            $("#tooptipbtn2").mousedown(function (ev) {
                //查词典功能将词传入查词典小工具
                // alert("查词典功能将词传入查词典小工具；查词典检索内容：" + r);
                //  alert(UM.getEditor('myEditor' + tab).selection.getStart() + e.pageY);
                showtooltip(2, tab, rtext, e);
                //  UM.getEditor('myEditor' + tab).selection.clearRange();
                //  UM.getEditor('myEditor' + tab).blur(); //编辑器离开焦点

            });
            //即划即查功能调用
            edit_search(rtext, e);
        }
        else {
            //$("#hidtooltip").val("");
        }
    });
    $(window).mousedown(function (e) {
        if (e.target.attributes["name"] != "tooptipbtn1" && e.target.attributes["name"] != "tooltip")
            $("#tooltip").remove();
    });
}

function showtooltip(flag, tab, rtext, e) {
    $("#tooltip").hide();
    if (flag == 1) {//搜专利
        rtext = UM.getEditor('myEditor' + tab).selection.getText();
        rtext = $.trim(rtext);
        if (rtext != "") {
            if (tab == 6)
                clickSerch(rtext, 1);
            else
                clickSerch(rtext);
            $("#hidtooltip").val("");
        }
    } else if (flag == 2) {
        rtext = UM.getEditor('myEditor' + tab).selection.getText();
        rtext = $.trim(rtext);
        if (rtext != "") {
            //  alert(rtext);
            edit_search(rtext, e, 'btn'); $("#hidtooltip").val("");
        }
        $("#hidtooptipbtn2tabvalue").val(tab);
    }
    $("#hidtooltip").val(rtext);
}
//查词典更新编辑区选中内容
function replacetext(value) {
    //更新编辑区内容   

    var tab = $("#hidtooptipbtn2tabvalue").val();
    UM.getEditor('myEditor' + tab).focus();

    UM.getEditor('myEditor' + tab).execCommand('insertHtml', value)
}




//#endregion

////#region XXX
////
//function () { 

//}
////#endregion



//$(function () {
//    window.onbeforeunload = function () {
//         alert("test保存一次");
//        return "真的离开?";
//    }
//});
//var _t;
//window.onbeforeunload = function () {
//    setTimeout(function () { _t = setTimeout(onunloadcancel, 0) }, 0);
//    return "真的离开?";
//}
//window.onunloadcancel = function () {
//    clearTimeout(_t);
//    alert("执行一次保存");
//} 

//编辑区宽度 value是宽度百分比
function setEditorWidth() {
    if ($.trim($(".power_right").html()) == "")
        $(".power_right").hide();
    else
        $(".power_right").show();
    var percentvalue = $(".center").width();

    var paddingvalue = percentvalue * 10 / 100 + 37;
    var strwidth = (percentvalue - paddingvalue);
    strwidth = (percentvalue - paddingvalue);

    if ($.trim($(".power_right").html()) == "")
        $(".power_right").hide();
    else
        $(".power_right").show();

    $(".edui-container").css({
        "width": strwidth + "px"
    });

    $(".edui-body-container").css({
        "width": (strwidth - 20) + "px"
    });
    $("#overflowcenter").css({ "width": ($(".center").width() - 10) + "px" });
    var tab = getselfwriteTab();
    seteditorheight(tab);
}

//模板库内容的去掉span标签的正则
function clearkbfontcolor(value) {
    value = value.replace(/<abbr id="highlight" style="color:#91a960" contenteditable="false">/gi, '');
    value = value.replace(/<abbr id="highlight1" style="color:#12ceda" contenteditable="false">/gi, '');
    value = value.replace(/<\/abbr>/gi, '');
    return value
}

//创意描述
function showidealist() {
    $('#ideanonecancel').click();
    var idealist = $.layer({
        type: 1,
        title: false,
        offset: ['', ''],
        border: false,
        bgcolor: 'none', //设置层背景色
        area: ['420px', '320px'],
        page: { dom: '#idealist' },
        closeBtn: false
    });

    //自设关闭 
    $('#idealistcancel').on('click', function () {
        layer.close(idealist);
    });
}
//创意描述
function showideanone() {
    $('#idealistcancel').click();
    var ideanone = $.layer({
        type: 1,
        title: false,
        offset: ['', ''],
        border: false,
        bgcolor: 'none', //设置层背景色
        area: ['420px', '320px'],
        page: { dom: '#ideanone' },
        closeBtn: false
    });

    //自设关闭 
    $('#ideanonecancel').on('click', function () {
        layer.close(ideanone);
    });
}


function getschemeList() {
    var schemeList = layer.load("加载中...");
    var patentType = getipcType();
    if (patentType == "0") {
        alert2();
        return false;
    }
    var isflag = save_selfwrite(false);

    if (!isflag) {
        //alert4();
        layer.close(schemeList);
        return false;
    }

    var userid = $("#hiduserid").val();
    var url = _IdeaUrl + "default.aspx?jsoncallback=?";
    if (patentType == 1)
        patentType = "fm";
    else
        patentType = "xx";
    var postData = {
        action: "getexportschemelist",
        patenttype: patentType,
        uid: userid,
        jsonmethod: "Cross_domain"
    };

    $.getJSON(url, postData, function (sender) {
        if (sender.ReturnValue != '0') {
            showideanone(); //alert(sender.ErrorInfo);
        }
        else {
            var obj = sender.Option;
            if (obj == null || obj.length == 0) {
                showideanone();
            } else {
                var s = [];
                for (var key in obj) {
                    s.push('<div class="delete_text1">');
                    s.push('<input name="idearadio" type="radio" value="' + obj[key].ID + '"><span>' + obj[key].Title + '</span>');
                    s.push('</div>');
                }
                $("#idealist").find(".delete_text").html(s.join(''));
                showidealist();
            }
        }
        layer.close(schemeList);
    });
}

function addschemebyid() {
    var schemeid = $('input[name="idearadio"]:checked').val(); //被选中创意的Value值
    if (schemeid == undefined || schemeid == "") {
        layer.alert("请选择要导入的创意方案");
    }
    else {
        GetScheme(schemeid);
    }
}
function GetScheme(id, flag) {
    addscheme = layer.load("正在导入...");
    var url = _IdeaUrl + "default.aspx?jsoncallback=?";
    var postData = {
        action: "getschemedetail",
        schemeid: id,
        jsonmethod: "Cross_domain"
    };

    $.getJSON(url, postData, function (sender) {
        if (sender.ReturnValue != '0') {
            layer.alert(sender.ErrorInfo);
        }
        else {
            var obj = sender.Option;
            for (var i = 0; i < obj.length; i++) {
                if (obj[i].TempleteID == 1) {
                    if (i == 2) {//3发明名称
                        getscheme1topatent("0", obj[i].Answer);
                    } else if (i == 3) { //4背景技术//4发明内容的技术问题
                        getscheme1topatent("2", obj[i].Answer);
                        getscheme1topatent("3", obj[i].Answer);
                    } else if (i == 4) {//5具体实施//5发明内容技术方案
                        getscheme1topatent("4", obj[i].Answer);
                        getscheme1topatent("3_1", obj[i].Answer);
                    } else if (i == 5) {//6发明内容的有益效果
                        getscheme1topatent("3_2", obj[i].Answer);
                    }
                } else if (obj[i].TempleteID == 2) {
                    if (i == 2) { //3发明名称
                        getscheme1topatent("0", obj[i].Answer);
                    } else if (i == 3) {//4技术领域
                        getscheme1topatent("1", obj[i].Answer);
                    } else if (i == 4) {//5背景技术//5发明内容的技术问题
                        getscheme1topatent("2", obj[i].Answer);
                        getscheme1topatent("3", obj[i].Answer);
                    } else if (i == 5) {//6具体实施//6发明内容技术方案
                        getscheme1topatent("4", obj[i].Answer);
                        getscheme1topatent("3_1", obj[i].Answer);
                    } else if (i == 6) {//7独立权利要求
                        getscheme1topatent("6", obj[i].Answer);
                    } else if (i == 7) {//8发明内容的有益效果
                        getscheme1topatent("3_2", obj[i].Answer);
                    }
                }
            }
        }
        if (flag == 1) {
            tabChange(0);
            setautosave();
        }
        layer.close(addscheme);
        $('#idealistcancel').click();
    });
}
function getscheme1topatent(tab, jointitle) {

    if (jointitle == null || jointitle == "")
        return;
    var id = getselfwriteID();
    AddPatentItem(id, jointitle);
    var url = _SelfWriteUrl + "SelfWriteOperator.aspx";
    var getdatas;
    var updatedatas;
    var textvalue;
    if (tab == "0") {
        getdatas = { action: "getpatent", id: id };
        //    updatedatas = { action: "updatepatent", id: id, templateid: tempid, title: encodeURIComponent(title), simple_title: encodeURIComponent(simple_title), userid: userid, patent_type: patent_type };
    }
    else if (tab == "1") {
        getdatas = { action: "getpatentipcbypid", pid: id };
    }
    else if (tab == "2") {
        getdatas = { action: "getpatenttechnologybypid", pid: id };
    }
    else if (tab == "3") {
        getdatas = { action: "getpatentcontentbypid", pid: id };
    }
    else if (tab == "4") {
        getdatas = { action: "getpatentwaybypid", pid: id };
    }
    else if (tab == "3_1") {
        getdatas = { action: "getpatentcontentbypid", pid: id };
    }
    else if (tab == "6") {
        getdatas = { action: "getclaimbypid", pid: id };
    }
    else if (tab == "3_2") {
        getdatas = { action: "getpatentcontentbypid", pid: id };
    }
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        async: false,
        data: getdatas,
        success: function (sender) {
            if (sender.ReturnValue != '0') {
            }
            else {
                var obj = sender.Option;
                if (tab == "0") {
                    textvalue = obj.Title; //获取当前标签的内容
                    if (textvalue != "")
                        textvalue = textvalue + "<br/><br/><br/>" + jointitle;
                    else
                        textvalue = jointitle;

                    var simple_title = $.trim(UM.getEditor("myEditor0").getPlainTxt());

                    $("#hiddivselfhint").html($("#myEditor0").html());
                    $("#hiddivselfhint").find("abbr[id='highlight']:hidden").remove();
                    $("#hiddivselfhint").find("abbr[id='highlight1']:hidden").remove();
                    simple_title = $.trim($("#hiddivselfhint").text());
                    $("#hiddivselfhint").html("");
                    simple_title = simple_title + jointitle;

                    updatedatas = { action: "updatepatent", id: id, templateid: obj.TemplateID, title: encodeURIComponent(textvalue), simple_title: encodeURIComponent(simple_title), userid: obj.UserID, patent_type: obj.Patent_Type };
                }
                else if (tab == "1") {
                    if (obj.length == 0) {
                        textvalue = ""; //获取当前标签的内容
                        if (textvalue != "")
                            textvalue = textvalue + "<br/><br/><br/>" + jointitle;
                        else
                            textvalue = jointitle;
                        updatedatas = { action: "savepatentipc", patentid: id, templateid: 0, ipc: encodeURIComponent(textvalue) };
                    } else {
                        textvalue = obj[0].Ipc; //获取当前标签的内容
                        if (textvalue != "")
                            textvalue = textvalue + "<br/><br/><br/>" + jointitle;
                        else
                            textvalue = jointitle;
                        updatedatas = { action: "updatepatentipc", id: obj[0].ID, patentid: id, templateid: obj[0].TemplateID, ipc: encodeURIComponent(textvalue) };
                    }
                }
                else if (tab == "2") {
                    if (obj.length == 0) {
                        textvalue = ""; //获取当前标签的内容
                        if (textvalue != "")
                            textvalue = textvalue + "<br/><br/><br/>" + jointitle;
                        else
                            textvalue = jointitle;
                        updatedatas = { action: "savepatenttechnology", patentid: id, templateid: 0, technology: encodeURIComponent(textvalue) };
                    } else {
                        textvalue = obj[0].Technology; //获取当前标签的内容
                        if (textvalue != "")
                            textvalue = textvalue + "<br/><br/><br/>" + jointitle;
                        else
                            textvalue = jointitle;
                        updatedatas = { action: "updatepatenttechnology", id: obj[0].ID, patentid: id, templateid: obj[0].TemplateID, technology: encodeURIComponent(textvalue) };
                    }
                }
                else if (tab == "3") {
                    if (obj.length < 1) {
                        textvalue = ""; //获取当前标签的内容
                        if (textvalue != "")
                            textvalue = textvalue + "<br/><br/><br/>" + jointitle;
                        else
                            textvalue = jointitle;
                        updatedatas = { action: "savepatentcontent", patentid: id, templateid: 0, content: encodeURIComponent(textvalue) };
                    } else {
                        textvalue = obj[0].Content; //获取当前标签的内容
                        if (textvalue != "")
                            textvalue = textvalue + "<br/><br/><br/>" + jointitle;
                        else
                            textvalue = jointitle;
                        updatedatas = { action: "updatepatentcontent", id: obj[0].ID, patentid: id, templateid: obj[0].TemplateID, content: encodeURIComponent(textvalue) };
                    }
                }
                else if (tab == "4") {
                    if (obj.length == 0) {
                        textvalue = ""; //获取当前标签的内容
                        if (textvalue != "")
                            textvalue = textvalue + "<br/><br/><br/>" + jointitle;
                        else
                            textvalue = jointitle;
                        updatedatas = { action: "savepatentway", patentid: id, templateid: 0, implementation_way: encodeURIComponent(textvalue) };
                    } else {
                        textvalue = obj[0].Implementation_Way; //获取当前标签的内容
                        if (textvalue != "")
                            textvalue = textvalue + "<br/><br/><br/>" + jointitle;
                        else
                            textvalue = jointitle;
                        updatedatas = { action: "updatepatentway", id: obj[0].ID, patentid: id, templateid: obj[0].TemplateID, implementation_way: encodeURIComponent(textvalue) };
                    }
                }
                else if (tab == "3_1") {
                    if (obj.length < 2) {
                        textvalue = ""; //获取当前标签的内容
                        if (textvalue != "")
                            textvalue = textvalue + "<br/><br/><br/>" + jointitle;
                        else
                            textvalue = jointitle;
                        updatedatas = { action: "savepatentcontent", patentid: id, templateid: 0, content: encodeURIComponent(textvalue) };
                    } else {
                        textvalue = obj[1].Content; //获取当前标签的内容
                        if (textvalue != "")
                            textvalue = textvalue + "<br/><br/><br/>" + jointitle;
                        else
                            textvalue = jointitle;
                        updatedatas = { action: "updatepatentcontent", id: obj[1].ID, patentid: id, templateid: obj[1].TemplateID, content: encodeURIComponent(textvalue) };
                    }
                }
                else if (tab == "6") {
                    if (obj.length == 0) {
                        addfirstclaimsid();
                        textvalue = ""; //获取当前标签的内容
                        if (textvalue != "")
                            textvalue = textvalue + "<br/><br/><br/>" + jointitle;
                        else
                            textvalue = jointitle;
                        updatedatas = { action: "updateclaim", id: $("#content6").find("div[id='editor6']").attr("thisid"), patentid: id, templateid: 0, content: encodeURIComponent(textvalue), is_mainclaim: 1 };
                    } else {
                        textvalue = obj[0].Content; //获取当前标签的内容
                        if (textvalue != "")
                            textvalue = textvalue + "<br/><br/><br/>" + jointitle;
                        else
                            textvalue = jointitle;
                        updatedatas = { action: "updateclaim", id: obj[0].ID, patentid: id, templateid: obj[0].TemplateID, content: encodeURIComponent(textvalue), is_mainclaim: 1 };
                    }
                }
                else if (tab == "3_2") {
                    if (obj.length < 3) {
                        textvalue = ""; //获取当前标签的内容
                        if (textvalue != "")
                            textvalue = textvalue + "<br/><br/><br/>" + jointitle;
                        else
                            textvalue = jointitle;
                        updatedatas = { action: "savepatentcontent", patentid: id, templateid: 0, content: encodeURIComponent(textvalue) };
                    } else {
                        textvalue = obj[2].Content; //获取当前标签的内容
                        if (textvalue != "")
                            textvalue = textvalue + "<br/><br/><br/>" + jointitle;
                        else
                            textvalue = jointitle;
                        updatedatas = { action: "updatepatentcontent", id: obj[2].ID, patentid: id, templateid: obj[2].TemplateID, content: encodeURIComponent(textvalue) };
                    }
                }

                $.ajax({
                    type: "post",
                    url: url,
                    dataType: "json", //返回值类型
                    async: false,
                    data: updatedatas,
                    success: function (senderupdate) {
                        if (sender.ReturnValue != '0') {
                        }
                        else {
                            UM.getEditor("myEditor" + tab).setContent(textvalue, false);
                            if (tab == "0") {
                                UM.getEditor('myEditor' + tab, { toolbar: [
            'source | undo redo | fontfamily fontsize | bold italic underline | forecolor backcolor |',
            'justifyleft justifycenter justifyright justifyjustify | selfhint selfexample'
         ]
                                });
                                showtextlimite("0");
                            }
                            setselfhint(); setselfexample();
                        }
                    }
                });
            }
        }
    });
}

//撰写提示
function selfhint() {
    var tab = getselfwriteTab();
    if (tab == "5" || tab == "8")
        return;
    var selfhintcount = $("#content" + tab).find("abbr[id='highlight1']:visible").length;
    //  alert("testtest" + selfhintcount);
    // var index = 0;
    if (selfhintcount == 0) {//设置为显示
        $(".edui-editor-body").find("abbr[id='highlight1']").show();
        $(".edui-editor-body").find("abbr[id='highlight1']").each(function () {
            // $(this).attr("name", "") alert("selfhint" + $(this).html());  
            // index++;
            var valuetest = $(this).attr("value");
            if (valuetest == undefined)
                valuetest = "";
            $(this).attr("value", "").html(decodeURIComponent(valuetest));
        });
        $("#hidselfhint").val("0");
    } else {//设置为隐藏 
        $(".edui-editor-body").find("abbr[id='highlight1']").hide();
        $(".edui-editor-body").find("abbr[id='highlight1']").each(function () {
            // $(this).attr("name", "highlight1_" + index) //alert("selfhint" + $(this).html());  
            //  index++;
            if ($.trim($(this).html()) != "") {
                $(this).attr("value", encodeURIComponent($(this).html())).html("");
            } else {
                $(this).attr("value", "").html("");
            }
        });       //   alert("selfhint");
        $("#hidselfhint").val("1");
    }

    if (tab == "0" || tab == "7")//摘要限制字数，判断隐藏的字符有多少个，减去一下
    {
        showtextlimite(tab);
    }
}
function setselfhint() {
    //var index = 0;
    var value = $("#hidselfhint").val();
    if (value == "") {
        var tab = getselfwriteTab();
        var selfhintcount = $("#content" + tab).find(".edui-editor-body").find("abbr[id='highlight1']:hidden").length;

        if (selfhintcount > 0)
            value = 1;
        else
            value = 0;
    } // alert("testtestaa" + value + $('#myEditor0').html());
    if (value == 0) {//设置为显示
        $(".edui-editor-body").find("abbr[id='highlight1']").show();
        $(".edui-editor-body").find("abbr[id='highlight1']").each(function () {
            // $(this).attr("name", "") //alert("selfhint" + $(this).html());  
            //  index++;
            var valuetest = $(this).attr("value"); //alert("testtest" + valuetest);
            if (valuetest != "" && valuetest != undefined) {
                $(this).html(decodeURIComponent(valuetest)); //.attr("value", "")
            } else if (valuetest == undefined) {
                $(this).attr("value", "");
            }
        });
        $("#hidselfhint").val("0");
    } else {//设置为隐藏

        $(".edui-editor-body").find("abbr[id='highlight1']").hide();
        $(".edui-editor-body").find("abbr[id='highlight1']").each(function () {
            // $(this).attr("name", "highlight1_" + index) //alert("selfhint" + $(this).html());  
            // index++;
            if ($.trim($(this).html()) != "") {
                $(this).attr("value", encodeURIComponent($(this).html())).html("");
            } else if ($(this).attr("value") == undefined) {
                $(this).attr("value", "");
            }
        });          //   alert("selfhint");
        $("#hidselfhint").val("1");
    }
    if (tab == "0" || tab == "7")//摘要限制字数，判断隐藏的字符有多少个，减去一下
    {
        showtextlimite(tab);
    }
}
//那标签就一个<highlight id="highlight1"></highlight> 一个<highlight id="highlight"></highlight>吧
//参考示例 
function selfexample() {
    var tab = getselfwriteTab();
    if (tab == "5" || tab == "8")
        return;
    var selfhintcount = $("#content" + tab).find("abbr[id='highlight']:visible").length;
    //  alert("testtest" + selfhintcount);
    // var index = 0;
    if (selfhintcount == 0) {//设置为显示
        $(".edui-editor-body").find("abbr[id='highlight']").show();
        $(".edui-editor-body").find("abbr[id='highlight']").each(function () {
            // $(this).attr("name", "") alert("selfhint" + $(this).html());  
            // index++;
            var valuetest = $(this).attr("value");
            if (valuetest == undefined)
                valuetest = "";
            $(this).attr("value", "").html(decodeURIComponent(valuetest));
        });
        $("#hidselfexample").val("0");
    } else {//设置为隐藏 
        $(".edui-editor-body").find("abbr[id='highlight']").hide();
        $(".edui-editor-body").find("abbr[id='highlight']").each(function () {
            // $(this).attr("name", "highlight1_" + index) //alert("selfhint" + $(this).html());  
            //  index++;
            if ($.trim($(this).html()) != "") {
                $(this).attr("value", encodeURIComponent($(this).html())).html("");
            } else {
                $(this).attr("value", "").html("");
            }
        });       //   alert("selfhint");
        $("#hidselfexample").val("1");
    }

    if (tab == "0" || tab == "7")//摘要限制字数，判断隐藏的字符有多少个，减去一下
    {
        showtextlimite(tab);
    }
}
function setselfexample() {
    //var index = 0;
    var value = $("#hidselfexample").val();
    if (value == "") {
        var tab = getselfwriteTab();
        var selfhintcount = $("#content" + tab).find(".edui-editor-body").find("abbr[id='highlight']:hidden").length;

        if (selfhintcount > 0)
            value = 1;
        else
            value = 0;
    } // alert("testtestaa" + value + $('#myEditor0').html());
    if (value == 0) {//设置为显示
        $(".edui-editor-body").find("abbr[id='highlight']").show();
        $(".edui-editor-body").find("abbr[id='highlight']").each(function () {
            // $(this).attr("name", "") //alert("selfhint" + $(this).html());  
            //  index++;
            var valuetest = $(this).attr("value"); //alert("testtest" + valuetest);
            if (valuetest != "" && valuetest != undefined) {
                $(this).html(decodeURIComponent(valuetest)); //.attr("value", "")
            } else if (valuetest == undefined) {
                $(this).attr("value", "");
            }
        });
        $("#hidselfexample").val("0");
    } else {//设置为隐藏

        $(".edui-editor-body").find("abbr[id='highlight']").hide();
        $(".edui-editor-body").find("abbr[id='highlight']").each(function () {
            // $(this).attr("name", "highlight1_" + index) //alert("selfhint" + $(this).html());  
            // index++;
            if ($.trim($(this).html()) != "") {
                $(this).attr("value", encodeURIComponent($(this).html())).html("");
            } else if ($(this).attr("value") == undefined) {
                $(this).attr("value", "");
            }
        });          //   alert("selfhint");
        $("#hidselfexample").val("1");
    }
    if (tab == "0" || tab == "7")//摘要限制字数，判断隐藏的字符有多少个，减去一下
    {
        showtextlimite(tab);
    }
}

////公式计算
//function showkityformula() {


//    var self_kityformula = $.layer({
//        type: 1,
//        title: false,
//        offset: ['', ''],
//        border: false,
//        bgcolor: 'none', //设置层背景色
//        area: ['700px', '450px'],
//        page: { dom: '#self_kityformula' },
//        closeBtn: false
//    });
//    //自设关闭
//    $('#kityformulacancel').on('click', function () {
//        layer.close(self_kityformula);
//        //helperv4();
//    });
//}

function qualitycheck() {
    var tab = getselfwriteTab();
    var isflag = save_selfwrite(false);

    if (!isflag) {
        return false;
    }
    var id = getselfwriteID();
    if (tab == 0) {//质检标题
        titlequalitycheck(id);
    }
    else if (tab == 1) {//质检技术领域

    }
    else if (tab == 2) {//质检背景技术

    }
    else if (tab == 3) {//质检发明内容

    }
    else if (tab == 4) {//质检具体实施方式

    }
    else if (tab == 5) {//质检附图及说明

    }
    else if (tab == 6) {//质检权利要求
    claimqualitycheck(id);
    }
    else { //质检摘要

    }
}
function titlequalitycheck(patentid) {//名称质检异步调用
    $.ajax({
        type: "post",
        url: _RootPath + 'SelfWriteOperator.aspx',
        dataType: "json",
        data:{
            Action: "qualitycheck",
            patentid: patentid
        },
        success: function (s) {
            if (s.ReturnValue != "0") {//质检出现问题
                showtooltips('divtitle', s.ErrorInfo);
            }
            else { //说明质检没有问题
                showtooltips('divtitle', '质检正常！');
            }
        },
        error: function () { }
    });
}
function claimqualitycheck(patentid) {
    $.ajax({
        type: "post",
        url: _RootPath + 'SelfWriteOperator.aspx',
        dataType: "json",
        data: {
            Action: "claimqualitycheck",
            patentid: patentid
        },
        success: function (s) {
            if (s.ReturnValue == "-1") {//质检出现问题
                showtooltips('divtclaim', s.ErrorInfo);
            }
            else if (s.ReturnValue == "-2") {
                var errorlist = s.Option;
                var info = "";
                var i = 1;
                for (var e in errorlist) {
                    if (errorlist[e].ClaimID == "0") {
                        showtooltips("divclaim", errorlist[e].ResultInfo);
                    }
                    else {
                        if (errorlist[e].ResultInfo != "") {
                            info += "权利要求(" + i + ")出现问题:</br>" + errorlist[e].ResultInfo + "<br/>";
                        }
                    }
                    i++;
                }
                if (info != "") {
                    showtooltips("divclaim", info);
                }
            }
            else { //说明质检没有问题
                showtooltips('divclaim', '质检正常！');
            }
        },
        error: function () { }
    });
}

function showtooltips(divid, content) {
    var tipsindex;
    $('#' + divid).on('click', function () {
        tipsindex = layer.tips(content, this, {
            style: ['background-color:#0FA6D8; color:#fff', '#0FA6D8'],
            guide: 1,
            maxWidth: 200,
            time: 600,
            closeBtn: [0, true]
        });
    });
    $('#' + divid).click();
    $('#' + divid + 'tips').val(tipsindex);
    //layer.close(tipsindex);
}

function qualityCheck() {
    openwin(_SelfWriteUrl + "self/swqualitycheck.aspx");
}