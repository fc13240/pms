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
    <link rel="stylesheet" type="text/css" href="<s:url value='/static/js/jquery.autocomplete.css'/>"/>
    <script type="text/javascript" src="<s:url value='/static/js/jquery.autocomplete.js'/>"></script>
    <script type="text/javascript" src="<s:url value='/temp/js/jquery.min.js'/>"></script>
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
					  	<h5>从好友中选择：<select name="receiver" class="form-control" style="width:120px;" id="receiver" required onchange="loadContactAddress(this.value)">
					  		<option value=''>请选择</option>
					  		<c:forEach items="${userFriends}" var="userFriend">
								<option value="${userFriend.user.userId}">${userFriend.user.username}</option>
					  		</c:forEach>
					  		
						</select></h5>
						<span>好友地址</span>
						<select  class="form-control" style="width:120px;" id="friendContactAddress" required onchange="loadContact(this.value)">
					  		<option value=''>请选择</option>
					  		<optgroup id="selectGroup">
					  		</optgroup>
						</select>
						<h5>收件人：</h5>
						<input style="width:400px;display:inline;" class="selectPointOfInterest form-control" name="contactPerson" id="contactPerson"  type="text" required maxLength="30"/>
						<span id="receiverError" style="color: red; display: none;">请输入的收件人姓名不要超过30字</span>
						<br>
						
						<h5>快递地址:</h5>
				        <select name="contactAddress.province" class="form-control" style="width:136px;display:inline;" id="province" onchange="loadCities()" required>
					  		<option value='' id="provinceOption">请选择</option>
					  		<c:forEach items="${provinces}" var="province">
								<option value="${province.id}">${province.name}</option>
					  		</c:forEach>
						</select>
						<select name="contactAddress.city" id="city" style="width:226px;display:inline;" class="form-control" onchange="loadDistricts()" required>
					 	 	<option value='' id="cityOption">请选择</option>
						</select>
						<select name="contactAddress.district" style="width:226px;display:inline;" class="form-control" id="district" required>
					 		<option value='' id="districtOption">请选择</option>
						</select>
						<input class="selectPointOfInterest form-control" style="width:460px;" type="text" name="contactAddress.detailAddress" id="detailAddress" required placeholder="详细地址"  maxLength="100"/>
						<span id="detailAddressError" style="color: red; display: none;">请输入的详细地址不要超过100字</span>
				        <br>	
				       	<h5>手机号码或电话号码：</h5>
				       	<input style="width:400px;" class="selectPointOfInterest form-control" type="text" name="phone" id="phone" value="" maxLength="20" required onblur="validatePhoneNumber(this.value)">
				       	<span id="phoneError" style="color: red; display: none;">请输入正确的手机或者电话号</span>
				       	<br/>
				       
				       	<h5>快递方式:</h5>
				       	<input style="width:400px;" class="selectPointOfInterest form-control" type="text" name="expressCompany" id="expressCompany" value="" maxLength="100" required/>
				       	<span id="expressCompanyError" style="color: red; display: none;">请输入的快递方式不要超过100字</span>
				       	<input style="width:400px;" class="selectPointOfInterest form-control" type="text" name="expressNo" id="expressNo" value="" maxLength="100" required/>
				       	<span id="expressNoError" style="color: red; display: none;">请输入正确的手机或者电话号</span>
						<br>
				 		<h5>寄出时间:</h5>
					    <input style="width:400px;pisplay:inline;"  class="selectPointOfInterest form-control" type="text" class="form-control" id="startAppDateId" 
							name="sendTime" placeholder="寄出时间选择" readonly="readonly" onclick="javascript:$('#start_date_img').click()" required> 
						<img style="display:none;" onclick="WdatePicker({el:'startAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="25" height="30" align="absmiddle" id="start_date_img">
				        <br>
					    
						<h5>快递内容:</h5>
						<input style="width:400px;" class="selectPointOfInterest form-control" type="text" name="name" id="name" value="" maxLength="100"/>
						<input type="hidden" name="expressStatus" id="expressStatus" />
						<br>
					    <div style="height:20px;"></div>
						<button class="button button-primary  button-rounded" type="button" style="width:80px;" onclick="saveExpress(1)">保存草稿</button>		
						<button class="button button-primary  button-rounded" type="button" style="width:80px;" onclick="saveExpress(2)">确认寄出</button>		
					</div>
					</form>				
				</div>				
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>
<script src="<s:url value='/static/js/jquery.validate.min.js'/>"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>"></script> 
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

function saveExpress(expressStatus){
	$("#expressStatus").val(expressStatus);
	$("#addExpressForm").submit();
}

function addContactAddressOptions(selectObj, options) {
	$.each(options, function(index, val){
	selectObj.append("<option value='" + val.id + "'>" + val.receiver + "</option>");
	});	
	}
function loadContactAddress(userId){
	var receiver = $("#receiver").val();
	if (receiver != "") {
		$.ajax({
			url: "<s:url value='/express/getContactAddress.html'/>?userId=" + receiver,
			type: 'get',
			dataType: 'json',
			success: function(result) {
				$.each(result,function(i,item){
					$("#selectGroup").append("<option value='"+item.id+"'>"+item.receiver+"</option>");
				})
				
				}
		})
	}
}

function loadContact(receiverId){
	$.ajax({
		url : "<s:url value='/express/loadContact.html'/>",
		data:{"receiverId":receiverId},
		dataType:"json",
		success:function (result){
			$("#contactPerson").val(result.receiver);
			$("#provinceOption").val(result.province);
			$("#provinceOption").text(result.provinceName);
			$("#cityOption").val(result.city);
			$("#cityOption").text(result.cityName);
			$("#districtOption").val(result.district);
			$("#districtOption").text(result.districtName);
			$("#detailAddress").val(result.detailAddress);
			$("#phone").val(result.phone);
		}
	})
}
</script>
</body>
</html>