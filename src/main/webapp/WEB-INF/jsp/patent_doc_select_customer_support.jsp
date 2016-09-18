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
			<%@ include file="_left_nav_editor.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding:20px;height:400px;">
					  <h4>请选择要分享的客服人员</h4>
					  <div>
						<form action="<s:url value='/patentDocWorkflow/searchCustomers.html'/>" method="get"  id="shareAddForm">
						  <c:forEach items="${paramValues.patentDocIds}" var="patentDocId">
							<input type="hidden" class="form-control" name="patentDocIds" value="<c:out value='${patentDocId}'/>">
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
						<form action="<s:url value='/patentDocWorkflow/addProxyOrgShares.html'/>" method="get"  id="shareAddForm">
						  <c:forEach items="${paramValues.patentDocIds}" var="patentDocId">
							<input type="hidden" name="patentDocIds" value="<c:out value='${patentDocId}'/>">
						  </c:forEach>
						  <table id="simple-table" style="width:500px;" class="table table-striped table-bordered table-hover">
							<thead>
							  <tr class="simple_bag">
								<th >序号</th>
								<th >用户名</th>
								<th >姓名</th>
								<th >操作</th>
								<th >备注名</th>
							  </tr>
							</thead>
							<tbody>
							  <c:forEach items="${customerSupports}" var="customerSupport" varStatus="status">
								<tr>
								  <td>${status.count}</td>
								  <td><c:out value="${customerSupport.user.username}"/></td>
								  <td><c:out value="${customerSupport.user.name}"/></td>
								  <td><a href="javascript:return void" onclick="sharePatentDocs('${customerSupport.userId}')">分享</a></td>
								  <td><c:out value="${customerSupport.remarkName}"/></td>
								</tr>
							  </c:forEach>
							
							</tbody>
						  </table>
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
	/* 
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
			$("<div>请选择机构</div>").dialog({
				modal: true,
				buttons: {
					Ok: function() {
						$(this).dialog("close");
					}
				}	
			});
	   				
		} else {
			var customerSuppors = formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'friend').join(",");
			var patentDocIds = $("input[name=patentDocIds]").val();
			$.ajax({
				url: "<s:url value='/patentDocWorkflow/addCustomerSupportShares.html'/>?customerSuppors=" + customerSuppors + "&patentDocIds=" + patentDocIds, 
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
	}); */
	function sharePatentDocs(userId){
		var customerSuppors = userId;
		var patentDocIds = $("input[name=patentDocIds]").val();
		$.ajax({
			url: "<s:url value='/patentDocWorkflow/addCustomerSupportShares.html'/>?customerSuppors=" + customerSuppors + "&patentDocIds=" + patentDocIds, 
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
	
</script>
</body>
</html>
