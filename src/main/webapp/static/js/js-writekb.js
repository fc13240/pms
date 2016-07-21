
function GetSolrValues(tabName, keyTxt, patentType) {   //根据专利类型  选项卡 关键字查找
     
    
    //gettitlevalues 发明名称
    //gettechfieldvalues   技术领域
    //gettechbackvalues  背景技术
    //getdescvalues   发明内容
    //gethowtodovalues  具体实施方式
    //getclaimvalues   权利要求
    //getabstractvalues  摘要
    var newtabName = '';
    switch (tabName) {
        case "gettitlevalues":
            newtabName = 'TIO';
            break;
        case "gettechfieldvalues":
            newtabName = 'TFO';
            break;
        case "gettechbackvalues":
            newtabName = 'TBO';
            break;
        case "getdescvalues":
            newtabName = 'ISO';
            break;
        case "gethowtodovalues":
            newtabName = 'SEO';
            break;
        case "getclaimvalues":
            newtabName = 'CLO';
            break;
        case "getabstractvalues":
            newtabName = 'ABSO';
            break;
            return;
    }
     
    
    if (keyTxt == '') {
        layer.alert("请选择相关词句进行检索");
        return false;
    }
     //var url = _RootPath + "default.aspx";
    if (patentType == "1") { //?????????????//
        patentType = "4";
    }

//   var postData = {
//        action:"smartsearch",
//        key: newtabName,
//        text: keyTxt,
//        columns: 'PD;ANO;TIO;PDT;PDB'
//    };
//    var url = _SelfWriteUrl + "default.aspx?jsoncallback=?";

//    $.getJSON(url, postData, function (json) {
//        //$.getJSON("http://111.198.99.247:8085/restzhiliao/patent/jsonpsmartsearch?jsonpCallback=?", postData, function (json) {
//        //  alert(JSON.stringify(json, null, 4));

//        var returnValue = JSON.stringify(json.ReturnValue);
//        alert(returnValue);
//        if (returnValue == 0) {
//            //运行正确  
//            var opt = JSON.stringify(json.Option);
//            var newopt = JSON.parse(opt);
//            if (newopt.length == 0) {
//                var contentStr = '<div class="model2"><div class="content"><p >暂无结果</p></div></div>';
//                $('.patentWrap').html(contentStr);
//                $('#patentS').attr('class', 'menud').siblings().attr('class', 'menudh');
//                $('.patentWrap').show().siblings().hide();
//            } else {
//                var patentNo = "";
//                var patentContent = "";
//                var pubTime = ""; //公开时间
//                var issueTime = ""; //授权时间
//                var tType = "";
//                var contentStr = "";
//                for (var i = 0; i < newopt.length; i++) {
//                    patentNo = newopt[i].ANO; // obj[i][0] == "" ? "nll" : obj[i][0];
//                    tType = newopt[i].PDB; //'4'; //obj[i][2] == "" ? "nll" : obj[i][2];
//                    pubTime = newopt[i].PD == "" ? "nll" : newopt[i].PD; //PD：公开日  20160120 
//                    issueTime = "nll"; //: obj[i][5]; 
//                    patentContent = newopt[i].TIO; //clearkbfontcolor(obj[i][1]);
//                    var len = patentContent.length;
//                    var end = len > 50 ? 50 : len;
//                    var content = patentContent.substring(0, end);
//                    var end2 = len > 115 ? 115 : len;
//                    var content2 = patentContent.substring(0, end2);
//                    contentStr += '<div class="model2"><div class="content"><p class="smallP"><span>' + patentNo + '：</span>' + content + '<a onclick="morePatent(\'' + patentNo + '\',\'' + tType + '\',\'' + pubTime + '\',\'' + issueTime + '\');">更多...</a></p><p class="bigP" style="display:none"><span>' + patentNo + '：</span>' + content2 + '<a onclick="morePatent(\'' + patentNo + '\',\'' + tType + '\',\'' + pubTime + '\',\'' + issueTime + '\');">更多...</a></p></div> </div>';

//                }
//                $('.patentWrap').html(contentStr);
//                $('#patentS').attr('class', 'menud').siblings().attr('class', 'menudh');
//                $('.patentWrap').show().siblings().hide();
//                var obj1 = json.Option1;

//                for (var i = 0; i < obj1.length; i++) {
//                    //查找到后开始设置关键字高亮
//                    $('.patentWrap').textSearch('' + obj1[i] + '');
//                }
//            }
//            layer.close(loadclockserch);

//        }
//        else {
//            // layer.alert('查询失败，请联系管理员'); 
//            var contentStr = '<div class="model2"><div class="content"><p >暂无结果</p></div></div>';
//            $('.patentWrap').html(contentStr);
//            $('#patentS').attr('class', 'menud').siblings().attr('class', 'menudh');
//            $('.patentWrap').show().siblings().hide();
//        }



//    });
    var url = _SelfWriteUrl + "default.aspx?jsoncallback=?";
    $.ajax({
        type: "post",
        url: url,
        dataType: "text", //返回值类型
        data: { action: "smartsearch", key: newtabName, text: keyTxt, columns: 'PD;ANO;TIO;PDT;PDB',recordcount:5 },
        success: function (json) {        
            var sender = JSON.parse(json);           
            if (sender.ReturnValue != '0') {
                // alert(sender.ErrorInfo);
                var contentStr = '<div class="model2"><div class="content"><p >暂无结果</p></div></div>';
                $('.patentWrap').html(contentStr);
                $('#patentS').attr('class', 'menud').siblings().attr('class', 'menudh');
                $('.patentWrap').show().siblings().hide();
            }
            else {
                var obj = sender.Option;                
                if (obj.length == 0) {
                    var contentStr = '<div class="model2"><div class="content"><p >暂无结果</p></div></div>';
                    $('.patentWrap').html(contentStr);
                    $('#patentS').attr('class', 'menud').siblings().attr('class', 'menudh');
                    $('.patentWrap').show().siblings().hide();
                } else {
                    var patentNo = "";
                    var patentContent = "";
                    var pubTime = ""; //公开时间
                    var issueTime = ""; //授权时间
                    var tType = "";
                    var contentStr = "";
                    var newopt = obj;
                    for (var i = 0; i < newopt.length; i++) {
                        patentNo = newopt[i].ANO; // obj[i][0] == "" ? "nll" : obj[i][0];
                        tType = newopt[i].PDB; //'4'; //obj[i][2] == "" ? "nll" : obj[i][2];
                        pubTime = newopt[i].PD == "" ? "nll" : newopt[i].PD; //PD：公开日  20160120 
                        issueTime = "nll"; //: obj[i][5]; 
                        patentContent = newopt[i].TIO; //clearkbfontcolor(obj[i][1]);
                        var len = patentContent.length;
                        var end = len > 50 ? 50 : len;
                        var content = patentContent.substring(0, end);
                        var end2 = len > 115 ? 115 : len;
                        var content2 = patentContent.substring(0, end2);
                        contentStr += '<div class="model2"><div class="content"><p class="smallP"><span>' + patentNo + '：</span>' + content + '<a onclick="morePatent(\'' + patentNo + '\',\'' + tType + '\',\'' + pubTime + '\',\'' + issueTime + '\');">更多...</a></p><p class="bigP" style="display:none"><span>' + patentNo + '：</span>' + content2 + '<a onclick="morePatent(\'' + patentNo + '\',\'' + tType + '\',\'' + pubTime + '\',\'' + issueTime + '\');">更多...</a></p></div> </div>';

                    }
                    $('.patentWrap').html(contentStr);
                    $('#patentS').attr('class', 'menud').siblings().attr('class', 'menudh');
                    $('.patentWrap').show().siblings().hide();
                    var obj1 = sender.Option1;
                    for (var i = 0; i < obj1.length; i++) {
                        //查找到后开始设置关键字高亮
                        $('.patentWrap').textSearch('' + obj1[i] + '');
                    }
                }
            }
            layer.close(loadclockserch);
        },
        error: function (sender) {  }
    });




  //  return;
    /*old ↓*/
//    $.ajax({
//        type: "post",
//        url: url,
//        dataType: "json", //返回值类型
//        data: { action: tabName, query: keyTxt, type: patentType },
//        success: function (sender) {
//            if (sender.ReturnValue != '0') {
//                // alert(sender.ErrorInfo);
//                var contentStr = '<div class="model2"><div class="content"><p >暂无结果</p></div></div>';
//                $('.patentWrap').html(contentStr);
//                $('#patentS').attr('class', 'menud').siblings().attr('class', 'menudh');
//                $('.patentWrap').show().siblings().hide();
//            }
//            else {
//                var obj = sender.Option;
//                var obj1 = sender.Option1;
//                if (obj.length == 0) {
//                    var contentStr = '<div class="model2"><div class="content"><p >暂无结果</p></div></div>';
//                    $('.patentWrap').html(contentStr);
//                    $('#patentS').attr('class', 'menud').siblings().attr('class', 'menudh');
//                    $('.patentWrap').show().siblings().hide();
//                } else {
//                    var patentNo = "";
//                    var patentContent = "";
//                    var pubTime = ""; //公开时间
//                    var issueTime = ""; //授权时间
//                    var tType = "";
//                    var contentStr = "";
//                    alert('ddddd');
//                    for (var i = 0; i < obj.length; i++) {
//                        patentNo = obj[i][0] == "" ? "nll" : obj[i][0];
//                        tType = obj[i][2] == "" ? "nll" : obj[i][2];
//                        pubTime = obj[i][4] == "" ? "nll" : obj[i][4];
//                        issueTime = obj[i][5] == "" ? "nll" : obj[i][5];
//                                              alert("ptType__" + tType);
//                        //                        alert("patentNo__" + patentNo);
//                        //                        alert("pubTime__" + pubTime);
//                        //                        alert("issueTime__" + issueTime);
//                        patentContent = clearkbfontcolor(obj[i][1]);
//                        var len = patentContent.length;
//                        var end = len > 50 ? 50 : len;
//                        var content = patentContent.substring(0, end);
//                        var end2 = len > 115 ? 115 : len;
//                        var content2 = patentContent.substring(0, end2);
//                        contentStr += '<div class="model2"><div class="content"><p class="smallP"><span>' + patentNo + '：</span>' + content + '<a onclick="morePatent(\'' + patentNo + '\',\'' + tType + '\',\'' + pubTime + '\',\'' + issueTime + '\');">更多...</a></p><p class="bigP" style="display:none"><span>' + patentNo + '：</span>' + content2 + '<a onclick="morePatent(\'' + patentNo + '\',\'' + tType + '\',\'' + pubTime + '\',\'' + issueTime + '\');">更多...</a></p></div> </div>';

//                    }
//                    $('.patentWrap').html(contentStr);
//                    $('#patentS').attr('class', 'menud').siblings().attr('class', 'menudh');
//                    $('.patentWrap').show().siblings().hide();

//                    for (var i = 0; i < obj1.length; i++) {
//                        //查找到后开始设置关键字高亮
//                        $('.patentWrap').textSearch('' + obj1[i] + '');
//                    }
//                }
//            }
//            layer.close(loadclockserch);
//        },
//        error: function (sender) { }
//    });
    /*old ↑*/

}
var loadclockserch;
function clickSerch(keyTxt, powerType) {   //1权利要求1 | 2权利要求其他 |不传 其他选项卡
    $("#kbpage").hide(); $("#kbpage2").hide();
    var topload = $("#patentS").offset().top;
    var leftload = $("#patentS").offset().left;
    loadclockserch = layer.load(0); //layer.load(0); //显示最小化
    $("#xubox_layer" + loadclockserch).css({ "top": (topload + 100) + "px", "left": leftload + "px" });
    //显示最小化
    $('.center').css('width', '75%');
    $('.right1').css('width', '25%');
    $('.bigP').hide();
    $('.smallP').show();
    $('#bs').attr('class', 'buttonh');
    var url = _RootPath + "default.aspx";
    var whichTab = getselfwriteTab();
    var tabName = num2tabName(whichTab);
    var patentType = getipcType(); //1  发明 2 实用新型
    if (whichTab == 6) {
        $('.keyword').hide();
    }
    //拆词，找到关键字 
    GetSolrValues(tabName, keyTxt, patentType);
    //需求已修改@对权利要求选项卡 还要在加一个权利要求1和权利要求2 类别的判断 然后再去后台读取 


}
//模板库函数↓ 


