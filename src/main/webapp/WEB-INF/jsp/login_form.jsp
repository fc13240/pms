<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<!DOCTYPE html>
<html>
<head>
	<title>专利管理系统登陆</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/bootstrap.min.css'/>" />
	<style type="text/css">
		body {
			background-color: #F03118;
			background: url("static/images/login.jpg")
		}
		
		#login-form {
			background-color: #F8F8FF;
			width: 400px;
			border: 2px solid #666;
			margin: auto;
			margin-top: 200px;
			padding-left: 40px;
			padding-right: 40px;
			padding-top: 20px;
   			-moz-border-radius: 15px;     
   			-webkit-border-radius: 15px;  
   			border-radius:15px;         	
		}
		
		.register {
			margin-top: 60px;
		}
	</style>
</head>
<body>
	<div class="container main">
		<div class="row">
			<div class="col-md-12  text-center">
				<form action="<s:url value='/login'/>" method="post" id="login-form" class="form-horizontal">
					<se:csrfInput/>
					<fieldset>
						<legend>专利管理系统登陆</legend>
					<div class="form-group">
						<label for="id_username" class="control-label">用户名</label>
						<input type="text" id="id_username" name="username" class="form-control" autofocus >
					</div>
					<div class="form-group">
						<label for="id_password">密码</label>
						<input type="password" id="id_password" name="password" class="form-control">
					</div>			
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block" value="登陆">	
					</div>			
					<div class="form-group register">
						<a href="/register">免费注册</a>	
					</div>									
					</fieldset>			
				</form>
			</div>					
		</div>			
	</div>

<script src="<s:url value='/static/js/jquery-1.11.3.js'/>"></script>
<script src="<s:url value='/static/js/bootstrap.min.js'/>"></script>	
</body>
</html>