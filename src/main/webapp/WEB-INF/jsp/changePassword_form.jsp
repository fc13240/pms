<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
<%@ include file="_css.jsp" %>
</head>
<body>

<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav_user.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 20px;font-weight: 300;line-height: 24px;">修改密码</span>
	</div>
	
	<div class="lt-box" style="padding:20px;">
	  <form action="<s:url value='/user/changePassword.html'/>" id="reset-form" name="pwd_change_form" method="post">
		<se:csrfInput/>
		<h5>请输入原密码：</h5>
		<input  style="height:40px;width:320px;-webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;padding-left:10px;" class="selectPointOfInterest" type="text" class="form-control" name="lastPassword" id="lastPassword" placeholder="原始密码" onkeydown="clearPasswordErrorSpan()" />
		<c:if test="${success != null && !success}">
		  <div> <span id="passwordError" class="passwordError" style="color:red">原密码输入错误!!</span> </div>
		</c:if>
		<br>
		<h5>请输入新密码：</h5>
		
		<input style="height:40px;width:320px;-webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;padding-left:10px;" class="selectPointOfInterest" type="password" name="newPassword" id="newPassword" minlength="4" maxlength="30" placeholder="新密码至少4位" required/>
		<br>
		<h5>请确认新密码：</h5>
		<input style="height:40px;width:320px;-webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;padding-left:10px;" class="selectPointOfInterest" type="password" class="form-control" name="newPasswordConfirm" id="newPasswordConfirm" minlength="4" maxlength="30" equalTo="#newPassword"placeholder="确认新密码" required/>
		<div style="margin-top:30px;width:300px;">
		  <input type="submit" id="resetPassword" class="t-btn2" style="font-size:16px;margin-left:30px;" value="确认修改" />
		  <input type="reset" style="width:90px;" class="t-btn1" style="font-size:16px;" value="重置" name="reset" />
		</div>
	  </form>
	</div>


</div>

</body>
</html>