//var modelWaite;
function congShu(pageindex) {
    if (pageindex == undefined)
        pageindex = 1;
    var topload = $("#patentS").offset().top;
    var leftload = $("#patentS").offset().left;
    loadclockserch = layer.load(0); //layer.load(0); //显示最小化
    $("#xubox_layer" + loadclockserch).css({ "top": (topload + 100) + "px", "left": leftload + "px" });
    var little = 0;
    var quanLiStr = '<span onclick="duLi();" style="cursor:pointer">独立权利要求模板</span>&nbsp&nbsp&nbsp<a onclick="congShu();" style="cursor:pointer">从属权利要求模板</a>';
    $('.keyword').html(quanLiStr);
    var modelStr = "";
    var dragId = "";
    var url = _RootPath + "SelfWriteOperator.aspx";
    var patentType = getipcType();

    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: {
            action: "getfollowclaimtemplatelist",
            patenttype: patentType, currentpage: pageindex, pagesize: 5,
            template_no: ""  //从权的 使用方法一样
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.close(loadclockserch);
            }
            else {
                var obj = sender.Option;
                //alert("obj___" + obj.length);
                //                alert("little___" + little);
                if (obj.length == 0) {
                    modelStr += "";
                    $('#modelWrap').html(modelStr);
                    var tab = getselfwriteTab();
                    seteditorheight(tab);
                    layer.close(loadclockserch);
                    return;
                }
                var totalcount = sender.records;

                var pagecount = parseInt((parseInt(totalcount) + 5 - 1) / 5, 10);
                if (totalcount <= 5) {
                    $("#kbpage").hide(); $("#kbpage2").hide();
                } else {
                    $("#kbpage").show(); $("#kbpage2").show();

                    if (pageindex == 1) {
                        $("#kbpage").html('<a style="color:#ccc" href="javascript:void(0);">上一页</a>&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:congShu(' + (pageindex + 1) + ');">下一页</a>');

                    } else if (pageindex == pagecount) {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:congShu(' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a style="color:#ccc" href="javascript:void(0);">下一页</a>');

                    }
                    else {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:congShu(' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a  style="color:#0085d0" href="javascript:congShu(' + (pageindex + 1) + ');">下一页</a>');
                    }
                    $("#kbpage2").html($.trim($("#kbpage").html()));
                }
                for (var key in obj) {
                    var tmpContent = clearkbfontcolor(obj[key].Content);

                    if (little < obj.length) {
                        little++;

                        var len = tmpContent.length;
                        var end = len > 55 ? 55 : len;
                        var content = tmpContent.substring(0, end);
                        var end2 = len > 120 ? 120 : len;
                        var content2 = tmpContent.substring(0, end2);
                        var tNo = $.trim(obj[key].Template_No);
                        modelStr += "<div class='model1' id=cong_" + tNo + " style='overflow-x: hidden; overflow-y: hidden;'><div class='title'>模板 " + ((pageindex - 1) * 5 + little) + "：适用于" + obj[key].Tag + "</div><div class='content'><p class='small'><span>从属权利要求：</span>" + content + "</p><p class='big' style='display:none'><span>从属权利要求：</span>" + content2 + "</p>  <div class='button' onclick='congShu2(\"" + tNo + "\" )'>+设为模板</div></div></div>"; //obj[key].ID

                        $('#modelWrap').html(modelStr);
                        var tab = getselfwriteTab();
                        seteditorheight(tab);
                        dragId += "cong_" + tNo + ";;";
                        bindDrag(dragId); //绑定eadyUI的拖拽事件   
                        layer.close(loadclockserch);
                        //设为模板的时候  修改文本框内容
                        //                        var wTab = getselfwriteTab();
                        //                        var tId = obj[key].ID;
                        //                        var iid = getselfwriteID();
                        //                        seteditorbyconfirm(wTab, tId, iid);

                    }
                } //for结束
            }
        },
        error: function (sender) { layer.close(loadclockserch); }
    });
}

