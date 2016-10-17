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
<title>龙图腾专利管家-申请人列表</title>
<%@ include file="_css.jsp" %>

</head>
<body>
<%@ include file="_top.jsp" %>
<div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_fee_reduce_transaction.jsp" %>
		  </div>
	<div class="tit_top">
        <div class="title2">
           费减方案列表</div>
               
    </div>
		<div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right" style="padding:10px 0 0 3px;" >
				    <div class="cl top1" style="height:10px;">
				    
					  <form class="form-inline" action="<s:url value='/appPerson/searchFeeReduceAppPerson.html'/>" method="get">
					  <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
					    <div class="form-group">
					    <input style="width:450px;height:34px;float:left;margin:0 5px 0 0 ;" name="keyword" id="keywordId" value="" placeholder="姓名/证件号码/邮编地址/费减备案状态/备案证件号/备案年度" class="t-input form-control"/>	
					    
					     <button class="button button-caution button-rounded" type="submit" style="width:120px;">搜索费减备案</button>
					    </div>
					  </form>

    			</div>
				<div style="height:10px;"></div>
					<div class="lt-box" style="padding:30px 0 0 0;">
							<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
						  <div class="ta-top" style="margin-left:8px;"> 
						  	<table class="search-table">
					  			<tr>
					  				<td>
									  	<button type="button" style="width: 100px;" class="button button-rounded button-primary" onclick="javascript:addAppPerson()">新增申请人</button>
										</a>
					  				</td>
					  				<td>
										<a href="javascript:return void" onclick="batchShareAppPerson()" >
								<button style="width:100px;margin-left:10px;" class="button button-primary  button-rounded" data-toggle="tooltip" data-placement="bottom" title="可以把申请人批量分享给好友哦！">批量分享</button>
										</a> 
					  				</td>					  				
					  				<td>
									  	<button type="button" style="width:130px;margin-left:10px;" class="button button-rounded button-primary" onclick="downloadProxyTemplate()">下载委托书模板</button>
										</a> 
									</td>	
					  			</tr>
					  		</table>		
						  </div>
						  </span> </div>
						<table id="simple-table" class="table table-striped table-bordered table-hover">
						  <thead>
							<tr class="simple_bag">
							  <th class="center"> <label class="pos-rel">
								<input style="width:30px;" type="checkbox" class="check-item">
								<span class="lbl"></span> </label>
							  </th>
							  <th class="center" width="40px">序号</th>
							  <th >姓名或名称</th>
							  <th>证件号码 </th>
							  <th>邮编及地址</th>
							  <th>费减备案状态</th>
							  <th>备案证件号</th>
							  <th>备案年度</th>
							  <th >委托书</th>
							  <th>手机号</th>
							  <th width="100px">纳税额</th>
							  <th width="100px">共享人</th>
							  <!-- 							<th>预览</th> 
							  <th>下载</th>-->
							  <th width="110px">操作</th>
							</tr>
						  </thead>
						  <tbody>
							<c:forEach items="${appPersons}" var="appPerson" varStatus="status">
							  <tr>
								<td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">
								<input type="checkbox" class="check-item" appPerson="<c:out value='${appPerson.appPersonId}'/>">
								<span class="lbl"></span></label>
								</td>
								<td class="center" style="text-align:center"> ${status.count+ (page.currentPage-1)*page.pageSize} </td>
								<td style="text-align:center"><c:out value="${appPerson.name}"/></td>
								<td style="text-align:center"><c:out value="${appPerson.idNumber}"/></td>
								<td style="text-align:center" class="hidden-480" ><c:out value="${appPerson.postcodeAddress}"/></td>
								<td style="text-align:center"><c:out value="${appPerson.feeReduceTransactionStatus}"/></td>
								<td	style="text-align:center"><c:out value="${appPerson.transactionIdentityId}"/></td>
								<td style="text-align:center"><c:out value="${appPerson.transactionYear}"/></td>
								<td style="text-align:center">
									<a  href="<s:url value='/appPerson/showProxyUploadForm.html'/>?appPersonId=<c:out value='${appPerson.appPersonId}'/>">上传</a>
									<c:if test="${not empty appPerson.proxyUrl}">
                    				<a href="<s:url value='/appPerson/downloadProxyFile.html'/>?appPersonId=<c:out value='${appPerson.appPersonId}'/>">下载</a> 
                    				</c:if>
								</td>
								<td style="text-align:center">
									<c:out value="${appPerson.phone}"/>
								</td>
								<td style="text-align:center"><c:out value="${appPerson.otherInfo}"/></td>
								
								<td style="text-align:center">
								<c:forEach items="${appPerson.shareUsers}" var="shareUser" varStatus="s">								
									<a href="javascript:return void" onclick="searchShareUserDetail(${shareUser.userId})" >
					        			<c:out value="${shareUser.username}"/>
					        			<c:if test="${!s.last}">;</c:if>
					        		</a>					        	
					       	 	</c:forEach>
								</td>
								
								<td><a href="<s:url value='/appPerson/findOneAppPersonInfo.html'/>?appPersonId=<c:out value='${appPerson.appPersonId}'/>"> 编辑 </a> 
								<a onclick="return confirm('确认要删除？')" href="<s:url value='/appPerson/deleteAppPersonInfo.html'/>?appPersonId=<c:out value='${appPerson.appPersonId}'/>">删除 </a>
								<a href="<s:url value='/appPerson/showFriends.html'/>?appPersons=<c:out value='${appPerson.appPersonId}'/>">分享</a>
								</td>
							  </tr>
							</c:forEach>
						  </tbody>
						</table>
						</div>
						
						
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

	function addAppPerson(){
		var url = "<s:url value='/appPerson/appPersonAddForm.html'/>";
		location.href = url
	}
	
	function searchShareUserDetail(shareUserId){
		var url = "<s:url value='/user/searchShareUserDetail.html'/>?shareUserId=" + shareUserId;
		window.open(url);
	}
	
	$('tr th input.check-item').click(function() {
		var checked = $(this).prop("checked");
		
		if (checked) {
			$('tr td input.check-item').each(function() {
				$(this).prop("checked", true);
			});
		} else {
			$('tr td input.check-item').each(function() {
				$(this).prop("checked", false);
			});
		}
	});
	
	$('tr td input.check-item').click(function() {
		var allChecked = true;
		var friendCheckboxes = $('tr td input.check-item');
		
		if ($(this).checked) {
			for (var i = 0; i < friendCheckboxes.length; i++) {
				if (!friendCheckboxes[i].checked) {
					allChecked = false;
					break;
				}
			}			
		} else {
			allChecked = false;
		}
		
		if (allChecked) {
			$('tr th input.check-item').prop("checked", true);
		} else {
			$('tr th input.check-item').prop("checked", false);
		}
	});
	
	function batchShareAppPerson() {
		var appPersonSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
		var uniqueAppPersonNos = []
		if (!appPersonSelected) {
			formutil.alertMessage('请选择申请人');
			
			return;
		}
		var appPersons_checked=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'appPerson');
		for (var i = 0; i < appPersons_checked.length; i++) {
			if ($.inArray(appPersons_checked[i], uniqueAppPersonNos) == -1) {
				uniqueAppPersonNos.push(appPersons_checked[i]);
			}
		}		
		var appPersons = uniqueAppPersonNos.join(",");		
		var url = "<s:url value='/appPerson/showFriends.html'/>?appPersons=" + appPersons;
		location.href= url
	}
		
		function downloadProxyTemplate(){
			location.href="<s:url value='/appPerson/downloadProxyTemplate.html'/>";
		}
		
		$(function(){
			
			
		})
		
		
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
	
	var url = "<s:url value='/appPerson/list.html'/>?currentPage=" + pageNo;
	
	<c:if test="${searchCondition != null}">
		url = "<s:url value='/appPerson/searchFeeReduceAppPerson.html'/>?page.currentPage=" + pageNo +"&"+"${searchCondition}";
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