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
<title>龙图腾专利管家——客服列表</title>
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
				<div class="lt-box" style="padding:20px;">
					<!-- list beg -->
					<div class="t-third">
					  <form action="<s:url value='/friend/searchUserFriends.html'/>" method="GET"  role="search">
					    <div class="form-group">
					      <button type="button" style="width: 100px;margin:20px;" class="button button-rounded button-primary" onclick="javascript:addCustomerSupport()">增加客服</button>
					    </div>
					  </form>
					  <div style="margin-top:22px;text-align: center;">
						  <table  class="table table-bordered table-striped">
						      <tr >
						        <th style="text-align:center">序号</th>
						        <th width="300px" style="text-align:center">用户名</th>
						        <th width="300px" style="text-align:center">姓名</th>
						        <th width="300px" style="text-align:center">备注名</th>
						        <th style="text-align:center">操作</th>
						      </tr>
						      <c:forEach items="${customerSupports}" var="customerSupport" varStatus="status">
						        <tr>
						          <td>${status.count}</td>
						          <td><c:out value="${customerSupport.user.username}"/></td>
						          <td><c:out value="${customerSupport.user.name}"/></td>
						          <td><input type="text" maxlength="40" size="30" value='${customerSupport.remarkName}' onChange="changeCustomerSupportRemarkName('<c:out value='${customerSupport.id}'/>', this.value)"/></td>
						          <td>
						          <a href="<s:url value='/employee/deleteCustomerSupport.html'/>?id=<c:out value='${customerSupport.id}'/>">
						          	删除客服
						          </a>
						          </td>
						        </tr>
						      </c:forEach>
						  </table>
					  </div>
					</div>				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>
<script type="text/javascript">
	function changeCustomerSupportRemarkName(id, remarkName) {
		$.ajax({
			url: "<s:url value='/employee/changeCustomerSupportRemarkName.html'/>?id=" + id + "&remarkName=" + remarkName, 
			type: 'get', 
			error: function() {
				formutil.alertMessage('修改失败，请稍后重试!');
			}
		});	
	}
	
	function addCustomerSupport(){
		var url = "<s:url value='/employee/searchCustomerSupport.html'/>";
		location.href = url;
	}
</script>
</body>
</html>