function congShu2(littleId, pageindex) {
    if (pageindex == undefined)
        pageindex = 1;
    var topload = $("#patentS").offset().top;
    var leftload = $("#patentS").offset().left;
    loadclockserch = layer.load(0); //layer.load(0); //显示最小化
    $("#xubox_layer" + loadclockserch).css({ "top": (topload + 100) + "px", "left": leftload + "px" });
    //设为模板的时候  修改文本框内容
    var wTab = getselfwriteTab();
    var tId = littleId;
    var iid = getselfwriteID();
    seteditorbyconfirm(wTab, tId, iid, 2);

    var little = 0;
    var quanLiStr = '<span onclick="duLi();" style="cursor:pointer">独立权利要求模板</span>&nbsp&nbsp&nbsp<a onclick="congShu();" style="cursor:pointer">从属权利要求模板</a>';
    $('.keyword').html(quanLiStr);
    var modelStr = "";
    var dragId = "";
    var template_no = littleId;
    var url = _RootPath + "SelfWriteOperator.aspx";
    var patentType = getipcType();
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: {
            action: "getfollowclaimtemplatelist",
            patenttype: patentType, currentpage: pageindex, pagesize: 5,
            template_no: template_no  //从权的 使用方法一样
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.close(loadclockserch);
            }
            else {
                var obj = sender.Option;
                //alert("obj___" + obj.length);
                //    alert("little___" + little);
                var totalcount = sender.records;

                var pagecount = parseInt((parseInt(totalcount) + 5 - 1) / 5, 10);
                if (totalcount <= 5) {
                    $("#kbpage").hide(); $("#kbpage2").hide();
                } else {
                    $("#kbpage").show(); $("#kbpage2").show();

                    if (pageindex == 1) {
                        $("#kbpage").html('<a style="color:#ccc" href="javascript:void(0);">上一页</a>&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:congShu2(\'' + littleId + '\',' + (pageindex + 1) + ');">下一页</a>');

                    } else if (pageindex == pagecount) {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:congShu2(\'' + littleId + '\',' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a style="color:#ccc" href="javascript:void(0);">下一页</a>');

                    }
                    else {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:congShu2(\'' + littleId + '\',' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a  style="color:#0085d0" href="javascript:congShu2(\'' + littleId + '\',' + (pageindex + 1) + ');">下一页</a>');
                    }
                    $("#kbpage2").html($.trim($("#kbpage").html()));
                }
                if (obj.length == 0) {
                    modelStr += "";
                    $('#modelWrap').html(modelStr);
                    var tab = getselfwriteTab();
                    seteditorheight(tab);
                    layer.close(loadclockserch);
                    return;
                }
                for (var key in obj) {
                    var tmpContent = clearkbfontcolor(obj[key].Content);

                    if (little < obj.length) {
                        little++;
                        var len = tmpContent.length;
                        var end = len > 55 ? 55 : len;
                        var content = tmpContent.substring(0, end);
                        var end2 = len > 120 ? 120 : len;
                        var content2 = tmpContent.substring(0, end2);
                        var tNo = $.trim(obj[key].Template_No);
                        modelStr += "<div class='model1' id=cong_" + tNo + " style='overflow-x: hidden; overflow-y: hidden;'><div class='title'>模板 " + ((pageindex - 1) * 5 + little) + "：适用于" + obj[key].Tag + "</div><div class='content'><p class='small'><span>从属权利要求：</span>" + content + "</p><p class='big' style='display:none'><span>从属权利要求：</span>" + content2 + "</p>  <div class='button' onclick='congShu2(\"" + tNo + "\" )'>+设为模板</div></div></div>";

                        $('#modelWrap').html(modelStr);
                        var tab = getselfwriteTab();
                        seteditorheight(tab);
                        dragId += "cong_" + tNo + ";;";
                        bindDrag(dragId); //绑定eadyUI的拖拽事件
                        layer.close(loadclockserch);
                    }
                } //for结束
            }
        },
        error: function (sender) { layer.close(loadclockserch); }
    });
}


function duLi(pageindex) {
    if (pageindex == undefined)
        pageindex = 1;
    var topload = $("#patentS").offset().top;
    var leftload = $("#patentS").offset().left;
    loadclockserch = layer.load(0); //layer.load(0); //显示最小化
    $("#xubox_layer" + loadclockserch).css({ "top": (topload + 100) + "px", "left": leftload + "px" });
    var little = 0;
    var quanLiStr = '<a onclick="duLi();" style="cursor:pointer">独立权利要求模板</a><span onclick="congShu();" style="cursor:pointer">从属权利要求模板</span>';
    $('.keyword').html(quanLiStr);
    var modelStr = "";
    var dragId = "";
    var template_no = "";
    var url = _RootPath + "SelfWriteOperator.aspx";
    var patentType = getipcType();
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: {
            action: "getclaimtemplatelist",
            patenttype: patentType, currentpage: pageindex, pagesize: 5,
            template_no: template_no//传他会排序  右边重新加载  点击选项卡传0   就是主权项     掉两次自己
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.close(loadclockserch);
            }
            else {
                var obj = sender.Option;
                var totalcount = sender.records;

                var pagecount = parseInt((parseInt(totalcount) + 5 - 1) / 5, 10);
                if (totalcount <= 5) {
                    $("#kbpage").hide(); $("#kbpage2").hide();
                } else {
                    $("#kbpage").show(); $("#kbpage2").show();

                    if (pageindex == 1) {
                        $("#kbpage").html('<a style="color:#ccc" href="javascript:void(0);">上一页</a>&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:duLi(' + (pageindex + 1) + ');">下一页</a>');

                    } else if (pageindex == pagecount) {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:duLi(' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a style="color:#ccc" href="javascript:void(0);">下一页</a>');

                    }
                    else {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:duLi(' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a  style="color:#0085d0" href="javascript:duLi(' + (pageindex + 1) + ');">下一页</a>');
                    } $("#kbpage2").html($.trim($("#kbpage").html()));
                }
                for (var key in obj) {
                    var tmpContent = clearkbfontcolor(obj[key].Content);
                    if (obj.length == 0) {
                        modelStr += "";
                        $('#modelWrap').html(modelStr);
                        var tab = getselfwriteTab();
                        seteditorheight(tab);
                        layer.close(loadclockserch);
                        return;
                    }
                    if (little < obj.length) {
                        little++;
                        var len = tmpContent.length;
                        var end = len > 55 ? 55 : len;
                        var content = tmpContent.substring(0, end);
                        var end2 = len > 120 ? 120 : len;
                        var content2 = tmpContent.substring(0, end2);
                        var tNo = $.trim(obj[key].Template_No);
                        modelStr += "<div class='model1' id=duli_" + tNo + " style='overflow-x: hidden; overflow-y: hidden;'><div class='title'>模板 " + ((pageindex - 1) * 5 + little) + "：适用于" + obj[key].Tag + "</div><div class='content'><p class='small'><span>独立权利要求：</span>" + content + "</p><p class='big' style='display:none'><span>独立权利要求：</span>" + content2 + "</p>  <div class='button' onclick='duLi2(\"" + tNo + "\" )'>+设为模板</div></div></div>";
                        $('#modelWrap').html(modelStr);
                        var tab = getselfwriteTab();
                        seteditorheight(tab);
                        dragId += "duli_" + tNo + ";;";
                        bindDrag(dragId); //绑定eadyUI的拖拽事件    
                        layer.close(loadclockserch);
                    }
                } //for结束
            }
        },
        error: function (sender) { layer.close(loadclockserch); }
    });
}


function duLi2(littleId, pageindex) {
    if (pageindex == undefined)
        pageindex = 1;
    var topload = $("#patentS").offset().top;
    var leftload = $("#patentS").offset().left;
    loadclockserch = layer.load(0); //layer.load(0); //显示最小化
    $("#xubox_layer" + loadclockserch).css({ "top": (topload + 100) + "px", "left": leftload + "px" });
    //设为模板的时候  修改文本框内容
    var wTab = getselfwriteTab();
    var tId = littleId;
    var iid = getselfwriteID();
    seteditorbyconfirm(wTab, tId, iid, 1);

    var little = 0;
    var quanLiStr = '<a onclick="duLi();" style="cursor:pointer">独立权利要求模板</a><span onclick="congShu();" style="cursor:pointer">从属权利要求模板</span>';
    $('.keyword').html(quanLiStr);
    var modelStr = "";
    var template_no = littleId;
    var dragId = "";
    var url = _RootPath + "SelfWriteOperator.aspx";
    var patentType = getipcType();
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: {
            action: "getclaimtemplatelist",
            patenttype: patentType, currentpage: pageindex, pagesize: 5,
            template_no: template_no//传他会排序  右边重新加载  点击选项卡传0   就是主权项     掉两次自己
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.close(loadclockserch);
            }
            else {
                var obj = sender.Option;
                var totalcount = sender.records;

                var pagecount = parseInt((parseInt(totalcount) + 5 - 1) / 5, 10);
                if (totalcount <= 5) {
                    $("#kbpage").hide(); $("#kbpage2").hide();
                } else {
                    $("#kbpage").show(); $("#kbpage2").show();

                    if (pageindex == 1) {
                        $("#kbpage").html('<a style="color:#ccc" href="javascript:void(0);">上一页</a>&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:duLi2(\'' + littleId + '\',' + (pageindex + 1) + ');">下一页</a>');

                    } else if (pageindex == pagecount) {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:duLi2(\'' + littleId + '\',' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a style="color:#ccc" href="javascript:void(0);">下一页</a>');

                    }
                    else {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:duLi2(\'' + littleId + '\',' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a  style="color:#0085d0" href="javascript:duLi2(\'' + littleId + '\',' + (pageindex + 1) + ');">下一页</a>');
                    } $("#kbpage2").html($.trim($("#kbpage").html()));
                }
                for (var key in obj) {
                    var tmpContent = clearkbfontcolor(obj[key].Content);
                    if (obj.length == 0) {
                        modelStr += "";
                        $('#modelWrap').html(modelStr);
                        var tab = getselfwriteTab();
                        seteditorheight(tab);
                        layer.close(loadclockserch);
                        return;
                    }
                    if (little < obj.length) {
                        little++;
                        var len = tmpContent.length;
                        var end = len > 55 ? 55 : len;
                        var content = tmpContent.substring(0, end);
                        var end2 = len > 120 ? 120 : len;
                        var content2 = tmpContent.substring(0, end2);
                        var tNo = $.trim(obj[key].Template_No);
                        modelStr += "<div class='model1' id=duli_" + tNo + " style='overflow-x: hidden; overflow-y: hidden;'><div class='title'>模板 " + ((pageindex - 1) * 5 + little) + "：适用于" + obj[key].Tag + "</div><div class='content'><p class='small'><span>独立权利要求：</span>" + content + "</p><p class='big' style='display:none'><span>独立权利要求：</span>" + content2 + "</p>  <div class='button' onclick='duLi2(\"" + tNo + "\" )'>+设为模板</div></div></div>";
                        $('#modelWrap').html(modelStr);
                        var tab = getselfwriteTab();
                        seteditorheight(tab);
                        dragId += "duli_" + tNo + ";;";
                        bindDrag(dragId); //绑定eadyUI的拖拽事件  
                        layer.close(loadclockserch);
                    }
                } //for结束
            }
        },
        error: function (sender) { layer.close(loadclockserch); }
    });
}




