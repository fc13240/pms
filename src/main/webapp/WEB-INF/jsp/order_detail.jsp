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
	
<!-- list beg -->
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
					   <td>不快递</td>
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
						<td>${order.postAddress.receiver}</td>
						<td>${order.postAddress.provinceName}${order.postAddress.cityName}${order.postAddress.districtName}${order.postAddress.streetName}${order.postAddress.detailAddress}</td>
						<td>${order.postAddress.phone}</td>
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
			  <th>费用信息</th>
			</tr>
		  </thead>
		  <tbody>
			<tr>
			  <td><table class="table table-striped table-bordered table-hover">
				  <thead>
					<tr class="simple_bag">
					  <th>服务费</th>
					  <th>快递费</th>
					  <th>龙图腾发票增值税</th>
					</tr>
				  </thead>
				  <tbody>
					<tr>
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
			  <th>龙图腾增值税发票抬头</th>
			</tr>
		  </thead>
		  <tbody>
		    <tr>
		    	<td>${order.invoice}</td>
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
			  <td><table class="table table-striped table-bordered table-hover">
				  <thead>
					<tr class="simple_bag">
					  <th>快递公司</th>
					  <th>快递单号</th>
					  <th>发货时间</th>
					</tr>
				  </thead>
				  <tbody>
					<tr>
					  <td>${order.expressCompany}</td>
					  <td>${order.expressNo}</td>
					  <td><fmt:formatDate value="${order.sendTime}" pattern="yyyy-MM-dd"/></td>
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
<!-- list end -->
</div>

</body>
</html>