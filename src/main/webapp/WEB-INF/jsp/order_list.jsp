<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
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
	
	<form action="<s:url value='/order/search.html'/>" method="get">
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
	<!-- 搜索结束 -->
	<div class="t-third" style="margin-top:15px;">
	  <div class="row">
	    <div class="col-xs-12">
	      <c:forEach items="${orders}" var="order">
	        <form action="<s:url value='/fee/exportFees.html'/>" method="get" target="feeExportFrame">
	          <c:forEach items="${order.feeList}" var="fee" varStatus="status">
	            <input type="hidden" name="fees" value="${fee.feeId}">
	          </c:forEach>
	          <table id="simple-table" class="table table-striped table-bordered table-hover">
	            <thead>
	              <tr class="simple_bag">
	                <th colspan="4"> <fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
	                  &nbsp;&nbsp;
	                  订单号：${order.id}<span style="margin-left:100px;">
	                  <input type="submit" value="导出费用清单">
	                  </span> </th>
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
	                        <th>发票抬头</th>
	                      </tr>
	                    </thead>
	                    <tbody>
	                      <c:forEach items="${order.feeList}" var="fee" varStatus="status">
	                        <tr>
	                          <td class="center">${status.count}</td>
	                          <td>${fee.patent.appNo}</td>
	                          <td>${fee.patent.name}</td>
	                          <td>${fee.patent.firstAppPerson}</td>
	                          <td>${fee.patent.patentStatus.statusDescription}</td>
	                          <td><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
	                          <td>${fee.feeType}</td>
	                          <td>${fee.amount} </td>
	                          <td>${fee.invoiceTitle}</td>
	                        </tr>
	                      </c:forEach>
	                    </tbody>
	                  </table></td>
	                <td> ${order.postAddress.receiver}
	                  <div><a href="javascript:void" onClick="window.open('<s:url value="/order/detail/"/>${order.id}.html')">订单详情</a></div></td>
	                <td>总额: ￥${order.amount}</td>
	                <td width="100px;"> ${order.orderStatus.statusDescription}
	                  <div style="clear:both;"></div>
	                  <c:if test="${order.orderStatus.statusId == 1}">
	                    <div> <a href="javascript:void" onClick="window.open('<s:url value="/alipay/index.html?orderId="/>${order.id}')">
	                      <button style="width:95px;" class="t-btn5">支付宝支付</button>
	                      </a> </div>
	                    <br>
	                  </c:if>
	                  <c:if test="${order.orderStatus.statusId == 1}">
	                    <div style="margin-top:40px;"> <a href="<s:url value='/order/delete.html'/>?orderId=<c:out value='${order.id}'/>">
	                      <button style="width:90px;" class="t-btn6">取消订单</button>
	                      </a> </div>
	                  </c:if>
	                </td>
	              </tr>
	            </tbody>
	          </table>
	        </form>
	      </c:forEach>
	    </div>
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
	          <input type="text" id="page.pageNo" style="width:50px;height:25px" name="page.currentPage" onKeyDown="gotoPageForEnter(event)"/>
	          <a href="javascript:void;" onClick="javascript:gotoPage()">跳转</a> </div>
	      </c:if>
	    </div>
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
</script>
</body>
</html>