//获得发明内容——技术方案的模板
function getcontentwaytemplatelist(pageindex) {
    if (pageindex == undefined)
        pageindex = 1;
    var topload = $("#patentS").offset().top;
    var leftload = $("#patentS").offset().left;
    loadclockserch = layer.load(0); //layer.load(0); //显示最小化
    $("#xubox_layer" + loadclockserch).css({ "top": (topload + 100) + "px", "left": leftload + "px" });
    var little = 0;
    var modelStr = '';
    var dragId = "";
    var url = _RootPath + "SelfWriteOperator.aspx";
    var patentType = getipcType();
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: {
            action: "getcontentwaytemplatelist",
            patenttype: patentType, currentpage: pageindex, pagesize: 5
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.close(loadclockserch);
            }
            else {
                var obj = sender.Option;
                if (obj.length == 0) {
                    $('#modelWrap').html(modelStr);
                    var tab = getselfwriteTab();
                    seteditorheight(tab);
                    layer.close(loadclockserch);
                    return;
                }
                var totalcount = sender.records;

                var pagecount = parseInt((parseInt(totalcount) + 5 - 1) / 5, 10);
                if (totalcount <= 5) {
                    $("#kbpage").hide(); $("#kbpage2").hide();
                } else {
                    $("#kbpage").show(); $("#kbpage2").show();

                    if (pageindex == 1) {
                        $("#kbpage").html('<a style="color:#ccc" href="javascript:void(0);">上一页</a>&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',3,' + (pageindex + 1) + ');">下一页</a>');

                    } else if (pageindex == pagecount) {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',3,' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a style="color:#ccc" href="javascript:void(0);">下一页</a>');

                    }
                    else {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',3,' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a  style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',3,' + (pageindex + 1) + ');">下一页</a>');
                    } $("#kbpage2").html($.trim($("#kbpage").html()));
                }
                for (var key in obj) {
                    var tmpContent = clearkbfontcolor(obj[key].Content);
                    if (obj.length == 0) {
                        modelStr += "";
                        $('#modelWrap').html(modelStr);
                        var tab = getselfwriteTab();
                        seteditorheight(tab);
                        layer.close(loadclockserch);
                        return;
                    }
                    if (little < obj.length) {
                        little++;
                        var len = tmpContent.length;
                        var end = len > 55 ? 55 : len;
                        var content = tmpContent.substring(0, end);
                        var end2 = len > 120 ? 120 : len;
                        var content2 = tmpContent.substring(0, end2);
                        var tNo = $.trim(obj[key].Template_No);
                        modelStr += "<div class='model1' id=" + tNo + " style='overflow-x: hidden; overflow-y: hidden;'><div class='title'>模板 " + ((pageindex - 1) * 5 + little) + "：适用于" + obj[key].Tag + "</div><div class='content'><p class='small'><span>发明内容-技术方案：</span>" + content + "</p><p class='big' style='display:none'><span>发明内容-技术方案：</span>" + content2 + "</p>  <div class='button' onclick='fullEditor(\"" + tNo + "\")'>+设为模板</div></div></div>";
                        $('#modelWrap').html(modelStr);
                        var tab = getselfwriteTab();
                        seteditorheight(tab);
                        dragId += tNo + ";;";
                        bindDrag(dragId); //绑定eadyUI的拖拽事件   
                        layer.close(loadclockserch);

                    }
                } //for结束
            }
        },
        error: function (sender) { layer.close(loadclockserch); }
    });
}
//获得发明内容-有益效果的模板
function getcontenteffecttemplatelist(pageindex) {
    if (pageindex == undefined)
        pageindex = 1;
    var topload = $("#patentS").offset().top;
    var leftload = $("#patentS").offset().left;
    loadclockserch = layer.load(0); //layer.load(0); //显示最小化
    $("#xubox_layer" + loadclockserch).css({ "top": (topload + 100) + "px", "left": leftload + "px" });
    var little = 0;
    var modelStr = '';
    var dragId = "";
    var url = _RootPath + "SelfWriteOperator.aspx";
    var patentType = getipcType();
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: {
            action: "getcontenteffecttemplatelist",
            patenttype: patentType, currentpage: pageindex, pagesize: 5
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.close(loadclockserch);
            }
            else {
                var obj = sender.Option;
                if (obj.length == 0) {
                    $('#modelWrap').html(modelStr);
                    var tab = getselfwriteTab();
                    seteditorheight(tab);
                    layer.close(loadclockserch);
                    return;
                }
                var totalcount = sender.records;

                var pagecount = parseInt((parseInt(totalcount) + 5 - 1) / 5, 10);
                if (totalcount <= 5) {
                    $("#kbpage").hide(); $("#kbpage2").hide();
                } else {
                    $("#kbpage").show(); $("#kbpage2").show();

                    if (pageindex == 1) {
                        $("#kbpage").html('<a style="color:#ccc" href="javascript:void(0);">上一页</a>&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',3,' + (pageindex + 1) + ');">下一页</a>');

                    } else if (pageindex == pagecount) {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',3,' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a style="color:#ccc" href="javascript:void(0);">下一页</a>');

                    }
                    else {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',3,' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a  style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',3,' + (pageindex + 1) + ');">下一页</a>');
                    }
                    $("#kbpage2").html($.trim($("#kbpage").html()));
                }
                for (var key in obj) {
                    var tmpContent = clearkbfontcolor(obj[key].Content);
                    if (obj.length == 0) {
                        modelStr += "";
                        $('#modelWrap').html(modelStr);
                        var tab = getselfwriteTab();
                        seteditorheight(tab);
                        layer.close(loadclockserch);
                        return;
                    }
                    if (little < obj.length) {
                        little++;
                        var len = tmpContent.length;
                        var end = len > 55 ? 55 : len;
                        var content = tmpContent.substring(0, end);
                        var end2 = len > 120 ? 120 : len;
                        var content2 = tmpContent.substring(0, end2);
                        var tNo = $.trim(obj[key].Template_No);
                        modelStr += "<div class='model1' id=" + tNo + " style='overflow-x: hidden; overflow-y: hidden;'><div class='title'>模板 " + ((pageindex - 1) * 5 + little) + "：适用于" + obj[key].Tag + "</div><div class='content'><p class='small'><span>发明内容-有益效果：</span>" + content + "</p><p class='big' style='display:none'><span>发明内容-有益效果：</span>" + content2 + "</p>  <div class='button' onclick='fullEditor(\"" + tNo + "\")'>+设为模板</div></div></div>";
                        $('#modelWrap').html(modelStr);
                        var tab = getselfwriteTab();
                        seteditorheight(tab);
                        dragId += tNo + ";;";
                        bindDrag(dragId); //绑定eadyUI的拖拽事件   
                        layer.close(loadclockserch);
                    }
                } //for结束
            }
        },
        error: function (sender) { layer.close(loadclockserch); }
    });
}
//获得发明内容——技术问题的模板
function getcontenttemplatelist(pageindex) {
    if (pageindex == undefined)
        pageindex = 1;
    var topload = $("#patentS").offset().top;
    var leftload = $("#patentS").offset().left;
    loadclockserch = layer.load(0); //layer.load(0); //显示最小化
    $("#xubox_layer" + loadclockserch).css({ "top": (topload + 100) + "px", "left": leftload + "px" });
    var little = 0;
    var modelStr = '';
    var dragId = "";
    var url = _RootPath + "SelfWriteOperator.aspx";
    var patentType = getipcType();
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: {
            action: "getcontenttemplatelist",
            patenttype: patentType, currentpage: pageindex, pagesize: 5
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.close(loadclockserch);
            }
            else {
                var obj = sender.Option;
                if (obj.length == 0) {
                    $('#modelWrap').html(modelStr);
                    var tab = getselfwriteTab();
                    seteditorheight(tab);
                    layer.close(loadclockserch);
                    return;
                }
                var totalcount = sender.records;

                var pagecount = parseInt((parseInt(totalcount) + 5 - 1) / 5, 10);
                if (totalcount <= 5) {
                    $("#kbpage").hide(); $("#kbpage2").hide();
                } else {
                    $("#kbpage").show(); $("#kbpage2").show();

                    if (pageindex == 1) {
                        $("#kbpage").html('<a style="color:#ccc" href="javascript:void(0);">上一页</a>&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',3,' + (pageindex + 1) + ');">下一页</a>');

                    } else if (pageindex == pagecount) {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',3,' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a style="color:#ccc" href="javascript:void(0);">下一页</a>');

                    }
                    else {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',3,' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a  style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',3,' + (pageindex + 1) + ');">下一页</a>');
                    } $("#kbpage2").html($.trim($("#kbpage").html()));
                }
                for (var key in obj) {
                    var tmpContent = clearkbfontcolor(obj[key].Content);
                    if (obj.length == 0) {
                        modelStr += "";
                        $('#modelWrap').html(modelStr);
                        var tab = getselfwriteTab();
                        seteditorheight(tab);
                        layer.close(loadclockserch);
                        return;
                    }
                    if (little < obj.length) {
                        little++;
                        var len = tmpContent.length;
                        var end = len > 55 ? 55 : len;
                        var content = tmpContent.substring(0, end);
                        var end2 = len > 120 ? 120 : len;
                        var content2 = tmpContent.substring(0, end2);
                        var tNo = $.trim(obj[key].Template_No);
                        modelStr += "<div class='model1' id=" + tNo + " style='overflow-x: hidden; overflow-y: hidden;'><div class='title'>模板 " + ((pageindex - 1) * 5 + little) + "：适用于" + obj[key].Tag + "</div><div class='content'><p class='small'><span>发明内容-技术问题：</span>" + content + "</p><p class='big' style='display:none'><span>发明内容-技术问题：</span>" + content2 + "</p>  <div class='button' onclick='fullEditor(\"" + tNo + "\")'>+设为模板</div></div></div>";
                        $('#modelWrap').html(modelStr);
                        var tab = getselfwriteTab();
                        seteditorheight(tab);
                        dragId += tNo + ";;";
                        bindDrag(dragId); //绑定eadyUI的拖拽事件   
                        layer.close(loadclockserch);
                    }
                } //for结束
            }
        },
        error: function (sender) { layer.close(loadclockserch); }
    });
}


