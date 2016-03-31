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
			<table class="table table-bordered">
				<tr>
					<th>序号</th>
					<th>请求用户名</th>
					<th>姓名</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${friendRequests}" var="request">
					<tr>
						<td></td>
						<td><c:out value="${request.username}"/></td>
						<td><c:out value="${request.name}"/></td>
						<td><a  href='javascript:processFriendRequest("<c:out value='${request.userId}'/>", 2)'>通过验证</a>
							<a  href='javascript:processFriendRequest("<c:out value='${request.userId}'/>", 3)'>拒绝请求</a></td>
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
function processFriendRequest(requestUser, processStatus) {
	$.ajax({
		url: "<s:url value='/friend/request/process.html'/>?requestUser=" + requestUser + "&processStatus=" + processStatus,
		success: function() {
	   		$("<div>处理成功</div>").dialog({
	   			modal: true,
	   			buttons: {
	   				Ok: function() {
	   					$(this).dialog("close");
	   					location.reload();
	   				}
	   			}
	   		});
		}
	});	
}
</script>
</body>
</html>