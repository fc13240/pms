<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="security" prefix="se" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<title>龙图腾专利管家－让专利管理更轻松！</title>
<meta name="keywords" content="龙图腾，龙图腾专利，专利管理，知识产权管理，专利管理软件，专利管家，专利监控，专利年费，专利官费，年费代缴，如何缴纳专利年费，通知书，通知书监控，专利费用查询，专利分析，专利代理管理系统，企业专利，高校专利"/>
<meta name="description" content="龙图腾专利管家，最简单的专利全流程管理系统，全程为专利代理机构、专利申请人或专利权人以及发明人的专利申请保驾护航，有效解决通知书答复过期失效，以及专利官费年费多缴、少缴、忘缴的问题。">

	<meta name="description" content="User login page" />
	<!-- bootstrap & fontawesome -->
	<link rel="stylesheet" href="<s:url value='/static/css/bootstrap.css'/>" />
	<link rel="stylesheet" href="<s:url value='/static/css/font-awesome.css'/>" />

	<!-- text fonts -->
	<link rel="stylesheet" href="<s:url value='/static/css/ace-fonts.css'/>" />

	<!-- ace styles -->
	<link rel="stylesheet" href="<s:url value='/static/css/ace.css'/>" />

	<link rel="stylesheet" href="<s:url value='/static/css/ace-rtl.css'/>" />



	<script src="<s:url value='/temp/js/jquery.min.js'/>"></script>
	
	<style type="text/css">
			#loginError{
				    color:#F00;
				    font-weight:bold;
			}
	</style>
	
	<link href="<s:url value='/static/css/lrtk.css'/>" rel="stylesheet" type="text/css" />

</head>

<body class="login-layout" >
<div style="position:absolute;z-index: 99999; left:20px; top:0px; width:100px; height:100px;">
<img src="<s:url value='/temp/images/logo_long.png'/>" width="80px;">
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tbody>
      <tr>
        <td width="10%" align="left" bgcolor="#FF0000"></td>
        <td width="60%" height="45" align="left" bgcolor="#FF0000">
        	<div class="nav">
        	<img src="<s:url value='/temp/images/login_top.jpg'/>">

			</div>
		</td>
        <td width="200" align="right" bgcolor="#FF0000">
        	<table width="250" border="0" cellspacing="0" cellpadding="0">
          	<tbody>
          	<tr>
            	<td height="45" align="center" class="wel_user" valign="middle">
欢迎您！请&nbsp;<a href="<s:url value='/user/loginForm.html'/>">登录</a>&nbsp;或&nbsp;<a href="<s:url value='/user/registerForm.html'/>">免费注册</a>              
   
            	</td>
          	</tr>
        	</tbody>
        	</table>
        </td>
      </tr>
    </tbody>
</table>

<div class="maincenter" style="width:400px;margin:30px auto;padding: 30px 0;font:'Microsoft YaHei';">
   	<div class="maincenter-box-tip" style="margin-bottom:40px;">
       	<p style="color: #6c6c6c;font-weight:700;font-size:18px;font:'Microsoft YaHei';">
           输入用户名找回密码,登录邮箱查看密码
        </p>
    </div>
       
		<div class="ui-form-item     ">
        	<label >用户名:</label>
        	<input name="username" id="username" style="width:300px;" type="text" placeholder="请输入会员名" value="">
        </div>

		<div style="width:340px;margin-top:50px;">
		    <input type="button" onclick="forgetName()" value="确定" class="width-35  btn btn-sm btn-primary" style="background-color:#C43330 !important;border-color: #C43330;">
		</div>

</div>
				
	
	<!-- 页脚 -->
	<br><br><br><br><br><br><br>
	<div id="footer">
	  <div class="container clear">
	    <div class="footer_r">
	      <div class="footer-Copy ml50" style="margin: 0px auto;text-align:center">
	        <p class="about-us"><a href="http://cn.lotut.com/" target="_blank" rel="nofollow">关于我们</a><span>|</span>
	          <a href="http://so.lotut.com/" target="_blank" rel="nofollow">专利检索</a><span>|</span>
	          <a href="http://www.lotut.com/index.php/blog/095lzql4ke.html" target="_blank" rel="nofollow">联系我们</a><span>|</span>
	          <a href="http://www.lotut.com/" target="_blank">商标市场</a></p>
	        <p class="Copyright"><font color="#000">Copyright @ 2016龙图腾版权，技术支持龙图腾信息技术有限公司</font> </p>
			<span style="display:inline-block;position:relative;width:auto;">
				<a href="https://ss.knet.cn/verifyseal.dll?sn=e16072934010064299rolh000000&amp;ct=df&amp;a=1&amp;pa=0.09530572313815355" id="kx_verify" tabindex="-1" target="_blank" kx_type="图标式" style="display:inline-block;">
					<img src="http://rr.knet.cn/static/images/logo/cnnic.png" style="border:none;height:25px;" oncontextmenu="return false;" alt="可信网站">
				</a>
			</span>

	      </div>
	    </div>
	  </div>
	</div>
<script type="text/javascript">
function forgetName() {
	var username=$("#username").val();
	var status;
	$.ajax({
		url: "<s:url value='/user/user_find_password_form.html'/>", 
		type: 'post',
		data:{"username" : username},
		success: function(processStatus) {
			status=processStatus;
			if(status=="1"){
				alert('邮件发送成功，请查收！')
			}else if(status=="2"){
				alert('用户名不存在！');
			}else{
				alert('发送邮件失败！');
			}
		},
		error: function() {
			alert('发送邮件失败！');
		}
	});	
}
</script>

		
</body>


</html>