function fullEditor(tId, duOrCong) {  //模板的id 设为模板的时候  修改文本框内容
    var wTab = getselfwriteTab();  //哪个选项卡
    var iid = getselfwriteID(); //当前专利的编号
    if (arguments.length == 1) {
        seteditorbyconfirm(wTab, tId, iid);
    } else if (arguments.length == 2) {
        seteditorbyconfirm(wTab, tId, iid, duOrCong); //1独立 2 从权
    }
}
//=====================xia
function stayModel() {
    $('#modelWrap').show().siblings().hide();
}
function showAllModel(pageindex) {  //BigModelShow里patentType == 0的情况  这个时候阴影遮罩，其实只是显示了发明里第一个选项卡的所有 没有功能
    //alert("all");
    if (pageindex == undefined) {
        pageindex = 1;
    }
    var topload = $("#patentS").offset().top;
    var leftload = $("#patentS").offset().left;
    loadclockserch = layer.load(0); //layer.load(0); //显示最小化
    $("#xubox_layer" + loadclockserch).css({ "top": (topload + 100) + "px", "left": leftload + "px" });
    $('#modelWrap').show().siblings().hide();
    var url = _RootPath + "SelfWriteOperator.aspx";
    var modelStr = "";
    sethidKBTemplet("0"); //标记当前展示的不分大小类
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: {
            action: "gettemplatelist",
            patenttype: "0", currentpage: pageindex, pagesize: 5
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.close(loadclockserch);
            }
            else {
                var obj = sender.Option;
                var count = 0;
                var totalcount = sender.records;
                var pagecount = parseInt((parseInt(totalcount) + 5 - 1) / 5, 10);
                if (totalcount <= 5) {
                    $("#kbpage").hide(); $("#kbpage2").hide();
                } else {
                    $("#kbpage").show(); $("#kbpage2").show();

                    if (pageindex == 1) {
                        $("#kbpage").html('<a style="color:#ccc" href="javascript:void(0);">上一页</a>&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:showAllModel(' + (pageindex + 1) + ');">下一页</a>');

                    } else if (pageindex == pagecount) {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:showAllModel(' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a style="color:#ccc" href="javascript:void(0);">下一页</a>');

                    }
                    else {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:showAllModel(' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a  style="color:#0085d0" href="javascript:showAllModel(' + (pageindex + 1) + ');">下一页</a>');
                    } $("#kbpage2").html($.trim($("#kbpage").html()));
                }


                for (var key in obj) {
                    var len = obj[key].Title.length;
                    var end = len > 55 ? 55 : len;
                    var content = clearkbfontcolor(obj[key].Title).substring(0, end); //模板一-1：适用于工艺类   
                    count++;
                    modelStr += "<div class='model1' ><div class='title'>模板 " + ((pageindex - 1) * 5 + count) + "：适用于" + obj[key].Tag + "</div><div class='content'><p><span>发明名称：</span>" + content + "</p><div class='button' >+设为模板</div></div></div>";
                    $('#modelWrap').html(modelStr);
                    var tab = getselfwriteTab();
                    seteditorheight(tab);
                    layer.close(loadclockserch);
                }
            }
        },
        error: function (sender) { layer.close(loadclockserch); }
    });
}
function showInitDragModel(patentType, pageindex) { //新建专利，选择专利类型后，显示可用的模板
    var topload = $("#patentS").offset().top;
    var leftload = $("#patentS").offset().left;
    loadclockserch = layer.load(0); //layer.load(0); //显示最小化
    $("#xubox_layer" + loadclockserch).css({ "top": (topload + 100) + "px", "left": leftload + "px" });
    $('#modelWrap').show().siblings().hide();
    sethidKBTemplet("2"); //选择了某个模板后 都存2
    var url = _RootPath + "SelfWriteOperator.aspx";
    var modelStr = "";
    var dragId = "";
    if (pageindex == undefined) {
        pageindex = 1;
    }
    $.ajax({
        type: "post",
        url: url,
        dataType: "json",
        data: {
            action: "gettemplatelist",
            patenttype: patentType, currentpage: pageindex, pagesize: 5
        },
        success: function (sender) {

            if (sender.ReturnValue != '0') {
                layer.close(loadclockserch);
            }
            else {
                var obj = sender.Option;
                if (obj.length == 0) {
                    $('#modelWrap').html("");
                    layer.close(loadclockserch);
                    return;
                }
                var count = 0;
                var totalcount = sender.records;
                var pagecount = parseInt((parseInt(totalcount) + 5 - 1) / 5, 10);
                if (totalcount <= 5) {
                    $("#kbpage").hide(); $("#kbpage2").hide();
                } else {
                    $("#kbpage").show(); $("#kbpage2").show();

                    if (pageindex == 1) {
                        $("#kbpage").html('<a style="color:#ccc" href="javascript:void(0);">上一页</a>&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:showInitDragModel(' + patentType + ',' + (pageindex + 1) + ');">下一页</a>');

                    } else if (pageindex == pagecount) {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:showInitDragModel(' + patentType + ',' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a style="color:#ccc" href="javascript:void(0);">下一页</a>');

                    }
                    else {
                        $("#kbpage").html('<a style="color:#0085d0" href="javascript:showInitDragModel(' + patentType + ',' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a  style="color:#0085d0" href="javascript:showInitDragModel(' + patentType + ',' + (pageindex + 1) + ');">下一页</a>');
                    } $("#kbpage2").html($.trim($("#kbpage").html()));
                }
                for (var key in obj) {
                    var len = clearkbfontcolor(obj[key].Title).length;
                    var end = len > 55 ? 55 : len;
                    var content = clearkbfontcolor(obj[key].Title).substring(0, end); //模板一-1：适用于工艺类   
                    var end2 = len > 120 ? 120 : len;
                    var content2 = clearkbfontcolor(obj[key].Title).substring(0, end2);
                    var tNo = $.trim(obj[key].Template_No);
                    count++;
                    modelStr += "<div class='model1'  id=" + tNo + " ><div class='title'>模板 " + ((pageindex - 1) * 5 + count) + "：适用于" + obj[key].Tag + "</div><div class='content'><p class='small'><span>发明名称：</span>" + content + "</p> <p class='big' style='display:none'><span>发明名称：</span>" + content2 + "</p> <div class='button' tmp=" + patentType + " onclick='fullEditor(\"" + tNo + "\")'>+设为模板</div></div></div>";
                    $('#modelWrap').html(modelStr);
                    var tab = getselfwriteTab();
                    seteditorheight(tab);
                    dragId += tNo + ';;';
                    bindDrag(dragId); //绑定eadyUI的拖拽事件   
                    layer.close(loadclockserch);
                }
            }
        },
        error: function (sender) { layer.close(loadclockserch); }
    });
}
function showKindsDragModel(patentType, whichTab, pageindex) { //各种类型的模板  展示之
    var topload = $("#patentS").offset().top;
    var leftload = $("#patentS").offset().left;
    loadclockserch = layer.load(0); //layer.load(0); //显示最小化
    $("#xubox_layer" + loadclockserch).css({ "top": (topload + 100) + "px", "left": leftload + "px" });

    $('#modelWrap').show().siblings().hide();
    sethidKBTemplet("2"); //选择了某个模板后 都存2
    var patentType = getipcType();
    if (patentType == 1) {
        var tabName = ['发明名称', '技术领域', '背景技术', '发明内容-技术问题', '具体实施方式', '附图及说明', '权利要求', '摘要', '摘要附图'];
    } else if (patentType == 2) {
        var tabName = ['实用新型名称', '技术领域', '背景技术', '发明内容-技术问题', '具体实施方式', '附图及说明', '权利要求', '摘要', '摘要附图'];
    }

    var tempId = $('#tempId').val();
    var modelStr = "";
    var dragId = "";
    var little = 0;
    if (whichTab == 6) {
        quanLiStr = '<a onclick="duLi();" style="cursor:pointer">独立权利要求模板</a><span onclick="congShu();" style="cursor:pointer">从属权利要求模板</span>';
        $('.keyword').html(quanLiStr);
        $('.keyword').show();
        $('.keyword').show();
    } else {
        $('.keyword').hide();
    }

    if (whichTab == 10) {
        $("#kbpage").hide(); $("#kbpage2").hide();
        modelStr += "<div class='model1' style='overflow-x: hidden; overflow-y: hidden'><div class='content'><p>本部分无模板使用，要素为发明中的部件或方法步骤，先看看别人怎么写的吧。</p> </div></div>";
        $('#modelWrap').html(modelStr);
        var tab = getselfwriteTab();
        seteditorheight(tab);
        layer.close(loadclockserch);
    } else if (whichTab == 8 || whichTab == 7) {

        $("#kbpage").hide(); $("#kbpage2").hide();
        modelStr += "<div class='model3' ><div class='img_text' style='color:#999'>本部分无模板使用。</div></div>";
        $('#modelWrap').html(modelStr);
        var tab = getselfwriteTab();
        seteditorheight(tab);
        layer.close(loadclockserch);
    }
    else {//选项卡的接口 
        var actionName = num2ActionName(whichTab);
        if (pageindex == undefined) {
            pageindex = 1;
        }
        var datas;
        if (actionName == "getpictemplatelist") {
            datas = {
                action: actionName,
                patenttype: patentType, pagesize: 15,
                template_no: ""//   只有权利要求才用得到这个参数，且这里是主权利的模板，所以传""即可
            };
            $("#kbpage").hide(); $("#kbpage2").hide();
        }
        else {

            if ($("#hideditor3id").val() == "3_1" && whichTab == 3) {
                tabName[3] = "发明内容-技术方案";
                actionName = "getcontentwaytemplatelist"; //发明内容
            } else if ($("#hideditor3id").val() == "3_2" && whichTab == 3) {
                actionName = "getcontenteffecttemplatelist"; //发明内容
                tabName[3] = "发明内容-有益效果";
            }
            else if (whichTab == 3) {
                actionName = "getcontenttemplatelist"; //发明内容
                tabName[3] = "发明内容-技术问题";
            }
            datas = {
                action: actionName,
                patenttype: patentType,
                template_no: "", currentpage: pageindex, pagesize: 5//   只有权利要求才用得到这个参数，且这里是主权利的模板，所以传""即可
            };
            // $("#kbpage").show();
        }
        var url = _RootPath + "SelfWriteOperator.aspx";
        $.ajax({
            type: "post",
            url: url,
            dataType: "json", //返回值类型
            data: datas,
            success: function (sender) {
                if (sender.ReturnValue != '0') {
                    layer.close(loadclockserch);
                }
                else {
                    var obj = sender.Option;
                    var count = 0;
                    //var inde = 1;
                    if (whichTab == 5) {  // 附图和说明 
                        if (obj == null || obj.length == 0) {
                            modelStr += "<div class='model3' ><div class='img_text' style='color:#999'>本部分无模板使用。</div></div>";
                            $('#modelWrap').html(modelStr);
                        }
                        for (var key in obj) {
                            var tmpContent = clearkbfontcolor(obj[key].Content);

                            var len = tmpContent.length;
                            var end = len > 55 ? 55 : len;
                            var content = tmpContent.substring(0, end);

                            var end2 = len > 120 ? 120 : len;
                            var content2 = tmpContent.substring(0, end2);
                            //要调用图片展示的方法   模板库只返回fid  先显示还要去调src的接口
                            var fid = obj[key].Fid;
                            // alert("fid___"+fid); 
                            $.ajax({
                                type: "post",
                                url: url,
                                async: false,
                                dataType: "json", //返回值类型
                                data: {
                                    action: "gettemplatefile",
                                    fid: fid //@@fid
                                },
                                success: function (sender) {
                                    if (sender.ReturnValue != '0') {
                                        var tab = getselfwriteTab();
                                        seteditorheight(tab);
                                        layer.close(loadclockserch);
                                    }
                                    else {
                                        var obj = sender.Option;  //obj.path:Template/TemplateFile/模板一/附图1.jpg 
                                        // alert("obj.path___" + obj.path);
                                        //alert(" _RootPath + obj.path____" + _RootPath + obj.path);
                                        modelStr += "<div class='model3' ><div class='img'><img src='" + _RootPath + obj.path + "'/></div><div class='img_text'>" + content + "</div><div class='img_text' style='display:none'>" + content2 + "</div></div>";
                                        $('#modelWrap').html(modelStr);
                                        var tab = getselfwriteTab();
                                        seteditorheight(tab);
                                        layer.close(loadclockserch);
                                    }
                                },
                                error: function (sender) { layer.close(loadclockserch); }
                            });
                        }
                    } else if (whichTab == 6) {  //权利里的主权

                        var totalcount = sender.records;
                        var pagecount = parseInt((parseInt(totalcount) + 5 - 1) / 5, 10);
                        if (totalcount <= 5) {
                            $("#kbpage").hide(); $("#kbpage2").hide();
                        } else {
                            $("#kbpage").show(); $("#kbpage2").show();

                            if (pageindex == 1) {
                                $("#kbpage").html('<a style="color:#ccc" href="javascript:void(0);">上一页</a>&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',' + whichTab + ',' + (pageindex + 1) + ');">下一页</a>');

                            } else if (pageindex == pagecount) {
                                $("#kbpage").html('<a style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',' + whichTab + ',' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a style="color:#ccc" href="javascript:void(0);">下一页</a>');

                            }
                            else {
                                $("#kbpage").html('<a style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',' + whichTab + ',' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a  style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',' + whichTab + ',' + (pageindex + 1) + ');">下一页</a>');
                            } $("#kbpage2").html($.trim($("#kbpage").html()));
                        }
                        for (var key in obj) {
                            var tmpContent = clearkbfontcolor(obj[key].Content);

                            if (little < obj.length) {
                                count++;
                                little++;
                                var len = tmpContent.length;
                                var end = len > 55 ? 55 : len;
                                var content = tmpContent.substring(0, end);
                                var end2 = len > 120 ? 120 : len;
                                var content2 = tmpContent.substring(0, end2);
                                var tNo = $.trim(obj[key].Template_No);
                                modelStr += "<div class='model1' id=" + tNo + " style='overflow-x: hidden; overflow-y: hidden;'><div class='title'>模板 " + ((pageindex - 1) * 5 + count) + "：适用于" + obj[key].Tag + "</div><div class='content'><p class='small'><span>独立权利要求：</span>" + content + "</p><p class='big' style='display:none'><span>独立权利要求：</span>" + content2 + "</p>  <div class='button' onclick='duLi2(\"" + tNo + "\" )'>+设为模板</div></div></div>";

                                $('#modelWrap').html(modelStr);
                                var tab = getselfwriteTab();
                                seteditorheight(tab);
                                dragId += tNo + ";;";
                                bindDrag(dragId); //绑定eadyUI的拖拽事件   
                                layer.close(loadclockserch);
                            }

                        } //for结束
                    }
                    else {
                        var totalcount = sender.records;

                        var pagecount = parseInt((parseInt(totalcount) + 5 - 1) / 5, 10);
                        if (totalcount <= 5) {
                            $("#kbpage").hide(); $("#kbpage2").hide();
                        } else {
                            $("#kbpage").show(); $("#kbpage2").show();

                            if (pageindex == 1) {
                                $("#kbpage").html('<a style="color:#ccc" href="javascript:void(0);">上一页</a>&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',' + whichTab + ',' + (pageindex + 1) + ');">下一页</a>');

                            } else if (pageindex == pagecount) {
                                $("#kbpage").html('<a style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',' + whichTab + ',' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a style="color:#ccc" href="javascript:void(0);">下一页</a>');

                            }
                            else {
                                $("#kbpage").html('<a style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',' + whichTab + ',' + (pageindex - 1) + ');">上一页</a>&nbsp;&nbsp;<a  style="color:#0085d0" href="javascript:showKindsDragModel(' + patentType + ',' + whichTab + ',' + (pageindex + 1) + ');">下一页</a>');
                            } $("#kbpage2").html($.trim($("#kbpage").html()));
                        }
                        for (var key in obj) {
                            var tmpContent = "";
                            if (whichTab == 0) {
                                tmpContent = clearkbfontcolor(obj[key].Title);
                            } else {
                                tmpContent = clearkbfontcolor(obj[key].Content);
                            }

                            if (little < obj.length) {
                                little++; count++;
                                var len = tmpContent.length;
                                var end = len > 55 ? 55 : len;
                                var content = tmpContent.substring(0, end);
                                var end2 = len > 120 ? 120 : len;
                                var content2 = tmpContent.substring(0, end2);
                                var tNo = $.trim(obj[key].Template_No);
                                modelStr += "<div class='model1' id=" + tNo + " style='overflow-x: hidden; overflow-y: hidden;'><div class='title'>模板 " + ((pageindex - 1) * 5 + count) + "：适用于" + obj[key].Tag + "</div><div class='content'><p class='small'><span>" + tabName[parseInt(whichTab)] + "：</span>" + content + "</p><p class='big' style='display:none'><span>" + tabName[parseInt(whichTab)] + "：</span>" + content2 + "</p>  <div class='button' style='z-index:500000;' onclick='fullEditor(\"" + tNo + "\")'>+设为模板</div></div></div>";
                                // tempId  换成 obj[key].ID _0211


                                $('#modelWrap').html(modelStr);
                                var tab = getselfwriteTab();
                                seteditorheight(tab);
                                dragId += tNo + ';;';
                                bindDrag(dragId); //绑定eadyUI的拖拽事件      
                                layer.close(loadclockserch);
                            }

                        } //for结束
                    }
                    $("#modelbutton").hide();
                }
            },
            error: function (sender) { layer.close(loadclockserch); }
        });
    }



}
//=====================shang




function searModel(e) {
    $(e).attr('class', 'menud').siblings().attr('class', 'menudh');
    //编辑区显示模板  右侧显示模板
    var patentType = getipcType();
    patentType = "0";
    stayModel();
    var tab = getselfwriteTab();
    seteditorheight(tab);
    var eleindex = getselfwriteEle();
    if (tab == 6 && eleindex != "1") {
        $('.keyword').show();
    } else $('.keyword').hide();
    if (tab == 5 || tab == 7 || tab == 8) {
        $("#kbpage").hide(); $("#kbpage2").hide();
    }
    else if (tab == 6 && eleindex == "1") {
        $('#kbpage').hide(); $("#kbpage2").hide();
    }
    else {
        $("#kbpage").show(); $("#kbpage2").show();
    }

}

//模板库函数↑


function searPatent(e) {

    $("#kbpage").hide(); $("#kbpage2").hide();
    var contentStr = '<div class="model2"><div class="img_text">您可以在输入框中输入文字，然后选中一段文字，点击搜专利，查看别人是怎么写的</div></div>';
    $('.patentWrap').html(contentStr);
    //    $('.patentWrap').html(""); //清空搜索结果
    if (getipcType() == "0") {//”0“ 没选专利类型
        alert1();
        return;
    }

    var modelType = gethidKBTemplet();
    if (modelType == 0) {  //0 没选择模板 
        alert3();
        return;
    }

    $(e).attr('class', 'menud').siblings().attr('class', 'menudh');
    $('.patentWrap').show().siblings().hide();
    //$('.keyword').show();  默认点击此表签 展示为空 
    var tab = getselfwriteTab();
    seteditorheight(tab);

    if (tab == 6) {
        $('.keyword').hide();
    }
}

//知识库里的附图及说明
function picNInstruc() {
    $("#kbpage").hide(); $("#kbpage2").hide();
    if (getipcType() == "0") {//”0“ 没选专利类型
        alert2();
        return;
    }
    var modelType = gethidKBTemplet();
    if (modelType == 0) {  //0 没选择模板 
        alert3();
        return;
    }

    $('#picNinS').attr('class', 'menud').siblings().attr('class', 'menudh');
    $('#pNlWrap').show().siblings().hide();
    //$('.keyword').hide();
    //  通过patentId去后台读取附图和说明的信息 根据返回结果展示 
    var patentId = getselfwriteID();
    if (patentId == "") {
        var picNull = "<div class='img_text' style='color:#999;'>暂无附图</div>";
        $('#pNlWrap').html(picNull);
        return;
    }

    var tab = getselfwriteTab();
    if (tab == 6) {
        $('.keyword').hide();
    }

    var url = _RootPath + "SelfWriteOperator.aspx";

    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: {
            action: "getamlistbypid",
            pid: patentId
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                var obj = sender.Option;
                if (obj.length == 0) {
                    var picNull = "<div class='img_text' style='color:#999;'>暂无附图</div>";
                    $('#pNlWrap').html(picNull);
                } else {
                    //通过fid  去查图片
                    var picStr = "";
                    var num = 0;
                    var num2 = obj.length;
                    for (var key in obj) {  //外层的循环
                        var fid = obj[key].Fid;
                        var instruction = obj[key].Instruction;
                        $.ajax({
                            type: "post",
                            url: url,
                            dataType: "json", //返回值类型
                            async: false,
                            data: {
                                action: "getpatentfile",
                                fid: fid
                            },
                            success: function (sender) {
                                if (sender.ReturnValue != '0') {
                                    layer.alert(sender.ErrorInfo);
                                }
                                else {
                                    var obj2 = sender.Option;
                                    if (obj2.path != "") {
                                        picStr += "<div class='img'><img src='../" + obj2.path + "'/></div><div class='img_text'>" + instruction + "</div>";
                                    }
                                    num++;
                                    if (num == num2) {
                                        if (picStr == "") {
                                            $('#pNlWrap').html("<div class='img_text' style='color:#999;'>暂无附图</div>");
                                        } else {
                                            $('#pNlWrap').html(picStr);
                                        }
                                    }
                                }
                            },
                            error: function (sender) { }
                        });
                    }
                    var tab = getselfwriteTab();
                    seteditorheight(tab);
                }
            }
        },
        error: function (sender) { }
    });

}


