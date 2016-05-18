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
<!-- 订单 -->
	<div class="lt-box">
	  <div class="main-container" id="main-container">
		<div class="row">
		  <div class="col-xs-12">

			<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:30px;"> 
				<span class="input-group-btn" >
				<div class="ta-top" style="margin:8px;"> 
				
				<span style="font-size:14px;font-weight:600;line-height:17px;">订单信息</span>
				
				</div>
				</span> 
			</div>
			<table id="simple-table" class="table table-striped table-bordered table-hover">
			  <thead>
				<tr class="simple_bag">
				  <th>订单编号</th>
				  <th>下单时间</th>
				  <th>支付时间</th>
				  <th>支付方式</th>
				</tr>
			  </thead>
			  <tbody>
				<tr>
				  <td>${order.id}</td>
				  <td><fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
				  <td><fmt:formatDate value="${order.payTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
				  <td>${order.paymentMethod.paymentMethod}</td>

				</tr>
			</table>
				
			<!-- /.span -->
		  </div>
		  <!-- /.row -->
		</div>
	  </div>
	</div>

<!-- 订单状态 -->
	<div class="lt-box">
	  <div class="main-container" id="main-container">
		<div class="row">
		  <div class="col-xs-12">

			<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:30px;"> 
				<span class="input-group-btn" >
				<div class="ta-top" style="margin:8px;"> 
				
				<span style="font-size:14px;font-weight:600;line-height:17px;">${order.orderStatus.statusDescription}订单</span>
				
				</div>
				</span> 
			</div>
			<table id="simple-table" class="table table-striped table-bordered table-hover">
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
			</table>
				
			<!-- /.span -->
		  </div>
		  <!-- /.row -->
		</div>
	  </div>
	</div>
	
<!-- 收货人信息 -->	
	<c:if test="${order.postAddress != null}">
	<div class="lt-box">
	  <div class="main-container" id="main-container">
		<div class="row">
		  <div class="col-xs-12">

			<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:30px;"> 
				<span class="input-group-btn" >
				<div class="ta-top" style="margin:8px;"> 
				
				<span style="font-size:14px;font-weight:600;line-height:17px;">收货人信息</span>
				
				</div>
				</span> 
			</div>
			<table id="simple-table" class="table table-striped table-bordered table-hover">
			 
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
			</table>
				
			<!-- /.span -->
		  </div>
		  <!-- /.row -->
		</div>
	  </div>
	</div>	
	</c:if>
	
<!-- 收货人信息 -->	
	<c:if test="${order.postAddress != null}">
	<div class="lt-box">
	  <div class="main-container" id="main-container">
		<div class="row">
		  <div class="col-xs-12">

			<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:30px;"> 
				<span class="input-group-btn" >
				<div class="ta-top" style="margin:8px;"> 
				
				<span style="font-size:14px;font-weight:600;line-height:17px;">龙图腾增值税发票抬头</span>
				
				</div>
				</span> 
			</div>
			<table id="simple-table" class="table table-striped table-bordered table-hover">
			<tr>
			  <td><table class="table table-striped table-bordered table-hover">
			  <tr>
				<td><table class="table table-striped table-bordered table-hover">
					    <tr>
					    	<td><font style="color: red">${order.invoice}</font></td>
					    </tr>
				</table></td>
			</tr>
			</table>
				
			<!-- /.span -->
		  </div>
		  <!-- /.row -->
		</div>
	  </div>
	</div>	
	</c:if>
	
<!-- 快递信息 -->	
	<div class="lt-box">
	  <div class="main-container" id="main-container">
		<div class="row">
		  <div class="col-xs-12">

			<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:30px;"> 
				<span class="input-group-btn" >
				<div class="ta-top" style="margin:8px;"> 
				
				<span style="font-size:14px;font-weight:600;line-height:17px;">快递信息</span>
				
				</div>
				</span> 
			</div>
			<table id="simple-table" class="table table-striped table-bordered table-hover">
		
				  <thead>
					<tr class="simple_bag">
					  <th>发货时间</th>
					  <th>快递单号</th>
					  <th>快递公司</th>
					</tr>
				  </thead>
				  <tbody>
					<tr>
					  <td><fmt:formatDate value="${order.sendTime}" pattern="yyyy-MM-dd"/></td>
					  <td>${order.expressNo}</td>
<%-- 					  <td>${order.expressCompany}</td> --%>
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

			</table>
				
			<!-- /.span -->
		  </div>
		  <!-- /.row -->
		</div>
	  </div>
	</div>	

	<div class="lt-box">
	  <div class="main-container" id="main-container">
		<div class="row">
		  <div class="col-xs-12">

			<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:30px;"> 
				<span class="input-group-btn" >
				<div class="ta-top" style="margin:8px;"> 
				
				<span style="font-size:14px;font-weight:600;line-height:17px;">费用信息</span>
				
				</div>
				</span> 
			</div>
			<table id="simple-table" class="table table-striped table-bordered table-hover">
		
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

			</table>
				
			<!-- /.span -->
		  </div>
		  <!-- /.row -->
		</div>
	  </div>
	</div>	
	
	<!-- 结算信息 -->
	<div class="lt-box">
	  <div class="main-container" id="main-container">
		<div class="row">
		  <div class="col-xs-12">

			<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:30px;"> 
				<span class="input-group-btn" >
				<div class="ta-top" style="margin:8px;"> 
				
				<span style="font-size:14px;font-weight:600;line-height:17px;">结算信息</span>
				
				</div>
				</span> 
			</div>
			<table id="simple-table" class="table table-striped table-bordered table-hover">
				  <tbody>
					<tr>
					  <td>商品金额</td>
					  <td>￥${order.totalAmount}</td>
					</tr>
				  </tbody>
			</table>
				
			<!-- /.span -->
		  </div>
		  <!-- /.row -->
		</div>
	  </div>
	</div>	
	
<!-- list end -->
</div>

</body>
</html>