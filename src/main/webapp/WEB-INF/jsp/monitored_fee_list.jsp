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
<title>龙图腾专利管理系统-专利交费</title>
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

					<div id="menu">
					  <div style="height:33px;">
					    <ul id="nav">
					      <p>快捷处理：</p>
					      <li><a href="#" class="">专利类型</a></li>
					      <li><a href="#" class="">交费状态</a></li>
					      <li><a href="#" class="selected">费用类型</a></li>
					      <li><a href="#" class="">期限监控</a></li>
					    </ul>
					  </div>
					  <div id="menu_con" style="min-width:1100px;">
					    <div class="tag" style="display:none"> 
					      <ul class="qxjk-ul">
					      	<li>
					        <a href="<s:url value='/fee/search.html?page.currentPage=1&patentType=1'/>">
					        	发明 (<c:out value='${patentTypeCount[(1).intValue()]["feeCount"]}' default="0"/>)
					        </a>
					        </li>
					        
					        <li>
						        <a href="<s:url value='/fee/search.html?page.currentPage=1&patentType=2'/>">
						        	实用新型 (<c:out value='${patentTypeCount[(2).intValue()]["feeCount"]}' default="0"/>)
						        </a>
					        </li>
					        
					        <li> 
						        <a href="<s:url value='/fee/search.html?page.currentPage=1&patentType=3'/>">
						        	外观设计 (<c:out value='${patentTypeCount[(3).intValue()]["feeCount"]}' default="0"/>)
						        </a>
					        </li> 
					      </ul>		    
					     </div>
					    <div class="tag"  style="display:none"> 
					      <ul class="qxjk-ul">
					      	<li>
						        <a href="<s:url value='/fee/search.html?page.currentPage=1&paymentStatus=1'/>">
						        	应交费 (<c:out value='${feePaymentStatusCount[(1).intValue()]["feeCount"]}' default="0"/>)
						        </a>
					        </li>
					        
					        <li> 
						        <a href="<s:url value='/fee/search.html?page.currentPage=1&paymentStatus=2'/>">
						        	已支付 (<c:out value='${feePaymentStatusCount[(2).intValue()]["feeCount"]}' default="0"/>)
						        </a>
					        </li>
					        
					        <li>
						        <a href="<s:url value='/fee/search.html?page.currentPage=1&paymentStatus=3'/>">
						        	已交局 (<c:out value='${feePaymentStatusCount[(3).intValue()]["feeCount"]}' default="0"/>)
						        </a>
					        </li>
					        
					        <li>
						        <a href="<s:url value='/fee/search.html?page.currentPage=1&paymentStatus=4'/>">
						        	待支付 (<c:out value='${feePaymentStatusCount[(4).intValue()]["feeCount"]}' default="0"/>)
						        </a>
					        </li>
					        
					        <li> 
						        <a href="<s:url value='/fee/search.html?page.currentPage=1&paymentStatus=5'/>">
						        	交费成功 (<c:out value='${feePaymentStatusCount[(5).intValue()]["feeCount"]}' default="0"/>)
						        </a>
					        </li> 
					      </ul>
					     
					    </div>
					    <div class="tag"  style="display:block;">
					      <ul class="qxjk-ul">
					      	<li>
						        <a href="<s:url value='/fee/search.html?page.currentPage=1&patentStatus=1'/>">
						        	申请费 (<c:out value='${patentStatusCount[(1).intValue()]["feeCount"]}' default="0"/>)
						        </a>
					        </li>
					        
					        <li>
						        <a href="<s:url value='/fee/search.html?page.currentPage=1&patentStatus=3'/>">
						        	年登印费 (<c:out value='${patentStatusCount[(3).intValue()]["feeCount"]}' default="0"/>)
						        </a>
					        </li>
					        
					        <li>
						        <a href="<s:url value='/fee/search.html?page.currentPage=1&patentStatus=6'/>">
						        	专利权维持年费 (<c:out value='${patentStatusCount[(6).intValue()]["feeCount"]}' default="0"/>)
						        </a>
					        </li>
					      </ul>
					    </div>
					    
					   <div class="tag"  style="display:none">
					      <ul class="qxjk-ul">
					      	<li>
						        <a href="<s:url value='/fee/search.html?deadlineStatus=1&page.currentPage=1'/>">
						        	已超期(<c:out value='${deadlineMonitor["overDue"] }'/>)
						        </a>
					        </li>
					        
					        <li>
						        <a href="<s:url value='/fee/search.html?deadlineStatus=2&page.currentPage=1'/>">
						        	两周内(<c:out value='${deadlineMonitor["withinTwoWeek"] }'/>)
						        </a>
					        </li>
					        
					        <li>
						        <a href="<s:url value='/fee/search.html?deadlineStatus=3&page.currentPage=1'/>">
						        	两月内(<c:out value='${deadlineMonitor["withinTwoMonth"] }'/>)
						        </a>
					        </li>
					        
					        <li>
						        <a href="<s:url value='/fee/search.html?deadlineStatus=4&page.currentPage=1'/>">
						        	三年内(<c:out value='${deadlineMonitor["withinThreeYear"] }'/>)
						        </a>
					        </li>
					        
					        <li>
						        <a href="<s:url value='/fee/search.html?deadlineStatus=5&page.currentPage=1'/>">
						        	三年以上(<c:out value='${deadlineMonitor["outThreeYear"] }'/>)
						        </a>
					        </li>
					      </ul>
					    </div>
					     
					  </div>
					</div>
				</div>	
				<!-- menu end -->
				<div class="lt-box">
					<div class="search-box">
				  		<form action="<s:url value='/fee/search.html'/>" method="get">
							<input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
							<input type="hidden" id="deadlineStatus" name="deadlineStatus" value="0"/>
							<div class="t-third">				
					
								<table class="search-table">
									<tr>
									  <td>专利类型</td>
									  <td>交费状态</td>
									  <td>费用类型</td>
									  <td>交费截止日开始</td>
									  <td></td>
									  <td>交费截止日结束</td>
									  <td>关键字</td>
									  <td></td>
									</tr>
									<tr>
									  <td>
										  <select style="width:100px;" class="selectPointOfInterest form-control" name="patentType" >
											<option value="">全部</option>
											<option value="1">发明</option>
											<option value="2">实用新型</option>
											<option value="3">外观设计</option>
										  </select>
									  </td>
									  
									  <td>
										  <select style="width:100px;" class="selectPointOfInterest form-control" name="paymentStatus" >
											<option value="">全部</option>
											<option value="1">应交费</option>
											<option value="2">已支付</option>
											<option value="3">已交费</option>
											<option value="4">待支付</option>
											<option value="5">交费成功</option>
										  </select>
									  </td>
									  
									  <td>
										  <select style="width:100px;" class="selectPointOfInterest form-control" name="patentStatus" >
											<option value="">全部</option>
											<option value="1">申请费</option>
											<option value="3">年登印费</option>
											<option value="6">维持年费</option>
										  </select>
									  </td>
									  
									  <td>
										<input style="width:108px;" class="selectPointOfInterest form-control"  type="text" onclick="WdatePicker({el:'startAppDateId'})"  class="form-control" id="startAppDateId"  name="startDeadline" placeholder="交费截止日开始" value="" readonly="readonly" >
									  </td>
									  <td>-</td>
									  <td>
										<input style="width:108px;" class="selectPointOfInterest form-control" type="text" onclick="WdatePicker({el:'endAppDateId'})"  class="form-control" id="endAppDateId" name="endDeadline" placeholder="交费截止日结束" value="" readonly="readonly" >
									  </td>
									  <td>
										<input name="keyword" style="width:300px;display:inline;" id="keywordId" value="" placeholder="申请号/名称/申请人/案件状态" class="t-input form-control"/>
									  </td>
									  <td>
									  	<button type="submit" class="button button-caution button-rounded">查询</button>
									  </td>
									</tr>							
								</table>	  	
							</div>
				  		</form>
				  	</div>	
				</div>
				<!--search box end-->	
				<div class="lt-box">
	
					<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
					  <div class="ta-top" style="margin-left:8px;"> 
						<table class="search-table">
							<tr>
							  <td>
								<a href="javascript:return void" onclick="showOrderCreateForm()">
								<button class="button button-caution button-rounded">立即交费</button>
								</a> 
							  </td>
							  <td>
							  	<a href="javascript:return void" onclick="batchUpdateInvoiceTitles()">
								<button style="width:110px;margin-left:10px;" class="button button-action button-rounded">修改发票抬头</button>
								</a> 
							  </td>
							  <td>
								
								<button style="margin-left:10px;" class="button button-rounded button-highlight" onclick="exportFees()">表格导出</button>
								
							  </td>	
							  <td>
								<a href="javascript:return void" onclick="delectFees()">
								<button style="margin-left:10px;" class="button button-rounded button-royal">删除费用</button>
								</a>
							  </td>	
							  <td>
								<span class="span3" style="font-size:14px;margin-left:50px;">成功交费总额：￥${totalFeeCount }</span>
							  </td>	
							  <td>
								<span class="span3" style="font-size:14px;margin-left:50px;">应交费总额：￥${unpaidFeeCount }  </span>							  
							  </td>		  
							</tr> 
						</table>	
					  </div>
					  </span> 
					</div>
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
						  <th>交费截止日</th>
						  <th>交费种类</th>
						  <th>交费金额</th>
						  <th>发票抬头</th>
						  <th>交费状态</th>
						</tr>
					  </thead>
					  <tbody>
						<c:forEach items="${fees}" var="fee" varStatus="status">
						  <tr>
							<td class="center" style="text-align:center"><span class="batch-share-item">
							  <input type="checkbox" class="fee-check-item" fee="${fee.feeId}" amount="${fee.amount}" onclick="calcTotalAmount()" 
							  	paymentStatus="${fee.paymentStatus.paymentStatusId}" deadline="<fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/>">
							  </span> </td>
							<td class="center" style="text-align:center"> ${status.count + (page.currentPage-1)*page.pageSize} </td>
							<td style="text-align:center"><a href="http://so.lotut.com/index.php/fee/search?keyword=${fee.patent.appNo}" target="_black">${fee.patent.appNo}</a></td>
							<td style="text-align:center">${fee.patent.name}</td>
							<td style="text-align:center">${fee.patent.firstAppPerson}</td>
							<td style="text-align:center">${fee.patent.patentStatus.statusDescription}</td>
							<td style="text-align:center"><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
							<td style="text-align:center">${fee.feeType}</td>
							<td style="text-align:center">${fee.amount}</td>
							<td style="text-align:center"><c:choose>
								<c:when test="${fee.paymentStatus.paymentStatusId == 1}">
								  <input type="text" value="${fee.invoiceTitle}" onChange="changeInvoiceTitle('${fee.feeId}', this.value)" size="30">
								</c:when>
								<c:otherwise> ${fee.invoiceTitle} </c:otherwise>
							  </c:choose>
							</td>
							<td style="text-align:center" >
	
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
						<tr style="text-align:center">
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
						  <input type="text" id="page.pageNo" style="width:50px;height:25px" name="currentPage" onKeyDown="gotoPageForEnter(event)"/>
						  <a href="javascript:void;" onClick="javascript:gotoPage()">跳转</a> <span> 每页
						  <select onChange="setPageSize()" style="height:25px;" id="pageSizeSelect">
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
						  <select onChange="setPageSize()" style="height:25px;" id="pageSizeSelect">
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

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>


