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
<title>龙图腾专利管家——添加专利</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>


<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav2.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding:20px;">

					<form action="<s:url value='/patent/savePatentDetail.html'/>" method="post">
					  <div class="lt-third" style="background:#fff;margin-top:10px;">
					  	<input type="hidden" value="${patent.patentId}" name="patentId">
						<h5>专利类型：</h5>
						<select style="width:332px;" class="selectPointOfInterest form-control" name="patentType.patentTypeId" id="patentTypeId" required>
				          <option value="${patent.patentType.patentTypeId}">${patent.patentType.typeDescription}</option>
				          <c:forEach items="${allPatentTypes}" var="patentType">
				            <option value="${patentType.patentTypeId}">				           
				          		${patentType.typeDescription}
				            </option>
				          </c:forEach>
				        </select>
				        
						<br>	  
				        <h5>专利名称:</h5>
				        <input class="selectPointOfInterest form-control" style="width:332px;" type="text" name="name" id="name" value="${patent.name}" required/>	  
					  	<br>
				        <h5>第一申请人：</h5>
				        <input class="selectPointOfInterest form-control" style="width:332px;" type="text" name="appPerson" id="name"  value="${patent.appPerson}"required/>	  
					  	<br>
				        <h5>申请日：</h5>
					    <input class="selectPointOfInterest form-control" style="width:332px;"  type="text" onclick="WdatePicker({el:'startAppDateId'})"  id="startAppDateId" name="appDate"  
					    	value="<fmt:formatDate value="${patent.appDate}" pattern="yyyy-MM-dd"/>" readonly="readonly" >
					     <br>
				        <h5>案件状态：</h5>
				        
				        <select style="width:332px;" class="selectPointOfInterest form-control" name="patentStatus.patentStatusId" id="patentStatusId" required>
				          <option value="${patent.patentStatus.patentStatusId}">${patent.patentStatus.statusDescription}</option>
				          <c:forEach items="${allPatentStatus}" var="patentStatus">
				            	<option value="${patentStatus.patentStatusId}">${patentStatus.statusDescription}</option>				            
				          </c:forEach>
				        </select>
			
				        <br>
						<h5>内部编码：</h5>
						<input class="selectPointOfInterest form-control" style="width:332px;"  type="text" name="internalCode" id="appPerson" value="${patent.internalCode}"/>
						<br>
				  		
					    <br>
					    <div style="height:20px;"></div>
					    <button class="button button-primary  button-rounded" type="submit" >保存</button>
					    
					  </div>
					    
					</form>				
				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>	

</body>
</html>