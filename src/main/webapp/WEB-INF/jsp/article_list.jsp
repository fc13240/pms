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
<script type="text/javascript" src="<s:url value='/temp/js/jquery_from.js'/>"></script>
<title>龙图腾专利管家-新闻列表</title>
<%@ include file="_css.jsp" %>

</head>
<body>
<%@ include file="_top.jsp" %>
<div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_article.jsp" %>
		  </div>
	<div class="tit_top">
        <div class="title2">
           文章列表</div>
               
    </div>
		<div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right" style="padding:10px 0 0 3px;" >
				    <div class="cl top1" style="height:10px;">
				    
					  <form class="form-inline" action="<s:url value='/article/searchArticles.html'/>" method="get">
						  <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
						  <div class="t-third">

						  <table class="search-table">
							  <tr>
							  <td>文章类型</td>
							  <td>关键字</td>
							  <td></td>
							  </tr>
							  <tr>
							  <td>
								<select  style="width:100px;" class="selectPointOfInterest form-control" name="articleType">
								  <option value="">全部</option>
								  <c:forEach items="${articleTypes}" var="articleType">
									<option value="<c:out value='${articleType.typeId}'/>">
									<c:out value="${articleType.typeName}"/>
									</option>
								  </c:forEach>
								</select>
							  </td>
							  <td>
								<input style="width:300px;height:34px;" name="keyword" id="keywordId" value="" placeholder="标题/关键字/作者/来源/摘要" class="t-input form-control"/>							  
							  </td>
							  <td>
							  <button class="button button-caution button-rounded" type="submit" style="width:80px;">查询</button>
							  </td>
							  </tr>							  
						  </table>
						  </div>
						</form>

    			</div>
				<div style="height:10px;"></div>
					<div class="lt-box" style="padding:50px 0 0 0;">
						<table id="simple-table" class="table table-striped table-bordered table-hover">
						  <thead>
							<tr class="simple_bag">
							  <th class="center" width="40px">序号</th>
							  <th width="100px">文章标题</th>
							  <th width="100px">作者 </th>
							  <th width="180px">来源</th>
							  <th width="60px">创建时间</th>
							  <th width="100px">修改时间</th>
							  <th width="50px">发布时间</th>
							  <th width="50px">审核状态</th>
							  <th width="50px">内容</th>
							  <th width="110px">操作</th>
							</tr>
						  </thead>
						  <tbody>
							<c:forEach items="${articles}" var="article" varStatus="status">
							  <tr>
								<td class="center" style="text-align:center"> ${status.count+ (page.currentPage-1)*page.pageSize} </td>
								<td style="text-align:center"><c:out value="${article.title}"/></td>
								<td style="text-align:center"><c:out value="${article.author}"/></td>
								<td style="text-align:center"><c:out value="${article.source}"/></td>
								<td style="text-align:center"><c:out value="${article.createTime}"/></td>
								<td	style="text-align:center"><c:out value="${article.updateTime}"/></td>
								<td style="text-align:center"><c:out value="${article.publishTime}"/></td>
								<td style="text-align:center">
								<c:if test="${article.checkStatus==0}">
								未审核
								</c:if>
								<c:if test="${article.checkStatus==1}">
								已审核
								</c:if>
								<c:if test="${article.checkStatus==2}">
								审核未通过
								</c:if>
								</td>
								<td style="text-align:center"><a href="javacript:return void" onclick="preview(${article.id})" >查看</a></td>
								<td style="text-align:center">
									<div class="btn-group">
										   <button style="font-size:15px" type="button" class="btn btn-default dropdown-toggle" 
										      data-toggle="dropdown">
										      审核 <span class="caret"></span>
										   </button>
										   <ul class="dropdown-menu" role="menu">
										      <li><a href="<s:url value='/article/audit.html?id=${article.id}&checkStatus=1'/>">审核通过</a></li>
										      <li class="divider"></li>
										      <li><a href="<s:url value='/article/audit.html?id=${article.id}&checkStatus=2'/>">审核未通过 </a></li>
										   </ul>
									</div>
									<div class="btn-group btn-group-lg">
										  <button type="button" style="width: 66px;height: 36px;font-size:14px" class="btn btn-default dropdown-toggle" onclick="deleteAd('${advertismentInfo.patentId}')">删除</button>
									</div>
									<div class="btn-group btn-group-lg">
										  <button type="button" style="width: 66px;height: 36px;font-size:14px" class="btn btn-default dropdown-toggle" onclick="deleteAd('${advertismentInfo.patentId}')">修改</button>
									</div>
								
								</td>
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

	function addAppPerson(){
		var url = "<s:url value='/appPerson/feeReduceTransactAppPersonForm.html'/>";
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
	
	var url = "<s:url value='/appPerson/getUserFeeReduceAppPersonList.html'/>?currentPage=" + pageNo;
	
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
	
	function deleteFeeReduceAppPersonInfo(appPersonId,status){
		$.ajax({
			url:"<s:url value='/appPerson/deleteFeeReduceAppPersonInfo.html'/>",
			data:{"appPersonId":appPersonId,"status":status},
			async:false,
			success:function (){
				
			}
		});
		
		location.reload();
	}
	
	function editorAppPerson(appPersonId){
		var fatherPath=window.location.href;
		fatherPath=fatherPath.substring(fatherPath.indexOf("appPerson")-1);
		window.location.href="<s:url value='/appPerson/updateFeeReduceAppPerson.html'/>?appPersonId="+appPersonId+"&fatherPath="+fatherPath; 
	}
	
	function preview(id){
		window.open("<s:url value='/article/preview.html'/>?id="+id)
	}
</script>
</body>
</html>