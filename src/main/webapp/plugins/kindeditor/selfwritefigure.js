
var _SkinPath = "/skins/default/";
var _RootPath = "/";
var _RootUrl = "http://www.izhiliao.com.cn/";
var _AgencyUrl = "http://agency.izhiliao.com.cn/";
var _UserUrl = "http://user.izhiliao.com.cn/";
var _SelfWriteUrl = "http://self.izhiliao.com.cn/";
var _IdeaUrl = "http://idea.izhiliao.com.cn/";


function addPic() {
    //清除之前痕迹
    $('#piciLlus2').val("请填写附图说明，例如”图1为本发明实施例XX的方法流程示意图”。").css('color', '#999');
    $('#picMarkiLlus2').val("请填写附图标记说明，例如“1杯子主体，2杯子把手”。").css('color', '#999');

var hidSrc=$('#rePicStc').val(); 
if (hidSrc!=undefined) { //说明展示过编辑页面 
      $('#reHtml').hide(); //请求过来的html表示编辑  隐藏
      $('#origin').show(); //原来html 表示新增  显示 
      $('#hidpatentPicId').val(""); //编辑过 再来添加，将隐藏域清空 这样在点击保存按钮的时候 就按add方式去保存 否则会按edit方式去保存
}

  //控制那个编号↓
  var bh = parseInt($("#askPicList").children(".img_box1").length) + 1; 
  //$('#picBianHao').html(bh+"、");
   
    $('#content5-1').hide();
    $('#content5_build').show();
    $('#piclist').show();
}

function piclistShow() {  
    $('#content5-1').show();
    $('#content5').hide();
    $('#content5_build').hide();
    $('#piclist').hide();
   
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
 