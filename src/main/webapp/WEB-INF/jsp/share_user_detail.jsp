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
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<title>龙图腾专利管家——基本信息</title>
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
				<h4>用户${user.username}详细信息</h4>
				<br>
					<form action=""	method="POST" >
						<h5>真实姓名/名称：</h5>
						<input class="ipt form-control" type="text" name="name" id="name"
							style="height: 40px; width: 300px;" value="${user.name}" readonly="readonly">
		
						<h5>电子邮件：</h5>
						<input class="email form-control" name="email" id="email" type="email"
							style="height: 40px; width: 300px;" value="${user.email}" readonly="readonly"> 
						<br>
						<h5>手机或电话号：</h5>
						<input style="width:300px;" class="phone form-control" name="phone" id="phone" type="text"
							value="${user.phone}" readonly="readonly"> 
						<br>
						<h5>QQ号：</h5>
						<input style="width:300px;" class="phone form-control" name="qq" id="qq" type="text"
							value="${user.qq}" readonly="readonly"> 
						<br>
						<h5>微信号：</h5>
						<input style="width:300px;" class="phone form-control" name="weChat" id="weChat" type="text"
							value="${user.weChat}" readonly="readonly"> 
						<br>
						<div style="height:20px;"></div>
						<h5 style="font-weight:700;">默认联系地址</h5>
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="width:70%;">
					  <thead>
						<tr class="simple_bag">
						  <th>联系人</th>
						  <th>所在地区</th>
						  <th>地址</th>
						  <th>联系电话</th>
						</tr>
					  </thead>
						<tr>
						  <td class="center" style="text-align:center">${contactAddress.receiver}</td>
						  <td class="center" style="text-align:center">${contactAddress.provinceName} ${contactAddress.cityName} ${contactAddress.districtName}
						  </td>
						  <td class="center" style="text-align:center">${contactAddress.detailAddress}</td>
						  <td class="center" style="text-align:center">${contactAddress.phone}</td>
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