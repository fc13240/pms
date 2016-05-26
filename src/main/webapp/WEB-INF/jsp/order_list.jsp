<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<%@ taglib uri="fn" prefix="fn" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单</title>
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
					    <li><a href="#" class="selected">支付状态</a></li>
					  </ul>
					</div>
				  
					<div id="menu_con" style="min-width:1100px;">
					<div class="tag" style="display:block;"> 
						<ul class="qxjk-ul">
							<a href="<s:url value='/order/search.html?page.currentPage=1&orderStatus=1'/>">
							<li>待支付 (<c:out value='${orderCountsByOrderStatus[(1).intValue()]["orderCount"]}' default="0"/>)</li>
							</a> 
							<a href="<s:url value='/order/search.html?page.currentPage=1&orderStatus=2'/>">
							<li>已支付 (<c:out value='${orderCountsByOrderStatus[(2).intValue()]["orderCount"]}' default="0"/>)</li>
							</a>
							<a href="<s:url value='/order/search.html?page.currentPage=1&orderStatus=4'/>">
							<li>已交局 (<c:out value='${orderCountsByOrderStatus[(4).intValue()]["orderCount"]}' default="0"/>)</li>
							</a>  
							<a href="<s:url value='/order/search.html?page.currentPage=1&orderStatus=3'/>">
							<li>交费成功 (<c:out value='${orderCountsByOrderStatus[(3).intValue()]["orderCount"]}' default="0"/>)</li>
							</a>
					     </ul>		    
					    </div>
					</div>
				  </div>				
				
				</div>
				<!-- menu end -->
				  <div class="lt-box" style="padding:20px;">
				  <form action="<s:url value='/order/search.html'/>" method="get">
				    <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
				    <div class="t-third">
				      <ul>
				        <li>
				          <p>支付状态</p>
				          <select name="orderStatus" class="selectPointOfInterest form-control">
				            <option value="">全部</option>
				            <c:forEach items="${allOrderStatus}" var="orderStatus">
				              <option value="<c:out value='${orderStatus.statusId}'/>">
				              <c:out value="${orderStatus.statusDescription}"/>
				              </option>
				            </c:forEach>
				          </select>
				        </li>
				        <li>
				          <p>订单日期开始</p>
				          <input class="form-control"  type="text" onclick="WdatePicker({el:'startAppDateId'})"  id="startAppDateId" name="startAppDate" placeholder="开始时间" value="" readonly="readonly" >
				          <img style="display:none;" onclick="WdatePicker({el:'startAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="18" align="absmiddle" id="start_date_img"> </li>
				        <li>
				          <p>订单日期截止</p>
				          <input class="form-control" type="text" onclick="WdatePicker({el:'endAppDateId'})" id="endAppDateId" name="endAppDate" placeholder="结束时间" value="" readonly="readonly" >
				          <img style="display:none;" onclick="WdatePicker({el:'endAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="22" align="absmiddle" id="end_date_img"> </li>
				        <li style="width: 385px;">
				          <p>订单号</p>
				          <input name="keyword" style="width:300px; display:inline;" id="keywordId" value="" placeholder="订单号" class="t-input form-control"/>
				          <button class="button button-caution button-rounded" type="submit">查询</button>
				        </li>
				        <div style="clear:both;"></div>
				      </ul>
				    </div>
				  </form>
				  </div>
				<!-- search end -->
				
				  <c:forEach items="${orders}" var="order">
				  	<div class="lt-box" style="padding:20px;">
				    <form action="<s:url value='/fee/exportOrderFees.html'/>" method="get" target="feeExportFrame">
				      <c:forEach items="${order.feeList}" var="fee" varStatus="status">
				        <input type="hidden" name="fees" value="${fee.feeId}">
				      </c:forEach>
				      <div style="font-weight:700;background:#f5fafe;height:40px;line-height:30px;padding-left:10px;">
						<fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
							&nbsp;&nbsp;订单号：${order.id}
						<span style="margin-left:100px;">
							<button type="submit" style="margin-top:3px;" class="button button-rounded button-highlight">导出费用清单</button>
						</span>
				      </div>
				      <table id="simple-table" class="table table-striped table-bordered table-hover">
						  <tr>
					        <td>序号</td>
					        <td>申请号/专利号</td>
					        <td>专利名称</td>
					        <td>第一申请人</td>
					        <td>案件状态</td>
					        <td>交费截止日</td>
					        <td>交费种类</td>
					        <td>交费金额</td>
					        <td>发票抬头</td>		  
						    <td rowspan="4">
						    <a href="javascript:void" onClick="window.open('<s:url value="/order/detail/"/>${order.id}.html')">订单详情</a>
						    </td>
						    <td rowspan="4">总额: ￥${order.totalAmount}</td>
						    <td rowspan="4">
								<h5>${order.orderStatus.statusDescription}</h5>
								<div style="clear:both;"></div>
								<input type="hidden" name="orderId" value="${order.id}">
								<c:if test="${order.orderStatus.statusId == 1}">
								<div style="margin-top:5px;"> <a href="javascript:void" onClick="window.open('<s:url value="/alipay/index.html?orderId="/>${order.id}')">
								<input type="button"  style="width:95px;" class="t-btn5" value="支付宝支付">
								</a> </div>
								</c:if>
								<c:if test="${order.orderStatus.statusId == 1}">
								<div style="margin-top:10px;"> <a>
								<button type="button" style="width:90px;" class="t-btn6" onclick="deleteOrder('${order.id}')">取消订单</button>
								</a> </div>
								</c:if>		    
						    </td>
						  </tr>
				     
				<style>
				.lt_tr_hiden{display:none;}
				</style>     
				                
							<c:forEach items="${order.feeList}" var="fee" varStatus="status">
				
				           
							<c:choose>
							<c:when test="${status.count<=2}">
							<tr>
							  <td class="center">${status.count}</td>
							                <td>
							                
							
							<a href="http://so.lotut.com/index.php/fee/search?keyword=${fee.patent.appNo}" target="_black">${fee.patent.appNo}</a>
							</td>
							<td>${fee.patent.name}</td>
							<td>${fee.patent.firstAppPerson}</td>
							<td>${fee.patent.patentStatus.statusDescription}</td>
							<td><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
							<td>${fee.feeType}</td>
							<td>${fee.amount} </td>
							<td>${fee.invoiceTitle}</td>
							</tr>
							</c:when>
							<c:when test="${status.count>2}"> 
							
							<tr class="lt_tr_hiden">
								<td class="center">${status.count}</td>
								<td>
								<a href="http://so.lotut.com/index.php/fee/search?keyword=${fee.patent.appNo}" target="_black">${fee.patent.appNo}</a>
								</td>
								<td>${fee.patent.name}</td>
								<td>${fee.patent.firstAppPerson}</td>
								<td>${fee.patent.patentStatus.statusDescription}</td>
								<td><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
								<td>${fee.feeType}</td>
								<td>${fee.amount} </td>
								<td>${fee.invoiceTitle}</td>
							</tr>
							</c:when>						
							</c:choose>                  	
							</c:forEach>
							<c:if test="${fn:length(order.feeList)>2}">
							<tr>
								<td colspan="9" >
								
								<button class="lt_more" type="button" style="width:90px;" class="t-btn6" >更多/收起</button>
								</td>
							</tr> 
							</c:if>
				
				
				      
				      
				      </table>
				      
				
				    </form>
				    </div>
				  </c:forEach>
				
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
				        <input type="text" id="page.pageNo" style="width:50px;height:15px" name="currentPage" onKeyDown="gotoPageForEnter(event)"/>
				        <a href="javascript:void;" onClick="javascript:gotoPage()">跳转</a> </div>
				    </c:if>
				    <c:if test="${searchCondition != null}">
				      <div class="col-lg-12"> 共 ${page.totalPages}页${page.totalRecords}条记录    第${page.currentPage} 页 <a href="?page.currentPage=1&${searchCondition}">首页</a>
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
				        <a href="javascript:void;" onClick="javascript:gotoPage()">跳转</a> </div>
				    </c:if>
				  </div>
				
				
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

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
	
	$(".lt_more").click(function(){
		$(this).closest("tbody").find('.lt_tr_hiden').toggle();

	})
	

	
</script>

<script type="text/javascript">
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
			var url = "<s:url value='/order/list.html'/>?currentPage=" + pageNo;
			
			<c:if test="${searchCondition != null}">
					url = "<s:url value='/order/search.html'/>?page.currentPage=" + pageNo +"&"+"${searchCondition}";
			</c:if>
			
			location.href = url
		}
		
		function gotoPageForEnter(event) {
			var e = event ? event : window.event;
					
			if(event.keyCode == 13) {
				gotoPage();
			}
		}
</script>
<script type="text/javascript">
	$(function() {
		formutil.setElementValue("#pageSizeSelect", ${page.pageSize});
		var forms = $("form");
		if (!/msie/i.test(navigator.userAgent)) {
			forms.attr('target', "exportFeeFrame");
		} 
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
	
	function deleteOrder(orderId) {
		$.ajax({
			url: "<s:url value='/order/delete.html'/>?orderId="+ orderId,
			type: 'get', 
			success: function() {
				location.reload();
			}
		});		
	}
</script>
</body>
</html>