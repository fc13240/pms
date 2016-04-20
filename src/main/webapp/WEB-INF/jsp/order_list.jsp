<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<title>控制台</title>
<%@ include file="_css.jsp" %>

</head>
<body class="no-skin">

<%@ include file="_nav.jsp"%>

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">

  <!-- sidebar -->
	<%@ include file="_main_menu.jsp"%>
  <!-- sidebar -->
  <div class="main-content">
    <div class="main-content-inner">
      <!-- #section:basics/content.breadcrumbs -->
      <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
          <li> <i class="ace-icon fa fa-home home-icon"></i> <a href="#">主页</a> </li>
          <li> <a href="#">订单</a> </li>
        </ul>
      </div>
      <div class="page-content">
 
        <div class="row">
          <div class="col-xs-12">
			<c:forEach items="${orders}" var="order">
                 <table id="simple-table" class="table table-striped table-bordered table-hover">
                    <thead>
                      <tr class="simple_bag">
                      	<th colspan="4">
                      		<fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/>&nbsp;&nbsp;
                      		订单号：${order.id}
                      	</th>
                      </tr>
                    </thead>
                    <tbody>
                    
                    <tr>
                    	<td>
			                 <table id="simple-table-fee" class="table table-striped table-bordered table-hover">
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
			                  </table> 	                    	
                    	</td>
                    	<td>${order.postAddress.receiver}</td>
                    	<td>总额: ￥${order.amount}</td>
                    	<td>
                    		${order.orderStatus.statusDescription}
                    		<c:if test="${order.orderStatus.statusId == 1}">
                    			<div>
                    				<a href="javascript:void" onclick="window.open('<s:url value="/alipay/index.html?orderId="/>${order.id}')">支付宝支付</a>
                    			</div>
                    			<div>
                    			</div>                    			
                    		</c:if>
                    	</td>
                    </tr>								
                   </tbody>
                  </table> 					
			</c:forEach> 						
          </div>
        </div>
		<%@ include file="_footer.jsp"%>
    </div>
  </div>
</div>
<%@ include file="_js.jsp"%>
</body>
</html>
