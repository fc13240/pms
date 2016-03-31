<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>专利列表</title>
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/bootstrap.min.css'/>" />
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/jquery-ui.min.css'/>" />
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<table class="table table-bordered">
				<tr>
					<th>序号</th>
					<th>用户名</th>
					<th>姓名</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${friends}" var="friend">
					<tr>
						<td></td>
						<td><c:out value="${friend.username}"/></td>
						<td><c:out value="${friend.name}"/></td>
						<td><a  href="<s:url value='/friend/delete/'/><c:out value='${friend.userId}.html'/>">删除好友</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
<script src="<s:url value='/static/js/jquery-1.11.3.js'/>"></script>
<script src="<s:url value='/static/js/bootstrap.min.js'/>"></script>
<script src="<s:url value='/static/js/formutil.js'/>"></script>

<script type="text/javascript">
function deleteFriend(friendId) {
	
}
</script>
</body>
</html>