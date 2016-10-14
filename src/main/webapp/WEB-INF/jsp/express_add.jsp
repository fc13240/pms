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
<title>龙图腾专利管家——新增快递</title>
<%@ include file="_css.jsp" %>
	<script src="<s:url value='/temp/js/jquery.js'/>" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="<s:url value='/static/js/jquery.autocomplete.css'/>"/>
    <script type="text/javascript" src="<s:url value='/static/js/jquery.autocomplete.js'/>"></script>
</head>
<body>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_express.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding:20px;">
					<form action="<s:url value='/express/addExpress.html'/>" method="post" id="addExpressForm" onsubmit="return check()" >
					  <div class="lt-third" style="background:#fff;margin-top:10px;">
					  
						<h5>收件人：</h5>
						<input style="width:400px;display:inline;" class="selectPointOfInterest form-control" name="receiver" id="receiver"  type="text" onblur="loadPatent()" required maxLength="30"/>
						<br>
						
						<h5>快递地址:</h5>
				        <select name="province" class="form-control" style="width:136px;display:inline;" id="province" onchange="loadCities()" required>
					  		<option value=''>请选择</option>
					  		<c:forEach items="${provinces}" var="province">
								<option value="${province.id}">${province.name}</option>
					  		</c:forEach>
						</select>
						<select name="city" id="city" style="width:226px;display:inline;" class="form-control" onchange="loadDistricts()" required>
					 	 	<option value=''>请选择</option>
						</select>
						<select name="district" style="width:226px;display:inline;" class="form-control" id="district" required>
					 		<option value=''>请选择</option>
						</select>
						<input class="selectPointOfInterest form-control" style="width:460px;" type="text" name="detailAddress" required/>
					
				        <br>	
				        	
				       	<h5>快递方式:</h5>
				       	<input style="width:400px;" class="selectPointOfInterest form-control" type="text" name="expressCompany" id="expressCompany" value="" maxLength="100"/>
				       	<input style="width:400px;" class="selectPointOfInterest form-control" type="text" name="expressNo" id="expressNo" value="" maxLength="100"/>
						<br>
				 		<h5>寄出时间:</h5>
					    <input style="width:400px;pisplay:inline;"  class="selectPointOfInterest form-control" type="text" class="form-control" id="startAppDateId" 
							name="sendTime" placeholder="寄出时间选择" readonly="readonly" onclick="javascript:$('#start_date_img').click()" required> 
						<img style="display:none;" onclick="WdatePicker({el:'startAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="25" height="30" align="absmiddle" id="start_date_img">
				        <br>
					    
						<h5>快递内容:</h5>
						<input style="width:400px;" class="selectPointOfInterest form-control" type="text" name="name" id="name" value="" maxLength="100"/>
						<br>
				       
				 		<input type="hidden" name="createTime" id="createTime"/>
					    <div style="height:20px;"></div>
						<button class="button button-primary  button-rounded" type="button" style="width:80px;" onclick="savaExpressAsDraft(1)">保存草稿</button>		
						<button class="button button-primary  button-rounded" type="button" style="width:80px;" onclick="waitToReceive(2)">确认寄出</button>		
					
					</form>				
				</div>				
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>


</div>
<script src="<s:url value='/static/js/jquery.validate.min.js'/>"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>"></script> 

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
	function savaExpressAsDraft(status){
		
		
	}


</script>
</body>
</html>