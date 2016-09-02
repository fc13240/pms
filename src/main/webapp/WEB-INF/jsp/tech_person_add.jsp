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
<title>龙图腾专利管家——添加技术员</title>
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
					<form action="<s:url value='/employee/searchTechPersonUsers.html'/>" method="GET"  role="search">
					    <div class="form-group">
					    <input class="selectPointOfInterest form-control" type="text" id="form-field-1" style="width:450px;display:inline;" name="keyword" id="keywordId" placeholder="用户名/姓名" value="<c:out value='${param.keyword}'/>" required/>
						<button  type="submit" class="button button-caution button-rounded" >查询</button>
						<button  type="button" class="button button-caution button-rounded" onclick="javascript:searchTechPersonFriends()">好友列表</button>
						</div>
					  </form>
					  <table id="simple-table" class="table table-striped table-bordered table-hover">
					    <thead>
					      <tr class="simple_bag">
					        <th>序号</th>
					        <th>用户名</th>
					        <th>姓名</th>
					        <th>操作</th>
					      </tr>
					    </thead>
					    <tbody>
					  <c:forEach items="${users}" var="user" varStatus="status">
					        <tr>
					          <td style="text-align:center">${status.count + page.startIndex}</td>
					          <td style="text-align:center"><c:out value="${user.username}"/></td>
					          <td style="text-align:center"><c:out value="${user.name}"/></td>
					          <td style="text-align:center"><a  href='javascript:addOrUpdateTechPerson(${user.userId});'>添加为技术员</a></td>
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
	function addOrUpdateTechPerson(userId) {
		$.ajax({
			url: "<s:url value='/employee/addOrUpdateTechPerson.html'/>?userId=" + userId,
			success: function() {
		   		$("<div>添加技术员成功</div>").dialog({
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
	
	function searchTechPersonFriends(){
		var keyword = $("input[name='keyword']").val();
		var url = "<s:url value='/employee/searchTechPersonFriends.html'/>?keyword=" + keyword;
		location.href = url;
	}
	
	
</script>


<script src="<s:url value='/static/js/jquery.validate.min.js'/>"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>"></script>
</body>
</html>