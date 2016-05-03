<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>龙图腾专利</title>
<%@ include file="_css.jsp" %>
</head>
<body>


<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav_friend.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">专利分享</span>
	</div>
	
<!--list beg  -->
	<div class="t-third">
	  <div class="row">请选择要分配的好友 </div>
	  <div>
		<form action="<s:url value='/patent/searchFriends.html'/>" method="get"  id="shareAddForm">
		  <c:forEach items="${paramValues.patents}" var="patent">
			<input type="hidden" name="patents" value="<c:out value='${patent}'/>">
		  </c:forEach>
		  <ul>
			<li style="width: 385px;">
			  <input name="keyword" id="keywordId" value="<c:out value='${param.keyword}'/>" placeholder="用户名/姓名" class="t-input"/>
			  <button>查询</button>
			</li>
		  </ul>
		</form>
	  </div>
	  <div style="margin-top:50px;width:500px;">
		<form action="<s:url value='/patent/sharePatents.html'/>" method="get"  id="shareAddForm">
		  <c:forEach items="${paramValues.patents}" var="patent">
			<input type="hidden" name="patents" value="<c:out value='${patent}'/>">
		  </c:forEach>
		  <table id="simple-table" style="width:500px;" class="table table-striped table-bordered table-hover">
			<thead>
			  <tr class="simple_bag">
				<th width="30px"><input style="width:15px;" type="checkbox" class="check-item"></th>
				<th>序号</th>
				<th>用户名</th>
				<th>姓名</th>
			  </tr>
			</thead>
			<tbody>
			  <c:forEach items="${friends}" var="friend" varStatus="status">
				<tr>
				  <td ><input name="friend" style="width:15px;" type="checkbox" class="check-item" friend="<c:out value='${friend.userId}'/>"></td>
				  <td>${status.count}</td>
				  <td><c:out value="${friend.username}"/></td>
				  <td><c:out value="${friend.name}"/></td>
				</tr>
			  </c:forEach>
			  <tr>
				<td colspan="4"><input type="button" class="btn btn-primary btn-block" id="addShareBtn" value="确定"/></td>
			  </tr>
			</tbody>
		  </table>
		</form>
	  </div>
	</div>

<!--list end  -->
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
