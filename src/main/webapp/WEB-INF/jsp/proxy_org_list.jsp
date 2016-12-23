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
<title>龙图腾专利管家——合作机构列表</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_friend.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding:20px;">
					<!-- list beg -->
					<div class="t-third">
					  <div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
						  <div class="ta-top" style="margin-left:8px;"> 
						  <form action="<s:url value='/employee/searchProxyOrg.html'/>" method="GET">
						  	<table class="search-table">
					  			<tr>
					  				<td>
									  	<button type="submit" style="width: 100px;" class="button button-rounded button-primary" >增加机构</button>
					  				</td>
					  			</tr>
					  		</table>
					  		</form>		
						  </div>
						  </span> 
					 </div>
					  <table id="simple-table" class="table table-striped table-bordered table-hover">
					    <thead>
					      <tr class="simple_bag">
					        <th width="150px">序号</th>
					        <th width="300px">机构用户名</th>
					        <th width="300px">机构名称</th>
					        <th width="300px">备注名</th>
					        <th>操作</th>
					      </tr>
					    </thead>
					    <tbody>
					      <c:forEach items="${proxyOrgs}" var="proxyOrg" varStatus="status">
					        <tr>
					          <td style="text-align:center">${status.count}</td>
					          <td style="text-align:center"><c:out value="${proxyOrg.user.username}"/></td>
					          <td style="text-align:center"><c:out value="${proxyOrg.user.name}"/></td>
					          <td style="text-align:center"><input type="text" maxlength="40" size="30" value='${proxyOrg.remarkName}' onChange="changeProxyOrgRemarkName('<c:out value='${proxyOrg.orgId}'/>', this.value)"/></td>
					          <td style="text-align:center">
					          <a href="javascript:void(0)" onclick="deleteProxyOrg(${proxyOrg.orgId})">
					          	删除机构
					          </a>
					          </td>
					        </tr>
					      </c:forEach>
					    </tbody>
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
			        </div>
			        <!-- 分页功能 End -->
					</div>				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>
<script type="text/javascript">
	function changeProxyOrgRemarkName(orgId, remarkName) {
		$.ajax({
			url: "<s:url value='/employee/changeProxyOrgRemarkName.html'/>?orgId=" + orgId + "&remarkName=" + remarkName, 
			type: 'get', 
			error: function() {
				formutil.alertMessage('修改失败，请稍后重试!');
			}
		});	
	}
	
	function addProxyOrg(){
		var url = "<s:url value='/employee/searchProxyOrg.html'/>";
		location.href = url;
	}
	
	function deleteProxyOrg(orgId) {
		$.ajax({
			url: "<s:url value='/employee/deleteProxyOrg.html'/>?orgId=" + orgId, 
			type: 'get',
			success:function(){
				window.location.reload();
			},
			error: function() {
				formutil.alertMessage('此合作机构包含有子机构，不能删除!');
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
		var url;
		if(${isTopProxyOrg} == 1) {
			url = "<s:url value='/employee/getTopProxyOrgList.html'/>?currentPage=" + pageNo;
		} else {
			url = "<s:url value='/employee/getProxyOrgList.html'/>?currentPage=" + pageNo;
		}
		
		
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