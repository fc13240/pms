<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>基本信息</title>
<%@ include file="_css.jsp" %>
</head>
<body>


<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav_user.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 20px;font-weight: 300;line-height: 24px;">基本信息</span>
	</div>
	
	<div class="lt-box" style="padding:20px;">
		<form action="<s:url value='/user/updateUserDetail.html'/>" method="POST">
			
		<h5>真实姓名/名称：</h5>
		<input class="ipt" type="text" name="name" id="name" style="height:40px;width:300px;"  value="${user.name}" maxlength="30">

		<h5>电子邮件：</h5>
		<input class="email"  name="email" id="email" type="text" style="height:40px;width:300px;"value="${user.email}" maxlength="25" ></td>
		<br>
		<h5>手机或电话号：</h5>
		 <input class="phone" name="phone" id="phone" type="text" style="height:40px;width:300px;" value="${user.phone}" maxlength="30" ></td>
		
		<br>
		<h5>手机或电话号：</h5>
		 <input class="phone" name="phone" id="phone" type="text" style="height:40px;width:300px;" value="${user.phone}" maxlength="30" ></td>
				
		<div style="margin-top:30px;width:300px;">
		<button style="width:100px;height:40px;"  type="submit" type="submit" class="t-btn4">保存</button>
		</div>	
		</form>		
	</div>


</div>

<script type="text/javascript">
	function updateDetail(){
		var username = $("#username").val();
		var name = $("#name").val();
		var email = $("#email").val();
		var phone = $("#phone").val();
		var url = "<s:url value='/user/updateUserDetail.html'/>?username=" +username +"&name="+ name+"&email="+email+"&phone="+phone;
		location.href = url
	}
</script>
</body>
</html>