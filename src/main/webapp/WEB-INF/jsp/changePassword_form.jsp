<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<title>龙图腾专利管家——修改密码</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
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
				  <form action="<s:url value='/user/changePassword.html'/>" id="reset-form" name="pwd_change_form" method="post">
					<se:csrfInput/>
					<h5>请输入原密码：</h5>
					<input  style="width:320px;" class="selectPointOfInterest form-control" type="password" class="form-control" name="lastPassword" id="lastPassword" placeholder="原始密码" onkeydown="clearPasswordErrorSpan()" />
					<c:if test="${success != null && !success}">
					  <div> <span id="passwordError" class="passwordError" style="color:red">原密码输入错误!!</span> </div>
					</c:if>
					<br>
					<h5>请输入新密码：</h5>
					
					<input style="width:320px;" class="selectPointOfInterest form-control" type="password" name="newPassword" id="newPassword" minlength="4" maxlength="30" placeholder="新密码至少4位" required/>
					<br>
					<h5>请确认新密码：</h5>
					<input style="width:320px;"  class="selectPointOfInterest form-control" type="password" class="form-control" name="newPasswordConfirm" id="newPasswordConfirm" minlength="4" maxlength="30" equalTo="#newPassword"placeholder="确认新密码" required/>
					<div style="margin-top:30px;width:300px;">
					  <input type="submit" id="resetPassword" class="button button-caution button-rounded" style="font-size:16px;margin-left:30px;" value="确认修改" />
					  <input type="reset" style="width:90px;font-size:16px;margin-left:30px;" class="button button-primary  button-rounded"  value="重置" name="reset" />
					</div>
				  </form>
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>
<script type="text/javascript">
	function clearPasswordErrorSpan() {
		$("#passwordError").hide();
	}
</script>
<script type="text/javascript">
	jQuery(function($) {
		$("#reset-form").validate({
			submitHandler: function(form){ 
				form.submit();     
			}
		});
	});
</script>
<script src="<s:url value='/static/js/jquery.validate.min.js'/>"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>"></script>
</body>
</html>