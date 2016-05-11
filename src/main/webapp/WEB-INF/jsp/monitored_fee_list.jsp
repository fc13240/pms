<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>专利缴费</title>
<%@ include file="_css.jsp" %>

</head>
<body>

<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav_fee.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">专利缴费</span>
	</div>
	<div id="menu">
	  <div style="height:33px;">
	    <ul id="nav">
	      <p>快捷处理：</p>
	      <li><a href="#" class="">专利类型</a></li>
<!-- 	      <li><a href="#" class="">缴费期限</a></li> -->
	      <li><a href="#" class="">缴费状态</a></li>
	      <li><a href="#" class="selected">费用类型</a></li>
	    </ul>
	  </div>
	  <div id="menu_con" style="min-width:1100px;">
	    <div class="tag" style="display:none"> 
	      <ul class="qxjk-ul">
	        <a href="<s:url value='/fee/search.html?page.currentPage=1&patentType=1'/>">
	        <li>发明 (<c:out value='${patentTypeCount[(1).intValue()]["feeCount"]}' default="0"/>)</li>
	        </a> <a href="<s:url value='/fee/search.html?page.currentPage=1&patentType=2'/>">
	        <li>实用新型 (<c:out value='${patentTypeCount[(2).intValue()]["feeCount"]}' default="0"/>)</li>
	        </a> 
	        <a href="<s:url value='/fee/search.html?page.currentPage=1&patentType=3'/>">
	        <li>外观设计 (<c:out value='${patentTypeCount[(3).intValue()]["feeCount"]}' default="0"/>)</li>
	        </a> 
	      </ul>		    
	     </div>
<!-- 	    <div class="tag" style="display:none">  -->
<!-- 	      <ul class="qxjk-ul"> -->
<!-- 	        <a href="#"> -->
<!-- 	        <li>已超期 ()</li> -->
<!-- 	        </a>  -->
<!-- 	        <a href="#"> -->
<!-- 	        <li>两周内()</li> -->
<!-- 	        </a> <a href="#"> -->
<!-- 	        <li>一月内 ()</li> -->
<!-- 	        </a>  -->
<!-- 	        <a href="#"> -->
<!-- 	        <li>两月内 ()</li> -->
<!-- 	        </a>  -->
<!-- 	        <a href="#"> -->
<!-- 	        <li>两月以上 ()</li> -->
<!-- 	        </a> 	         -->
<!-- 	      </ul>	  -->
<!-- 	     </div> -->
	    <div class="tag"  style="display:none"> 
	      <ul class="qxjk-ul">
	        <a href="<s:url value='/fee/search.html?page.currentPage=1&paymentStatus=1'/>">
	        <li>未缴费 (<c:out value='${feePaymentStatusCount[(1).intValue()]["feeCount"]}' default="0"/>)</li>
	        </a> 
	        <a href="<s:url value='/fee/search.html?page.currentPage=1&paymentStatus=2'/>">
	        <li>已支付 (<c:out value='${feePaymentStatusCount[(2).intValue()]["feeCount"]}' default="0"/>)</li>
	        </a>
	        <a href="<s:url value='/fee/search.html?page.currentPage=1&paymentStatus=3'/>">
	        <li>已缴费 (<c:out value='${feePaymentStatusCount[(3).intValue()]["feeCount"]}' default="0"/>)</li>
	        </a> 
	      </ul>
	     
	    </div>
	    <div class="tag"  style="display:block">
	      <ul class="qxjk-ul">
	        <a href="<s:url value='/fee/search.html?page.currentPage=1&patentStatus=1'/>">
	        <li>申请费 (<c:out value='${patentStatusCount[(1).intValue()]["feeCount"]}' default="0"/>)</li>
	        </a>
	        <a href="<s:url value='/fee/search.html?page.currentPage=1&patentStatus=3'/>">
	        <li>年登印费 (<c:out value='${patentStatusCount[(3).intValue()]["feeCount"]}' default="0"/>)</li>
	        </a>
	        <a href="<s:url value='/fee/search.html?page.currentPage=1&patentStatus=6'/>">
	        <li>专利权维持年费 (<c:out value='${patentStatusCount[(6).intValue()]["feeCount"]}' default="0"/>)</li>
	        </a>
	      </ul>
	    </div>
	  </div>
	</div>
	<!--menu end-->		
