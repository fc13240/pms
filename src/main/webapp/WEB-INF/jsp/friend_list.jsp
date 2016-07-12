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
<title>龙图腾专利管家——好友列表</title>
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
					<div class="t-third">
					  <form action="<s:url value='/friend/searchUserFriends.html'/>" method="GET"  role="search">
					    <div class="form-group">
					      <input class="form-control" type="text" id="form-field-1" style="width:450px;height:34px;display:inline;" name="keyword" id="keywordId" placeholder="用户名/姓名" value="<c:out value='${param.keyword}'/>" />
					      <button  type="submit" style="height:34px;" class="button button-caution button-rounded">查询</button>
					    </div>
					  </form>
					  <table id="simple-table" class="table table-striped table-bordered table-hover">
					    <thead>
					      <tr class="simple_bag">
					        <th>序号</th>
					        <th>用户名</th>
					        <th>姓名</th>
					        <th>邮箱</th>
					        <th>电话</th>
					        <th width="260px">备注名</th>
					        <th>操作</th>
					      </tr>
					    </thead>
					    <tbody>
					      <c:forEach items="${friends}" var="friend" varStatus="status">
					        <tr>
					          <td style="text-align:center">${status.count}</td>
					          <td style="text-align:center"><c:out value="${friend.username}"/></td>
					          <td style="text-align:center"><c:out value="${friend.realname}"/></td>
					          <td style="text-align:center"><c:out value="${friend.email}"/></td>
					          <td style="text-align:center"><c:out value="${friend.phone}"/></td>
					          <td style="text-align:center"><input type="text" maxlength="40" size="30" value='${friend.remarkName}' onChange="changeRemarkName('<c:out value='${friend.friendId}'/>', this.value)"/></td>
					          <td style="text-align:center"><a  href="<s:url value='/friend/delete/'/><c:out value='${friend.friendId}.html'/>">删除好友</a></td>
					        </tr>
					      </c:forEach>
					    </tbody>
					  </table>
					</div>				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>
<script type="text/javascript">
function changeRemarkName(friendId, remarkName) {
	$.ajax({
		url: "<s:url value='/friend/changeRemarkName.html'/>?friendId=" + friendId + "&remarkName=" + remarkName, 
		type: 'get', 
		error: function() {
			formutil.alertMessage('修改失败，请稍后重试!');
		}
	});	
}
</script>
</body>
</html>