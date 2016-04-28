<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加专利</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav2.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">添加专利</span>
	</div>
	
	<form action="<s:url value='/patent/addPatent.html'/>" method="post">
	  <div class="t-third">
	    <ul>
	      <li>
	        <p>专利号:</p>
	        <input style="height:16px;" type="text" name="appNo" id="appNo"  required/>
	      </li>
	      <li>
	        <p>专利名称:</p>
	        <input style="height:16px;" type="text" name="name" id="name"  required/>
	      </li>
	      <li>
	        <p>专利类型</p>
	        <select name="patentType.patentTypeId" id="patentTypeId" required>
	          <option value="">全部</option>
	          <c:forEach items="${allPatentTypes}" var="patentType">
	            <option value="<c:out value='${patentType.patentTypeId}'/>">
	            <c:out value="${patentType.typeDescription}"/>
	            </option>
	          </c:forEach>
	        </select>
	      </li>
	      <li>
	        <p>专利状态</p>
	        <label id="lblSelect">
	        <select name="patentStatus.patentStatusId" id="patentStatusId" required>
	          <option value="">全部</option>
	          <c:forEach items="${allPatentStatus}" var="patentStatus">
	            <option value="<c:out value='${patentStatus.patentStatusId}'/>">
	            <c:out value="${patentStatus.statusDescription}"/>
	            </option>
	          </c:forEach>
	        </select>
	        </label>
	      </li>
	      <li>
	        <p>申请人</p>
	        <input style="height:16px;" type="text" name="appPerson" id="appPerson" />
	      </li>
	      <li>
	        <p>申请日</p>
	        <input  type="text" onclick="WdatePicker({el:'startAppDateId'})" style="height:18px;" id="startAppDateId" name="appDate" placeholder="申请时间" value="" readonly="readonly" >
	        <img onclick="WdatePicker({el:'startAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="18" align="absmiddle" id="start_date_img"> </li>
	      <li>
	        <p>&nbsp;</p>
	        <button type="submit">保存</button>
	      </li>
	    </ul>
	  </div>
	</form>


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