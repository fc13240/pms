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
<title>龙图腾专利管家——合作机构列表</title>
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
					  <div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
						  <div class="ta-top" style="margin-left:8px;"> 
						  	<table class="search-table">
					  			<tr>
					  				<td>
									  	<button type="button" style="width: 100px;" class="button button-rounded button-primary" onclick="javascript:addProxyOrg()">增加机构</button>
					  				</td>
					  			</tr>
					  		</table>		
						  </div>
						  </span> 
					 </div>
					  <table id="simple-table" class="table table-striped table-bordered table-hover">
					    <thead>
					      <tr class="simple_bag">
					        <th width="150px">序号</th>
					        <th width="300px">机构用户名</th>
					        <th width="300px">机构名称</th>
					        <th width="300px">备注名</th>
					        <th>操作</th>
					      </tr>
					    </thead>
					    <tbody>
					      <c:forEach items="${proxyOrgs}" var="proxyOrg" varStatus="status">
					        <tr>
					          <td style="text-align:center">${status.count}</td>
					          <td style="text-align:center"><c:out value="${proxyOrg.user.username}"/></td>
					          <td style="text-align:center"><c:out value="${proxyOrg.user.name}"/></td>
					          <td style="text-align:center"><input type="text" maxlength="40" size="30" value='${proxyOrg.remarkName}' onChange="changeProxyOrgRemarkName('<c:out value='${proxyOrg.orgId}'/>', this.value)"/></td>
					          <td style="text-align:center">
					          <a href="<s:url value='/employee/deleteProxyOrg.html'/>?orgId=<c:out value='${proxyOrg.orgId}'/>">
					          	删除机构
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
	function changeProxyOrgRemarkName(orgId, remarkName) {
		$.ajax({
			url: "<s:url value='/employee/changeProxyOrgRemarkName.html'/>?orgId=" + orgId + "&remarkName=" + remarkName, 
			type: 'get', 
			error: function() {
				formutil.alertMessage('修改失败，请稍后重试!');
			}
		});	
	}
	
	function addProxyOrg(){
		var url = "<s:url value='/employee/searchProxyOrg.html'/>";
		location.href = url;
	}
</script>
</body>
</html>