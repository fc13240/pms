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
<title>龙图腾专利管家——订单详情</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_fee.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding:20px;">
					<table class="table table-striped table-bordered table-hover">
						  <thead>
							<tr class="simple_bag">
							  <th> 订单信息 </th>
							</tr>
						  </thead>
						  <tbody>
							<tr>
							  <td><table class="table table-striped table-bordered table-hover">
								  <thead>
									<tr class="simple_bag">
									  <th style="text-align:center">订单编号</th>
									  <th style="text-align:center">下单时间</th>
									  <th style="text-align:center">支付时间</th>
									  <th style="text-align:center">支付方式</th>
									  <th style="text-align:center">快递方式</th>
									</tr>
								  </thead>
								  <tbody>
									<tr>
									  <td style="text-align:center">${order.id}</td>
									  <td style="text-align:center"><fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									  <td style="text-align:center"><fmt:formatDate value="${order.payTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									  <td style="text-align:center">${order.paymentMethod.paymentMethod}</td>
									  <c:if test="${order.expressFee == 20}">
									   	<td style="text-align:center">EMS</td>
									  </c:if>
									  <c:if test="${order.expressFee == 0 && order.postAddress != null}">
									   <td style="text-align:center">挂号信</td>
									  </c:if>
									  <c:if test="${order.expressFee == 0 && order.postAddress == null}">
									   <td style="text-align:center">无</td>
									  </c:if>
									</tr>
								  </tbody>
								</table></td>
							</tr>
						  </tbody>
						</table>
						<table class="table table-striped table-bordered table-hover">
						  <thead>
							<tr class="simple_bag">
							  <th> ${order.orderStatus.statusDescription}订单 </th>
							</tr>
						  </thead>
						  <tbody>
							<tr>
							  <td><table class="table table-striped table-bordered table-hover">
								  <thead>
									<tr class="simple_bag">
									  <th style="text-align:center">序号</th>
									  <th style="text-align:center">申请号/专利号</th>
									  <th style="text-align:center">专利名称</th>
									  <th style="text-align:center">第一申请人</th>
									  <th style="text-align:center">案件状态</th>
									  <th style="text-align:center">缴费截止日</th>
									  <th style="text-align:center">缴费种类</th>
									  <th style="text-align:center">缴费金额</th>
									  <th style="text-align:center">缴费状态</th>
									  <th style="text-align:center">发票抬头</th>
									</tr>
								  </thead>
								  <tbody>
									<c:forEach items="${order.feeList}" var="fee" varStatus="status">
									  <tr>
										<td class="center" style="text-align:center">${status.count}</td>
										<td style="text-align:center">${fee.patent.appNo}</td>
										<td style="text-align:center">${fee.patent.name}</td>
										<td style="text-align:center">${fee.patent.firstAppPerson}</td>
										<td style="text-align:center">${fee.patent.patentStatus.statusDescription}</td>
										<td style="text-align:center"><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
										<td style="text-align:center">${fee.feeType}</td>
										<td style="text-align:center">${fee.amount} </td>
										<td style="text-align:center">${fee.paymentStatus.payementStatusDescription} </td>
										<td style="text-align:center">${fee.invoiceTitle}</td>
									  </tr>
									</c:forEach>
								  </tbody>
								</table></td>
							</tr>
						  </tbody>
						</table>
				
						<c:if test="${order.postAddress != null}">
						  <table class="table table-striped table-bordered table-hover" id="table1">
							<thead>
							  <tr class="simple_bag">
								<th> 收货人信息 </th>
							  </tr>
							</thead>
							<tbody>
							  <tr>
								<td><table class="table table-striped table-bordered table-hover">
									<thead>
									  <tr class="simple_bag">
										<th style="text-align:center">收货人姓名</th>
										<th style="text-align:center">地址</th>
										<th style="text-align:center">电话</th>
									  </tr>
									</thead>
									<tbody>
									  <tr>
										<td style="text-align:center"> ${order.postAddress.receiver} </td>
										<td style="text-align:center"> ${order.postAddress.provinceName}${order.postAddress.cityName}${order.postAddress.districtName}${order.postAddress.detailAddress} </td>
										<td style="text-align:center"> ${order.postAddress.phone} </td>
									  </tr>
									</tbody>
								  </table></td>
							  </tr>
							</tbody>
						  </table>
						</c:if>
				
						<table class="table table-striped table-bordered table-hover">
						 <thead>
							<tr class="simple_bag">
							  <th>龙图腾增值税发票抬头</th>
							</tr>
						  </thead>
						  <tbody>
						    <tr>
						    	<td><font style="color: red">${order.invoice}</font></td>
						    </tr>
						  </tbody>
						</table>
						<table class="table table-striped table-bordered table-hover">
						  <thead>
							<tr class="simple_bag">
							  <th> 快递信息 </th>
							</tr>
						  </thead>
						  <tbody>
							<tr>
							  <td><form action="<s:url value='/order/updateUserOrderContactAddresses.html'/>" method="post" id="orderDetail">
								  <se:csrfInput/>
								  快递单编号:
								  <input type="text" style="width:210px;height:34px;" name="expressNo" id="expressNo" value="${order.expressNo}" required/>
								  快递公司:
								  	 <c:if test="${order.expressFee == 20}">
									   <span>EMS</span>
									  </c:if>
									  <c:if test="${order.expressFee == 10 && order.postAddress != null}">
									   <span>挂号信</span>
									  </c:if>
									  <c:if test="${order.expressFee == 0 && order.postAddress == null}">
									   <span>无</span>
									  </c:if>
								  <div style="margin-top:10px;">
									<div class="input-group">
									  <div style="float:left;line-height: 32px;">发送时间</div>
									  <div style="float:left;margin-left: 16px;" class="form-group" style="margin-left:15px;">
									  <div style="float:left;">
										<input  type="text" class="form-control" id="startAppDateId" style="width:108px;height:34px;"
										name="startDispatchDate" placeholder="快递发送日期选择" value="<fmt:formatDate value="${order.sendTime}" pattern="yyyy-MM-dd"/>"  
										readonly="readonly" onclick="javascript:$('#start_date_img').click()" style="width: 150px;height: 25px" required> </div>
									  <div style="float:left;margin: 8px;"><img onclick="WdatePicker({el:'startAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="25" height="30" align="absmiddle" id="start_date_img"></div>
									</div>
								  </div>
								  </div>
								  <input type="hidden" name="orderId" id="orderId" value="${order.id}"/>
								  <input type="submit" value="保存" style="width: 100px;height: 25px;background: #DB0C14; color:#fff" onclick="javascript:submitExp()"/>
								</form></td>
							</tr>
						  </tbody>
						</table>
						<table class="table table-striped table-bordered table-hover">
						  <thead>
							<tr class="simple_bag">
							  <th>费用信息</th>
							</tr>
						  </thead>
						  <tbody>
							<tr>
							  <td><table class="table table-striped table-bordered table-hover" >
								  <thead>
									<tr class="simple_bag">
									  <th style="text-align:center">官费</th>
									  <th style="text-align:center">服务费</th>
									  <th style="text-align:center">快递费</th>
									  <th style="text-align:center">龙图腾发票增值税</th>
									</tr>
								  </thead>
								  <tbody>
									<tr>
									  <td style="text-align:center">
									  	<c:set var="totalAmount" value="0"></c:set>
									  	<c:forEach items="${order.feeList}" var="fee">
									  		<c:set var="totalAmount" value="${totalAmount+fee.amount}"></c:set>
									  	</c:forEach>
									  	￥${totalAmount }
									  </td>
									  <td style="text-align:center">￥${order.serviceFee}</td>
									  <td style="text-align:center">￥${order.expressFee}</td>
									  <td style="text-align:center">￥${order.invoiceFee}</td>
									</tr>
									<tr>
									  <td colspan="5" style="font-weight: bold;">商品总额:￥${order.totalAmount+order.serviceFee}</td>
									</tr>
								  </tbody>
								</table></td>
							</tr>
						  </tbody>
						</table>				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>




