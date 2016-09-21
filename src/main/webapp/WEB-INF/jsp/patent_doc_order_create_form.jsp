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
<title>龙图腾专利管家——订单</title>
<%@ include file="_css.jsp" %>

</head>
<body>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_editor.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box">
					<form action="<s:url value='/patentDocWorkflow/createPatentDocOrder.html'/>" method="post">
					  <c:forEach items="${PatentDocs}" var="patentDoc" varStatus="status">
						<input type="hidden" name="patentDocIds" value="${patentDoc.patentDocId}">
					  </c:forEach>
					  <table id="simple-table" class="table table-striped table-bordered table-hover">
						<tr>
						  <td>支付方式:</td>
						</tr>
						<tr>
						  <td><input type="radio" name="paymentMethod.paymentMethodId" value="1" checked="checked" required="required">
							支付宝支付
							<input type="hidden" name="paymentMethod.paymentMethodId" value="2" required="required">
							 
						 </td>
						</tr>
						<tr>
						  <td>专利文档详情</td>
						</tr>
						<tr>
						  <td><table id="simple-table" class="table table-striped table-bordered table-hover">
							  <thead>
								<tr class="simple_bag">
								  <th>序号</th>
								  <th>文档类型</th>
								  <th>专利名称</th>
								  <th>申请费</th>
								  <th>印刷费</th>
								  <th>申请审查费</th>
								  <th>服务费</th>
								  <th>总计</th>
								  <th>费用状态</th>
								</tr>
							  </thead>
							  <tbody>
								<c:forEach items="${PatentDocs}" var="patentDoc" varStatus="status">
								  <tr>
									<td class="center" style="text-align:center">${status.count}</td>
									<c:if test="${patentDoc.patentType==1}">
										<td style="text-align:center"><c:out value="发明专利"/></td>
									</c:if>
									<c:if test="${patentDoc.patentType==2}">
										<td style="text-align:center"><c:out value="实用新型"/></td>
									</c:if>
									<c:if test="${patentDoc.patentType==3}">
										<td style="text-align:center"><c:out value="外观设计"/></td>
									</c:if>
									<td style="text-align:center">${patentDoc.name}</td>
									<td style="text-align:center">
										${patentDoc.applyFee}
									</td>
									<td style="text-align:center">
										<c:if test="${patentDoc.printFee<=0}">/</c:if>
										<c:if test="${patentDoc.printFee>0}">${patentDoc.printFee}</c:if>
									</td>
									<td style="text-align:center">
										<c:if test="${patentDoc.checkFee<=0}">/</c:if>
										<c:if test="${patentDoc.checkFee>0}">${patentDoc.checkFee}</c:if>
									</td>
									<td style="text-align:center">
										${patentDoc.serviceFee}
									</td>
									<td style="text-align:center">
										${patentDoc.totalFee}
									</td>
									<c:if test="${patentDoc.feeStatus==0}">
										<td style="text-align:center"><c:out value="未缴费"/></td>
									</c:if>
									<c:if test="${patentDoc.feeStatus==1}">
										<td style="text-align:center"><c:out value="已缴费"/></td>
									</c:if>
								  </tr>
								</c:forEach>
							  </tbody>
							</table>
								<tr>
									<td colspan="10">总价: ￥<span id="totalAmount">${totalAmount}</span>
									</td>
								</tr>
					  </table>
					  <span style="margin-left:10px;margin-bottom:10px;">
					  <input type="submit" class="button button-caution button-rounded" value="提交订单">
					  </span>
					</form>				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>	


<script type="text/javascript">

	function hint(){
		var postAddress=$("input:radio[name='postAddress.id']:checked").val();
		var express=$("input:radio[name='express']:checked").val();
		var nationalInvoice=$("input:radio[name='nationalInvoice']:checked").val();
		var companyInvoice=$("input:radio[name='companyInvoice']:checked").val();
		var patentAmount = parseInt($("#patentFee").text());
		var serviceFeeAmount = parseInt($("#serviceFee").text());
		var baseFee = patentAmount + serviceFeeAmount;
		var expressFee = $("#expressFee");
		var expressFeeAmount = 20;
		var normalExpressFee = 10;
		var invoiceFee = $("#invoiceFee");
		var totalAmount = $("#totalAmount");
		var needPost = postAddress!=0;
		var isEmsExpress = express==1;
		var needCompanyInvoice = companyInvoice==1;
		
		if (needPost) {
			if (isEmsExpress && needCompanyInvoice) {
				expressFee.text(expressFeeAmount);
				invoiceFee.text(parseInt(patentAmount * 0.1));
				totalAmount.text(baseFee + expressFeeAmount + parseInt(patentAmount * 0.1));	
			} else if (isEmsExpress) {
				expressFee.text(expressFeeAmount);
				invoiceFee.text(0);
				totalAmount.text(baseFee + expressFeeAmount);
			} else if (needCompanyInvoice) {
				expressFee.text(10);
				invoiceFee.text(parseInt(patentAmount * 0.1));
				totalAmount.text(baseFee + normalExpressFee + parseInt(patentAmount * 0.1));				
			} else {
				expressFee.text(10);
				invoiceFee.text(0);
				totalAmount.text(baseFee + normalExpressFee);	
			}
		} else {
			expressFee.text(0);
			invoiceFee.text(0);
			totalAmount.text(baseFee);			
		}
		

	}
	
	
			
		function hide(){
			var trs = $("tr[class='lotut']");  
			for(i = 0; i < trs.length; i++){   
			    trs[i].style.display = "none"; //这里获取的trs[i]是DOM对象而不是jQuery对象，因此不能直接使用hide()方法  
			} 
			
		var express=$("input:radio[name='express']:checked").val();
		var nationalInvoice=$("input:radio[name='nationalInvoice']:checked").val();
		var invoice=$("input:radio[name='invoice']:checked").val();
		var patentAmount = parseInt($("#patentFee").text());
		var serviceFeeAmount = parseInt($("#serviceFee").text());
		var baseFee = patentAmount + serviceFeeAmount;
		var expressFee = $("#expressFee");
		var expressFeeAmount = 20;
		var invoiceFee = $("#invoiceFee");
		var totalAmount = $("#totalAmount");
		expressFee.text(0);
		invoiceFee.text(0);
		totalAmount.text(baseFee);
		$("#invoice").val("");
	}

	
	function show(){
		var trs = $("tr[class='lotut']");  
		for(i = 0; i < trs.length; i++){   
		    trs[i].style.display = "block"; 
		} 
		};
	function showed(){
 		$("#invoice").show();
 	}
 	function hidde(){
 		$("#invoice").hide();
 		$("#invoice").val("");
 	}
</script>
</body>
</html>