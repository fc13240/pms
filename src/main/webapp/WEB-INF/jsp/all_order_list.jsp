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
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav_fee.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">订单</span>
	</div>
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
		        <a href="<s:url value='/order/adminSearch.html?page.currentPage=1&orderStatus=2'/>">
		        <li>已支付 (<c:out value='${orderCountsByOrderStatus[(2).intValue()]["orderCount"]}' default="0"/>)</li>
		        </a>
		        <a href="<s:url value='/order/adminSearch.html?page.currentPage=1&orderStatus=4'/>">
		        <li>已交局 (<c:out value='${orderCountsByOrderStatus[(4).intValue()]["orderCount"]}' default="0"/>)</li>
		        </a>  
		        <a href="<s:url value='/order/adminSearch.html?page.currentPage=1&orderStatus=3'/>">
		        <li>缴费成功 (<c:out value='${orderCountsByOrderStatus[(3).intValue()]["orderCount"]}' default="0"/>)</li>
		        </a>
	
		      </ul>		    
		     </div>
	 </div>
 	</div>
<div class="lt-box">
  <form action="<s:url value='/order/adminSearch.html'/>" method="get">
    <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
    <div class="t-third">
      <ul>
        <li>
          <p>支付状态</p>
          <select name="orderStatus" id="orderStatusId">
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
          <input  type="text" onclick="WdatePicker({el:'startAppDateId'})" style="height:18px;" id="startAppDateId" name="startAppDate" placeholder="开始时间" value="" readonly="readonly" >
          <img onclick="WdatePicker({el:'startAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="18" align="absmiddle" id="start_date_img"> - </li>
        <li>
          <p>订单日期截止</p>
          <input type="text" onclick="WdatePicker({el:'endAppDateId'})" style="height:18px;" id="endAppDateId" name="endAppDate" placeholder="结束时间" value="" readonly="readonly" >
          <img onclick="WdatePicker({el:'endAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="22" align="absmiddle" id="end_date_img"> </li>
        <li style="width: 385px;">
          <p>订单号</p>
          <input name="keyword" id="keywordId" value="" placeholder="订单号" class="t-input"/>
          <button type="submit">查询</button>
        </li>
      </ul>
    </div>
  </form>
  </div>
  
  <!-- 搜索结束 -->
		<c:forEach items="${orders}" var="order">

		<form action="<s:url value='/fee/exportFees.html'/>" method="get" target="feeExportFrame">
   		 <c:forEach items="${order.feeList}" var="fee" varStatus="status">
      		<input type="hidden" name="fees" value="${fee.feeId}">
    	 </c:forEach>
		  <table id="simple-table" class="table table-striped table-bordered table-hover">
			<thead>
			  <tr class="simple_bag">
				<th colspan="5"> <fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
				  &nbsp;&nbsp;&nbsp;
				  订单号：${order.id}
				 <span style="margin-left:100px;">
              		<input type="submit" value="导出费用清单">
              	</span>
              	
				  <c:if test="${order.orderStatus.statusId == 2}">
					<div> <a href="<s:url value='/order/setUserOrderToPaid.html'/>?orderId=<c:out value='${order.id}'/>">
					  <button type="button" class="btn btn-purple btn-sm">置为已缴费</button>
					  </a> </div>
				  </c:if>              	

				  <c:if test="${order.orderStatus.statusId == 4}">
					<div> <a href="<s:url value='/order/setUserOrderToPaidSuccess.html'/>?orderId=<c:out value='${order.id}'/>">
					  <button type="button" class="btn btn-purple btn-sm">缴费成功</button>
					  </a> </div>
				  </c:if>        				                	
              	
				</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
				<td><table id="simple-table-fee" class="table table-striped table-bordered table-hover">
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
						<th>缴费状态</th>
						<th>发票抬头</th>
					  </tr>
					</thead>
					<tbody>
					
					  <c:forEach items="${order.feeList}" var="fee" varStatus="status">
					  
						<c:choose>
							<c:when test="${status.count<=2}">
							<tr>
							  <td class="center">${status.count}</td>
							  <td><a href="http://so.lotut.com/index.php/fee/search?keyword=${fee.patent.appNo}" target="_black">${fee.patent.appNo}</a></td>
							  <td>${fee.patent.name}</td>
							  <td>${fee.patent.firstAppPerson}</td>
							  <td>${fee.patent.patentStatus.statusDescription}</td>
							  <td><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
							  <td>${fee.feeType}</td>
							  <td>${fee.amount} </td>
							  <td>${fee.paymentStatus.payementStatusDescription} </td>
							  <td>${fee.invoiceTitle}</td>
							</tr>
							</c:when>
							<c:when test="${status.count>2}"> 
	   
								
							<tr class="lt_tr_hiden">
							  <td class="center">${status.count}</td>
							  <td><a href="http://so.lotut.com/index.php/fee/search?keyword=${fee.patent.appNo}" target="_black">${fee.patent.appNo}</a></td>
							  <td>${fee.patent.name}</td>
							  <td>${fee.patent.firstAppPerson}</td>
							  <td>${fee.patent.patentStatus.statusDescription}</td>
							  <td><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
							  <td>${fee.feeType}</td>
							  <td>${fee.amount} </td>
							  <td>${fee.paymentStatus.payementStatusDescription} </td>
							  <td>${fee.invoiceTitle}</td>
							</tr>
							</c:when>						
						</c:choose> 		  
					  </c:forEach>
							<c:if test="${fn:length(order.feeList)>2}">
							<!-- 	${fn:length(order.feeList)} --> 
							<tr>
							<td colspan="9" >
							
							<button class="lt_more" type="button" style="width:90px;" class="t-btn6" >更多/收起</button>
							</td>
							</tr> 
							</c:if>					  
					</tbody>
				  </table></td>
				<td>${order.owner.username} </td>
				<td><div><a href="javascript:void" onclick="window.open('<s:url value="/order/detail/"/>${order.id}.html')">编辑订单</a></div></td>
				<td>总额: ￥${order.totalAmount}</td>
				<td> ${order.orderStatus.statusDescription}
				

				</td>
			  </tr>
			</tbody>
		  </table>
		  </form>

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
			  <input type="text" id="page.pageNo" style="width:50px;height:25px" name="currentPage" onkeydown="gotoPageForEnter(event)"/>
			  <a href="javascript:void;" onclick="javascript:gotoPage()">跳转</a> </div>
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
			  <input type="text" id="page.pageNo" style="width:50px;height:25px" name="page.currentPage" onkeydown="gotoPageForEnter(event)"/>
			  <a href="javascript:void;" onclick="javascript:gotoPage()">跳转</a> </div>
		  </c:if>
		</div>
	</div>		

<!--list end  -->

</div>
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
			url = "<s:url value='/order/adminSearch.html'/>?page.currentPage=" + pageNo +"&"+"${searchCondition}";
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
</body>
</html>