<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">订单详情</span>
	</div>
	
<!--  -->
	<div class="lt-box">

	</div>
<!--  -->
</div>
<script type="text/javascript">
			function addDefaultOption(selectElem) {
				selectElem.append("<option value=''>请选择</option>");
			}
			
			function resetSelect() {
				for (var i = 0; i < arguments.length; i++) {
					var selectObj = arguments[i];
					selectObj.empty();
					addDefaultOption(selectObj);
				}
			}
			
			function addOptions(selectObj, options) {
				$.each(options, function(index, val){
					selectObj.append("<option value='" + val.id + "'>" + val.name + "</option>");
				});	
			}
			
			function loadCities() {
				var province = $("#province").val();
				
				resetSelect($("#city"), $("#district"), $("#street"));
				
				if (province != "") {
					$.ajax({
						url: "<s:url value='/user/getCitiesByProvince.html'/>?province=" + province,
						type: 'get',
						dataType: 'json',
						success: function(cities) {
							var city = $("#city");
							
							resetSelect(city);
							addOptions(city, cities);
						}
					})
				} 
			}
			
			function loadDistricts() {
				var city = $("#city").val();
			
				resetSelect($("#district"), $("#street"));
				
				if (city != "") {
					$.ajax({
						url: "<s:url value='/user/getDistrictsByCity.html'/>?city=" + city,
						type: 'get',
						dataType: 'json',
						success: function(districts) {
							var district = $("#district");
							
							resetSelect(district);
							addOptions(district, districts);
						}
					})
				}
			}
			
			function loadStreets() {
				var district = $("#district").val();
				
				resetSelect($("#street"));
				
				if (district != "") {
					$.ajax({
						url: "<s:url value='/user/getStreetsByDistrict.html'/>?district=" + district,
						type: 'get',
						dataType: 'json',
						success: function(streets) {
							var street = $("#street");
							
							resetSelect(street);
							addOptions(street, streets);
						}
					})
				} 
			}
	
</script>
<script type="text/javascript">
/* $("#table1").style.textAlign="center"; */

$(function() {
	$("#orderDetail").validate({
		submitHandler: function(form){ 
			form.submit();     
		}
	});	
});

		function remind(){
			$("<div>操作成功</div>").dialog({
				modal: true,
				buttons: {
					Ok: function() {
					$(this).dialog("close");
					}
				}	
			});
		}
</script>
<script src="<s:url value='/static/js/jquery.validate.min.js'/>"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>"></script>		
</body>
</html>
