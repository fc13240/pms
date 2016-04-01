<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta charset="utf-8" />
	<title>登录注册</title>

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
	<!-- 引入JQuery -->
	<script type="text/javascript" src="<s:url value='/static/js/jquery.min.js'/>">
	</script>
	<!-- 引入cookie -->
	<script type="text/javascript" src="<s:url value='/static/js/cookie.js'/>"></script>

	<!-- 注册 -->
	<script type="text/javascript">
		$("#regist_button").click(function(){
				//清除消息提示
				$("#warning_1").hide();
				$("#warning_2").hide();
				$("#warning_3").hide();
				//获取请求参数
				var email=$("#email").val().trim();
				var actual_name=$("#actual_name").val().trim();
				var username=$("#username").val().trim();
				var password=$("#regist_password").val().trim();
				var final_password=$("#final_password").val().trim();
			//检查格式
			var ok=true;
			if(username==""){
				ok=false;
				$("#warning_1 span").html("用户名为空");
				$("#warning_1").show();
			}
			if(password==""){
				ok=false;
				$("#warning_2 span").html("密码为空");
				$("#warning_2").show();
			}else{
				if(password.length<6){
					ok=false;
					$("#warning_2 span").html("密码需要6位");
					$("#warning_2").show();
				}
			}
			if(final_password != password){
				ok=false;
				$("#warning_3 span").html("确认密码和密码不一致");
				$("#warning_3").show();
			}
			//发送Ajax
			if(ok){
				$.ajax({
					url:"http://localhost:8080/pms/user/register.html",
					type:"post",
					data:{"username":username,"password":password,"actual_name":actual_name,"email":email},
					dataType:"json",
					success:function(result){
						if(result.status==0){
							alert(result.msg);
							$("#back").click();//切换到登录页面
						}else if(result.status==1){
							$("#warning_1 span").html(result.msg);
							$("#warning_1").show();
						}
					},
					error:function(){
						alert("注册失败,稍后重试！");
					}
				});
			}
		});
	</script>
</head>

<body class="login-layout" style=" background-image: url(<s:url value='/static/images/bacground.jpg'/>);background-size:cover; ">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
				

						<div class="space-6">

						</div>

						<div class="position-relative">
							<div id="login-box" class="login-box visible widget-box no-border" style="background-color:#5090C1;margin-top:200px;">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="ace-icon fa fa-coffee green"></i>
											请输入您的信息
										</h4>

										<div class="space-6"></div>

										<form action="<s:url value='/login'/>" method="post" id="login-form" class="form-horizontal">
										<se:csrfInput/>
											<fieldset>
												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="text" class="form-control" name="username" id="count" placeholder="用户名" />
														<!-- 加一个提示区 --> 
														<span id="count_span">请输入用户名</span>
														<i class="ace-icon fa fa-user"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="password" class="form-control" name="password" id="password" placeholder="密码" />
														<!-- 加一个提示区 -->
														<span id="password_span">请输入密码</span>
														<i class="ace-icon fa fa-lock"></i>
													</span>
												</label>

												<div class="space"></div>

												<div class="clearfix">
													<label class="inline">
														<input type="checkbox" class="ace" />
														<span class="lbl"> 记住密码</span>
													</label>

											
													<input type="submit" class="width-35 pull-right btn btn-sm btn-primary" style="font-size:16px;" value="登陆">

													
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>
<!--
											<div class="social-or-login center">
												<span class="bigger-110">Or Login Using</span>
											</div>

											<div class="space-6"></div>

											<div class="social-login center">
												<a class="btn btn-primary">
													<i class="ace-icon fa fa-facebook"></i>
												</a>

												<a class="btn btn-info">
													<i class="ace-icon fa fa-twitter"></i>
												</a>

												<a class="btn btn-danger">
													<i class="ace-icon fa fa-google-plus"></i>
												</a>
											</div>-->
									</div><!-- /.widget-main -->

									<div class="toolbar clearfix">
						

										<div>
											<a href="#" data-target="#signup-box" class="user-signup-link" >
												我要注册
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div>
								</div><!-- /.widget-body -->
							</div><!-- /.login-box -->

							<div id="forgot-box" class="forgot-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header red lighter bigger">
											<i class="ace-icon fa fa-key"></i>
											Retrieve Password
										</h4>

										<div class="space-6"></div>
										<p>
											Enter your email and to receive instructions
										</p>

										<form>
											<fieldset>
												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="email" class="form-control" placeholder="Email" />
														<i class="ace-icon fa fa-envelope"></i>
													</span>
												</label>

												<div class="clearfix">
													<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
														<i class="ace-icon fa fa-lightbulb-o"></i>
														<span class="bigger-110">Send Me!</span>
													</button>
												</div>
											</fieldset>
										</form>
									</div><!-- /.widget-main -->

									<div class="toolbar center">
										<a href="#" data-target="#login-box" class="back-to-login-link">
											Back to login
											<i class="ace-icon fa fa-arrow-right"></i>
										</a>
									</div>
								</div><!-- /.widget-body -->
							</div><!-- /.forgot-box -->

							<div id="signup-box" class="signup-box widget-box no-border" style="background-color: #76B774;margin-top:100px;">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="ace-icon fa fa-users blue"></i>
											新用户注册
										</h4>

										<div class="space-6"></div>
										<p> 输入您的详细信息: </p>

										<form>
											<fieldset>
												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="email" id="email" class="form-control" placeholder="邮箱" />
														<i class="ace-icon fa fa-envelope"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="text" class="form-control" id="username" placeholder="用户名" />
														<div class='warning' id='warning_1'><span>该用户名不可用</span></div>
														<i class="ace-icon fa fa-user"></i>
													</span>
												</label>
												
												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="text" class="form-control" id="actual_name" placeholder="真实姓名" />
														<i class="ace-icon fa fa-user"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="password" class="form-control" id="regist_password" placeholder="密码" />
														<div class='warning' id='warning_2'><span>密码长度过短</span></div>
														<i class="ace-icon fa fa-lock"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="password" class="form-control" id="final_password" placeholder="再次输入密码" />
														<div class='warning' id='warning_3'><span>密码输入不一致</span></div>
														<i class="ace-icon fa fa-retweet"></i>
													</span>
												</label>

												<label class="block">
													<input type="checkbox" class="ace" />
													<span class="lbl">
														同意
														<a href="#">用户条约</a>
													</span>
												</label>

												<div class="space-24"></div>

												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm">
														<i class="ace-icon fa fa-refresh"></i>
														<span class="bigger-110">重置</span>
													</button>

													<button type="button" id="regist_button" class="width-65 pull-right btn btn-sm btn-success">
														<span class="bigger-110">注册</span>

														<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
													</button>
												</div>
											</fieldset>
										</form>
									</div>

									<div class="toolbar center">
										<a href="#" data-target="#login-box" id="back" class="back-to-login-link">
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
</body>
</html>