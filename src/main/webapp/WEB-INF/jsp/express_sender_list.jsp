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
			<div class="lt-right" style="padding:20px 0 0 3px;">
				
				 <div class="cl top1" style="height:10px;">
				    
					  <form class="form-inline" action="<s:url value='/express/searchSenderExpress.html'/>" method="get">
					  <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
					    <div class="form-group">
					    <input style="width:450px;height:34px;float:left;margin:0 5px 0 0 ;" name="keyword" id="keywordId" value="<c:out value='${param.keyword}'/>" placeholder="快递状态/快递方式 /快递内容" class="t-input form-control"/>	
					    
					     <button class="button button-caution button-rounded" type="submit" style="width:100px;">查询</button>
					    </div>
					  </form>

    			</div>
    			<div class="col-xs-offset-1 col-xs-11">
			
				</div>
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding:30px 0 0 0;">
					
					<table id="simple-table" class="table table-striped table-bordered table-hover" width="100%">
					  <thead>
						<tr class="simple_bag">
						  <th class="center" width="45px">
						  	<%-- <label class="pos-rel">
								<input type="checkbox" class="patent-check-item" id="checkall"  name="checkall" />
								<span class="lbl"></span> 
							  </label> --%>
						  	序号
						  </th>
						  <th width="80px">寄件人</th>
						  <th width="80px">收件人</th>
						  <th>快递地址</th>
						  <th>快递方式</th>
						  <th width="100px">快递时间</th>
						  <th>联系方式</th>
						  <th>快递内容</th>
						  <th>快递状态</th>
						  <th>操作</th>
						</tr>
					  </thead>
					  <c:forEach items="${express}" var="express" varStatus="status">
						<tr>
						  <td class="center" style="text-align:center">
							  <%-- <label class="pos-rel"> <span class="batch-share-item">
								  <input type="checkbox" class="patent-check-item" express="<c:out value='${express.expressId}'/>">
								  <span class="lbl"></span>
							  </label> --%>
						  ${status.count + (page.currentPage-1)*page.pageSize}
						  </td>
						  <td class="center" style="text-align:center">${express.sender.username}</td>
						  <td class="center" style="text-align:center">${express.receiver.username}</td>
						  <td class="center" style="text-align:center">${express.contactAddress.provinceName} ${express.contactAddress.cityName} ${express.contactAddress.districtName}
						  ${express.contactAddress.detailAddress}
						  </td>
						  <td class="center" style="text-align:center">${express.expressCompany}</td>
						  <td class="center" style="text-align:center"><fmt:formatDate value="${express.sendTime}" pattern="yyyy-MM-dd"/></td>
						  <td class="center" style="text-align:center">${express.contactPerson}&nbsp;${express.phone}</td>
						  <td class="center" style="text-align:center">${express.expressRemark}</td>
						  <td class="center" style="text-align:center">${express.expressStatus.expressStatusDesc}</td>
						  <td class="center" style="text-align:center">
							  <c:if test="${express.expressStatus.expressStatusId == 1||express.expressStatus.expressStatusId == 2}">
							  		<a href="<s:url value='/express/updatExpressFrom.html'/>?expressId=<c:out value='${express.expressId}'/>"  target="_blank"> 编辑 </a>
							  		<a href="javascript:return void" onclick="changeExpressStatus(${express.expressId},2)"> 置为已寄出 </a>
							  </c:if>
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
	
	var url = "<s:url value='/express/getUserSenderExpressList.html'/>?currentPage=" + pageNo;
	
	
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

function changeExpressStatus(id,status){
	$.ajax({
		url: "<s:url value='/express/changeExpressStatus.html'/>",
		data:{"expressId" : id ,"expressStatus": status},
		type: 'post', 
		success: function() {
			 location.reload();
		}
	});	
}
</script>

</body>
</html>