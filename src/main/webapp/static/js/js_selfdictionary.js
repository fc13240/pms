function otherWeb(whichWeb) {
    var uurl = window.location.href;
    //http://localhost:5287/SelfWrite/self/selfwrite.aspx#1=1&ele=0&id=1919&tab=1
    //http://192.168.0.10:7305/self/selfwrite.aspx?id=1919#1=1&ele=0&id=1919&tab=0  
    //有问题 http://gxself.izhiliao.com.cn/self/selfwrite.aspx?desvalue=534&destype=1#1=1&ele=0&id=2186&tab=0
    if (uurl.indexOf("desvalue") > -1) { 
        var frontUrl = uurl.split('?')[0];
        var endUrl = uurl.split('#')[1];  //1=1&ele=0&id=1920&tab=1
        var eles = endUrl.indexOf("&ele=");
        var ids = endUrl.indexOf("&id=");
        var tabs = endUrl.indexOf("&tab=");

        var elestr = endUrl.substring(eles + 5, ids);
        var idstr = endUrl.substring(ids + 4, tabs);
        var tabstr = endUrl.substring(tabs + 5, endUrl.length);
        alert("elestr__" + elestr);
        alert("idstr__" + idstr);
        alert("tabstr__" + tabstr);
        var newUrl = frontUrl + '?id=' + idstr + '#1=1&ele=' + elestr + '&id=' + idstr + '&tab=' + tabstr;
        // alert("newUrl____"+newUrl);
        window.location.href = newUrl;

    } else {
        if (uurl.indexOf('#') != -1 && uurl.indexOf('?') == -1 && uurl.indexOf('1=1') != -1) {
            var frontUrl = uurl.split('#')[0];
            var endUrl = uurl.split('#')[1];  //1=1&ele=0&id=1920&tab=1
            var eles = endUrl.indexOf("&ele=");
            var ids = endUrl.indexOf("&id=");
            var tabs = endUrl.indexOf("&tab=");

            var elestr = endUrl.substring(eles + 5, ids);
            var idstr = endUrl.substring(ids + 4, tabs);
            var tabstr = endUrl.substring(tabs + 5, endUrl.length);
            var newUrl = frontUrl + '?id=' + idstr + '#1=1&ele=' + elestr + '&id=' + idstr + '&tab=' + tabstr;
            // alert("newUrl____"+newUrl);
            window.location.href = newUrl;
        }
    }
     
    
    var keyWord = $.trim($('#keyWord').val());
    var enkeyWord = encodeURI(keyWord); 
    switch (whichWeb) {

        case "baike":
            window.open("http://baike.baidu.com/search/word?word=" + enkeyWord);

            //    window.open("http://baike.baidu.com/item/" + keyWord);
            break;
        case "being":
            window.open("http://www.bing.com/knows/search?q=" + enkeyWord + "&mkt=zh-cn");
            break;
        case "wky":
            window.open("http://zh.wikipedia.org/wiki/" + enkeyWord);
            break;
        case "zhiwang":
            document.getElementById("inputkw").value = keyWord;
            document.getElementById("zwform").submit();
            break;
        default:

    }
}
function setInstantState() {
    var inst;
    if ($("#ctl00_Self_Dictionary1_hideInstantDic").length==0)
        inst = $('#Self_Dictionary1_hideInstantDic').val();
    else
        inst = $('#ctl00_Self_Dictionary1_hideInstantDic').val();
    if (inst == "offInstant") {
        $('#instant').css('background', 'url(' + _SkinPath + 'self/images/jishi.png) no-repeat scroll 0 4px').css('color', '#709cec');
    } else {
        $('#instant').css('background', 'url(' + _SkinPath + 'self/images/jishi.png) no-repeat scroll 0 -25px').css('color', '#075db3');
    }
}
function instantDic() {//即划即查状态的改变
    var inst;
    if ($("#ctl00_Self_Dictionary1_hideInstantDic").length == 0)
        inst = $('#Self_Dictionary1_hideInstantDic').val();
    else
        inst = $('#ctl00_Self_Dictionary1_hideInstantDic').val();
    // 1、样式变了
    if (inst == "offInstant") {
        //2然后给如玉一个隐藏域的值 他一读就知道是即划即查了 
        if ($("#ctl00_Self_Dictionary1_hideInstantDic").length == 0)
            $('#Self_Dictionary1_hideInstantDic').val("onInstant");
        else
            $('#ctl00_Self_Dictionary1_hideInstantDic').val("onInstant");
        $('#instant').css('background', 'url(' + _SkinPath + 'self/images/jishi.png) no-repeat scroll 0 -25px').css('color', '#075db3');
    }
    else if (inst == "onInstant") {
        if ($("#ctl00_Self_Dictionary1_hideInstantDic").length==0)
            $('#Self_Dictionary1_hideInstantDic').val("offInstant");
        else
            $('#ctl00_Self_Dictionary1_hideInstantDic').val("offInstant");
        $('#instant').css('background', 'url(' + _SkinPath + 'self/images/jishi.png) no-repeat scroll 0 4px').css('color', '#709cec');
    }
}


