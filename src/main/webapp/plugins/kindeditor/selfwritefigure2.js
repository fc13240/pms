

function chooseFromList() {
    $('#content8').hide();
    chooseListShow(); //选中列表浮层展示
}

var showBg;

function abstactShow() {
   
    $('#content8').show();
    var objBRed = $('.pic_box1h'); 
    if (objBRed.length != 0) {
        objBRed.removeClass('pic_box1h');
    }
    $('#choosePicDiv').hide();
    layer.close(showBg);
  //  $('#cancleAbs').click();
}
function borderRed(e) { 
    var objBRed = $('.pic_box1h'); 
    if (objBRed.length != 0) { 
        objBRed.removeClass('pic_box1h');
        $(e).parent().addClass('pic_box1h');
    } 
        $(e).parent().addClass('pic_box1h');
   
}

function beAbstract2() {//直接通过swf上传后就保存起来
    var patentId = getselfwriteID(); //撰写的专利的id
    var userId = $("#hiduserid").val();
    var newSrc = $("#imgheadab").attr("src");
    if (newSrc != _SkinPath + "self/images/Figurenull.jpg" && newSrc != undefined) {
        var newSrcIn = newSrc.split('../')[1];
    } else {
        var newSrcIn = "";
    }
   
    var tmpId = "0";
    var url = _RootPath + "SelfWriteOperator.aspx";

    }


function beAbstract() { 
    var objBRed = $('.pic_box1h');
  
    if (objBRed.length == 0) {
        layer.alert("请选择一张图片");
        return;
    } else {
        var absPicSr = $('.pic_box1h .absSr').val(); //图片路径
        var absPid = $('.pic_box1h .absPid').val();  //图片ID
        var absFid = $('.pic_box1h .absFid').val();  //图片Fid
        $("#imgheadab").attr('src', absPicSr); 
        layer.close(showBg); 
        //因为已经有了专利id，所以摘要附图都是修改的接口
        var patentId = getselfwriteID();
        var tmpId = "0";
        var url = _RootPath + "SelfWriteOperator.aspx";
        $.ajax({
            type: "post",
            url: url,
            dataType: "json", //返回值类型
            data: {
                action: "getabstractbypid",
                pid: patentId
            },
            success: function (sender) {
                if (sender.ReturnValue != '0') {
                    // layer.alert(sender.ErrorInfo);
                }
                else {
                    var obj = sender.Option;
                    var abId = obj.ID;

                    var pContent = obj.Content;
                    pContent = encodeURIComponent(pContent);  
                    if (obj.TemplateID != "0") {
                        tmpId = obj.TemplateID;
                    } 
                        $.ajax({
                            type: "post",
                            url: url,
                            dataType: "json", //返回值类型
                            data: {
                                action: "updateabstract",
                                id: abId,
                                patentid: patentId,
                                templateid: tmpId,
                                content: pContent,
                                fid: absFid
                            },
                            success: function (sender) {
                                if (sender.ReturnValue != '0') {
                                    layer.alert(sender.ErrorInfo);
                                }
                                else {
                                    //alert("修改摘要成功！");
                                }
                            },
                            error: function (sender) { }
                        }); 
                }
            },
            error: function (sender) { }
        }); 
    } 
}