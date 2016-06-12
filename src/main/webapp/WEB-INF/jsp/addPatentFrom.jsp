<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>龙图腾专利管理系统——添加专利</title>
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

					<form action="<s:url value='/patent/addPatent.html'/>" method="post">
					  <div class="lt-third" style="background:#fff;margin-top:10px;">
					  
						<h5>专利号：</h5>
						<input class="selectPointOfInterest form-control" style="width:332px;"  type="text" name="appNo" id="appNo"  required/>
						<br>	  
				        <h5>专利名称:</h5>
				        <input class="selectPointOfInterest form-control" style="width:332px;" type="text" name="name" id="name"  required/>	  
					  	<br>
				        <h5>专利类型</h5>
				        <select style="width:332px;" class="selectPointOfInterest form-control" name="patentType.patentTypeId" id="patentTypeId" required>
				          <option value="">全部</option>
				          <c:forEach items="${allPatentTypes}" var="patentType">
				            <option value="<c:out value='${patentType.patentTypeId}'/>">
				            <c:out value="${patentType.typeDescription}"/>
				            </option>
				          </c:forEach>
				        </select>
				        <br>
				        <h5>专利状态</h5>
				        
				        <select style="width:332px;" class="selectPointOfInterest form-control" name="patentStatus.patentStatusId" id="patentStatusId" required>
				          <option value="">全部</option>
				          <c:forEach items="${allPatentStatus}" var="patentStatus">
				            <option value="<c:out value='${patentStatus.patentStatusId}'/>">
				            <c:out value="${patentStatus.statusDescription}"/>
				            </option>
				          </c:forEach>
				        </select>
			
				        <br>
						<h5>申请人</h5>
						<input class="selectPointOfInterest form-control" style="width:332px;"  type="text" name="appPerson" id="appPerson" />
						<br>
				  		<h5>申请日</h5>
					    <input class="selectPointOfInterest form-control" style="width:332px;"  type="text" onclick="WdatePicker({el:'startAppDateId'})"  id="startAppDateId" name="appDate" placeholder="申请时间" value="" readonly="readonly" >
					    </li>
					    <br>
					    <div style="height:20px;"></div>
					    <button class="button button-primary  button-rounded" type="submit">保存</button>
					  </div>
					    
					</form>				
				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>	

 
<script type="text/javascript">
function addDefaultOption(selectElem) {
	selectElem.append("<option value=''>请选择</option>");
}

function resetSelect() {
	for (var i = 0; i < arguments.length; i++) {
		var selectObj = arguments[i];
		selectObj.empty();
		addDefaultOption(selectObj);
	}
}

function addOptions(selectObj, options) {
	$.each(options, function(index, val){
		selectObj.append("<option value='" + val.id + "'>" + val.name + "</option>");
	});	
}

function loadCities() {
	var province = $("#province").val();
	
	resetSelect($("#city"), $("#district"), $("#street"));
	
	if (province != "") {
		$.ajax({
			url: "<s:url value='/user/getCitiesByProvince.html'/>?province=" + province,
			type: 'get',
			dataType: 'json',
			success: function(cities) {
				var city = $("#city");
				
				resetSelect(city);
				addOptions(city, cities);
			}
		})
	} 
}

function loadDistricts() {
	var city = $("#city").val();

	resetSelect($("#district"), $("#street"));
	
	if (city != "") {
		$.ajax({
			url: "<s:url value='/user/getDistrictsByCity.html'/>?city=" + city,
			type: 'get',
			dataType: 'json',
			success: function(districts) {
				var district = $("#district");
				
				resetSelect(district);
				addOptions(district, districts);
			}
		})
	}
}

function loadStreets() {
	var district = $("#district").val();
	
	resetSelect($("#street"));
	
	if (district != "") {
		$.ajax({
			url: "<s:url value='/user/getStreetsByDistrict.html'/>?district=" + district,
			type: 'get',
			dataType: 'json',
			success: function(streets) {
				var street = $("#street");
				
				resetSelect(street);
				addOptions(street, streets);
			}
		})
	} 
}

</script>
</body>
</html>