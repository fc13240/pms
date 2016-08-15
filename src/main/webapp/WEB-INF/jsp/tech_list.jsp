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
<title>龙图腾专利管家——技术员列表</title>
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
					      <button type="button" style="width: 100px;margin:20px;" class="button button-rounded button-primary" onclick="javascript:addTech()">增加技术员</button>
					    </div>
					  </form>
					  <table id="simple-table" class="table table-striped table-bordered table-hover">
					    <thead>
					      <tr class="simple_bag">
					        <th>序号</th>
					        <th width="300px">用户名</th>
					        <th width="300px">姓名</th>
					        <th width="300px">备注名</th>
					        <th>操作</th>
					      </tr>
					    </thead>
					    <tbody>
					      <c:forEach items="${techs}" var="tech" varStatus="status">
					        <tr>
					          <td style="text-align:center">${status.count}</td>
					          <td style="text-align:center"><c:out value="${tech.user.username}"/></td>
					          <td style="text-align:center"><c:out value="${tech.user.name}"/></td>
					          <td style="text-align:center"><input type="text" maxlength="40" size="30" value='${tech.remarkName}' onChange="changeTechRemarkName('<c:out value='${tech.id}'/>', this.value)"/></td>
					          <td style="text-align:center">
					          <a href="<s:url value='/employee/deleteTech.html'/>?id=<c:out value='${tech.id}'/>">
					          	删除技术员
					          </a>
					          </td>
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
	function changeTechRemarkName(id, remarkName) {
		$.ajax({
			url: "<s:url value='/employee/changeTechRemarkName.html'/>?id=" + id + "&remarkName=" + remarkName, 
			type: 'get', 
			error: function() {
				formutil.alertMessage('修改失败，请稍后重试!');
			}
		});	
	}
	
	function addTech(){
		var url = "<s:url value='/employee/searchTech.html'/>";
		location.href = url;
	}
</script>
</body>
</html>