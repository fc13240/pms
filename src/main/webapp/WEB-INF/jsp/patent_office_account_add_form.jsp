<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>龙图腾专利管理系统——电子账户信息</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav2.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box">
					<form action="<s:url value='/patentOfficeAccount/add.html'/>" method="POST">
					<table id="simple-table" class="table table-striped table-bordered table-hover">
					  <tr>
						<td style="line-height:50px;width:250px;">中国专利电子申请的用户名：</td>
						<td><input class="ipt" type="text" name="name" id="name" style="height:30px;width:600px;"  value="" maxlength="30">
		
						</td>
					  </tr>
					  <tr>
						<td class="f-tar td-w125" style="line-height:50px;">用户代码：</td>
						<td>
						<input class="email"  name="username" id="email" type="text" style="height:30px;width:600px;" value="" maxlength="25" ></td>
					  </tr>
					  <tr>
						<td class="f-tar td-w125" style="line-height:50px;">登陆密码：</td>
						<td>
						  <input class="phone" name="password" id="phone" type="text" style="height:30px;width:600px;" value="" maxlength="30" ></td>
					  </tr>
					
					  <tr>
						<td class="f-tar td-w125" style="height:47px;"></td>
						<td>
							<button  type="submit" type="submit" class="button button-primary  button-rounded">保存</button>
						</td>
					  </tr>
					</table>
					</form>				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>	

</body>
</html>