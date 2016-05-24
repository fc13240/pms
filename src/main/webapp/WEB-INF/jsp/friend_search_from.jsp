<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加好友</title>
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

				<!-- list beg -->
					<div class="t-third" style="margin-top10px;background:#fff;">
					<form action="<s:url value='/friend/search.html'/>" method="GET"  role="search">
					  <div class="form-group">
						<input class="selectPointOfInterest form-control" type="text" id="form-field-1" style="width:450px;display:inline;" name="keyword" id="keywordId" placeholder="用户名/姓名" value="<c:out value='${param.keyword}'/>" required/>
						<button  type="submit" class="button button-caution button-rounded">查询</button>
					  </div>
					</form>
					<table class="table table-bordered table-striped">
					  <tr>
						<th>序号</th>
						<th>用户名</th>
						<th>姓名</th>
						<th>操作</th>
					  </tr>
					  <c:forEach items="${friends}" var="friend" varStatus="status">
						<tr>
						  <td>${status.count + page.startIndex}</td>
						  <td><c:out value="${friend.username}"/></td>
						  <td><c:out value="${friend.name}"/></td>
						  <td><a  href='javascript:sendFriendRequest("<c:out value='${friend.userId}'/>");'>请求加为好友</a></td>
						</tr>
					  </c:forEach>
					</table>
					</div>
				<!-- list end -->				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>



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

	<script type="text/javascript">
			function pageHide() {
				document.getElementById("page.page").style.display="none";
			}
	</script>

<script src="<s:url value='/static/js/jquery.validate.min.js'/>"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>"></script>
</body>
</html>