<!-- list beg -->
	
	<div class="lt-box">
	  <form action="<s:url value='/fee/search.html'/>" method="get">
		<input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
		<div class="t-third">
		  <ul>
			<li>
			  <p>专利类型</p>
			  <label id="lblSelect">
			  <select id="patentType" name="patentType" >
				<option value="">全部</option>
				<option value="1">发明</option>
				<option value="2">实用新型</option>
				<option value="3">外观设计</option>
			  </select>
			  </label>
			</li>
			<li>
			  <p>缴费状态</p>
			  <label id="lblSelect">
			  <select id="paymentStatus" name="paymentStatus" >
				<option value="">全部</option>
				<option value="1">未缴</option>
				<option value="2">已支付</option>
				<option value="3">已缴</option>
				<option value="4">已加入订单</option>
			  </select>
			  </label>
			</li>
			<li>
			  <p>费用类型</p>
			  <label id="lblSelect">
			  <select id="patentStatus" name="patentStatus" >
				<option value="">全部</option>
				<option value="1">申请费</option>
				<option value="3">年登印费</option>
				<option value="6">维持年费</option>
			  </select>
			  </label>
			</li>
			<li>
			  <p>缴费截止日开始</p>
			  <input  type="text" onclick="WdatePicker({el:'startAppDateId'})" style="height:18px;" class="form-control" id="startAppDateId"  name="startDeadline" placeholder="缴费截止日开始" value="" readonly="readonly" >
			</li>
			<li>
			  <p>缴费截止日结束</p>
			  <input type="text" onclick="WdatePicker({el:'endAppDateId'})" style="height:18px;" class="form-control" id="endAppDateId" name="endDeadline" placeholder="缴费截止日结束" value="" readonly="readonly" >
			</li>
			<li style="width: 385px;">
			  <p>关键字</p>
			  <input name="keyword" id="keywordId" value="" placeholder="申请号/名称/申请人/内部编码" class="t-input"/>
			  <button>查询</button>
			</li>
		  </ul>
		</div>
	  </form>
	</div>
	<!--search box end-->
	<div class="lt-box">
	  <div class="main-container" id="main-container">
		<div class="row">
		  <div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<div class="row">
			  <div class="col-xs-12">
				<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
				  <div class="ta-top" style="margin:8px;"> <a href="javascript:batchUpdateInvoiceTitles()">
					<button class="t-btn1">批量修改发票抬头</button>
					</a> <a href="javascript:exportFees()">
					<button class="t-btn6">表格导出</button>
					</a> <a href="javascript:showOrderCreateForm()">
					<button class="t-btn5">加入订单</button>
					</a> <a href="javascript:delectFees()">
					<button class="t-btn2">删除费用</button>
					</a></div>
				  </span> </div>
				<table id="simple-table" class="table table-striped table-bordered table-hover">
				  <thead>
					<tr class="simple_bag">
					  <th class="center"> <label class="pos-rel">
						<input type="checkbox" class="fee-check-item" onclick="calcTotalAmount()">
						<span class="lbl"></span> </label>
					  </th>
					  <th>序号</th>
					  <th>申请号/专利号</th>
					  <th>专利名称</th>
					  <th>第一申请人</th>
					  <th>案件状态</th>
					  <th>缴费截止日</th>
					  <th>缴费种类</th>
					  <th>缴费金额</th>
					  <th>发票抬头</th>
					  <th>缴费状态</th>
					</tr>
				  </thead>
				  <tbody>
					<c:forEach items="${fees}" var="fee" varStatus="status">
					  <tr>
						<td class="center"><span class="batch-share-item">
						  <input type="checkbox" class="fee-check-item" fee="${fee.feeId}" amount="${fee.amount}" onclick="calcTotalAmount()" paymentStatus="${fee.paymentStatus.paymentStatusId}">
						  </span> </td>
						<td class="center"> ${status.count + (page.currentPage-1)*page.pageSize} </td>
						<td><a href="http://so.lotut.com/index.php/fee/search?keyword=${fee.patent.appNo}" target="_black">${fee.patent.appNo}</a></td>
						<td>${fee.patent.name}</td>
						<td>${fee.patent.firstAppPerson}</td>
						<td>${fee.patent.patentStatus.statusDescription}</td>
						<td><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
						<td>${fee.feeType}</td>
						<td>${fee.amount}</td>
						<td><c:choose>
							<c:when test="${fee.paymentStatus.paymentStatusId == 1}">
							  <input type="text" value="${fee.invoiceTitle}" onChange="changeInvoiceTitle('${fee.feeId}', this.value)" size="30">
							</c:when>
							<c:otherwise> ${fee.invoiceTitle} </c:otherwise>
						  </c:choose>
						</td>
						<td>

							<c:choose>
								<c:when test="${fee.paymentStatus.paymentStatusId == 1}">
								${fee.paymentStatus.payementStatusDescription}
								</c:when>
								<c:otherwise> 
								
								<a  href="<s:url value="/order/detail/"/>${fee.orderId}.html" target="_black">
									${fee.paymentStatus.payementStatusDescription}
	                  			</a>
								
								</c:otherwise>
							</c:choose>

						
						</td>
					  </tr>
					</c:forEach>
					<tr>
					  <c:set var="totalAmount" value="0"></c:set>
					  <c:forEach items="${fees}" var="fee">
						<c:set var="totalAmount" value="${totalAmount+fee.amount}"></c:set>
					  </c:forEach>
					  <td colspan="11">总计: ￥<span id="totalAmountSpan">${totalAmount}</span></td>
					</tr>
				  </tbody>
				</table>
				<!-- 分页功能 start -->
				<div style="height:30px;background:#fff;">
				  <c:if test="${searchCondition == null}">
					<div class="col-lg-12"> 共 ${page.totalPages} 页${page.totalRecords}条记录    第${page.currentPage} 页 <a href="?currentPage=1">首页</a>
					  <c:choose>
						<c:when test="${page.currentPage - 1 > 0}"> <a href="?currentPage=${page.currentPage - 1}">上一页</a> </c:when>
						<c:when test="${page.currentPage - 1 <= 0}"> <a href="?currentPage=1">上一页</a> </c:when>
					  </c:choose>
					  <c:choose>
						<c:when test="${page.totalPages==0}"> <a href="?currentPage=${page.currentPage}">下一页</a> </c:when>
						<c:when test="${page.currentPage + 1 < page.totalPages}"> <a href="?currentPage=${page.currentPage+1}">下一页</a> </c:when>
						<c:when test="${page.currentPage + 1 >= page.totalPages}"> <a href="?currentPage=${page.totalPages}">下一页</a> </c:when>
					  </c:choose>
					  <c:choose>
						<c:when test="${page.totalPages==0}"> <a href="?currentPage=${page.currentPage}">尾页</a> </c:when>
						<c:otherwise> <a href="?currentPage=${page.totalPages}">尾页</a> </c:otherwise>
					  </c:choose>
					  <input type="text" id="page.pageNo" style="width:50px;height:15px" name="currentPage" onKeyDown="gotoPageForEnter(event)"/>
					  <a href="javascript:void;" onClick="javascript:gotoPage()">跳转</a> <span> 每页
					  <select onChange="setPageSize()" id="pageSizeSelect">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
						<option value="100">100</option>
					  </select>
					  条记录 </span> </div>
				  </c:if>
				  <c:if test="${searchCondition != null}">
					<div class="col-lg-12"> 共 ${page.totalPages} 页${page.totalRecords}条记录    第${page.currentPage} 页 <a href="?page.currentPage=1&${searchCondition}">首页</a>
					  <c:choose>
						<c:when test="${page.currentPage - 1 > 0}"> <a href="?page.currentPage=${page.currentPage - 1}&${searchCondition}">上一页</a> </c:when>
						<c:when test="${page.currentPage - 1 <= 0}"> <a href="?page.currentPage=1&${searchCondition}">上一页</a> </c:when>
					  </c:choose>
					  <c:choose>
						<c:when test="${page.totalPages==0}"> <a href="?page.currentPage=${page.currentPage}&${searchCondition}">下一页</a> </c:when>
						<c:when test="${page.currentPage + 1 < page.totalPages}"> <a href="?page.currentPage=${page.currentPage+1}&${searchCondition}">下一页</a> </c:when>
						<c:when test="${page.currentPage + 1 >= page.totalPages}"> <a href="?page.currentPage=${page.totalPages}&${searchCondition}">下一页</a> </c:when>
					  </c:choose>
					  <c:choose>
						<c:when test="${page.totalPages==0}"> <a href="?page.currentPage=${page.currentPage}&${searchCondition}">尾页</a> </c:when>
						<c:otherwise> <a href="?page.currentPage=${page.totalPages}&${searchCondition}">尾页</a> </c:otherwise>
					  </c:choose>
					  <!-- 分页功能 End -->
					  <input type="text" id="page.pageNo" style="width:50px;height:15px" name="page.currentPage" onKeyDown="gotoPageForEnter(event)"/>
					  <a href="javascript:void;" onClick="javascript:gotoPage()">跳转</a> <span> 每页
					  <select onChange="setPageSize()" id="pageSizeSelect">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
						<option value="100">100</option>
					  </select>
					  条记录 </span> </div>
				  </c:if>
				</div>
				<!-- 分页功能 end -->
			  </div>
			</div>
			<!-- /.span -->
		  </div>
		  <!-- /.row -->
		</div>
	  </div>
	</div>
	

