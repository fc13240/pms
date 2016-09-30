<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<title>龙图腾专利管家——用户注册</title>

	<meta name="description" content="User login page" />
	<!-- bootstrap & fontawesome -->
	<link rel="stylesheet" href="<s:url value='/static/css/bootstrap.css'/>" />
	<link rel="stylesheet" href="<s:url value='/static/css/font-awesome.css'/>" />

	<!-- text fonts -->
	<link rel="stylesheet" href="<s:url value='/static/css/ace-fonts.css'/>" />

	<!-- ace styles -->
	<link rel="stylesheet" href="<s:url value='/static/css/ace.css'/>" />

	<!--[if lte IE 9]>
		<link rel="stylesheet" href="<s:url value='/static/css/ace-part2.css'/>" />
	<![endif]-->
	<link rel="stylesheet" href="<s:url value='/static/css/ace-rtl.css'/>" />

	<!--[if lte IE 9]>
	  <link rel="stylesheet" href="<s:url value='/static/css/ace-ie.css'/>" />
	<![endif]-->

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

	<!--[if lt IE 9]>
	<script src="<s:url value='/static/js/html5shiv.js'/>"></script>
	<script src="<s:url value='/static/js/respond.js'/>"></script>
	<![endif]-->

	<script src="<s:url value='/static/js/jquery.js'/>"></script>
	<style type="text/css">
			.userNameError{
				    color:#F00;
				    font-weight:bold;
			}
			.input-remark{
					display:block;
					float:left;
					height:34px;
					width:85px;
					margin-right:10px;
					line-height:34px;
					font-size:15px;
					color:#666;
					font-weight:500;
					text-align:right;
			}
	</style>
</head>

<body class="login-layout" style=" background-image: url(<s:url value='/static/images/bacground2.jpg'/>);background-size:cover; ">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container" style="width:500px;">
				

						<div class="space-6">

						</div>

						<div class="position-relative">
							<div id="login-box" class="login-box visible widget-box no-border" style="background-color:#D23435;margin-top:100px;">
								
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="ace-icon fa fa-users blue"></i>
											新用户注册
										</h4>

										<div class="space-6"></div>

										<form id="registerForm" action="<s:url value='/user/register.html'/>" method="post" >
										<se:csrfInput/>
											<fieldset>
												<label class="block clearfix">
													<span class="input-remark">用户名：</span>
													<span class="input-icon input-icon-right" style="width:290px;">
														<input type="text" class="form-control" id="username" minlength="3" maxlength="30" placeholder="用户名" name="username" onkeydown="clearPasswordErrorSpan()" required />
														<c:if test="${success != null && !success}">
															<div>
																<span id="userNameError" class="userNameError">用户名已被注册请重新输入!</span>
															</div>
														</c:if>
														<i class="ace-icon fa fa-user"></i>
													</span>
												</label>
												
												<label class="block clearfix">
													<span class="input-remark">密码：</span>
													<span class="input-icon input-icon-right" style="width:290px;">
														<input type="password" class="form-control" id="regist_password" minlength="4" maxlength="30" placeholder="密码4位以上" name="password" required />
														<div class='warning' id='warning_2'><span></span></div>
														<i class="ace-icon fa fa-lock"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="input-remark">确认密码：</span>
													<span class="input-icon input-icon-right" style="width:290px;">
														<input type="password" class="form-control" id="final_password" minlength="4" maxlength="30" equalTo="#regist_password" placeholder="再次输入密码" name="finalpassword" required/>
														<div class='warning' id='warning_3'><span></span></div>
														<i class="ace-icon fa fa-retweet"></i>
													</span>
												</label>
												<!--  
												<label class="block clearfix">
													<span class="input-remark">真实姓名：</span>
													<span class="input-icon input-icon-right" style="width:290px;">
														<input type="text" class="form-control" id="actual_name" placeholder="真实姓名" name="name" maxlength="30" minlength="2" required />
														<i class="ace-icon fa fa-user"></i>
													</span>
												</label>												
												-->
												<label class="block clearfix">
													<span class="input-remark">邮箱：</span>
													<span class="input-icon input-icon-right" style="width:290px;">
														<input type="email" id="email" class="form-control" placeholder="请输入真实邮箱，用于密码找回" name="email"  minlength="3" maxlength="100" required />
														<i class="ace-icon fa fa-envelope"></i>
													</span>
												</label>												

