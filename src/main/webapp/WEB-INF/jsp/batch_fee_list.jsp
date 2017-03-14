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
<title>龙图腾专利管家——官费查询</title>
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
					<table class="table table-bordered patent-table table-striped">
					  <tr>
						<th colspan="9">应缴费信息</th>
					  </tr>
					  <tr>
						<th colspan="9"> 
							<input type="checkbox" class="fee-check-item" checked="checked">
						
							<span class="batch-share" style="margin-left:10px;">
								  <a href="javascript:return void" onclick="updateMonitorStatus(2)">
								  <button class="button button-caution button-rounded" style="font-weight:500;font-size:16px;width:110px;">加入购物车</button>
								  </a>
							</span> 
							
						    <span class="batch-share">
						    <a href="javascript:return void" onclick="joinOrder()">
						    <button class="button button-primary  button-rounded" style="font-weight:500;font-size:16px;">立即交费</button>
						   </a>
						   </span>							
						   <span style="color:red;">
						   		风险提示：请用户认真核对查询费用信息，龙图腾对费用信息造成的不良后果不承担任何法律责任
						   </span>
						</th>
					  </tr>
					  <tr>
						<th>序号</th>
						<th>申请号/专利号</th>
						<th>专利名称</th>
						<th>第一申请人</th>
						<th>案件状态</th>
						<th>缴费种类</th>
						<th>缴费截止日</th>
						<th>缴费金额</th>
						<th>购物车</th>
					  </tr>
					  <c:forEach items="${fees}" var="fee" varStatus="status">
						<tr>
						  <td><span class="batch-share-item">
							<input type="checkbox" checked="checked" class="fee-check-item" feeId="${fee.feeId}" patent="${fee.patent.patentId}" monitorStatus="${fee.monitorStatus.monitorStatusDescription}"
								   deadline="<fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/>">
							</span> ${status.index+1} </td>
						  <td>${fee.patent.appNo}</td>
						  <td>${fee.patent.name}</td>
						  <td>${fee.patent.firstAppPerson}</td>
						  <td>${fee.patent.patentStatusText}</td>
						  <td>${fee.feeType}</td>
						  <td><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
						  <td>${fee.amount} </td>
						  <td>${fee.monitorStatus.monitorStatusDescription}</td>
						</tr>
					  </c:forEach>
					</table>
					<c:if test="${! empty emptyFeePatents}">
					  <table class="table table-bordered patent-table table-striped">
						<tr>
						  <th colspan="5">以下专利没有查询到应缴费信息</th>
						</tr>
						<tr>
						  <th>序号</th>
						  <th>申请号/专利号</th>
						  <th>专利名称</th>
						  <th>第一申请人</th>
						</tr>
						<c:forEach items="${emptyFeePatents}" var="patent" varStatus="status">
						  <tr>
							<td>${status.index+1}</td>
							<td>${patent.appNo}</td>
							<td>${patent.name}</td>
							<td>${patent.firstAppPerson}</td>
						  </tr>
						</c:forEach>
					  </table>
					</c:if>
					<c:if test="${! empty failedPatents}">
					  <table class="table table-bordered patent-table table-striped">
						<tr>
						  <th colspan="5">以下专利查询应缴费信息失败</th>
						</tr>
						<tr>
						  <th>序号</th>
						  <th>申请号/专利号</th>
						  <th>专利名称</th>
						  <th>第一申请人</th>
						</tr>
						<c:forEach items="${failedPatents}" var="patent" varStatus="status">
						  <tr>
							<td>${status.index+1}</td>
							<td>${patent.appNo}</td>
							<td>${patent.name}</td>
							<td>${patent.firstAppPerson}</td>
						  </tr>
						</c:forEach>
					  </table>
					</c:if>
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>	


<script type="text/javascript">
	$(function(){
		formutil.clickAllCheckbox('tr th input.fee-check-item', 'tr td input.fee-check-item');
		formutil.clickItemCheckbox('tr th input.fee-check-item', 'tr td input.fee-check-item');
	});
	function updateMonitorStatus(status) {
		var feeSelected = formutil.anyCheckboxItemSelected('tr td input.fee-check-item');
		
		if (!feeSelected) {
			formutil.alertMessage('请选择应缴费记录');
			return;
		}

		var fees = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'feeId');
		
		var patents = formutil.removeDuplicate(formutil.getAllCheckboxValues('tr td input.fee-check-item', 'patent'));
		
		location.href = "<s:url value='/fee/batchChangeMonitorStatus.html'/>?fees=" + fees + "&patents=" + patents + "&monitorStatus=" + status;
	}
	
	function joinOrder() {
		var feeSelected = formutil.anyCheckboxItemSelected('tr td input.fee-check-item');
		var monitorStatus=formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item','monitorStatus');
		if (!feeSelected) {
			formutil.alertMessage('请选择应缴费记录');
			return;
		}
		
		for(var i = 0;i < monitorStatus.length;i++){
			if (monitorStatus[i]=="已加入") {
				
				formutil.alertMessage('部分商品已在购物车中，不能重复添加！');
				return;
			}
		}
		var deadline = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item','deadline');
		
		var now =new Date().getTime();
		for(var k= 0; k < deadline.length; k++){
			var isOverDue=checkTime(now,deadline[k]);
			if(isOverDue){
				if(!confirm('已超出规定交费期限！,是否继续操作？')) {
					return;
				} else {
					break;
				}
			}
		}
		var fees = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'feeId');
		
		window.open("<s:url value='/order/orderCreateForm.html'/>?fees=" + fees);
	}
	
	function checkTime(now,deadline){
		var deadline = Date.parse(deadline.replace(/-/g, '/'));
		var twelveHours=43200000;
		var oneday=twelveHours*2;
		if(deadline+oneday-now<twelveHours){
			return true;
		}
		return false;
	}
</script>
</body>
</html>