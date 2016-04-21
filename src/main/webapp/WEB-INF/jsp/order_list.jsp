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
 		<!-- 搜索开始 -->
 			<!-- 搜索功能 -->
		<div class="search-header" style="margin:0 auto;width:610px;">
                <form action="<s:url value='/order/search.html'/>" method="get">
                    <div class="widget-box collapsed" style="border:none;">
                        <div class="widget-header" style="background:none;padding:0px;border:none; margin-top:30px;">
                
                            <span class="widget-toolbar" style="border:none;padding:0px;">
                            <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
                            <input type="text" style="height:45px;width:450px;" name="keyword" id="keywordId" placeholder="订单号"/>
                            	<button class="btn btn-info" type="submit" style="height:45px;">搜索</button>
                            
                                <a href="#" data-action="collapse" style="margin-left:10px;">
                                    <button type="button" class="btn btn-sm btn-success">高级搜索</button>
                                    <i class="ace-icon fa fa-chevron-up" style="display:none;"></i>
                                </a>
                            </span>
                        </div>
                        <div class="widget-body" style="display: none;border-left:1px solid #CCC;border-right:1px solid #CCC;border-bottom:1px solid #CCC;boder-top:none;width:512px;margin-left:5px;">
                        	
	                            <div class="widget-main">
	                                <div style="margin-top:10px;">支付状态
	                                <select name="orderStatus" id="orderStatusId">
	                                    <option value="">全部</option>
									  	<c:forEach items="${allOrderStatus}" var="orderStatus">
											<option value="<c:out value='${orderStatus.orderStatusId}'/>"><c:out value="${orderStatus.statusDescription}"/></option>
										</c:forEach>
	                                </select>	
	                                </div>
	                                <div style="margin-top:10px;">
	                                    <div class="input-group">
	                                    <div style="float:left;line-height: 32px;">查询日期</div>
						                <div style="float:left;margin-left: 16px;" class="form-group" style="margin-left:15px;">
							                <div style="float:left;"><input  type="text" class="form-control" id="startAppDateId" name="startAppDate" placeholder="开始时间" value="" readonly="readonly" onclick="javascript:$('#start_date_img').click()"></div> 
											<div style="float:left;margin: 8px;"><img onclick="WdatePicker({el:'startAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="22" align="absmiddle" id="start_date_img"> - </div>
							                </div>	
						                
						                <div style="float:left;" class="form-group">
							                <div style="float:left;"><input type="text" class="form-control" id="endAppDateId" name="endAppDate" placeholder="结束时间" value="" readonly="readonly" onclick="javascript:$('#end_date_img').click()"> </div> 
											<div style="float:left;margin: 8px;"><img onclick="WdatePicker({el:'endAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="22" align="absmiddle" id="end_date_img"></div>
				 							</div>
			 							<div style="clear:both;"></div>	
						                <style>
							             /*.simple_bag th{background:#f5fafe;}*/
							                .ui-jqgrid-view {margin-top: 30px;}
							                #grid-table_cb{border-left: 1px solid #E1E1E1;}
							                </style>			
	                                    </div>
	                                </div>
	                                <div style="width:60px;margin:0 auto;">
	                                <span class="input-group-btn">
										<button type="submit" class="btn btn-purple btn-sm">搜索</button>
									</span>
	                                </div>
	                            </div>
                        </div>
                    </div>
                </div>
 		<!-- 搜索结束 -->
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
                    	<td>
                    		${order.postAddress.receiver}
                    		<div><a href="javascript:void" onclick="window.open('<s:url value="/order/detail/"/>${order.id}.html')">订单详情</a></div>
                    	</td>
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
                    		<c:if test="${order.orderStatus.statusId == 1}">
                    			<div>
	                    			<a href="<s:url value='/order/delete.html'/>?orderId=<c:out value='${order.id}'/>">
	           						<button type="button" class="btn btn-purple btn-sm">取消订单</button>
	           						</a>
           						</div>
                    		</c:if>
                    	</td>
                    </tr>								
                   </tbody>
                  </table> 					
			</c:forEach> 						
          </div>
          		<!-- 分页功能 start -->
				<div class="row">
					<c:if test="${searchCondition == null}">
							<div class="col-lg-12">	
										共 ${page.totalPages} 页${page.totalRecords}条记录    第${page.currentPage} 页
										<a href="?currentPage=1">首页</a>
									<c:choose>
										<c:when test="${page.currentPage - 1 > 0}">
											<a href="?currentPage=${page.currentPage - 1}">上一页</a>
										</c:when>
										<c:when test="${page.currentPage - 1 <= 0}">
											<a href="?currentPage=1">上一页</a>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${page.totalPages==0}">
											<a href="?currentPage=${page.currentPage}">下一页</a>
										</c:when>
										<c:when test="${page.currentPage + 1 < page.totalPages}">
											<a href="?currentPage=${page.currentPage+1}">下一页</a>
										</c:when>
										<c:when test="${page.currentPage + 1 >= page.totalPages}">
											<a href="?currentPage=${page.totalPages}">下一页</a>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${page.totalPages==0}">
											<a href="?currentPage=${page.currentPage}">尾页</a>
										</c:when>
										<c:otherwise>
											<a href="?currentPage=${page.totalPages}">尾页</a>
										</c:otherwise>
									</c:choose>
							<input type="text" id="page.pageNo" style="width:50px;height:25px" name="currentPage" onkeydown="gotoPageForEnter(event)"/>
								<a href="javascript:void;" onclick="javascript:gotoPage()">跳转</a>
							</div>
						</c:if>
						<c:if test="${searchCondition != null}">
									<div class="col-lg-12">	
												共 ${page.totalPages}页${page.totalRecords}条记录    第${page.currentPage} 页
												<a href="?page.currentPage=1&${searchCondition}">首页</a>
											<c:choose>
												<c:when test="${page.currentPage - 1 > 0}">
													<a href="?page.currentPage=${page.currentPage - 1}&${searchCondition}">上一页</a>
												</c:when>
												<c:when test="${page.currentPage - 1 <= 0}">
													<a href="?page.currentPage=1&${searchCondition}">上一页</a>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${page.totalPages==0}">
													<a href="?page.currentPage=${page.currentPage}&${searchCondition}">下一页</a>
												</c:when>
												<c:when test="${page.currentPage + 1 < page.totalPages}">
													<a href="?page.currentPage=${page.currentPage+1}&${searchCondition}">下一页</a>
												</c:when>
												<c:when test="${page.currentPage + 1 >= page.totalPages}">
													<a href="?page.currentPage=${page.totalPages}&${searchCondition}">下一页</a>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${page.totalPages==0}">
													<a href="?page.currentPage=${page.currentPage}&${searchCondition}">尾页</a>
												</c:when>
												<c:otherwise>
													<a href="?page.currentPage=${page.totalPages}&${searchCondition}">尾页</a>
												</c:otherwise>
											</c:choose>
								 	<!-- 分页功能 End -->
								
									<input type="text" id="page.pageNo" style="width:50px;height:25px" name="page.currentPage" onkeydown="gotoPageForEnter(event)"/>
										<a href="javascript:void;" onclick="javascript:gotoPage()">跳转</a>
									</div>	
						</c:if>
				</div>
				
        </div>
		<%@ include file="_footer.jsp"%>
    </div>
  </div>
</div>
<%@ include file="_js.jsp"%>
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
</body>
</html>
