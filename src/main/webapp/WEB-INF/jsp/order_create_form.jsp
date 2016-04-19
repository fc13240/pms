<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<title>控制台</title>
<%@ include file="_css.jsp" %>

</head>
<body class="no-skin">

<%@ include file="_nav.jsp"%>

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">

  <!-- sidebar -->
	<%@ include file="_main_menu.jsp"%>
  <!-- sidebar -->
  <div class="main-content">
    <div class="main-content-inner">
      <!-- #section:basics/content.breadcrumbs -->
      <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
          <li> <i class="ace-icon fa fa-home home-icon"></i> <a href="#">主页</a> </li>
          <li> <a href="#">订单</a> </li>
        </ul>
      </div>
      <div class="page-content">
 
        <div class="row">
          <div class="col-xs-12">
          	<form action="<s:url value='/order/createOrder.html'/>" method="post">
          		<input type="hidden" name="fees" value="${param.fees}">
          		
          		<table id="simple-table" class="table table-striped table-bordered table-hover">
          			<tr>
          				<td>收货人信息</td>
          			</tr>
          			<c:forEach items="${contactAddresses}" var="address">
	          			<tr>
	          				<td>
	          					<input type="radio" name="postAddress" checked="${address.defaultAddress}" value="${address.id}"> 
	          					${address.receiver} ${address.provinceName} ${address.cityName} ${address.districtName}
	          					${address.streetName} ${address.detailAddress} ${address.phone} 
	          				</td>
	          			</tr>       
          			</c:forEach>
          			<tr>
          				<td>支付方式</td>
          			</tr>     
          			<tr>
          				<td><input type="radio" name="paymentMethod" value="1"> 支付宝支付 <input type="radio" name="paymentMethod" checked="checked" value="2"> 银联卡支付 </td>
          			</tr>    
          			<tr>
          				<td>费用详情</td>
          			</tr>     
          			<tr>
 						<td>
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
									<th>发票抬头</th>
									<th>费用状态</th>
	                              </tr>
	                            </thead>
	                            <tbody>
								
								<c:forEach items="${fees}" var="fee" varStatus="status">
									<tr>
										<td class="center">${status.count}</td>
										<td>${fee.patent.appNo}</td>
										<td>${fee.patent.name}</td>
										<td>${fee.patent.firstAppPerson}</td>
										<td>${fee.patent.patentStatus.statusDescription}</td>
										<td><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
										<td>${fee.feeType}</td>
										<td>${fee.amount} </td>
										<td>${fee.invoiceTitle}</td>
										<td>${fee.paymentStatus.payementStatusDescription}</td>
									</tr>
								</c:forEach>	
									<tr>
										<c:set var="totalAmount" value="0"></c:set>
										<c:forEach items="${fees}" var="fee">
											<c:set var="totalAmount" value="${totalAmount+fee.amount}"></c:set>
										</c:forEach>
										<td colspan="10">总计: ￥<span id="totalAmountSpan">${totalAmount}</span></td>
									</tr>							
	                            </tbody>
	                          </table> 						
 						</td>         				
          			</tr>             			       			     			
          		</table>
          		<input type="submit" value="提交订单">
          	</form>
          </div>
        </div>
		<%@ include file="_footer.jsp"%>
    </div>
  </div>
</div>
<%@ include file="_js.jsp"%>
</body>
</html>
