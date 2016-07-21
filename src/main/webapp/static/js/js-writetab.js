
function tabChange(whichTab, flag, isclaim) {//whichTab:0-8代表第1-第9个选项卡,增加一个flag用于切换时候看是否需要判断专利类型 
    $("#cidiantishi").hide();
    //标签操作要做的几个重点：提示是否选择了专利类型；保存上一个标签编辑区；标签切换到当前标签；切换撰写小贴士；获取当前标签编辑区；获取当前标签的模版库内容；
    if (flag == undefined)
        flag = true;
    if (isclaim == undefined)
        isclaim = true;
    //1、提示是否选择了专利类型；：增加一个flag用于切换时候看是否需要判断专利类型、模板的选择
   // if (getipcType() == "0" && flag) {
    //    alert2();
   //     return;
   // }
	
    //用户选择专利类型之后，可以选择模板撰写，也可以不选择模板直接进行撰写。所以注释模版判断
    //----------start
    //    var modelType = gethidKBTemplet();
    //    if ((modelType == 0 || modelType == 1) && flag) {  //0 没选择模板 
    //        alert3();
    //        return;
    //    }
    //----------end

    //2、保存上一个标签编辑区：如果选择的不是当前标签，将当前标签的内容保存
    if (flag)//切换标签时，flag=true，保存上一标签的内容再切换标签
    {
		alert(222332);
        var oldtab = $("#tabWrap").find(".tab1").attr("value");
        if (oldtab != whichTab) {
			//  保存之前的记录  开始
            if (checktext08(oldtab)) {
                if (getselfwriteID() == "")
                    save_selfwritebyTab(oldtab, false);
                else {
                    var eleindex = getselfwriteEle();
                    if (eleindex == "1" && oldtab == "6") {//汇总5--7的6）在要素关系切换标签保存要素信息
                        if (checkelenameisnull()) {
                            layer.alert("要素名称不能为空。");
                            return;
                        }
                        if (checkeleothersisnull()) {
                            layer.alert("同一条要素的要素描述、要素限定二者之一不为空。");
                            return;
                        }
                        save_selfwritebyTab(10);
                    } else {
                        save_selfwritebyTab(oldtab);
                    }
                }
            }
			//  保存之前的记录  结束
            else
                return;
        }
		
        else return; //如果是当前标签则无操作
    }

    //3、标签切换到当前标签；
    $("div[name='tabs']:eq(" + whichTab + ")").attr('class', 'tab1').siblings().attr('class', 'tab1h');

    //4、切换撰写小贴士：设置小贴士的显示内容，并且在隐藏域里记录是哪一个小贴士 
    setTips(whichTab);

    //    $("div[id^='myEditor']").each(function(){
    //         $(this).droppable({
    //             disabled: false
    //      });
    //         });
    // $('#myEditor' + whichTab).droppable("option", "disabled", false);           
    //   $('#myEditor' + whichTab).droppable({
    //            disabled: false
    //        });
    //   $('#myEditor' + whichTab).attr("disabled", "true");
    //5、获取当前标签编辑区：编辑区更新 
    var id = getselfwriteID();
    if (id != "") {
        if (window.location.hash.indexOf('&ele=') > -1 & isclaim) {
            var eleindex = /ele=[^&]*/.exec(window.location.hash.substring(window.location.hash.indexOf('&ele=')))[0].replace('ele=', ''); 
            window.location.hash = "#1=1&id=" + id + "&tab=" + whichTab + eleindex;
        }
        if (window.location.href.indexOf('&ele=') > -1 & isclaim) {
            var eleindex =/ele=[^&]*/.exec(window.location.hash.substring(window.location.hash.indexOf('&ele=')))[0].replace('ele=', '');// window.location.href.substring(window.location.href.indexOf('&ele='));
            window.location.hash = "#1=1&id=" + id + "&tab=" + whichTab + eleindex;
        }
        else
            window.location.hash = "#1=1&ele=0&id=" + id + "&tab=" + whichTab;
       // alert(window.location.hash);
    }
    if (whichTab == 5) {
        $("#cidiantishi").hide();
        $("div[id^='content']").hide();
        //
        if (id != "") {
            var url = _RootPath + "SelfWriteOperator.aspx";
            $.ajax({
                type: "post",
                url: url,
                dataType: "json", //返回值类型
                data: {
                    action: "getamlistbypid",
                    pid: id
                },
                success: function (sender) {
                    if (sender.ReturnValue != '0') {
                        layer.alert(sender.ErrorInfo);
                    }
                    else {
                        var obj = sender.Option;
                        if (obj.length == 0) {//没有附图
                            $("#content5_build").show();
                            addPic();
                        } else {
                            $("#content5").show();
                            piclistShow();
                            setEditorWidth();
                        }

                    }
                },
                error: function (sender) { }
            });
        }
        else {
            $("#cidiantishi").hide();
            $("#content5_build").show();
            addPic();
        }

    } else if (whichTab == 8) {
        $("#cidiantishi").hide();
        $("div[id^='content']").hide();
        tabChange2();
    } else {
        seteditor(whichTab, 0, id);
    }
    //6、获取当前标签的模版库内容:模板库更新 
    $('#modelS').attr('class', 'menud').siblings().attr('class', 'menudh');
    //sr  $('#modelWrap').show().siblings().hide();
    $('.keyword').hide();


    var patentType = getipcType();
    sethidKBTemplet("2");
    //alert("patentType__Q" + patentType);
    little = 0; //每次单击选项卡，都应该让little为0，这样就能生成对应这个选项卡的小类模板了，否则不行

    if (patentType == 0) {
        showAllModel();
    } else {
        var eleindex = getselfwriteEle();
        if (eleindex == "1" && whichTab == "6") {
            showKindsDragModel(patentType, 10);
        } else {
            showKindsDragModel(patentType, whichTab);
        }
    }



    ScrollTop();
    closetips(whichTab);
}


