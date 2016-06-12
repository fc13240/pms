<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>龙图腾专利管理系统——专利详细</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav2.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box">
					<table class="table table-striped">
					  <tr>
						<td width="33%"><span class="patent-item-title">专利号：</span>
						  <c:out value="${patent.appNo}"/></td>
						<td width="33%"><span class="patent-item-title">专利类型：</span>
						  <c:out value="${patent.patentType.typeDescription}"/></td>
						<td width="34%"><span class="patent-item-title">专利名称：</span>
						  <c:out value="${patent.name}"/></td>
					  </tr>
					  <tr>
						<td><span class="patent-item-title">申请日：</span>
						  <fmt:formatDate value="${patent.appDate}" pattern="yyyy-MM-dd"/></td>
						<td><span class="patent-item-title">第一申请人：</span>
						  <c:out value="${patent.firstAppPerson}"/></td>
						<td><span class="patent-item-title">案件状态：</span>
						  <c:out value="${patent.patentStatus.statusDescription}"/></td>
					  </tr>
					  <tr>
						<td><span class="patent-item-title">共享人：</span>
						  <c:out value="${patent.shareUsersAsString}"/></td>
						<td></td>
						<td></td>
					  </tr>
					</table>
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>	
</body>
</html>