//最大化最小化
function bigSmall(e) {
    var MorP = findMorP();
    var scBsClassName = $('#scBs').attr('class');
    if (scBsClassName == "shousou") {  //由小变大
        $('.center').css('width', '50%');
        $('.right1').css('width', '50%');
        if (MorP == 0) {
            $('.big').show();
            $('.small').hide();
        } else if (MorP == 1) {
            $('.bigP').show();
            $('.smallP').hide();
        }
        $('#scBs').attr('class', 'shousouh');
    } else if (scBsClassName == "shousouh") {
        $('.center').css('width', '75%');
        $('.right1').css('width', '25%');
        if (MorP == 0) {
            $('.big').hide();
            $('.small').show();
        } else if (MorP == 1) {
            $('.bigP').hide();
            $('.smallP').show();
        }
        $('#scBs').attr('class', 'shousou');
    }
    setEditorWidth();
}


//辅助功能函数↓
//获取隐藏域模板库选择的是大类还是小类
function gethidKBTemplet() {
    var value = 0;
    value = $("#hidKBTemplet").val();
    if (value == undefined || value == "")
        value = 0;
    return value;
}
//设置隐藏域模板库的值  0 没选择模板；1大类；2小类
function sethidKBTemplet(value) {
    $("#hidKBTemplet").val(value);
}
function findMorP() {  //判断知识库里 当前显示的是 模板库还是搜专利
    var MorP = "";
    $(".data_menu").find("div").each(function (index) {
        if ($(this).attr('class') == "menud") {
            MorP = index;  //0是模板库 1是搜专利 
        }
    });
    return MorP;
}
function num2ActionName(whichTab) {//数字转换成接口需要的action的参数值
    whichTab = parseInt(whichTab);
    var actionName = "";
    switch (whichTab) {
        case 0:
            actionName = "gettemplatelist"; //发明名称
            break;
        case 1:
            actionName = "getipctemplatelist"; //技术领域
            break;
        case 2:
            actionName = "getbacktemplatelist"; //背景技术
            break;
        case 3:
            actionName = "getcontenttemplatelist"; //发明内容
            break;
        case 4:
            actionName = "getimplementtemplatelist"; //具体实施方式
            break;
        case 5:
            actionName = "getpictemplatelist"; //附图及说明
            break;
        case 6:
            actionName = "getclaimtemplatelist"; //权利要求    这里返回主权利的 getclaimtemplatelist
            break;
        case 7:
            actionName = "getabstracttemplatelist"; //摘要  只取其中文字
            break;
        case 8:
            actionName = "getabstracttemplatelist"; //摘要附图  只取其中图片
            break;
    }
    return actionName;
}
function num2tabName(whichTab) {  //数字转换成接口需要的参数
    //alert("whichTab_" + whichTab);
    //  alert(typeof whichTab);
    whichTab = parseInt(whichTab);
    var tabName = "";
    switch (whichTab) {
        case 0:
            tabName = "gettitlevalues"; //标题
            break;
        case 1:
            tabName = 'gettechfieldvalues'; //技术领域
            break;
        case 2:
            tabName = 'gettechbackvalues'; //背景技术
            break;
        case 3:
            tabName = 'getdescvalues'; //发明内容 
            break;
        case 4:
            tabName = 'gethowtodovalues'; //实施方案
            break;
        case 5:
            tabName = 'getfigdescvalues'; //附图及说明
            break;
        case 6:
            tabName = 'getclaimvalues'; //权利要求
            break;
        case 7:
            tabName = 'getabstractvalues'; //摘要
            break;
    }
    //alert("tabName_" + tabName);
    return tabName;
}