<iframe id="feeExcelFileFrame" style="display:none"></iframe>	

<script src="<s:url value='/static/datepicker/WdatePicker.js'/>"></script>

<Script language="javascript">
function GetRequest() {
  
  var url = location.search; //获取url中"?"符后的字串
   var theRequest = new Object();
   if (url.indexOf("?") != -1) {
      var str = url.substr(1);
      strs = str.split("&");
      for(var i = 0; i < strs.length; i ++) {
         theRequest[strs[i].split("=")[0]]=(strs[i].split("=")[1]);
      }
   }
   return theRequest;
}
</Script>
<Script language="javascript">

var Request = new Object();
Request = GetRequest();
var select1;
selected_type = Request['selectType'];
//alert(selected_type);
//如果存在 selected_type,循环清空选中 selected的class，并根据值选中指定的selected
if(selected_type!=undefined){
	//alert("存在selected_type");
	$("#nav li a").removeClass("selected");
	if(selected_type='4'){
		$("#nav li a").eq(3).addClass("selected");	
	}
		
}
</Script>


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
	iframe.src = "<s:url value='/fee/exportFeesAllMessage.html'/>?fees=" + fees;		
}

function batchUpdateInvoiceTitles() {
	var feeSelected = formutil.anyCheckboxItemSelected('tr td input.fee-check-item');
	
	if (!feeSelected) {
		formutil.alertMessage('请选择费用记录');
		return;
	}	
	
	var paymentStatus = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'paymentStatus');
	
	for (var i = 0; i < paymentStatus.length; i++) {
		if (paymentStatus[i] == 2 || paymentStatus[i] == 3 || paymentStatus[i] == 5) {
			formutil.alertMessage('只能修改应交费和待支付信息，请重新选择！');
			return;
		}
	}	
	
	var invoiceTitle = prompt("请输入发票抬头", "");
	if (invoiceTitle != null && invoiceTitle != "") {
		var fees = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'fee');
		
		$.ajax({
			url: "<s:url value='/fee/changeInvoiceTitle.html'/>?fees=" + fees + "&invoiceTitle=" + encodeURI(invoiceTitle), 
			type: 'get', 
			success: function(data) {
				location.reload();
			}
		});
	} 
}

function changeInvoiceTitle(fee, invoiceTitle) {
	$.ajax({
		url: "<s:url value='/fee/changeInvoiceTitle.html'/>?fees=" + fee + "&invoiceTitle=" + encodeURI(invoiceTitle), 
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
		
		var deadline = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item','deadline');
		
		var now =new Date().getTime();
		
		for(var k= 0; k < deadline.length; k++){
			//alert(checkTime(dateFormat(deadline[k],'yyyy-MM-dd HH:mm:ss'),nowDataFormat(new Date(),'yyyy-MM-dd HH:mm:ss')));
			var isOverDue=checkTime(now,deadline[k]);
			if(isOverDue){
				if(!confirm('已超出规定交费期限！,是否继续操作？')) {
					return;
				} else {
					break;
				}
					
			}
			
		}
		for (var i = 0; i < paymentStatus.length; i++) {
			if (paymentStatus[i] == 2 || paymentStatus[i] == 3 || paymentStatus[i] == 4 || paymentStatus[i] == 5) {
				formutil.alertMessage('只能选中应交费信息，请重新选择！');
				return;
			}
		}
		
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