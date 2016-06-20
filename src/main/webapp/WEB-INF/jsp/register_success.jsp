<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<title>龙图腾专利管家——注册成功</title>

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
</head>

<body class="login-layout" style=" background-image: url(<s:url value='/static/images/bacground2.jpg'/>);background-size:cover; ">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
				

						<div class="space-6">

						</div>

						<div class="position-relative">
							<div id="login-box" class="login-box visible widget-box no-border" style="background-color:#D43230;margin-top:200px;">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="ace-icon fa fa-coffee green"></i>
											注册成功
										</h4>
									</div><!-- /.widget-main -->
									<div class="toolbar center">
										<a href="<s:url value='/loginForm.html'/>"  >
											<i class="ace-icon fa fa-arrow-left"></i>
											返回登录
										</a>
									</div>
									
								</div><!-- /.widget-body -->
							</div><!-- /.login-box -->	
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
		$("#regist_button").click(function(){
			$("#registerForm").submit();
		});
		
		jQuery(function($) {
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
	
	<!-- 页脚 -->
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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