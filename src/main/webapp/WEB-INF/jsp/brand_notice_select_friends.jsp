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
<title>龙图腾专利管家——我的好友</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_brand_management.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding:20px;height:400px;">
					  <h4>请选择要分配的好友 </h4>
					  <div>
						<form action="<s:url value='/brandNotice/searchFriends.html'/>" method="get"  id="shareAddForm">
						  <c:forEach items="${paramValues.brands}" var="brand">
							<input type="hidden" class="form-control" name="brands" value="<c:out value='${brand}'/>">
						  </c:forEach>
						<table class="search-table">
						<tr>
						<td>
						<input name="keyword" style="display:inline;width:300px;" class="form-control" id="keywordId" value="<c:out value='${param.keyword}'/>" placeholder="用户名/姓名" class="t-input"/>
						</td>
						<td>
						<button type="submit" class="button button-caution button-rounded">查询</button>
						</td>
						</tr>
						</table>
							  
							  
						
						</form>
					  </div>
					  <div style="margin-top:20px;width:500px;">
						<form action="" method="get"  id="shareAddForm">
						  <c:forEach items="${paramValues.brands}" var="brand">
							<input type="hidden" name="brands" value="<c:out value='${brand}'/>">
						  </c:forEach>
						  <table id="simple-table" style="width:500px;" class="table table-striped table-bordered table-hover">
							<thead>
							  <tr class="simple_bag">
								<th width="30px"><input style="width:15px;" type="checkbox" class="check-item"></th>
								<th>序号</th>
								<th>用户名</th>
								<th>姓名</th>
								<th>备注名</th>
							  </tr>
							</thead>
							<tbody>
							  <c:forEach items="${friends}" var="friend" varStatus="status">
								<tr>
								  <td ><input name="friend" style="width:15px;" type="checkbox" class="check-item" friend="<c:out value='${friend.friendId}'/>"></td>
								  <td>${status.count}</td>
								   <td><c:out value="${friend.user.username}"/></td>
								  <td><c:out value="${friend.user.name}"/></td>
								  <td><c:out value="${friend.remarkName}"/></td>
								</tr>
							  </c:forEach>
							
							</tbody>
						  </table>
						  <input type="button" class="button button-caution button-rounded" id="addShareBtn" value="确定"/>
						</form>
					  </div>
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>	
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
	
	function shareBrandManagements() {
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
			var brands = $("input[name=brands]").val();
			$.ajax({
				url: "<s:url value='/brand/addBrandNoticeShares.html'/>?friends=" + friends + "&brands=" + brands, 
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
		$('#addShareBtn').click(shareBrandManagements);
	});
</script>
</body>
</html>