<!-- list end -->
</div>
<iframe id="feeExcelFileFrame" style="display:none"></iframe>	

<script src="<s:url value='/static/datepicker/WdatePicker.js'/>"></script>


<script type="text/javascript">
$(function(){
	formutil.clickAllCheckbox('tr th input.fee-check-item', 'tr td input.fee-check-item');
	formutil.clickItemCheckbox('tr th input.fee-check-item', 'tr td input.fee-check-item');
});	

function exportFees() {
	var feeSelected = formutil.anyCheckboxItemSelected('tr td input.fee-check-item');
	
	if (!feeSelected) {
		formutil.alertMessage('请选择要导出的记录');
		return;
	}	
	
	var fees = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'fee');
	
	var iframe = document.getElementById('feeExcelFileFrame');
	iframe.src = "<s:url value='/fee/exportFees.html'/>?fees=" + fees;		
}

function batchUpdateInvoiceTitles() {
	var feeSelected = formutil.anyCheckboxItemSelected('tr td input.fee-check-item');
	
	if (!feeSelected) {
		formutil.alertMessage('请选择费用记录');
		return;
	}	
	
	var paymentStatus = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'paymentStatus');
	
	for (var i = 0; i < paymentStatus.length; i++) {
		if (paymentStatus[i] == 2 || paymentStatus[i] == 3) {
			formutil.alertMessage('已支付记录不能修改发票抬头，请重新选择！');
			return;
		}
	}	
	
	var invoiceTitle = prompt("请输入发票抬头", "");
	if (invoiceTitle != null && invoiceTitle != "") {
		var fees = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'fee');
		
		$.ajax({
			url: "<s:url value='/fee/changeInvoiceTitle.html'/>?fees=" + fees + "&invoiceTitle=" + invoiceTitle, 
			type: 'get', 
			success: function(data) {
				location.reload();
			}
		});
	} 
}

