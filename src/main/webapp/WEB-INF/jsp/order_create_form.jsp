<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单</title>
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
				<%@ include file="_left_nav_fee.jsp" %>
			</div>
			<div class="con-list" style="float:left;width:91%;">
				<div class="t-ti">
					<hr class="t-hr">
					<span style="font-size: 16px;font-weight: 300;line-height: 24px;">订单</span>
				</div>
                <div style="height:30px;"></div>

		        <div class="row" style="margin-left:20px;">
		          <div class="col-xs-12">
		          	<form action="<s:url value='/order/createOrder.html'/>" method="post">
		          		<c:forEach items="${fees}" var="fee" varStatus="status">
		          			<input type="hidden" name="feeIds" value="${fee.feeId}">
		          		</c:forEach>
		          		
		          		<table id="simple-table" class="table table-striped table-bordered table-hover">
		          			<tr>
		          				<td>收货人信息</td>
		          			</tr>
		          			<c:forEach items="${contactAddresses}" var="address">
			          			<tr>
			          				<td>
			          					<input type="radio" name="postAddress.id"
			          						<c:if test="${address.defaultAddress}">checked="checked"</c:if> value="${address.id}" required="required"> 
			          					${address.receiver} ${address.provinceName} ${address.cityName} ${address.districtName}
			          					${address.streetName} ${address.detailAddress} ${address.phone} 
			          				</td>
			          			</tr>       
		          			</c:forEach>
		          			<tr>
		          				<td>
		          					<input type="radio" name="postAddress.id" value="0" 
		          						<c:if test="${empty contactAddresses}">checked="checked"</c:if> required="required"> 不需要邮寄
		          					<span style="color:red;"><c:if test="${empty contactAddresses}">没有联系地址信息，需要邮寄请添加联系地址后再重新支付&nbsp;&nbsp;&nbsp;</c:if></span>
		          				</td>
		          			</tr>            			
		          			<tr>
		          				<td>支付方式</td>
		          			</tr>     
		          			<tr>
		          				<td><input type="radio" name="paymentMethod.paymentMethodId" value="1" checked="checked" required="required"> 支付宝支付 
		          				<input type="radio" name="paymentMethod.paymentMethodId" value="2" required="required"> 银联卡支付 </td>
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