function morePatent(patentNo, tType, pubTime, issueTime) {
      // alert("ptType__" + tType);
    //    alert("patentNo__" + patentNo);
    //    alert("pubTime__" + pubTime);
       //    alert("issueTime__" + issueTime);  CNS0
       /*old*/
//    if (tType == "1" || tType == "8") {
//        $('#kb_strSources').val('fmzl');
//    } else if (tType == "2" || tType == "9") {
//        $('#kb_strSources').val('syxx');
//    } else if (tType == "4") {
//        $('#kb_strSources').val('fmsq');
//    }
//    else if (tType == "3") {
//        $('#kb_strSources').val('wgzl');
       //    }
       /*old ↑*/

       if (tType == "CNA0" ) { //发明专利
           $('#kb_strSources').val('fmzl');
       } else if (tType == "CNY0") { //实用新型
           $('#kb_strSources').val('syxx');
       } else if (tType == "CNB0") { //发明授权
           $('#kb_strSources').val('fmsq');
       }
       else if (tType == "CNS0") { //外观设计
           $('#kb_strSources').val('wgzl');
       }

    var subTime = (issueTime != "nll") ? issueTime : pubTime;   //这里如果两个时间都没有那传的就是‘nll’了
    //处理专利号
    var subPatentNo = "";
    if (patentNo == 'nll') {
    }
    else if (patentNo.indexOf(".") > -1)
        subPatentNo = patentNo.toUpperCase().substring(0, patentNo.indexOf("."));
    else
        subPatentNo = patentNo.toUpperCase();
    //结束↑
    subTime = (subTime == "nll") ? "" : subTime;
    //    alert("patentNo" + patentNo);
    //    alert("subPatentNo" + subPatentNo);
    //    alert("subTime" + subTime);
    $('#kb_strWhere').val('an=(' + subPatentNo + ') and pd=(' + subTime + ')');
    document.kb_searchForm.submit();
}
function bindDrag(str) {
    $('.edui-container').css('z-index', '0');
    var sstr = str.split(';;');
    for (var i = 0; i < sstr.length - 1; i++) {
        $('#' + sstr[i]).draggable({
            revert: true,
            proxy: function (source) {


                var div = $('<div id="sss" class="modelmm"  style="z-index:1;overflow: hidden;" ><div/>');
                //  alert($(this).clone().html());     model1sr
                //<div class="title">模板 1：适用于发明；产品；机械结构；碳石墨环；轴密封；螺纹；凹槽；筛网环</div><div class="content"><p class="small"><span>发明名称：</span>一种（产品类型的名称）[碳石墨环轴密封结构]</p><p class="big" style="display:none"><span>发明名称：</span>一种（产品类型的名称）[碳石墨环轴密封结构]</p>  <div class="button" style="z-index:500000;" onclick="fullEditor(&quot;100030010000&quot;)">+设为模板</div></div>
                var clone = $(this).clone().html();
                div.append(clone);
                div.insertBefore($(source).parent().parent().parent());
                $("#sss").find(".button").remove();
                $("#sss").css({ "width": $(source).width() + "px" });
                return div;
            },
            onStartDrag: function () {

                $(this).draggable('proxy').hide();
            },
            onDrag: function () {
                $('#sss').css({ "position": "absolute", "z-index": "1" });
                $(this).draggable('proxy').css("position", "absolute");

                $(this).draggable('proxy').show();



            },
            onStopDrag: function () {
                $('#sss').remove();

            }
        });
        $("#" + sstr[i]).hover(function () {
            //85是顶部到模板库的位置    38是模板库到页尾的上面那一点白   75/25是页尾高度的一半
            $("#hidmodelbutton").val($(this).attr("id")); 
            var gundongtiao = $(document).scrollTop();//这是外面那个滚动条高度
           
            if (($(this).offset().top + ($(this).height()) / 2) > 85 && ($(this).offset().top + ($(this).height()) / 2) < 38 + 25 + $(".right_right_bot").height()) {

                $("#modelbutton").css({ "position": "fixed", "top": ($(this).offset().top - gundongtiao + ($(this).height()) / 2) + "px", "left": ($(this).offset().left + ($(this).width() - 80) / 2) + "px" }).show();

            }

            else {
                $("#modelbutton").css({ "position": "fixed", "top": ($(this).offset().top + ($(this).height()) / 2) + "px", "left": ($(this).offset().left + ($(this).width() - 80) / 2) + "px" }).hide();

            }
        }, function () {

        });
    }

    $(".right1").hover(function () { }, function () { $("#modelbutton").hide(); });
    $(".data_menu").hover(function () { $("#modelbutton").hide(); }, function () { });
    $(".data_title").hover(function () { $("#modelbutton").hide(); }, function () { });
    $(".keyword").hover(function () { $("#modelbutton").hide(); }, function () { });


    bindAcceptDrag('myEditor0');
    bindAcceptDrag('myEditor1');
    bindAcceptDrag('myEditor2');
    bindAcceptDrag('myEditor3');
    bindAcceptDrag('myEditor3_1');
    bindAcceptDrag('myEditor3_2');
    bindAcceptDrag('myEditor4');
    bindAcceptDrag('myEditor5');
    bindAcceptDrag('myEditor6');
}

