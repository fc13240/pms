<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s"%>
<%@ taglib uri="security" prefix="se"%>
<%@ taglib uri="c" prefix="c"%>
<%@ taglib uri="fmt" prefix="fmt"%>
<%@ taglib uri="spring-form" prefix="form"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>龙图腾专利管理系统——基本信息</title>
<%@ include file="_css.jsp"%>
</head>
<body>
<%@ include file="_top.jsp"%>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_user.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding:20px;">
					<form action="<s:url value='/user/updateUserDetail.html'/>"
						method="POST" onsubmit="return check()">
						<h5>真实姓名/名称：</h5>
						<input class="ipt form-control" type="text" name="name" id="name"
							style="height: 40px; width: 300px;" value="${user.name}"
							maxlength="30">
		
						<h5>电子邮件：</h5>
						<input class="email form-control" name="email" id="email" type="email"
							style="height: 40px; width: 300px;" value="${user.email}"
							maxlength="25" onblur="validateEmail(this.value)"> <span
							style="color: red; display: none;" id=emailError>请输入正确的邮件地址</span>
						<br>
						<h5>手机或电话号：</h5>
						<input style="width:300px;" class="phone form-control" name="phone" id="phone" type="text"
							minlength="6" maxlength="15" value="${user.phone}"
							onblur="validatePhoneNumber(this.value)"> <span
							style="color: red; display: none;" id=phoneError>请输入正确的手机或者电话号</span>
						<br>
						<div style="height: 20px;"></div>
		
						<button type="submit" style="width: 90px;" class="button button-primary  button-rounded">保存</button>
		
					</form>				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>




	<script type="text/javascript">
		function updateDetail() {
			var username = $("#username").val();
			var name = $("#name").val();
			var email = $("#email").val();
			var phone = $("#phone").val();
			var url = "<s:url value='/user/updateUserDetail.html'/>?username="
					+ username + "&name=" + name + "&email=" + email
					+ "&phone=" + phone;
			location.href = url
		}
		function validatePhoneNumber(phoneNumber) {
			var reg = new RegExp("^[0-9]*$");
			document.getElementById("phoneError").style.display = "none";
			if (reg.test(phoneNumber)) {
				if (phoneNumber.length<7 || phoneNumber.length>13) {
					document.getElementById("phoneError").style.display = "";
					return false;
				} else {
					return true;
				}
			} else {
				document.getElementById("phoneError").style.display = "";
				return false;
			}
		}

		function validateEmail(email) {
			var CheckMail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
			var reg = new RegExp(CheckMail);
			document.getElementById("emailError").style.display = "none";
			if (!reg.test(email)) {
				document.getElementById("emailError").style.display = "";
				return false;
			} else {
				return true;
			}
		}

		function check() {
			var email = document.getElementById("email").value;
			var phone = document.getElementById("phone").value;
			if (validatePhoneNumber(phone) && validateEmail(email)) {
				return true;
			} else {
				return false;
			}
		}
	</script>
</body>
</html>