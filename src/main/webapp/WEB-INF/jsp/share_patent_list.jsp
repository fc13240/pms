<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>好友请求列表</title>
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/bootstrap.min.css'/>" />
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/jquery-ui.min.css'/>" />
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<table class="table table-bordered patent-table table-striped">
				<tr>
					<th>序号</th>
					<th>分享人</th>
					<th>专利号</th>	
					<th>专利名称</th>	
					<th>第一申请人</th>	
				</tr>
				<c:forEach items="${sharePatents}" var="share">
					<tr>
						<td>编号</td>
						<td>${share.shareBy.username}</td>
						<td><a href="javascript:window.open('<s:url value="/patent/detail/"/>${share.patent.patentId}.html')">${share.patent.appNo}</a></td>
						<td>${share.patent.name}</td>
						<td>${share.patent.firstAppPerson}</td>				
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
<script src="<s:url value='/static/js/jquery-1.11.3.js'/>"></script>
<script src="<s:url value='/static/js/bootstrap.min.js'/>"></script>
<script src="<s:url value='/static/js/formutil.js'/>"></script>
<script src="<s:url value='/static/js/jquery-ui.min.js'/>"></script>

<script type="text/javascript">

</script>
</body>
</html>