//修改专利类型时候设置一下第一个名称标签的文字
function settabNameBytype(type) {
    if (type == 2)
        $("div[name='tabs']:eq(0)").text("实用新型名称");
    else
        $("div[name='tabs']:eq(0)").text("发明名称");
}

function checktext08(oldtab) {
    var error_content = $.trim($("#error_content" + oldtab).html());

    if (error_content.indexOf("已经超过上限") > -1) {
        layer.alert(error_content); return false;
    } return true;
}

//关闭质检结果提示框
function closetips(type) {
    var currenttipsindex;
    if (type == 0) {
        currenttipsindex = $("#divclaimtips").val();
        $("#divclaimtips").val("");
        layer.close(currenttipsindex);
    }
    else if (type == 1) {
        if ($("#divtitletips").val() != "") {
            currenttipsindex = $("#divtitletips").val();
            $("#divtitletips").val("");
        }
        else if ($("#divclaimtips").val() != "") {
            currenttipsindex = $("#divclaimtips").val();
            $("#divclaimtips").val("");
        }
        layer.close(currenttipsindex);
    }
    else if (type == 2) {
        if ($("#divtitletips").val() != "") {
            currenttipsindex = $("#divtitletips").val();
            $("#divtitletips").val("");
        }
        else if ($("#divclaimtips").val() != "") {
            currenttipsindex = $("#divclaimtips").val();
            $("#divclaimtips").val("");
        }
        layer.close(currenttipsindex);
    }
    else if (type == 3) {
        if ($("#divtitletips").val() != "") {
            currenttipsindex = $("#divtitletips").val();
            $("#divtitletips").val("");
        }
        else if ($("#divclaimtips").val() != "") {
            currenttipsindex = $("#divclaimtips").val();
            $("#divclaimtips").val("");
        }
        layer.close(currenttipsindex);
    }
    else if (type == 4) {
        if ($("#divtitletips").val() != "") {
            currenttipsindex = $("#divtitletips").val();
            $("#divtitletips").val("");
        }
        else if ($("#divclaimtips").val() != "") {
            currenttipsindex = $("#divclaimtips").val();
            $("#divclaimtips").val("");
        }
        layer.close(currenttipsindex);
    }
    else if (type == 5) {
        if ($("#divtitletips").val() != "") {
            currenttipsindex = $("#divtitletips").val();
            $("#divtitletips").val("");
        }
        else if ($("#divclaimtips").val() != "") {
            currenttipsindex = $("#divclaimtips").val();
            $("#divclaimtips").val("");
        }
        layer.close(currenttipsindex);
    }
    else if (type == 6) {
        currenttipsindex = $("#divtitletips").val();
        $("#divtitletips").val("");
        layer.close(currenttipsindex);
    }
    else if (type == 7) {
        if ($("#divtitletips").val() != "") {
            currenttipsindex = $("#divtitletips").val();
            $("#divtitletips").val("");
        }
        else if ($("#divclaimtips").val() != "") {
            currenttipsindex = $("#divclaimtips").val();
            $("#divclaimtips").val("");
        }
        layer.close(currenttipsindex);
    }
    else if (type == 8) {
        if ($("#divtitletips").val() != "") {
            currenttipsindex = $("#divtitletips").val();
            $("#divtitletips").val("");
        }
        else if ($("#divclaimtips").val() != "") {
            currenttipsindex = $("#divclaimtips").val();
            $("#divclaimtips").val("");
        }
        layer.close(currenttipsindex);
    }
}