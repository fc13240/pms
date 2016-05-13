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
	
	<div class="t-third">
			<form action="<s:url value='/user/updateUserDetail.html'/>" method="POST">
			<table id="simple-table" class="table table-striped table-bordered table-hover">
			  <tr>
				<td style="line-height:50px;">真实姓名/名称：</td>
				<td><input class="ipt" type="text" name="name" id="name" style="height:30px;width:200px;"  value="${user.name}" maxlength="30">

				</td>
			  </tr>
			  <tr>
				<td class="f-tar td-w125" style="line-height:50px;">电子邮件：</td>
				<td>
				  <input class="email"  name="email" id="email" type="text" style="height:30px;width:200px;"value="${user.email}" maxlength="25" ></td>
			  </tr>
			  <tr>
				<td class="f-tar td-w125" style="line-height:50px;">手机或电话号：</td>
				<td>
				  <input class="phone" name="phone" id="phone" type="text" style="height:30px;width:200px;" value="${user.phone}" maxlength="30" ></td>
			  </tr>
			  <tr>
				<td class="f-tar td-w125" style="height:47px;"></td>
				<td>
					<button  type="submit" type="submit" class="t-btn4">保存</button>
				</td>
			  </tr>
			</table>
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