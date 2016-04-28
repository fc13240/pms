<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>好友请求</title>
<%@ include file="_css.jsp" %>
</head>
<body>

<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav_friend.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">好友请求</span>
	</div>
	
	<div class="t-third">
	  <div class="page-content">
		<div class="row">
		  <div class="col-lg-12">
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
		<div class="footer">
		  <div class="footer-inner">
			<!-- #section:basics/footer -->
			<div class="footer-content"> <span class="bigger-120"> <span class="blue bolder">龙图腾</span> 2013-2014 </span> &nbsp; &nbsp; </div>
			<!-- /section:basics/footer -->
		  </div>
		</div>
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"> <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i> </a> </div>
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