<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>The patent list</title>
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/bootstrap.min.css'/>" />
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/jquery-ui.min.css'/>" />
</head>
<body>
	<div class="row">
		<div class="col-lg-12" style="font-size: 20px;margin-bottom:20px;">
			请选择要分享的好友	
		</div>	
	</div>
	<div class="row">
		<div class="col-lg-12">
			<form action="<s:url value='/patent/searchFriends.html'/>" method="GET" class="navbar-form navbar-left" role="search">
				<c:forEach items="${paramValues.patents}" var="patent">
					<input type="hidden" name="patents" value="<c:out value='${patent}'/>">
				</c:forEach>					
				<div class="form-group">
					<input type="text" class="form-control" name="keyword" placeholder="用户名/姓名" value="<c:out value='${param.keyword}'/>">
				</div>
				<button type="submit" class="btn btn-primary friend-query">查询</button>
			</form>	
		</div>
	</div>
		<form action="<s:url value='/patent/sharePatents.html'/>" method="get"  id="shareAddForm">
			<c:forEach items="${paramValues.patents}" var="patent">
				<input type="hidden" name="patents" value="<c:out value='${patent}'/>">
			</c:forEach>			
		<div class="row">
			<div class="col-lg-3">
				<table class="table table-bordered table-striped">
					<tr>
						<th><input type="checkbox" class="check-item">序号</th>
						<th>用户名</th>
						<th>姓名</th>
					</tr>
					<c:forEach items="${friends}" var="friend">
						<tr>
							<td><input name="friend" type="checkbox" class="check-item" friend="<c:out value='${friend.userId}'/>">编号</td>
							<td><c:out value="${friend.username}"/></td>
							<td><c:out value="${friend.name}"/></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="3"><input type="button" class="btn btn-primary btn-block" id="addShareBtn" value="确定"/></td>
					</tr>
				</table>
			</div>
			<div class="col-lg-9"></div>
		</div>
	</form>
<script src="<s:url value='/static/js/jquery-1.11.3.js'/>"></script>
<script src="<s:url value='/static/js/bootstrap.min.js'/>"></script>
<script src="<s:url value='/static/js/formutil.js'/>"></script>
<script src="<s:url value='/static/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
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
	
	function sharePatents() {
		var friendSelected = false;

		var friendCheckboxes = $('tr td input.check-item');
		for (var i = 0; i < friendCheckboxes.length; i++) {
			if (friendCheckboxes[i].checked) {
				friendSelected = true;
				break;
			}
		}
		
		if (!friendSelected) {
			$("<div>请选择好友</div>").dialog({
				modal: true,
				buttons: {
					Ok: function() {
						$(this).dialog("close");
					}
				}	
			});
	   				
		} else {
			var friends = formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'friend').join(",");
			var patents = $("input[name=patents]").val();
			$.ajax({
				url: "<s:url value='/sharePatent/addShares.html'/>?friends=" + friends + "&patents=" + patents, 
				type: 'GET', 
				success: function() {
					$("<div>分享成功</div>").dialog({
						modal: true,
						buttons: {
							Ok: function() {
								$(this).dialog("close");
								history.go(-1);
							}
						}	
					});
				}
			});			
		}
	}
	
	$(function() {
		$('#addShareBtn').click(sharePatents)
	});
</script>
</body>
</html>