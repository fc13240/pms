/*基础类库，存放常用的基本脚本方法*/
function locationwin(url) {
    if (url != "")
        window.location.href = url;
    //   window.location.href = "../login.aspx?referrUrl=" + encodeURI(_refUrl);
}

function openwin(url) {
    if (url != "")
        window.open(url);
}

var openWin = function (_url, _blank) {
    if (_blank === undefined || _blank === null || _blank === "") {
        window.location.href = _url;
    } else {
        window.open(_url, '', '', '');
    }
}
//验证码刷新按钮
function refreshYZM() {
    var srcNew = "../YZM.aspx?r=" + Math.random();
    $('#yzm').attr('src', srcNew);
}
function refreshYZM2(str) {
    var srcNew = "../YZM.aspx?r=" + Math.random();
    $('#' + str).attr('src', srcNew);
}
//改变tab显示和tab样式  e为""不用改变样式 
function changeShow(str, e) {
    $('#' + str).show().siblings().hide();
    if (e != "") {
        $(e).attr('class', 'on').siblings().removeAttr('class');

    }
}
 
 