function modelbuttonclick() {
    var modelid = $("#hidmodelbutton").val();

    $("#" + modelid).find(".button").click();
}

function bindAcceptDrag(str) {
    $('#' + str).droppable({
        disabled: false, onDragEnter: function (e, source) {
            $(source).draggable('options').cursor = 'pointer';
        },
        onDragLeave: function (e, source) {
            $(source).draggable('options').cursor = 'pointer'; // 'not-allowed';
        },
        onDrop: function (e, source) {
            var thiseditorid = $(this).attr('id');
            //            alert("testtest" + thiseditorid);
            if (("myEditor" + $("#hidfocusid").val()) != thiseditorid && $("#hidfocusid").val() != "") {
                thiseditorid = "myEditor" + $("#hidfocusid").val();
            }
            //  alert("testtest11" + thiseditorid); 
            var wTab = getselfwriteTab();  //哪个选项卡
            if (thiseditorid != "myEditor" + wTab && thiseditorid.indexOf("myEditor" + wTab + "_") < 0)//拖拽的是当前标签的当前编辑区id位置
            {
                return;
            }
            if (wTab == "6") {
                //  UM.getEditor(thiseditorid).focus();
                $("#" + thiseditorid).focus();
                $("#hidclaimid").val(thiseditorid.replace("myEditor", ""));
            } else if (wTab == "3") {
                // $("#" + thiseditorid).focus();
                var nowtab3 = $("#hideditor3id").val();
                if (nowtab3 == "")
                    nowtab3 == "3";
                if (nowtab3 != thiseditorid.replace("myEditor", ""))
                    return;
            }
            var tempId = $(source).attr('id');
            //     alert("tempId__" + tempId);
            if (tempId.indexOf("duli_") >= 0) {
                tempId = tempId.split("duli_")[1];
                fullEditor(tempId, 1);
            } else if (tempId.indexOf("cong_") >= 0) {
                tempId = tempId.split("cong_")[1];
                fullEditor(tempId, 2);
            } else {
                fullEditor(tempId); //拖进去后直接更新编辑区就行了 不用别的操作
            }
        }
    });

}
