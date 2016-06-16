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
<title>龙图腾专利管理系统——官费查询</title>
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
						<th colspan="9"> <input type="checkbox" class="fee-check-item">
						  <span class="batch-share"><a href="javascript:updateMonitorStatus(2)">进入购物车</a></span>
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
	
</script>


<script type="text/javascript">
	$(function(){
		formutil.clickAllCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
		formutil.clickItemCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
	});
	
	function batchShare() {
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		var uniquePatentNos = []
		if (!patentSelected) {
			bootbox.alert('请选择专利');
			return;
		}
		var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
		for (var i = 0; i < patents_checked.length; i++) {
			if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
				uniquePatentNos.push(patents_checked[i]);
			}
		}		
		var patents = uniquePatentNos.join(",");		
		location.href = "<s:url value='/patent/showFriends.html'/>?patents=" + patents;
	}
	function batchGrabFees(){
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		
		if (!patentSelected) {
			bootbox.alert('请选择专利');
			return;
		}
			
		var patentNos = formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
		
		 window.open("<s:url value='/fee/batchGrabFees.html'/>?patents=" + patentNos);		
		
	}		
	
	function getFeeInfo(patentId) {
		window.open("/fee/list?patentId=" + patentId);
	}
	
	function deleteShare(patentId) {
		$.ajax({
			url: "" + patentId, 
			type: 'get', 
			dataType: "json",
			success: function(data) {
				if (data.result == 'not-owner') {
					formutil.alertMessage('你不是专利的拥有者，无法取消分享');				
				} else {
					formutil.alertMessage('分享已取消', true);	
				}
			}
		});			
	}
	
	function changeInternalCode(patentId, internalCode) {
		$.ajax({
			url: "<s:url value='/patent/changeInternalCode.html'/>?patentId=" + patentId + "&internalCode=" + internalCode, 
			type: 'get', 
			success: function(data) {
				//formutil.alertMessage('内部编码修改成功');	
			},
			error: function() {
				formutil.alertMessage('内部编码修改失败');
			}
		});	
	}
	
	function deletePatent(url) {
		$( "<div>确定要删除吗?</div>" ).dialog({
		  resizable: false,
		  height:140,
		  modal: true,
		  buttons: {
			"确定": function() {
				$.ajax({
					url: url, 
					type: 'get', 
					success: function(data) {
						formutil.alertMessage('删除成功', true);	
					}
				});	
			},
			"取消": function() {
			  $( this ).dialog( "close" );
			}
		  }
		});
	}
	

</script>
</body>
</html>