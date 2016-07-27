<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<title>专利模板列表！</title>
	<%@ include file="_css.jsp" %>
	
</head>

<body>
<div>
<%@ include file="_top.jsp" %>
</div>
<div style="height:150px;"></div>
<div>
	<hr>
	   <p class="active-tab"><strong>当前点击板块</strong>: <span></span></p>
	   <p class="previous-tab"><strong>上一次点击板块</strong>: <span></span></p>
	<hr>
	<ul id="myTab" class="nav nav-tabs" style="background-color: white;">
	   <li class="active"><a href="#home" data-toggle="tab">
	      专利模板</a></li>
	   <li><a href="#inventName" data-toggle="tab">发明名称</a></li>
	   <li><a href="#techDomain" data-toggle="tab">技术领域</a></li>
	   <li><a href="#backTech" data-toggle="tab">背景技术</a></li>
	   <li class="dropdown">
	      <a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown">
	         	发明内容 <b class="caret"></b>
	       </a>
	      <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
	         <li><a href="#contentProblem" tabindex="-1" data-toggle="tab">发明问题</a></li>
	         <li><a href="#contentClaim" tabindex="-1" data-toggle="tab">发明要求</a></li>
	         <li><a href="#contentEffect" tabindex="-1" data-toggle="tab">发明效果</a></li>
	      </ul>
	   </li>
	   <li><a href="#implementWay" data-toggle="tab">实施方式</a></li>
	   <li><a href="#rightClaim" data-toggle="tab">权利要求</a></li>
	   <li><a href="#abstract" data-toggle="tab">摘&nbsp;&nbsp;要</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
	   <div class="tab-pane fade in active" id="home">
	      专利模板首页
	   </div>
	   <div class="tab-pane fade" id="inventName">
	   	   <br/>
		   <div>
		   	   <table id="simple-table" class="table table-striped table-bordered table-hover">
		   	   		<thead>
		   	   			<tr>
							<th>序号</th>
							<th>模块说明</th>
							<th>具体模块样板</th>
							<th>创建时间</th>
							<th>修改时间</th>
							<th>操作</th>
		   	   			</tr>
		   	   		</thead>
		   	   		<tbody>
			   			<c:forEach items="${inventNameTemplates }" var="inventNameTemplate" varStatus="status">
			   				<tr>
			   					<td>模块${status.count }</td>
			   					<td>${inventNameTemplate.templateTitle }</td>
			   					<td>${inventNameTemplate.content }</td>
			   					<td> <fmt:formatDate value="${inventNameTemplate.createTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   					<td> <fmt:formatDate value="${inventNameTemplate.lastUpdateTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   				</tr>
			   			
			   			</c:forEach>
		   			</tbody>
		   	   </table>
		   	
		   </div>
	   </div>
	   <div class="tab-pane fade" id="techDomain">
	      	<br/>
	      	<div>
		   	   <table id="simple-table" class="table table-striped table-bordered table-hover">
		   	   		<thead>
		   	   			<tr>
							<th>序号</th>
							<th>模块说明</th>
							<th>具体模块样板</th>
							<th>创建时间</th>
							<th>修改时间</th>
							<th>操作</th>
		   	   			</tr>
		   	   		</thead>
		   	   		<tbody>
			   			<c:forEach items="${techDomainTemplates }" var="techDomainTemplate" varStatus="status">
			   				<tr>
			   					<td>${status.count }</td>
			   					<td>${techDomainTemplate.templateTitle }</td>
			   					<td>${techDomainTemplate.content }</td>
			   					<td> <fmt:formatDate value="${techDomainTemplate.createTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   					<td> <fmt:formatDate value="${techDomainTemplate.lastUpdateTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   				</tr>
			   			
			   			</c:forEach>
		   			</tbody>
		   	   </table>
		   	
		   </div>
	   </div>
	   <div class="tab-pane fade" id="backTech">
	      	<br/>
	      	<div>
		   	   <table id="simple-table" class="table table-striped table-bordered table-hover">
		   	   		<thead>
		   	   			<tr>
							<th>序号</th>
							<th>模块说明</th>
							<th>具体模块样板</th>
							<th>创建时间</th>
							<th>修改时间</th>
							<th>操作</th>
		   	   			</tr>
		   	   		</thead>
		   	   		<tbody>
			   			<c:forEach items="${backTechTemplates }" var="backTechTemplate" varStatus="status">
			   				<tr>
			   					<td>${status.count }</td>
			   					<td>${backTechTemplate.templateTitle }</td>
			   					<td>${backTechTemplate.content }</td>
			   					<td> <fmt:formatDate value="${backTechTemplate.createTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   					<td> <fmt:formatDate value="${backTechTemplate.lastUpdateTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   				</tr>
			   			
			   			</c:forEach>
		   			</tbody>
		   	   </table>
		   	
		   </div>
	   </div>
	   <div class="tab-pane fade" id="contentProblem">
	      	<br/>
	      	<div>
		   	   <table id="simple-table" class="table table-striped table-bordered table-hover">
		   	   		<thead>
		   	   			<tr>
							<th>序号</th>
							<th>模块说明</th>
							<th>具体模块样板</th>
							<th>创建时间</th>
							<th>修改时间</th>
							<th>操作</th>
		   	   			</tr>
		   	   		</thead>
		   	   		<tbody>
			   			<c:forEach items="${contentProblemTemplates }" var="contentProblemTemplate" varStatus="status">
			   				<tr>
			   					<td>${status.count }</td>
			   					<td>${contentProblemTemplate.templateTitle }</td>
			   					<td>${contentProblemTemplate.content }</td>
			   					<td> <fmt:formatDate value="${contentProblemTemplate.createTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   					<td> <fmt:formatDate value="${contentProblemTemplate.lastUpdateTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   				</tr>
			   			
			   			</c:forEach>
		   			</tbody>
		   	   </table>
		   	
		   </div>
	   </div>
	   <div class="tab-pane fade" id="contentClaim">
	      	<br/>
	      	<div>
		   	   <table id="simple-table" class="table table-striped table-bordered table-hover">
		   	   		<thead>
		   	   			<tr>
							<th>序号</th>
							<th>模块说明</th>
							<th>具体模块样板</th>
							<th>创建时间</th>
							<th>修改时间</th>
							<th>操作</th>
		   	   			</tr>
		   	   		</thead>
		   	   		<tbody>
			   			<c:forEach items="${contentClaimTemplates }" var="contentClaimTemplate" varStatus="status">
			   				<tr>
			   					<td>${status.count }</td>
			   					<td>${contentClaimTemplate.templateTitle }</td>
			   					<td>${contentClaimTemplate.content }</td>
			   					<td> <fmt:formatDate value="${contentClaimTemplate.createTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   					<td> <fmt:formatDate value="${contentClaimTemplate.lastUpdateTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   				</tr>
			   			
			   			</c:forEach>
		   			</tbody>
		   	   </table>
		   	
		   </div>
	   </div>
	   <div class="tab-pane fade" id="contentEffect">
	      	<br/>
	      	<div>
		   	   <table id="simple-table" class="table table-striped table-bordered table-hover">
		   	   		<thead>
		   	   			<tr>
							<th>序号</th>
							<th>模块说明</th>
							<th>具体模块样板</th>
							<th>创建时间</th>
							<th>修改时间</th>
							<th>操作</th>
		   	   			</tr>
		   	   		</thead>
		   	   		<tbody>
			   			<c:forEach items="${contentEffectTemplates }" var="contentEffectTemplate" varStatus="status">
			   				<tr>
			   					<td>${status.count }</td>
			   					<td>${contentEffectTemplate.templateTitle }</td>
			   					<td>${contentEffectTemplate.content }</td>
			   					<td> <fmt:formatDate value="${contentEffectTemplate.createTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   					<td> <fmt:formatDate value="${contentEffectTemplate.lastUpdateTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   				</tr>
			   			
			   			</c:forEach>
		   			</tbody>
		   	   </table>
		   	
		   </div>
	   </div>
	   <div class="tab-pane fade" id="implementWay">
	      	<br/>
	      	<div>
		   	   <table id="simple-table" class="table table-striped table-bordered table-hover">
		   	   		<thead>
		   	   			<tr>
							<th>序号</th>
							<th>模块说明</th>
							<th>具体模块样板</th>
							<th>创建时间</th>
							<th>修改时间</th>
							<th>操作</th>
		   	   			</tr>
		   	   		</thead>
		   	   		<tbody>
			   			<c:forEach items="${implementWayTemplates }" var="implementWayTemplate" varStatus="status">
			   				<tr>
			   					<td>${status.count }</td>
			   					<td>${implementWayTemplate.templateTitle }</td>
			   					<td>${implementWayTemplate.content }</td>
			   					<td> <fmt:formatDate value="${implementWayTemplate.createTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   					<td> <fmt:formatDate value="${implementWayTemplate.lastUpdateTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   				</tr>
			   			
			   			</c:forEach>
		   			</tbody>
		   	   </table>
		   	
		   </div>
	   </div>
	   <div class="tab-pane fade" id="rightClaim">
	      	<br/>
	      	<div>
		   	   <table id="simple-table" class="table table-striped table-bordered table-hover">
		   	   		<thead>
		   	   			<tr>
							<th>序号</th>
							<th>模块说明</th>
							<th>具体模块样板</th>
							<th>创建时间</th>
							<th>修改时间</th>
							<th>操作</th>
		   	   			</tr>
		   	   		</thead>
		   	   		<tbody>
			   			<c:forEach items="${rightClaimTemplates }" var="rightClaimTemplate" varStatus="status">
			   				<tr>
			   					<td>${status.count }</td>
			   					<td>${rightClaimTemplate.templateTitle }</td>
			   					<td>${rightClaimTemplate.content }</td>
			   					<td> <fmt:formatDate value="${rightClaimTemplate.createTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   					<td> <fmt:formatDate value="${rightClaimTemplate.lastUpdateTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   				</tr>
			   			
			   			</c:forEach>
		   			</tbody>
		   	   </table>
		   	
		   </div>
	   </div>
	   <div class="tab-pane fade" id="abstract">
	      	<br/>
	      	<div>
		   	   <table id="simple-table" class="table table-striped table-bordered table-hover">
		   	   		<thead>
		   	   			<tr>
							<th>序号</th>
							<th>模块说明</th>
							<th>具体模块样板</th>
							<th>创建时间</th>
							<th>修改时间</th>
							<th>操作</th>
		   	   			</tr>
		   	   		</thead>
		   	   		<tbody>
			   			<c:forEach items="${abstractTemplates }" var="abstractTemplate" varStatus="status">
			   				<tr>
			   					<td>${status.count }</td>
			   					<td>${abstractTemplate.templateTitle }</td>
			   					<td>${abstractTemplate.content }</td>
			   					<td> <fmt:formatDate value="${abstractTemplate.createTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   					<td> <fmt:formatDate value="${abstractTemplate.lastUpdateTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			   				</tr>
			   			
			   			</c:forEach>
		   			</tbody>
		   	   </table>
		   	
		   </div>
	   </div>
	</div>
</div>
<script>
   $(function(){
      $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      // Get the name of active tab
      var activeTab = $(e.target).text(); 
      // Get the name of previous tab
      var previousTab = $(e.relatedTarget).text(); 
      $(".active-tab span").html(activeTab);
      $(".previous-tab span").html(previousTab);
   });
});
</script>
</body>
</html>