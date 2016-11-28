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
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<title>龙图腾专利管家-购买记录</title>
<%@ include file="_css.jsp" %>

</head>
<body>
<%@ include file="_top.jsp" %>
<div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_brand.jsp" %>
		  </div>
	<div class="tit_top">
        <div class="title2">
           购买记录</div>
               
    </div>
		<div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right" style="padding:10px 0 0 3px;" >
				    <div class="cl top1" style="height:10px;">
				    
					  <%-- <form class="form-inline" action="<s:url value='/brand/searchUserBrands.html'/>" method="get">
						  <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1" required/>
						  <div class="t-third">

						  <table class="search-table">
							  <tr>
							  <td>商标类别</td>
							  <td>关键字</td>
							  <td></td>
							  </tr>
							  <tr>
							  <td>
								<select  style="width:110px;" class="selectPointOfInterest form-control" name="categoryId">
								  <option value="">全部</option>
								  <c:forEach items="${categorys }" var="category">
								  	<option value="${category.categoryId }" <c:if test="${category.categoryId==searchCondition.categoryId }">selected="selected"</c:if>>${category.categoryName }</option>
								  </c:forEach>
								</select>
							  </td>
							  <td>
								<input style="width:300px;height:34px;" name="keyword" id="keywordId"  placeholder="商标名称/注册号" class="t-input form-control" value="${searchCondition.keyword }"/>							  
							  </td>
							  <td>
							  <button class="button button-caution button-rounded" type="submit" style="width:80px;">查询</button>
							  </td>
							  </tr>							  
						  </table>
						  </div>
						</form> --%>

    			</div>
				<div style="height:10px;"></div>
					<div class="lt-box" style="padding:50px 0 0 0;">
						<table id="simple-table" class="table table-striped table-bordered table-hover">
						  <thead>
							<tr class="simple_bag">
							  <th class="center" width="20px">序号</th>
							  <th width="">微信昵称</th>
							  <th width="">订单号</th>
							  <th width="">商标注册号</th>
							  <th width="">商标名称</th>
							  <th width="">总金额</th>
							  <th width="170px">支付时间</th>
							</tr>
						  </thead>
						  <tbody>
						  	<c:forEach items="${weChatOrders}" var="weChatOrder" varStatus="status">
								<tr>
									<td class="center" style="text-align:center"> ${status.count + (page.currentPage-1)*page.pageSize} </td>
									<td style="text-align: center">${weChatOrder.wechatName }</td>
									<td style="text-align: center">${weChatOrder.wechatOrderId }</td>
									<td style="text-align: center">${weChatOrder.brand.brandNo }</td>
									<td style="text-align: center">${weChatOrder.brand.name }</td>
									<td style="text-align: center">${weChatOrder.totalFee }</td>
									<td style="text-align: center"><fmt:formatDate value="${weChatOrder.payTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								</tr>
							</c:forEach>
						  </tbody>
						</table>
						</div>
						
						
						<!-- 分页功能 start -->
			        <div style="height:30px;background:#fff;">
			        	<div id="holdCurrentPage" style="display:none;">
			        		<input id="hold" value="${page.currentPage}"/>
			        	</div>
			          <c:if test="${searchCondition == null}">
			            <div class="col-lg-12"> 共 ${page.totalPages}页${page.totalRecords}条记录    第${page.currentPage} 页 <a href="?currentPage=1">首页</a>
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
			              <!-- 分页功能 End -->
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
					</div>
				</div>
				

<script type="text/javascript">
function gotoPage() {
	var pageNo = document.getElementById("page.pageNo").value;
	
	if (isNaN(pageNo)) {
		alert("请输入数值");
		return;
	}
	
	if(pageNo==""){
		alert("请输入数值")
		return;
	}
	
	pageNo = parseInt(pageNo);
	
	if (pageNo < 1 || pageNo > parseInt("${page.totalPages}")) {
		alert("只能输入1-${page.totalPages}之间的数值");
		return;
	}
	
	var url = "<s:url value='/brand/getWechatOrderList.html'/>?currentPage=" + pageNo;
	
	<c:if test="${searchCondition != null}">
		url = "<s:url value='/brand/searchUserBrands.html'/>?page.currentPage=" + pageNo +"&"+"${searchCondition}";
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