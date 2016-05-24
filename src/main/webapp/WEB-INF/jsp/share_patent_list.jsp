<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>分享管理</title>
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
					<table id="simple-table" class="table table-striped table-bordered table-hover">
					  <thead>
						<tr class="simple_bag">
						  <th>序号</th>
						  <th>分享人</th>
						  <th>专利号</th>
						  <th>专利名称</th>
						  <th>第一申请人</th>
						</tr>
					  </thead>
					  <tbody>
						<c:forEach items="${sharePatents}" var="share" varStatus="status">
						  <tr>
							<td>${status.index+1}</td>
							<td>${share.shareBy.username}</td>
							<td><a href="javascript:window.open('<s:url value="/patent/detail/"/>${share.patent.patentId}.html')">${share.patent.appNo}</a></td>
							<td>${share.patent.name}</td>
							<td>${share.patent.firstAppPerson}</td>
						  </tr>
						</c:forEach>
					  </tbody>
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