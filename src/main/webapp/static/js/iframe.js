/*头尾框架脚本*/
/*头尾框架脚本*//*基类脚本*/

//#region 全局变量 
//var _UserUrl = "http://192.168.6.26/";
//#endregion 

//#region 基本方法
//当前页面跳转
function locationwin(url) {
    if (url != "")
        window.location.href = url;
}
//
function openwin(url) {
    if (url != "")
        window.open(url);
}
//#endregion 

//#region 用户服务操作
//验证角色
/*function checkusertype() {
var url = _RootPath + "default.aspx?jsoncallback=?";
var postData = {
action: "getnowpagesessionuser",
jsonmethod: "Cross_domain"
};
$.getJSON(url, postData, function (sender) {
if (sender.ReturnValue != '0') {
layer.msg('用户权限不足', 1, function () {
locationwin(_RootPath + "user/login.aspx?referrUrl=" + window.location.href); //自动关闭后de操作
});
}
else {
if (sender.Option.Type < 56) {
layer.msg('用户权限不足', 1, function () {
locationwin(_RootPath + "user/login.aspx?referrUrl=" + window.location.href); //自动关闭后de操作
});
}
}
});
}
*/
//退出登录
function logoutUser() {//u_logout原方法名称
    var url = _UserUrl + "default.aspx?jsoncallback=?";
    var postData = {
        action: "logoutuser",
        jsonmethod: "Cross_domain"
    };
    $.getJSON(url, postData, function (sender) {
        if (sender.ReturnValue != '0') {
            // layer.alert(sender.ErrorInfo);
            return;
        }
        else {
            //  layer.alert("退出成功！");
            $("#dl").show();
            $("#dl_in").remove(); $("#usertab").remove();
            $("#zc").html(" <a href=\"" + _UserUrl + "user/register.aspx\">注册</a>");
            usersession("uout", "");
        }
    });
}
//获取当前登录用户信息
function getUser() {
    var url = _UserUrl + "default.aspx?jsoncallback=?";
    var postData = {
        action: "getnowpagesessionuser",
        jsonmethod: "Cross_domain"
    };
    $.getJSON(url, postData, function (sender) {
        if (sender.ReturnValue != '0') {
            $("#u_login").bind("click", function () {
                var _refUrl = window.location.href;
                window.location.href = _UserUrl + "user/login.aspx?referrUrl=" + encodeURI(_refUrl);
            }); $("#zc").html(" <a href=\"" + _UserUrl + "user/register.aspx\">注册</a>");
            usersession("uout", "");
        }
        else {
            getusertab(sender.Option);
        }
    });
}
//#endregion 
//#region 获取登录用户下拉列表
function getusertab(user) {
    var sUrl = _RootUrl + "msguserproject.aspx?jsoncallback=?";
    var postData = {
        type: user.Type, command: "usertab", user: user.User, phone: user.Phone,
        jsonmethod: "Cross_domain"
    };

    var x = $.getJSON(sUrl, postData, function (data) {


        if (data) {
            if (data.ReturnValue == 0) {
                //  alert(decodeURIComponent(data.Result));
                $("#divlogin").html(decodeURIComponent(data.Result));
                $("#u_logout").bind("click", function () {
                    logoutUser();
                });
                $("#u_login").bind("click", function () {
                    var _refUrl = window.location.href;
                    window.location.href = _UserUrl + "user/login.aspx?referrUrl=" + encodeURI(_refUrl);
                });
                usersession("ulogin", user);
            }
            else {
                $("#u_login").bind("click", function () {
                    var _refUrl = window.location.href;
                    window.location.href = _UserUrl + "user/login.aspx?referrUrl=" + encodeURI(_refUrl);
                });
                $("#zc").html(" <a href=\"" + _UserUrl + "user/register.aspx\">注册</a>");
                usersession("uout", "");
            }
        }
        else {
            $("#u_login").bind("click", function () {
                var _refUrl = window.location.href;
                window.location.href = _UserUrl + "user/login.aspx?referrUrl=" + encodeURI(_refUrl);
            });
            $("#zc").html(" <a href=\"" + _UserUrl + "user/register.aspx\">注册</a>");
            usersession("uout", "");
        }

    });
    //alert(x.status)
}



////session
/**/
function usersession(v, user) {
    var datas;
    if (user == "")
        datas = { command: v, user: "" };
    else
        datas = { command: v, user: user.User, uid: user.UID, type: user.Type, orgid: user.OrgID, org: user.Org, phone: user.Phone };
    $.ajax({
        type: "Post",
        url: _RootPath + "msguserproject.aspx",
        data: datas,
        dataType: "text",
        success: function (data) {

        }
    });
}

/*下拉列表操作*/
var userMouseOver = function (event) {
    var top = $(event).offset().top - 7;
    var left = $(event).offset().left + 4;
    $("#usertab").css("top", "" + (top) + "px").css("left", "" + (left - 5) + "px").css("display", "block").css("z-index", "1000");

    $("#usertab").mouseleave(function () {
        $("#usertab").hide();
        $("#dl_in").show();
    })
}
function usertabMouseOver(_obj) {// 搜索框的浮层下拉
    $(_obj).removeClass("nameh").addClass("namehh");
    $(_obj).mouseleave(function () {
        $(_obj).removeClass("namehh").addClass("nameh");
    });

}
function tabmouseover(eve, imgsrc) {
    $(eve).hide();
    if (!$(eve).is(":visible"))
        $(eve).next().fadeIn(1000);


    $(eve).next().mouseleave(function () {
        $(this).hide();
        if (!$(eve).is(":visible"))
            $(this).prev().fadeIn(500);
    });
}
function imgmouseover(eve, imgsrc) {
    $(eve).find("img").attr("src", _RootUrl + "skins/images/" + imgsrc + "h.png");
    $(eve).mouseleave(function () {
        $(eve).find("img").attr("src", _RootUrl + "skins/images/" + imgsrc + ".png");
    });
}
//#endregion
//#region 置顶滚动 
function ScrollTop() {
    $("html, body").animate({ scrollTop: 0 }, 0);
}
$(window).scroll(function () {
    var _scroll = $(this).scrollTop();
    var _wh = $(this).height();
    var _ww = ($(this).width() - 940) / 2;
    var _h = $(".flo").height();
    var _w = $(".flo").width();
    if (_scroll > 40) {
        // $(".flo").css({ top: (_wh - _h + _scroll - 90) + "px", left: (_ww + 940 + _w + 40) + "px" }).show();
        var floo = $(window).height() - 415;
        $(".flo").css({ "position": "fixed", "top": floo + "px", left: (_ww + 940 + _w + 40) + "px" }).show();
    } else {
        $(".flo").hide();
    }
});

$(document).ready(function () { hovertop(); });
function hovertop() {

    $("td[name='flotoqq']").hover(function () {
        $("td[name='flotoqq']").removeClass("qq").addClass("qqh");
        $("td[name='flotoqq']").html('腾讯<br /> 客服');
    },
function () {
    $("td[name='flotoqq']").removeClass("qqh").addClass("qq");
    $("td[name='flotoqq']").html('');
});

    $("td[name='flototop']").hover(function () {
        $("td[name='flototop']").removeClass("zhid").addClass("zhidh");
        $("td[name='flototop']").html('回到<br />顶部');
    },
function () {
    $("td[name='flototop']").removeClass("zhidh").addClass("zhid");
    $("td[name='flototop']").html('');
});
}
//#endregion