<!-- 												<label class="block"> -->
<!-- 													<input type="checkbox" class="ace" /> -->
<%-- 													<span class="lbl"> --%>
<!-- 														同意 -->
<!-- 														<a href="#">用户条约</a> -->
<%-- 													</span> --%>
<!-- 												</label> -->

												<div class="space-24"></div>

												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm">
														<i class="ace-icon fa fa-refresh"></i>
														<span class="bigger-110">重置</span>
													</button>
													
													<button type="submit" id="regist_button" class="width-65 pull-right btn btn-sm btn-success">
														<span class="bigger-110">注册</span>
														<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
													</button>
												</div>
											</fieldset>
										</form>
									</div>

									<div class="toolbar center">
										<a href="<s:url value='/loginForm.html'/>"  style="color:yellow">
											<i class="ace-icon fa fa-arrow-left"></i>
											返回登录
										</a>
									</div>
								</div><!-- /.widget-body -->
							</div><!-- /.signup-box -->
						</div><!-- /.position-relative -->
<!--
							<div class="navbar-fixed-top align-right">
								<br />
								&nbsp;
								<a id="btn-login-dark" href="#">Dark</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-blur" href="#">Blur</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-light" href="#">Light</a>
								&nbsp; &nbsp; &nbsp;
							</div>-->
					</div>
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.main-content -->
	</div><!-- /.main-container -->

	<!-- basic scripts -->

	<!--[if !IE]> -->
	<script type="text/javascript">
		window.jQuery || document.write("<script src='<s:url value='/static/js/jquery.js'/>'>"+"<"+"/script>");
	</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='<s:url value='/static/js/jquery1x.js'/>'>"+"<"+"/script>");
</script>
<![endif]-->
	<script type="text/javascript">
		if('ontouchstart' in document.documentElement) document.write("<script src='<s:url value='/static/js/jquery.mobile.custom.js'/>'>"+"<"+"/script>");
	</script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
	
		
		jQuery(function($) {
			$("#registerForm").validate({
				submitHandler: function(form){ 
					form.submit();     
				}
			});				
			
		 $(document).on('click', '.toolbar a[data-target]', function(e) {
			e.preventDefault();
			var target = $(this).data('target');
			$('.widget-box.visible').removeClass('visible');//hide others
			$(target).addClass('visible');//show target
		 });
		});		
		
		//you don't need this, just used for changing background
		jQuery(function($) {
		 $('#btn-login-dark').on('click', function(e) {
			$('body').attr('class', 'login-layout');
			$('#id-text2').attr('class', 'white');
			$('#id-company-text').attr('class', 'blue');
			
			e.preventDefault();
		 });
		 $('#btn-login-light').on('click', function(e) {
			$('body').attr('class', 'login-layout light-login');
			$('#id-text2').attr('class', 'grey');
			$('#id-company-text').attr('class', 'blue');
			
			e.preventDefault();
		 });
		 $('#btn-login-blur').on('click', function(e) {
			$('body').attr('class', 'login-layout blur-login');
			$('#id-text2').attr('class', 'white');
			$('#id-company-text').attr('class', 'light-blue');
			
			e.preventDefault();
		 });
		 
		});
	</script>
	<script type="text/javascript">
			function clearPasswordErrorSpan() {
				$("#userNameError").hide();
			}
	</script>	
<script src="<s:url value='/static/js/jquery.validate.min.js'/>"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>"></script>	

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
	        <p class="Copyright"><font color="#FFF">Copyright @ 2016龙图腾版权，技术支持龙图腾信息技术有限公司</font> </p>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>