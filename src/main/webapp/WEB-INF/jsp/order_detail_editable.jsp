<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单详情</title>
<%@ include file="_css.jsp" %>
</head>
<body>


<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav_fee.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">订单详情</span>
	</div>
	
<!--  -->
	<div class="lt-box">
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
					  <th>订单编号</th>
					  <th>下单时间</th>
					  <th>支付时间</th>
					  <th>支付方式</th>
					  <th>快递方式</th>
					</tr>
				  </thead>
				  <tbody>
					<tr>
					  <td>${order.id}</td>
					  <td><fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
					  <td><fmt:formatDate value="${order.payTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
					  <td>${order.paymentMethod.paymentMethod}</td>
					  <c:if test="${order.expressFee == 20}">
					   	<td>顺丰速运</td>
					  </c:if>
					  <c:if test="${order.expressFee == 0 && order.postAddress != null}">
					   <td>挂号信</td>
					  </c:if>
					  <c:if test="${order.expressFee == 0 && order.postAddress == null}">
					   <td>无</td>
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
					  <th>序号</th>
					  <th>申请号/专利号</th>
					  <th>专利名称</th>
					  <th>第一申请人</th>
					  <th>案件状态</th>
					  <th>缴费截止日</th>
					  <th>缴费种类</th>
					  <th>缴费金额</th>
					  <th>缴费状态</th>
					  <th>发票抬头</th>
					</tr>
				  </thead>
				  <tbody>
					<c:forEach items="${order.feeList}" var="fee" varStatus="status">
					  <tr>
						<td class="center">${status.count}</td>
						<td>${fee.patent.appNo}</td>
						<td>${fee.patent.name}</td>
						<td>${fee.patent.firstAppPerson}</td>
						<td>${fee.patent.patentStatus.statusDescription}</td>
						<td><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
						<td>${fee.feeType}</td>
						<td>${fee.amount} </td>
						<td>${fee.paymentStatus.payementStatusDescription} </td>
						<td>${fee.invoiceTitle}</td>
					  </tr>
					</c:forEach>
				  </tbody>
				</table></td>
			</tr>
		  </tbody>
		</table>

		<c:if test="${order.postAddress != null}">
		  <table class="table table-striped table-bordered table-hover">
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
						<th>收货人姓名</th>
						<th>地址</th>
						<th>电话</th>
					  </tr>
					</thead>
					<tbody>
					  <tr>
						<td> ${order.postAddress.receiver} </td>
						<td> ${order.postAddress.provinceName}${order.postAddress.cityName}${order.postAddress.districtName}${order.postAddress.streetName}${order.postAddress.detailAddress} </td>
						<td> ${order.postAddress.phone} </td>
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
				  <input type="text" name="expressNo" id="expressNo" value="${order.expressNo}" required/>
				  快递公司:
				  	 <c:if test="${order.expressFee == 20}">
					   <span>顺丰速运</span>
					  </c:if>
					  <c:if test="${order.expressFee == 0 && order.postAddress != null}">
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
						<input  type="text" class="form-control" id="startAppDateId" 
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
			  <td><table class="table table-striped table-bordered table-hover">
				  <thead>
					<tr class="simple_bag">
					  <th>官费</th>
					  <th>服务费</th>
					  <th>快递费</th>
					  <th>龙图腾发票增值税</th>
					</tr>
				  </thead>
				  <tbody>
					<tr>
					  <td>
					  	<c:set var="totalAmount" value="0"></c:set>
					  	<c:forEach items="${order.feeList}" var="fee">
					  		<c:set var="totalAmount" value="${totalAmount+fee.amount}"></c:set>
					  	</c:forEach>
					  	${totalAmount }
					  </td>
					  <td>￥${order.serviceFee}</td>
					  <td>￥${order.expressFee}</td>
					  <td>￥${order.invoiceFee}</td>
					</tr>
				  </tbody>
				</table></td>
			</tr>
		  </tbody>
		</table>
		<table class="table table-striped table-bordered table-hover">
		  <thead>
			<tr class="simple_bag">
			  <th> 结算信息 </th>
			</tr>
		  </thead>
		  <tbody>
			<tr>
			  <td><table class="table table-striped table-bordered table-hover">
				  <tbody>
					<tr>
					  <td>商品金额</td>
					  <td>￥${order.totalAmount}</td>
					</tr>
				  </tbody>
				</table></td>
			</tr>
		  </tbody>
		</table>
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
