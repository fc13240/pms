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
<title>龙图腾专利管家-查询添加</title>
<%@ include file="_css.jsp" %>
<body>
<%@ include file="_top.jsp" %>


<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">

		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav2.jsp" %>
		  </div>
		  <!--left end-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>

				<!-- search begin -->
				<div class="lt-box">
					<div class="search-box">
						<form action="<s:url value='/patent/searchPatent.html'/>" method="get">
						  <div class="t-third" style="clear:both;text-align:center;">
						  <input type="text" style="width:400px;height:35px;display:inline;" placeholder="申请号／申请人／专利名称／代理机构" name="q"	 class="text" id="keywordId" />
							<input type="submit" value="专利库搜索"  id="mc-embedded-subscribe" class="button" style="background: #D31119; color: #fff;width:150px;height:36px;"/>
						  </div>
						</form>
					</div>
				</div>
				<!--search form end-->
				<div class="lt-box">
					<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
					  <div class="ta-top" style="margin:8px;"> 
						<a href="javascript:return void" onclick="batchAddPatents()">
						<button class="button button-caution button-rounded" style="width:150px;height:36px;">一键加入管理</button> 
						</a>	          
					  </div>
					  </span> </div>
					<table id="simple-table" class="table table-striped table-bordered table-hover">
					  <thead>
						<tr class="simple_bag">
						  <th class="center" width="15"> <label class="pos-rel">
							<input type="checkbox" class="patent-check-item" id="checkall"  name="checkall" />
							<span class="lbl"></span> </label>
						  </th>
						  <th class="center" width="35">序号</th>
						  <th width="110">申请号/专利号</th>
						  <th width="170">专利名称</th>
						  <th width="110">申请人</th>
						  <th width="110">代理机构</th>
						  <th width="110">申请日</th>
						  <th width="110">公布号</th>
						  <th width="110">公布日</th>
						  <th width="60">专利类型</th>
						</tr>
					  </thead>
					  <tbody>
						<c:forEach items="${patent}" var="patent" varStatus="status">
						  <tr>
							<td class="center" style="text-align:center">
								<label class="pos-rel"> <span class="batch-share-item">
									  <input type="checkbox" class="patent-check-item" patent="<c:out value='${patent.objectId}'/>">
									  <span class="lbl"></span>
									  </span>
								</label>
							</td>
							<td class="center" style="text-align:center"> ${status.count + (page.currentPage-1)*page.pageSize} </td>
							<td style="text-align:center">
								<c:out value="${patent.appNo}"/>
							</td>
							<td style="text-align:center">
								<c:out value="${patent.name}"/>
							</td>
							<td style="text-align:center">
								<c:out value="${patent.appPerson}"/>
							</td>
							<td style="text-align:center">
								<c:out value="${patent.proxyOrg}"/>
							</td>	
							<td style="text-align:center">
								<fmt:formatDate value="${patent.appDate}" pattern="yyyy-MM-dd"/>
							</td>
							<td style="text-align:center">
								<c:out value="${patent.publishNo}"/>
							</td>
							<td style="text-align:center">
								<fmt:formatDate value="${patent.publishDate}" pattern="yyyy-MM-dd"/>
							</td>
							<td style="text-align:center">
								<c:out value="${patent.patentType.typeDescription}"/>
							</td>
							
													
						  </tr>
						</c:forEach>
					  </tbody>
					</table>
					<div style="height:30px;background:#fff;">
			            <div class="col-lg-12"> 共 ${page.totalPages}页${page.totalRecords}条记录    第${page.currentPage} 页 <a href="?currentPage=1&q=${param.q}">首页</a>
			              <c:choose>
			                <c:when test="${page.currentPage - 1 > 0}"> <a href="?currentPage=${page.currentPage - 1}&q=${param.q}">上一页</a> </c:when>
			                <c:when test="${page.currentPage - 1 <= 0}"> <a href="?currentPage=1&q=${param.q}">上一页</a> </c:when>
			              </c:choose>
			              <c:choose>
			                <c:when test="${page.totalPages==0}"> <a href="?currentPage=${page.currentPage}&q=${param.q}">下一页</a> </c:when>
			                <c:when test="${page.currentPage + 1 < page.totalPages}"> <a href="?currentPage=${page.currentPage+1}&q=${param.q}">下一页</a> </c:when>
			                <c:when test="${page.currentPage + 1 >= page.totalPages}"> <a href="?currentPage=${page.totalPages}&q=${param.q}">下一页</a> </c:when>
			              </c:choose>
			              <c:choose>
			                <c:when test="${page.totalPages==0}"> <a href="?currentPage=${page.currentPage}&q=${param.q}">尾页</a> </c:when>
			                <c:otherwise> <a href="?currentPage=${page.totalPages}&q=${param.q}">尾页</a> </c:otherwise>
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
			        </div>					
									
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
	
	function batchAddPatents() {
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		var uniquePatentNos = []
		if (!patentSelected) {
			formutil.alertMessage('请选择专利');
			
			return;
		}
		var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
		for (var i = 0; i < patents_checked.length; i++) {
			if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
				uniquePatentNos.push(patents_checked[i]);
			}
		}		
		var patents = uniquePatentNos.join(",");
		
		$.ajax({
			url: "<s:url value='/patent/addPatents.html'/>?patents=" + patents, 
			type: 'get', 
			success: function(data) {
				formutil.alertMessage('添加成功!');
			}
		});			
	}
	
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
		
		var url = "<s:url value='/patent/searchPatent.html'/>?currentPage=" + pageNo+"&q="+"${param.q}";
		
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