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
	      <li><a href="#" class="">通知状态</a></li>
	      <li><a href="#" class="">专利类型</a></li>
	      <li><a href="#" class="">期限监控</a></li>
	      <li><a href="#" class="selected">通知类型</a></li>
	    </ul>
	  </div>
	  <div id="menu_con" style="min-width:1100px;">
	    <div class="tag" style="display:none"> 这里是通知状态 </div>
	    <div class="tag" style="display:none"> 这里是专利类型 </div>
	    <div class="tag"  style="display:none"> 这里是期限监控 </div>
	    <div class="tag"  style="display:block">
	      <ul class="qxjk-ul">
	        <a href="#">
	        <li>新案受理 (6)</li>
	        </a> <a href="#">
	        <li>新案受理 (6)</li>
	        </a> <a href="#">
	        <li>费用相关 (6)</li>
	        </a> <a href="#">
	        <li>补正审查 (4)</li>
	        </a> <a href="#">
	        <li>授权登记 (1)</li>
	        </a> <a href="#">
	        <li>权利丧失 (0)</li>
	        </a> <a href="#">
	        <li>手续合格 (0)</li>
	        </a> <a href="#">
	        <li>其他 (2)</li>
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
	<!--search box end-->
	<div style="clear:both;height:30px;"></div>
	<div class="t-table">
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
	                <button class="t-btn5">在线支付</button>
	                </a> </div>
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
	                  <th>费用状态</th>
	                </tr>
	              </thead>
	              <tbody>
	                <c:forEach items="${fees}" var="fee" varStatus="status">
	                  <tr>
	                    <td class="center"><span class="batch-share-item">
	                      <input type="checkbox" class="fee-check-item" fee="${fee.feeId}" amount="${fee.amount}" onclick="calcTotalAmount()">
	                      </span> </td>
	                    <td class="center"> ${status.count + (page.currentPage-1)*page.pageSize} </td>
	                    <td>${fee.patent.appNo}</td>
	                    <td>${fee.patent.name}</td>
	                    <td>${fee.patent.firstAppPerson}</td>
	                    <td>${fee.patent.patentStatus.statusDescription}</td>
	                    <td><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
	                    <td>${fee.feeType}</td>
	                    <td>${fee.amount}</td>
	                    <td><input type="text" value="${fee.invoiceTitle}" onChange="changeInvoiceTitle('${fee.feeId}', this.value)" size="30">
	                    </td>
	                    <td>${fee.paymentStatus.payementStatusDescription} </td>
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
	            <div class="row">
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
	                  <input type="text" id="page.pageNo" style="width:50px;height:25px" name="currentPage" onKeyDown="gotoPageForEnter(event)"/>
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
	                  <input type="text" id="page.pageNo" style="width:50px;height:25px" name="page.currentPage" onKeyDown="gotoPageForEnter(event)"/>
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

    <%@ include file="_footer_js.jsp" %>
</body>
</html>