function iDictionary() {//添加到个人词库

    var keyWord = $.trim($('#keyWord').val()); //读文本框里的文字，就是把这个词添加到个人词库中去
    var userId = $("#hiduserid").val();
    if (keyWord == '') {
        layer.alert("请输入要添加的词条");
        return false;
    }
    var swid = getselfwriteID();
    if (swid == "")
    { trysaveeditor0byfirst(keyWord); }
    else {
        AddPatentItem(swid, $.trim(keyWord));
    }
    var url = _RootPath + "default.aspx";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: { action: 'addrepository', userid: userId, key: keyWord },
        success: function (sender) {
            if (sender.ReturnValue != '0') {

                layer.alert(sender.ErrorInfo);
            }
            else {
                var obj = sender.Option;
                // alert(obj);    是OK 
                $('#iAdd').attr('src', _SkinPath + 'self/images/duigou.png');
            }
        },
        error: function (sender) { }
    });
}

function doSearch(keyWord) {   //‘化妆品’
    var wholeDocuHig = parseInt(document.body.scrollHeight); //是文档窗口高度
    if (keyWord == "" || keyWord == "请输入查询内容") {
        //layer.alert("请输入关键词");
        return false;
    }
    var url = _RootPath + "default.aspx";
    $.ajax({
        type: "post",
        url: url,
        dataType: "json", //返回值类型
        data: { action: "getitemsbyindex", key: keyWord },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                var obj = sender.Option;
                if (obj.length > 0) {
                    $('#add_selfDic').show(); //添加到个人词库show
                    $('#rs_word1').hide();
                    $('#rs_word2').show(); //相关词show
                    var str = "<a>相关词：</a>";
                    for (var i = 0; i < obj.length; i++) {
                        if ($('#hidFromEdit').val() == "1") {//可以替换编辑区的这样拼
                            str += '<a class="sr_a" onclick="re_edit(\'' + obj[i] + '\');" style="cursor:pointer" title="单击替换关键词">' + obj[i] + '</a>';
                        } else {//不能替换编辑区的这样拼
                            str += '<a class="sr_a" onclick="re_edit(\'' + obj[i] + '\');" style="cursor:pointer">' + obj[i] + '</a>';
                        }
                    }
                    $('#rs_word2').html(str);
                }
                else if (obj.length == 0) {
                    $('#add_selfDic').show(); //添加到个人词库show
                    $('#rs_word1').show();
                    $('#rs_word2').hide(); //对不起show
                }
            }
        },
        error: function (sender) { }
    });

}
function re_edit(replace_word) {
    var fromEdit = $('#hidFromEdit').val();
    if (fromEdit == "0") {//不是来自编辑区的词  点击后没有效果 直接返回
        return;
    }
    replacetext(replace_word);
    //alert("replace_word::" + replace_word);
    $('#hidFromEdit').val('0'); //用完将隐藏域还原
    // $("#closeDic").trigger("click");
}
function edit_search(txt_value, e, btn) {//    从编辑区输入到文本框 
    var inst;
    if ($("#ctl00_Self_Dictionary1_hideInstantDic").length==0)
        inst = $('#Self_Dictionary1_hideInstantDic').val();
    else
        inst = $('#ctl00_Self_Dictionary1_hideInstantDic').val();
    if (arguments.length == 2 && inst == "offInstant") {  //是划过来的 并且没有打开即划即查 
        return;
    }

    //  $("#hidtooltip").val(txt_value);
    //  $('#hidLeft').val($(e).offset().left);
    //   $('#hidTop').val($(e).offset().top + $(e).height());

    // alert("e.pageX::" + e.pageX);
    // alert("e.pageY::" + e.pageY);
    $('#hidLeft').val(e.pageX); //e.pageX是left    e.pageY是top
    $('#hidTop').val(e.pageY);


    $('#hidFromEdit').val('1'); //控制可以替换编辑区的相近词
    buildDialog(); //先构建出词典dialog
    var keyWord = $.trim(txt_value);
    $('#keyWord').val(keyWord);
    setInstantState();  //即划即查状态也需要在这里查好后 设置好
    setPinState();  //小钉子的状态在这里查好 设置好
    doSearch(keyWord);
}
function dic_search() {//在字典上输入到文本框 
    $('#hidFromEdit').val('0');   //控制不能替换编辑区的相近词
    buildDialog(); //先构建出词典dialog
    var keyWord = $.trim($('#keyWord').val());
    setInstantState();  //即划即查状态也需要在这里查好后 设置好
    setPinState();  //小钉子的状态在这里查好 设置好
    doSearch(keyWord);
}
function setPinState() {
    var pinState;
    if ($("#ctl00_Self_Dictionary1_hideBinState").length==0)
        pinState = $('#Self_Dictionary1_hideBinState').val();
    else
        pinState = $('#ctl00_Self_Dictionary1_hideBinState').val();
    if (pinState == "onBin") {
        $('#unpin').hide();
        $('#pin').show();
        pin = true; //2、点击其他地方也不自动关闭了 
        $('#www_codefans_net').css('position', 'fixed');     //3、始终在屏幕一个位置出现
    } else {
        $('#unpin').show();
        $('#pin').hide();
        pin = false; //2、点击其他地方也不自动关闭了  
        $('#www_codefans_net').css('position', 'absolute');     //3、不固定在屏幕上了
    }
}
function onPin() {

    if ($("#ctl00_Self_Dictionary1_hideBinState").length==0)
        $('#Self_Dictionary1_hideBinState').val("onBin");    //改变状态为：把不钉住改为钉住 
    else
        $('#ctl00_Self_Dictionary1_hideBinState').val("onBin");    //改变状态为：把不钉住改为钉住 



    $('#unpin').hide();
    $('#pin').show();
    pin = true; //2、点击其他地方也不自动关闭了 
    $('#www_codefans_net').css('position', 'fixed');     //3、始终在屏幕一个位置出现
}
function offPin() {
    if ($("#ctl00_Self_Dictionary1_hideBinState").length==0)
        $('#Self_Dictionary1_hideBinState').val("offBin");    //改变状态为：把钉住改为不钉住 
    else
        $('#ctl00_Self_Dictionary1_hideBinState').val("offBin");    //改变状态为：把钉住改为不钉住  

    $('#unpin').show();
    $('#pin').hide();
    pin = false; //2、点击其他地方也不自动关闭了  
    $('#www_codefans_net').css('position', 'absolute');     //3、不固定在屏幕上了
}