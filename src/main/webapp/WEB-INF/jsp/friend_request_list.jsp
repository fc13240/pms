<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>龙图腾专利管理系统——好友请求</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_friend.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding:20px;">
					<table class="table table-bordered">
					  <tr>
						<th>序号</th>
						<th>请求用户名</th>
						<th>姓名</th>
						<th>操作</th>
					  </tr>
					  <c:forEach items="${friendRequests}" var="request" varStatus="status">
						<tr>
						  <td>${status.count}</td>
						  <td><c:out value="${request.username}"/></td>
						  <td><c:out value="${request.name}"/></td>
						  <td><a  href='javascript:processFriendRequest("<c:out value='${request.userId}'/>", 2)'>通过验证</a> <a  href='javascript:processFriendRequest("<c:out value='${request.userId}'/>", 3)'>拒绝请求</a></td>
						</tr>
					  </c:forEach>
					</table>				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>





<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">好友请求</span>
	</div>
	
	<div class="lt-box">


	</div>


</div>



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

<script>
	$(document).ready(function(){
	
		$("img[class=cgh]").click(function(){
			var ol = $('ol[class="hashTabber-nav hashTabber-sandstone"]')[0];
			var ols =$('.con-list')[0];
			if(ol.style.display=="inline-block"||ol.style.display==""){
					this.style.marginLeft="0px";
					this.src='<s:url value='/temp/images/tabs.png'/>';
					ol.style.display="none";
					ols.style.width="97%";
				}else{
					ol.style.display="inline-block";
					this.style.marginLeft="108px";
					this.src='<s:url value='/temp/images/tab.png'/>';
					ols.style.width="88%";
				}
		});
	});
</script>
</body>
</html>