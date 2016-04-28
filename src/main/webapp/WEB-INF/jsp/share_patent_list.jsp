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
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav2.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">分享管理</span>
	</div>
	
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

</body>
</html>