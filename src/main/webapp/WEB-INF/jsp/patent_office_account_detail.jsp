<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>电子账户信息</title>
<%@ include file="_css.jsp" %>
</head>
<body>


<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav2.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 20px;font-weight: 300;line-height: 24px;">电子账户信息</span>
	</div>
	
	<div class="t-third">
			<form action="<s:url value='/patentOfficeAccount/update.html'/>" method="POST">
			<table id="simple-table" class="table table-striped table-bordered table-hover">
			  <tr>
				<td style="line-height:50px;width:250px;">中国专利电子申请的用户名：</td>
				<td><input class="ipt" type="text" name="name" id="name" style="height:30px;width:600px;"  value="${patentOfficeAccount.name}" maxlength="30">

				</td>
			  </tr>
			  <tr>
				<td class="f-tar td-w125" style="line-height:50px;">用户代码：</td>
				<td>
				<input name="accountId"  type="hidden" value="${patentOfficeAccount.accountId}">
				<input class="email"  name="username" id="email" type="text" style="height:30px;width:600px;" value="${patentOfficeAccount.username}" maxlength="25" ></td>
			  </tr>
			  <tr>
				<td class="f-tar td-w125" style="line-height:50px;">登陆密码：</td>
				<td>
				  <input class="phone" name="password" id="phone" type="text" style="height:30px;width:600px;" value="${patentOfficeAccount.password}" maxlength="30" ></td>
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
</body>
</html>