<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加地址</title>
<%@ include file="_css.jsp" %>
</head>
<body>


<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav_user.jsp" %>

<script src="<s:url value='/static/js/jquery.validate.min.js'/>"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>"></script>

<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 20px;font-weight: 300;line-height: 24px;">添加地址</span>
	</div>
	<div class="lt-third" style="background:#fff;margin-top:10px;">	
		<form action="<s:url value='/user/addContactAddress.html'/>" method="post" onsubmit="return check()">
		  <se:csrfInput/>
       	<h5>联系人名称:</h5>
		<input class="selectPointOfInterest" type="text" name="receiver" required/>
		<br>	  
       	<h5>手机或固话:</h5>
		<input class="selectPointOfInterest" id="phoneRece" type="text" name="phone" required onblur="validatePhoneNumber(this.value)"/>
		<span style="color: red; display: none;" id=phoneError>请输入正确的手机或者电话号</span>
		<br> 
       	<h5>通讯地址:</h5>
		<select name="province" id="province" onchange="loadCities()" required>
		  <option value=''>请选择</option>
		  <c:forEach items="${provinces}" var="province">
			<option value="${province.id}">${province.name}</option>
		  </c:forEach>
		</select>
		<select name="city" id="city" onchange="loadDistricts()" required>
		  <option value=''>请选择</option>
		</select>
		<select name="district" id="district" onchange="loadStreets()" required>
		  <option value=''>请选择</option>
		</select>
		<select name="street" id="street" required>
		  <option value=''>请选择</option>
		</select>		
		<br> 		  
       	<h5>详细地址:</h5>
		<input class="selectPointOfInterest" type="text" name="detailAddress" required/>
		<br>   
		<div style="height:20px;"></div> 
		<button type="submit" style="width:90px;" class="t-btn2">保存</button>
		</form>
	</div>
</div>
<script type="text/javascript">
			jQuery(function($) {
				//initiate dataTables plugin
				//And for the first simple table, which doesn't have TableTools or dataTables
				//select/deselect all rows according to table header checkbox
				var active_class = 'active';
				$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
					var th_checked = this.checked;//checkbox inside "TH" table header
					
					$(this).closest('table').find('tbody > tr').each(function(){
						var row = this;
						if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
						else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
					});
				});
				
				//select/deselect a row when the checkbox is checked/unchecked
				$('#simple-table').on('click', 'td input[type=checkbox]' , function(){
					var $row = $(this).closest('tr');
					if(this.checked) $row.addClass(active_class);
					else $row.removeClass(active_class);
				});
			
				
			
				/********************************/
				//add tooltip for small view action buttons in dropdown menu
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				
				//tooltip placement on right or left
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					//var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
				
			
			})
		</script> 

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

function validatePhoneNumber(phoneNumber) {
	var reg = new RegExp("^[0-9]*$");
	document.getElementById("phoneError").style.display = "none";
	if (reg.test(phoneNumber)) {
		if (phoneNumber.length<7 || phoneNumber.length>13) {
			document.getElementById("phoneError").style.display = "";
			return false;
		} else {
			return true;
		}
	} else {
		document.getElementById("phoneError").style.display = "";
		return false;
	}
}

function check() {
	 var phone = document.getElementById("phoneRece").value;  
	if(validatePhoneNumber(phone)){
		return true;
	}else {
		return false;
	}
}


</script>
</body>
</html>





					   