function changeInvoiceTitle(fee, invoiceTitle) {
	$.ajax({
		url: "<s:url value='/fee/changeInvoiceTitle.html'/>?fees=" + fee + "&invoiceTitle=" + invoiceTitle, 
		type: 'get', 
		success: function(data) {
			// location.reload();
		}
	});			
}



//CS:FeesCount
	function gotoPage() {
		var pageNo = document.getElementById("page.pageNo").value;
		
		if(isNaN(pageNo)){
			alert("请输入数值");
			return;
		}
		
		if(pageNo==""){
			alert("请输入数值")
			return;
		}
		
		pageNo=parseInt(pageNo);
		
		if(pageNo<1 || pageNo > parseInt("${page.totalPages}")){
			alert("只能输入1-${page.totalPages}之间的数值");
			return;
		}
		var url = "<s:url value='/fee/monitoredFeeList.html'/>?currentPage=" + pageNo;
		
		<c:if test="${searchCondition != null}">
				url = "<s:url value='/fee/search.html'/>?page.currentPage=" + pageNo +"&"+"${searchCondition}";
		</c:if>
		
		location.href = url
	}
	
	function gotoPageForEnter(event) {
		var e = event ? event : window.event;
				
		if(event.keyCode == 13) {
			gotoPage();
		}
	}
	
	function calcTotalAmount() {
		var amounts = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'amount');
		var totalAmount = 0;
		var totalAmountSpan = $("#totalAmountSpan");
		var checkAllCheckbox = $("tr th input.fee-check-item");
		
		if (checkAllCheckbox.prop("checked")) {
			var allAmounts = formutil.getAllCheckboxValues('tr td input.fee-check-item', 'amount');
			
			for (var i = 0; i < allAmounts.length; i++) {
				totalAmount += parseInt(allAmounts[i]);
			}
			
			totalAmountSpan.text(totalAmount);
			return;
		}
		
		for (var i = 0; i < amounts.length; i++) {
			totalAmount += parseInt(amounts[i]);
		}
		
		totalAmountSpan.text(totalAmount);
	}
	
	function showOrderCreateForm() {
		var feeSelected = formutil.anyCheckboxItemSelected('tr td input.fee-check-item');
		
		if (!feeSelected) {
			formutil.alertMessage('请选择要支付的记录');
			return;
		}	
		
		var fees = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'fee');
		var paymentStatus = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'paymentStatus');
		
		for (var i = 0; i < paymentStatus.length; i++) {
			if (paymentStatus[i] == 2 || paymentStatus[i] == 3 || paymentStatus[i] == 4) {
				formutil.alertMessage('包含已支付或已加入订单内的记录，请重新选择！');
				return;
			}
		}
		
		window.open("<s:url value='/order/orderCreateForm.html'/>?fees=" + fees);	
	}

