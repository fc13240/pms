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
<title>龙图腾专利管家——我寄出的快递</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_express.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding:20px;">
					
					<table id="simple-table" class="table table-striped table-bordered table-hover">
					  <thead>
						<tr class="simple_bag">
						  <th class="center" width="60">
						  	<label class="pos-rel">
								<input type="checkbox" class="patent-check-item" id="checkall"  name="checkall" />
								<span class="lbl"></span> 
							  </label>
						  	序号
						  </th>
						  <th>寄件人</th>
						  <th>收件人</th>
						  <th>快递地址</th>
						  <th>快递方式</th>
						  <th>快递时间</th>
						  <th>联系电话</th>
						  <th>快递内容</th>
						  <th>快递状态</th>
						  <th>操作</th>
						</tr>
					  </thead>
					  <c:forEach items="${express}" var="express" varStatus="status">
						<tr>
						  <td class="center" style="text-align:center">
							  <label class="pos-rel"> <span class="batch-share-item">
								  <input type="checkbox" class="patent-check-item" express="<c:out value='${express.expressId}'/>">
								  <span class="lbl"></span>
							  </label>
						  ${status.count}
						  </td>
						  <td class="center" style="text-align:center">${express.sender.username}</td>
						  <td class="center" style="text-align:center">${express.sender.receiver}</td>
						  <td class="center" style="text-align:center">${express.contactAddress.provinceName} ${express.contactAddress.cityName} ${express.contactAddress.districtName}
						  ${express.contactAddress.detailAddress}
						  </td>
						  <td class="center" style="text-align:center">${express.expressCompany}${express.expressNo}</td>
						  <td class="center" style="text-align:center">"<fmt:formatDate value="${express.sendTime}" pattern="yyyy-MM-dd"/>"</td>
						  <td class="center" style="text-align:center"></td>
						  <td class="center" style="text-align:center">${express.expressRemark}</td>
						  <td class="center" style="text-align:center">${express.expressStatus.expressStatusDesc}</td>
						  <td class="center" style="text-align:center">
						  	<a href="<s:url value='/user/updateUserContactAddressesFrom.html'/>?id=<c:out value=''/>"> 修改 </a>
						  </td>
						</tr>
					  </c:forEach>
					</table>
						 <!-- 分页功能 start -->
			        <div style="height:30px;background:#fff;">	
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
			        </div>
			        <!-- 分页功能 End -->
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>



<script type="text/javascript">
$(function(){
	formutil.clickAllCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
	formutil.clickItemCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
});

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
	
	var url = "<s:url value='/express/express_sender_list.html'/>?currentPage=" + pageNo;
	
	
	location.href = url
	
}

function gotoPageForEnter(event) {
	var e = event ? event : window.event;
			
	if(event.keyCode == 13) {
		gotoPage();
	}
}

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