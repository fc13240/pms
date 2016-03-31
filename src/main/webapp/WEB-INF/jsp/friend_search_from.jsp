<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>The friend search form</title>
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/bootstrap.min.css'/>" />
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/jquery-ui.min.css'/>" />
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<form action="<s:url value='/friend/search.html'/>" method="GET" class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" name="keyword" placeholder="用户名/姓名" value="<c:out value='${param.keyword}'/>">
				</div>
				<button type="submit" class="btn btn-primary friend-query">查询</button>
			</form>	
		</div>
	</div>		
	<div class="row">
		<div class="col-lg-3">
			<table class="table table-bordered table-striped">
				<tr>
					<th>序号</th>
					<th>用户名</th>
					<th>姓名</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${friends}" var="friend" varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td><c:out value="${friend.username}"/></td>
						<td><c:out value="${friend.name}"/></td>
						<td><a  href='javascript:sendFriendRequest("<c:out value='${friend.userId}'/>");'>请求加为好友</a></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3"><input type="button" class="btn btn-primary btn-block" id="addShareBtn" value="确定"/></td>
				</tr>
			</table>
		</div>
		<div class="col-lg-9"></div>
	</div>
<script src="<s:url value='/static/js/jquery-1.11.3.js'/>"></script>
<script src="<s:url value='/static/js/bootstrap.min.js'/>"></script>
<script src="<s:url value='/static/js/formutil.js'/>"></script>
<script src="<s:url value='/static/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
function sendFriendRequest(toUser) {
	$.ajax({
		url: "<s:url value='/friend/request.html'/>?toUser=" + toUser,
		success: function() {
	   		$("<div>请求已发送</div>").dialog({
	   			modal: true,
	   			buttons: {
	   				Ok: function() {
	   					$(this).dialog("close");
	   				}
	   			}
	   		});
		}
	});
}
</script>
</body>
</html>