</script>	

<script type="text/javascript">
	$(function() {
		formutil.setElementValue("#pageSizeSelect", ${page.pageSize});
	});
	
	function setPageSize() {
		var pageSize = $("#pageSizeSelect").val();
		
		$.ajax({
			url: "<s:url value='/user/setPageSize.html'/>?pageSize=" + pageSize, 
			type: 'get', 
			success: function() {
				location.reload();
			}
		});		
	}	
</script>
<script type="text/javascript">
		$(function(){
			formutil.clickAllCheckbox('tr th input.fee-check-item', 'tr td input.fee-check-item');
			formutil.clickItemCheckbox('tr th input.fee-check-item', 'tr td input.fee-check-item');
		});
		function delectFees() {
			var feeSelected = formutil.anyCheckboxItemSelected('tr td input.fee-check-item');
			
			if (!feeSelected) {
				formutil.alertMessage('请选择要删除的费用信息');
				return;
			}
		
			var fees = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'fee');
			var paymentStatus = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'paymentStatus');
			for (var i = 0; i < paymentStatus.length; i++) {
				if (paymentStatus[i] == 2 || paymentStatus[i] == 3 || paymentStatus[i] == 4) {
					formutil.alertMessage('您选择的费用已支付或已加入订单内，请重新选择！');
					return;
				}
			}
			location.href = "<s:url value='/fee/deleteFees.html'/>?fees=" + fees;
		}
</script>
<%@ include file="_footer_js.jsp" %>
</body>
</html>