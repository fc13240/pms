<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>缴费</title>
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
				<%@ include file="_left_nav2.jsp" %>
			</div>
			<div class="con-list" style="float:left;width:91%;">
				<div class="t-ti">
					<hr class="t-hr">
					<span style="font-size: 16px;font-weight: 300;line-height: 24px;">缴费</span>
				</div>
                <div style="height:30px;"></div>

				<div class="row">
				  <div class="col-lg-12">
				    <table class="table table-bordered patent-table table-striped">
				      <tr>
				        <th colspan="4">专利信息</th>
				      </tr>
				      <tr>
				        <th>申请号/专利号</th>
				        <th>专利名称</th>
				        <th>第一申请人</th>
				        <th>案件状态</th>
				      </tr>
				      <tr>
				        <td>${fees[0].patent.appNo}</td>
				        <td>${fees[0].patent.name}</td>
				        <td>${fees[0].patent.firstAppPerson}</td>
				        <td>${fees[0].patent.patentStatus.statusDescription}</td>
				      </tr>
				    </table>
				    <table class="table table-bordered patent-table table-striped">
				      <tr>
				        <th colspan="9">应缴费信息</th>
				      </tr>
				      <tr>
				        <th colspan="9"> <input type="checkbox" class="fee-check-item">
				          <span class="batch-share"><a href="javascript:updateMonitorStatus(2)">加入监控</a></span> <span class="batch-share"><a href="javascript:updateMonitorStatus(1)">放弃监控</a></span> </th>
				      </tr>
				      <tr>
				        <th>序号</th>
				        <th>缴费种类</th>
				        <th>缴费截止日</th>
				        <th>缴费金额</th>
				        <th>监控状态</th>
				      </tr>
				      <c:forEach items="${fees}" var="fee" varStatus="status">
				        <tr>
				          <td><span class="batch-share-item">
				            <input type="checkbox" class="fee-check-item" feeId="${fee.feeId}">
				            </span> ${status.index+1} </td>
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
         
        </div>
		<!--container end-->
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
		
		location.href = "<s:url value='/fee/changeMonitorStatus.html'/>?fees=" + fees + "&monitorStatus=" + status;
					
	}
	
</script>

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