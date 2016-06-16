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
<title>龙图腾专利管理系统——订单详情</title>
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
				<div class="lt-box">
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
						  <td style="text-align:center">${order.id}</td>
						  <td style="text-align:center"><fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
						  <td style="text-align:center"><fmt:formatDate value="${order.payTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
						  <td style="text-align:center">${order.paymentMethod.paymentMethod}</td>
		
						</tr>
					</table>				
				</div>
				<div class="lt-box">
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
					</table>				
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
									<td style="text-align:center">${order.postAddress.receiver}</td>
									<td style="text-align:center">${order.postAddress.provinceName}${order.postAddress.cityName}${order.postAddress.districtName}${order.postAddress.streetName}${order.postAddress.detailAddress}</td>
									<td style="text-align:center">${order.postAddress.phone}</td>
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
				
			<!-- 发票信息 -->
			
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
								  <td style="text-align:center"><fmt:formatDate value="${order.sendTime}" pattern="yyyy-MM-dd"/></td>
								  <td style="text-align:center">${order.expressNo}</td>
			<%-- 					  <td>${order.expressCompany}</td> --%>
								  <c:if test="${order.expressFee == 20}">
								   <td style="text-align:center">顺丰速运</td>
								  </c:if>
								  <c:if test="${order.expressFee == 0 && order.postAddress != null}">
								   <td style="text-align:center">挂号信</td>
								  </c:if>
								  <c:if test="${order.expressFee == 0 && order.postAddress == null}">
								   <td style="text-align:center">无</td>
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
								  <td colspan="5" style="font-weight: bold;">商品总额:￥${order.totalAmount}</td>
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

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>




</body>
</html>