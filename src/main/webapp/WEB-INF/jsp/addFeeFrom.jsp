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
<%@ include file="_left_nav_fee.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">添加费用信息</span>
	</div>
	
	<form action="<s:url value='/patent/addFee.html'/>" method="post">
	  <div class="t-third">
	    <ul>
	      <li>
	        <p>申请号/专利号:</p>
	        <input style="height:16px;" type="text" name="appNo" id="appNo"  required/>
	      </li>
	      <li>
	        <p>专利名称:</p>
	        <input style="height:16px;" type="text" name="name" id="name"  required/>
	      </li>
	      <li>
	        <p>第一申请人:</p>
	        <input style="height:16px;" type="text" name="name" id="name"  required/>
	      </li>
	      <li>
	        <p>案件状态:</p>
	        <input style="height:16px;" type="text" name="name" id="name"  required/>
	      </li>
	      <li>
	        <p>缴费截止日:</p>
	        <input style="height:16px;" type="text" name="name" id="name"  required/>
	      </li>
	      <li>
	        <p>缴费种类:</p>
	        <input style="height:16px;" type="text" name="name" id="name"  required/>
	      </li>
	      <li>
	        <p>缴费金额:</p>
	        <input style="height:16px;" type="text" name="name" id="name"  required/>
	      </li>
	      <li>
	        <p>发票抬头:</p>
	        <input style="height:16px;" type="text" name="name" id="name"  required/>
	      </li>
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