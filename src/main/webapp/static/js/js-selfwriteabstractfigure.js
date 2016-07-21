
function askAbList() {
    var patentId = getselfwriteID();
    $.ajax({ url: _RootPath + 'self/selfwriteabstractfigure.aspx', //后台返回附录列表页面的html
        type: 'POST',
        data: { patentId: patentId },
        dataType: 'html',
        success: function (resultHtml) {  //:FILE38738337A61C8D04BA6C5A2FCD50039A   
           
            if (resultHtml=="") {
                layer.alert("附图内容为空，请添加后才能选择");
                return;
            }
            $('#ab_picList').html(resultHtml); 
        },
        error: function () {
        }
    });  
}

function tabChange2() { 
    //content8 show之前  先去后台读取摘要的src
    //1、有摘要图片  改变src的值  然后show   
    //根据专利id获取摘要
    var patentId = getselfwriteID(); 
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
                var fid = obj.Fid;
                if (fid == "") {
                    $('#imgheadab').attr('src', _SkinPath + "self/images/Figurenull.jpg");
                    return;
                }
                //根据fid去读取图片路径
                $.ajax({
                    type: "post",
                    url: url,
                    dataType: "json", //返回值类型
                    data: {
                        action: "getpatentfile",
                        fid: fid
                    },
                    success: function (sender) {
                        if (sender.ReturnValue != '0') {
                            // layer.alert(sender.ErrorInfo);
                        }
                        else {
                            var obj = sender.Option;
                            $('#imgheadab').attr('src', "../" + obj.path);
                        }
                    },
                    error: function (sender) { }
                });

            }
        },
        error: function (sender) { }
    });


    //2、没有摘要图片  不变  然后show
    $('#content8').show();
}

function chooseFromList() {
    $('#content8').hide();
    chooseListShow(); //选中列表浮层展示
}

var showBg;
function chooseListShow() {
    //askAbList(); //请求附图列表的图片

    var patentId = getselfwriteID();
    $.ajax({ url: _RootPath + 'self/selfwriteabstractfigure.aspx', //后台返回附录列表页面的html
        type: 'POST',
        data: { patentId: patentId },
        dataType: 'html',
        success: function (resultHtml) {  //:FILE38738337A61C8D04BA6C5A2FCD50039A   

            if (resultHtml == "") {
                layer.alert("附图内容为空，请添加后才能选择");
                return;
            } else {
                $('#ab_picList').html(resultHtml);
                showBg = $.layer({
                    type: 1,
                    title: false,
                    offset: ['', ''],
                    border: false,
                    bgcolor: 'none', //设置层背景色
                    area: ['420px', '520px'],
                    page: { dom: '#choosePicDiv' },
                    closeBtn: false
                });
                var showBgtop = $("#choseAbs").offset().top - 300;
                var showBgleft = $("#choseAbs").offset().left - 700;
                $("#choosePicDiv").css("top", showBgtop + "px").css("left", showBgleft + "px").show();
                $('.xubox_close').css("top", showBgtop + "px").css("left", showBgleft + 250 + "px").css('z-index', '1999999');
                $('#cancleAbs').on('click', function () {
                    layer.close(showBg);
                });   
            }
           
        },
        error: function () {
        }
    }); 
    $('#content8').show();  
}
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
    $.ajax({
        type: "post",
        url: url,
        dataType: "json",
        data: {
            action: "savepatentfile",
            fname: "", //可以为空 
            ftype: ".jpg",
            path: newSrcIn, //这个文件已经被保存了，这是文件的路径
            patentid: patentId,
            userid: userId
        },
        success: function (sender) {
            if (sender.ReturnValue != '0') {
                layer.alert(sender.ErrorInfo);
            }
            else {
                var fid = sender.Option;
                //因为已经有了专利id，所以摘要附图都是修改的接口  
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
                                    fid: fid
                                },
                                success: function (sender) {
                                    if (sender.ReturnValue != '0') {
                                        layer.alert(sender.ErrorInfo);
                                    }
                                    else {
                                        // alert("2修改摘要成功！");
                                    }
                                },
                                error: function (sender) { }
                            });
                        }
                    },
                    error: function (sender) { }
                });
            }
        },
        error: function (sender) { }
    }); 
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