<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>官费查询</title>
<%@ include file="_css.jsp" %>
</head>
<body>


<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav2.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">官费查询</span>
	</div>
	
<!-- list beg -->

	<div class="lt-box">	
		<table class="table table-bordered patent-table table-striped">
		  <tr>
			<th colspan="9">应缴费信息</th>
		  </tr>
		  <tr>
			<th colspan="9"> 
				<input type="checkbox" class="fee-check-item">
			    <span class="batch-share">
			    	<a href="javascript:updateMonitorStatus(2)">加入监控</a>
			    </span>
<%-- 			    <span class="batch-share"> --%>
<!-- 			    	<a href="javascript:updateMonitorStatus(1)">放弃监控</a> -->
<%-- 			    </span>  --%>
				<span class="batch-share">
			    	 &nbsp;|&nbsp;<a href="javascript:joinOrder()">加入订单</a>
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
			<th>监控状态</th>
		  </tr>
		  <c:forEach items="${fees}" var="fee" varStatus="status">
			<tr>
			  <td><span class="batch-share-item">
				<input type="checkbox" class="fee-check-item" feeId="${fee.feeId}" patent="${fee.patent.patentId}">
				</span> ${status.index+1} </td>
			  <td>${fee.patent.appNo}</td>
			  <td>${fee.patent.name}</td>
			  <td>${fee.patent.firstAppPerson}</td>
			  <td>${fee.patent.patentStatus.statusDescription}</td>
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

<!-- list end -->
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
		
		if (!feeSelected) {
			formutil.alertMessage('请选择应缴费记录');
			return;
		}

		var fees = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'feeId');
		
		window.open("<s:url value='/order/orderCreateForm.html'/>?fees=" + fees);
	}
</script>
</body>
</html>