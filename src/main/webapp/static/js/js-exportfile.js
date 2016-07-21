$(function () {
    //exportLayerShow('pid1234');  //这个方法里面有专利id 用来导出
});
function fileClose() { 
    $('#closefile').click();
    $('#exportFile').hide(); 
}
function exportLayerShow(patentId) {
    var secretType = $("#list_typeHid").val();
    var encyptKey = $("#list_keyHid").val();
    var pass = $("#passhid").val();
    if (secretType > 0 && secretType != 9) {
        if (pass == "") {
            encryptKey();
            $("#patentidhid").val(patentId);
            $("#btntypehid").val("3")
        }
        else {
            exportLayershows(patentId);
        }
    }
    else {
        exportLayershows(patentId);
    }
}

function exportLayershows(patentId) {
    //  var patentId = getselfwriteID();
    //样式初始化
    if (arguments.length != 0) {
        $('#patentIdHid').val(patentId);
    }
    $('#process').hide();
    $('#wordsLess').attr('class', 'active');
    $('#wordsMore').attr('class', 'daochu_type1');
    $('#song').attr('class', 'active2');
    $('#fsong').attr('class', 'daochu_typeh1');
    $('#kaiti').attr('class', 'daochu_typeh1');
    $('#name').val("新建专利1");
    //↑ 

    var showBg = $.layer({
        type: 1,
        title: false,
        offset: ['', ''],
        border: false,
        bgcolor: 'none', //设置层背景色
        area: ['420px', '520px'],
        page: { dom: '#exportFile' },
        closeBtn: false
    });

    //自设关闭 
    $('#closefile').on('click', function () {
        $('#bar').css('width', '0%');
        layer.close(showBg);
    });  

}
  
 



 
var timer = 0;
function fileExport() {    //导出操作
    var patentId = $('#patentIdHid').val(); 
    if (patentId == "") { 
        patentId = getselfwriteID(); //获得专利id  patentId 去执行导出操作
    } 
    var fileName = $.trim($('#name').val());
  
    var fontSize = "";
    var fontFamily = "";
    var font = new Array();
    $(".active").each(function () { 
        font.push($(this).attr("value"));
    });
    $(".active2").each(function () {
        font.push($(this).attr("value"));
    });
    fontSize = (font[0] == null ? "" : font[0]);
    fontFamily = (font[1] == null ? "" : font[1]);
   
    //把这四个参数传给后台 去执行导出操作 
    //这里看生成word  成功的话1、变成100%   2、关闭当前对话框，打开新的对话框
   var url = _RootPath + "SelfWriteOperator.aspx";
   $.ajax({
       type: "post",
       url: url,
       dataType: "json", //返回值类型
       data: {
           action: "exportpatent",
           patentid: patentId,
           filename: fileName,
           font: fontFamily,
           fontsize: fontSize
       },
       success: function (sender) {
           if (sender.ReturnValue != '0') { 
              clearInterval(timer);
              $('#bar').css('width', numBar + '%');
              setTimeout("tipFail()", 1000);
           }
          else {
//              clearInterval(timer);
//              $('#bar').css('width', numBar + '%');
//              setTimeout("tipFail()", 1000);


          var downloadPath = sender.Option;
          var filename = sender.Option1;
          //      locationwin(_RootPath + "SelfWriteOperator.aspx?action=exportpatent&patentid=" + patentId + "&filename=" + fileName + "&font=" + fontFamily + "&fontsize=" + fontSize);
      var href = encodeURI(_RootPath + "DownloadFile.aspx?filepath=" + downloadPath + "&filename=" + filename);
          clearInterval(timer);
          $('#bar').css('width', '100%');
          setTimeout("fileClose()", 1000);
          // alert("导出成功！");
          locationwin(href); //    window.open(href);
           }
       },
       error: function (sender) {  }
   });
    numBar = 0;
    $('#process').show(); 
     timer = setInterval("go()", 50);
 }
 



 
function tipFail() {
    $('#close').click();
    var tipFail = $.layer({
        type: 1,
        title: ['导出提示', 'border:none; background:#61BA7A; color:#fff;'],
        offset: ['', ''],
        border: false,
        bgcolor: '#eee', //设置层背景色
        area: ['500px', '200px'],
        page: { dom: '#tipFail' },
        closeBtn: [0, true]
    });

    $('#cancle').on('click', function () {
        layer.close(tipFail);
        $('#closefile').click(); 
    });
    $('#again').on('click', function () {
        //点击重试按钮后，重新执行导出操作   
        $('#bar').css('width', '0%');
        layer.close(tipFail);
        $('#closefile').click();
        exportLayerShow();
    });
}

 
var numBar = 0; 
function go() {
  //  opBar.style.width = numBar + "%";
    $('#bar').css('width', numBar + '%');
    numBar++;
   
    if ($('#bar').css('width') == "126px") { 
         clearInterval(timer); 
    } 
}
function fontMark1(eFont) {
    //先全部还原
    $('#wordsLess').attr('class', 'daochu_type1');
    $('#wordsMore').attr('class', 'daochu_type1');
    //再赋新样式
    $('#' + eFont).attr('class', 'active');
}
function fontMark2(eFamily) {
    //先全部还原
    $('#song').attr('class', 'daochu_typeh1');
    $('#fsong').attr('class', 'daochu_typeh1');
    $('#kaiti').attr('class', 'daochu_typeh1');
    //再赋新样式
    $('#' + eFamily).attr('class', 'active2');
}




function browseFolder(path) {
    try {
        var Message = "\u8bf7\u9009\u62e9\u6587\u4ef6\u5939"; //选择框提示信息
        var Shell = new ActiveXObject("Shell.Application");
        var Folder = Shell.BrowseForFolder(0, Message, 64, 17); //起始目录为：我的电脑
        //var Folder = Shell.BrowseForFolder(0, Message, 0); //起始目录为：桌面
        if (Folder != null) {
            Folder = Folder.items(); // 返回 FolderItems 对象
            Folder = Folder.item(); // 返回 Folderitem 对象
            Folder = Folder.Path; // 返回路径
            if (Folder.charAt(Folder.length - 1) != "\\") {
                Folder = Folder + "\\";
            }
            document.getElementById(path).value = Folder;
            return Folder;
        }
    }
    catch (e) {
        layer.alert(e.message);
    }
}