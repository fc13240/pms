<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>龙图腾专利</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
 
<div style="min-width:1300px;height:1500px; background:#F3F3F5;">
	<div style="float:left;width:5%;">
		<%@ include file="_left_nav.jsp" %>
	</div>
	<div style="float:left;width:95%;">

        <div class="center-cconcenct">
        	<!-- 代码 开始 -->
            <div id="change-t"><img src="<s:url value='/temp/images/tab.png'/>"  class="cgh"/></div>
			<div style="float:left;width:9%;">
				<%@ include file="_left_nav_user.jsp" %>
			</div>
			<div class="con-list" style="float:left;width:91%;">
				<div class="t-ti">
					<hr class="t-hr">
					<span style="font-size: 16px;font-weight: 300;line-height: 24px;">专利概况</span>
				</div>
                <div style="height:30px;"></div>
				<div class="t-third">
				<form action="<s:url value='/user/changePassword.html'/>" id="reset-form" name="pwd_change_form" method="post">									
				<se:csrfInput/>
							<h5>请输入原密码：</h5>
								<input  style="width:300px;height:25px;" type="text" class="form-control" name="lastPassword" id="lastPassword" placeholder="原始密码" onkeydown="clearPasswordErrorSpan()" />
								<c:if test="${success != null && !success}">
									<div>
										<span id="passwordError" class="passwordError" style="color:red">原密码输入错误!!</span>
									</div>
								</c:if>
								<br>
						<h5>请输入新密码：</h5>
						<input style="width:300px;height:25px;" type="password" class="form-control" name="newPassword" id="newPassword" minlength="4" maxlength="30" placeholder="新密码至少4位" required/>
						<br>
						<h5>请确认新密码：</h5>
						<input style="width:300px;height:25px;" type="password" class="form-control" name="newPasswordConfirm" id="newPasswordConfirm" minlength="4" maxlength="30" equalTo="#newPassword"placeholder="确认新密码" required/>
						<div style="margin-top:30px; float:left;width:300px;">
						<input type="submit" id="resetPassword" class="width-35 pull-right btn btn-sm btn-primary" style="font-size:16px;margin-left:30px;" value="确认修改" />
						<input type="reset" class="width-35 pull-right btn btn-sm btn-primary" style="font-size:16px;" value="重置" name="reset" />
						</div>
				</form>	              
                </div>
			</div>
         
        </div>
		<!--container end-->
    </div>
</div>
<script>
	$(document).ready(function(){
	
		$("img[class=cgh]").click(function(){
			var ol = $('ol[class="hashTabber-nav hashTabber-sandstone"]')[0];
			var ols =$('.con-list')[0];
			if(ol.style.display=="inline-block"||ol.style.display==""){
					this.style.marginLeft="0px";
					this.src='<s:url value='/temp/images/tabs.png'/>';
					ol.style.display="none";
					ols.style.width="97%";
				}else{
					ol.style.display="inline-block";
					this.style.marginLeft="108px";
					this.src='<s:url value='/temp/images/tab.png'/>';
					ols.style.width="88%";
				}
		});
	});
</script>
</body>
</html>