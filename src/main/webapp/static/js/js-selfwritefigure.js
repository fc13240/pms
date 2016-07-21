 


function deletePic(picId) {
    layer.confirm('是否确定要删除该附图？', function (index) {
        var url = _RootPath + "SelfWriteOperator.aspx";
        $.ajax({
            type: "post",
            url: url,
            dataType: "json", //返回值类型
            data: {
                action: "deleteattachedmapbyid",
                id: picId
            },
            success: function (sender) {
                if (sender.ReturnValue != '0') {
                   // layer.alert(sender.ErrorInfo);
                }
                else {
                    layer.alert("删除附图成功！");
                    piclistShow();
                    if ($('#picNinS').attr('class') == "menud") {
                        picNInstruc();
                    } 
                }
            },
            error: function (sender) { }
        });
    }, function (index) {
        layer.close(index);
        return false;
    });
}
function editPic(picId, sqaureIndex, picSrc,fid) {//sqaureIndex:方框里那个数字，不存库    picId:当前附图的id
    $('#ft_hidSrc').val(picSrc); //存当前编辑的图片的地址
    $('#ft_hidFid').val(fid); //存当前编辑的图片的fid
    $.ajax({ url: _RootPath + 'self/selfwritefigure.aspx', //@@@@@@@@后台编辑
        type: 'POST',
        data: { picId: picId, sqaureIndex: sqaureIndex },
        dataType: 'html',
        success: function (resultHtml) {  //:FILE38738337A61C8D04BA6C5A2FCD50039A   
            $('#reHtml').html(resultHtml).show(); //请求过来的html表示编辑  显示
            $('#origin').hide(); //原来html 表示新增  隐藏 
            //alert(" $('#rePicStc').val()____" + $('#rePicStc').val());
            var repic = $('#rePicStc').val();
            if (repic == "") {
                var rePicStc = _SkinPath + "self/images/Figurenull.jpg";
            } else {
                var rePicStc = "../" + $('#rePicStc').val();
            }
           // alert("rePicStc___" + rePicStc);
            $("#imghead").attr('src', rePicStc);
            $('#content5').hide();
            $('#content5_build').show();
            $('#piclist').show();
            var tab = getselfwriteTab();
            seteditorheight(tab);
        },
        error: function () {
        }
    });    
}
function addPic() {
    //清除之前痕迹
    $('#piciLlus2').val("请填写附图说明，例如”图1为本发明实施例XX的方法流程示意图”。").css('color', '#999');
    $('#picMarkiLlus2').val("请填写附图标记说明，例如“1杯子主体，2杯子把手”。").css('color', '#999');
    $("#imghead").attr('src', _SkinPath + 'self/images/Figurenull.jpg');
    //$("#imghead").attr('src', '/SelfWrite/skins/default/self/images/Figurenull.jpg'); //  显示新增时候的默认图片


var hidSrc=$('#rePicStc').val(); 
if (hidSrc!=undefined) { //说明展示过编辑页面 
      $('#reHtml').hide(); //请求过来的html表示编辑  隐藏
      $('#origin').show(); //原来html 表示新增  显示 
      $('#hidpatentPicId').val(""); //编辑过 再来添加，将隐藏域清空 这样在点击保存按钮的时候 就按add方式去保存 否则会按edit方式去保存
}

  //控制那个编号↓
  var bh = parseInt($("#askPicList").children(".img_box1").length) + 1; 
  $('#picBianHao').html(bh+"、");
   
    $('#content5').hide();
    $('#content5_build').show();
    $('#piclist').show();
    var tab = getselfwriteTab();
    seteditorheight(tab);

}
function getPicListOrAb(pOa) { //得到附图列表和摘要附图  //  pOa=="p"得到附图列表的图片地址   pOa=="a"得到摘要图片的地址   
    //patent_img/2015-01-26/patent0/FB3A7934-AEA6-41DE-9292-CA267BD9325D.jpg;;patent_img/2015-01-26/patent0/CD7BE20E-860C-4261-B419-A417EFC8E219.jpg;;
//使用方法：split;;  然后在每一个路径前加../即可显示，但是入库的话一定要去掉../
    var patentId = getselfwriteID();
    $.ajax({ url: _RootPath + 'self/selfwritefigure3.aspx?pOa=' + pOa, //后台返回图片的src
        type: 'POST',
        data: { patentId: patentId },
        dataType: 'html',
        success: function (result) { 
            $('#getPA').html(result);
            var getPorA = $('#getPorA').val();
         // alert("getPorA" + getPorA);
        },
        error: function () {
        }
    });   
}
function piclistShow() {  
var patentId=getselfwriteID();
$.ajax({ url: _RootPath + 'self/selfwritefigure2.aspx', //后台返回编辑页面的html
    type: 'POST',
    data: { patentId: patentId },
    dataType: 'html',
    success: function (resultHtml) {  //:FILE38738337A61C8D04BA6C5A2FCD50039A    
        $('#askPicList').html(resultHtml).show();
        var tab = getselfwriteTab(); //这两句是ry控制编辑区高度的
        seteditorheight(tab);
    },
    error: function () {
    }
});   
     
    $('#content5').show();
    $('#content5_build').hide();
    $('#piclist').hide();
    var tab = getselfwriteTab();
    seteditorheight(tab);
   
}
function savePicNiLlu() { 
    var piciLlus = ""; // "附图说明";
    var picMarkiLlus = ""; //  "附图标记说明";
    var command = "add";
    var patentPicId = $('#hidpatentPicId').val();  //如果编辑过 这个值就不会是undefined 如果不是新加附图 这个值也不会是""
    if (patentPicId != undefined && patentPicId != "") { //说明展示过编辑页面
        command = "update";  //update是沿袭之前的参数
    } 
    var writeId = getselfwriteID(); //撰写的专利的id 
 
    var loadi = layer.load('加载中…');

    var url = _RootPath + "SelfWriteOperator.aspx";
    var userId = $("#hiduserid").val();
    var newSrc = $("#imghead").attr("src");   //../patent_img/2015-01-22/patent0/E5A7B51D-44B1-404F-9F09-6E510A14E14E.jpg
    //alert("newSrc" + newSrc);  ///SelfWrite/skins/default/self/images/Figurenull.jpg
    if (newSrc != _SkinPath + "self/images/Figurenull.jpg" && newSrc != undefined) {
        var newSrcIn = newSrc.split('../')[1];
    } else {
        var newSrcIn = "";  //没图  存成空的
    }
    var hidSrc= $('#ft_hidSrc').val(); //存当前编辑的图片的地址
    var hidFid = $('#ft_hidFid').val(); //存当前编辑的图片的fid 
   
    // 判断要是新增图片还是编辑图片 
    if (command=="add") {
        //1是新增
        piciLlus = $.trim($('#piciLlus2').val()); // "附图说明";   2号是新增的
        picMarkiLlus = $.trim($('#picMarkiLlus2').val()); //  "附图标记说明"; 
        if (piciLlus == "" ||piciLlus== "请填写附图说明，例如”图1为本发明实施例XX的方法流程示意图”。") {
            layer.alert("请填写附图说明");
            return;
        }
        if (picMarkiLlus == "请填写附图标记说明，例如“1杯子主体，2杯子把手”。") {
            picMarkiLlus = "";
        }
        $.ajax({
            type: "post",
            url: url,
            dataType: "json", //返回值类型
            data: {
                action: "savepatentfile",
                fname: "", //可以为空 
                ftype: ".jpg",
                path: newSrcIn, //这个文件已经被保存了，这是文件的路径
                patentid: writeId,
                userid: userId
            },
            success: function (sender) {
                if (sender.ReturnValue != '0') {
                    //layer.alert(sender.ErrorInfo);
                }
                else {
                    var fid = sender.Option;
                    //alert("图片入库成功fid:::" + fid);
                    //保存成功后 再保存文本
                    $.ajax({
                        type: "post",
                        url: url,
                        dataType: "json", //返回值类型
                        data: {
                            action: "saveattachedmap",
                            patentid: writeId,
                            templateid: "0", //图片这里都固定存成0
                            instruction: piciLlus,
                            mark_instruction: picMarkiLlus,
                            fid: fid
                        },
                        success: function (sender) {
                            if (sender.ReturnValue != '0') {
                            //    layer.alert(sender.ErrorInfo);
                            }
                            else {
                                //layer.alert("图片的文本入库成功！");   新添加成功后把原来的值都清空 
                                piclistShow();
                                if ($('#picNinS').attr('class') == "menud") {
                                    picNInstruc();
                                } 
                                 
                                layer.close(loadi);
                            }
                        },
                        error: function (sender) { layer.close(loadi); }
                    });
                }
            },
            error: function (sender) { layer.close(loadi); }
        });
    } else if (command == "update") {
        //2是修改
        //判断图片修改了，先存图片，然后返回fid
        piciLlus = $.trim($('#piciLlus').val()); // "附图说明"; 
        picMarkiLlus = $.trim($('#picMarkiLlus').val()); //  "附图标记说明"; 
        if (piciLlus == "" || piciLlus == "请填写附图说明，例如”图1为本发明实施例XX的方法流程示意图”。") {
            layer.alert("请填写附图说明");
            return;
        }
        if (newSrcIn != hidSrc) {  
            $.ajax({
                type: "post",
                url: url,
                dataType: "json", //返回值类型
                data: {
                    action: "savepatentfile",
                    fname: "",
                    ftype: ".jpg",
                    path: newSrcIn,
                    patentid: writeId,
                    userid: userId
                },
                success: function (sender) {
                    if (sender.ReturnValue != '0') {
                      //  layer.alert(sender.ErrorInfo);
                    }
                    else {
                        var fid = sender.Option;
                        $.ajax({
                            type: "post",
                            url: url,
                            dataType: "json", //返回值类型
                            data: {
                                action: "updateattachedmap",
                                id: patentPicId,
                                patentid: writeId,
                                templateid: "0",
                                instruction: piciLlus,
                                mark_instruction: picMarkiLlus,
                                fid: fid
                            },
                            success: function (sender) {
                                if (sender.ReturnValue != '0') {
                                //    alert(sender.ErrorInfo);
                                }
                                else {
                                   // layer.alert("修改附图成功！");
                                    piclistShow();
                                    if ($('#picNinS').attr('class') == "menud") {
                                        picNInstruc();
                                    } 
                                    layer.close(loadi);
                                }
                            },
                            error: function (sender) {  }
                        });
                    }
                },
                error: function (sender) {  }
            });
        } else {
            //图片没有修改，用原来的fid去修改 
            $.ajax({
                type: "post",
                url: url,
                dataType: "json", //返回值类型
                data: {
                    action: "updateattachedmap",
                    id: patentPicId,
                    patentid: writeId,
                    templateid: "0",
                    instruction: piciLlus,
                    mark_instruction: picMarkiLlus,
                    fid: hidFid
                },
                success: function (sender) {
                    if (sender.ReturnValue != '0') {
                     //   alert(sender.ErrorInfo);
                    }
                    else {
                       // layer.alert("修改附图成功！");
                        piclistShow();
                        if ($('#picNinS').attr('class') == "menud") {
                            picNInstruc();
                        } 
                        layer.close(loadi);
                    }
                },
                error: function (sender) {   }
            });
        }
 
    }

}



function piciLlusFc(e) {
    var val = $.trim($(e).val());
    if (val == "请填写附图说明，例如”图1为本发明实施例XX的方法流程示意图”。") {
        $(e).val("");
        $(e).css('color','black');
    }
}
function picMarkiLlusFc(e) {
    var val = $.trim($(e).val());
    if (val == "请填写附图标记说明，例如“1杯子主体，2杯子把手”。") {
        $(e).val("");
      
        $(e).css('color', 'black');
    }
}
function piciLlusBl(e) {
    var val = $.trim($(e).val());
    if (val == "") {
        $(e).val("请填写附图说明，例如”图1为本发明实施例XX的方法流程示意图”。");
        $(e).css('color', '#999');
    }
}
function picMarkiLlusBl(e) {
    var val = $.trim($(e).val());
    if (val == "") {
        $(e).val("请填写附图标记说明，例如“1杯子主体，2杯子把手”。");
        $(e).css('color', '#999');
    }
}
 