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
					<form action="<s:url value='/express/addExpress.html'/>" method="post" id="addExpressForm">
					  <div class="lt-third" style="background:#fff;margin-top:10px;">
					  <input type="hidden" name="receiver.userId" id="userId"/>
					  	<%-- <h5>从好友中选择：<select name="receiver.userId" class="form-control" style="width:120px;display:inline;" id="receiver" required onchange="loadContactAddress(this.value)">
					  		<option value=''>请选择</option>
					  		<c:forEach items="${userFriends}" var="userFriend">
								<option value="${userFriend.user.userId}">${userFriend.user.username}</option>
					  		</c:forEach>
					  		
						</select>
						<span style="display:inline;">好友地址：</span>
						<select  class="form-control" style="width:120px;display:inline;" id="friendContactAddress" required onchange="loadContact(this.value)">
					  		<option value=''>请选择</option>
					  		<optgroup id="selectGroup">
					  		</optgroup>
						</select>
						</h5> --%>
						<h5>收件人：<a href="javascript:void(0)" onclick="loadFriend()">选择好友</a>
						<%-- 从好友中选择
							<select name="receiver.userId" class="form-control" style="width:120px;display:inline;" id="receiver" required onchange="loadContactAddress(this.value);loadReceiver(this.value)">
					  		<option value=''>请选择</option>
					  		<c:forEach items="${userFriends}" var="userFriend">
								<option value="${userFriend.user.userId}">${userFriend.user.username}</option>
					  		</c:forEach>
						</select> --%>
						</h5>
						<input style="width:600px;display:inline;" class="selectPointOfInterest form-control" id="receiverName" onchange="validateInputInfo(this.value, 'receiverError', 50)" type="text" required="required" maxLength="30" readonly="readonly" />
						<span id="receiverError" style="color: red; display: none;">请选择好友</span>
						<br>
						<h5>快递地址 :<a  href="javascript:void(0)" onclick="loadFriendAddress()">选择好友地址</a>
							<%-- <select  class="form-control" style="width:120px;display:inline;" id="friendContactAddress" required onchange="loadContact(this.value)">
						  		<option value=''>请选择</option>
						  		<optgroup id="selectGroup">
						  		</optgroup>
							</select>
						 --%>
						</h5>
				        <select name="contactAddress.province" class="form-control" style="width:136px;display:inline;" id="province" onchange="loadCities();validateInputInfo(this.value, 'provinceError', 50)" required>
					  		<option value='' id="provinceOption">请选择</option>
					  		<c:forEach items="${provinces}" var="province">
								<option value="${province.id}">${province.name}</option>
					  		</c:forEach>
						</select>
						<select name="contactAddress.city" id="city" style="width:226px;display:inline;" class="form-control" onchange="loadDistricts();validateInputInfo(this.value, 'provinceError', 50)" required>
					 	 	<option value='' id="cityOption">请选择</option>
						</select>
						<select name="contactAddress.district" style="width:226px;display:inline;" class="form-control" id="district" required onchange="validateInputInfo(this.value, 'provinceError', 50)"">
					 		<option value='' id="districtOption">请选择</option>
						</select>
						<input class="selectPointOfInterest form-control" style="width:600px;margin-top:5px" type="text" name="contactAddress.detailAddress" id="detailAddress" onblur="validateInputInfo(this.value, 'detailAddressError', 100)" required placeholder="详细地址"  maxLength="100"/>
						<span id="provinceError" style="color: red; display: none;">请请选择所在的省市地区</span>
						<span id="detailAddressError" style="color: red; display: none;">请输入的详细地址不要超过100字</span>
				        <h5>联系人:</h5>
						<input style="width:600px;display:inline;" class="selectPointOfInterest form-control" id="contactPerson" name="contactPerson" type="text" onblur="validateInputInfo(this.value, 'contactPersonError', 200)" required maxLength="200"/>
						<span id="contactPersonError" style="color: red; display: none;">请输入的联系人在200个字以内</span>
						<br>	
				       	<h5>联系电话：</h5>
				       	<input style="width:600px;" class="selectPointOfInterest form-control" type="text" name="phone" id="phone" value="" maxLength="20" required onblur="validatePhoneNumber(this.value)">
				       <!-- 	onblur="validatePhoneNumber(this.value)" -->
				       	<span id="phoneError" style="color: red; display: none;">请输入正确的联系电话</span>
				       	<br/>
				       
				       	<h5>快递方式:</h5>
				      <!--  	<div> -->
				       	<input  style="width:600px;" class="selectPointOfInterest form-control" type="text" name="expressCompany" id="expressCompany" value="" onblur="validateInputInfo(this.value, 'expressCompanyError', 100)" maxLength="100" required placeholder="请输入快递公司和快递单号"/>
				       	<span id="expressCompanyError" style="color: red; display: none;">请输入的快递方式不要超过100字</span>
				       	<!-- </div> -->
				       	<%-- <div style="float:left;">
				       	 <input  style="width:300px;" class="selectPointOfInterest form-control" type="text" name="expressNo" id="expressNo" value="" onblur="validateInputInfo(this.value, 'expressNoError', 50)" maxLength="50" required/>
				       	<span id="expressNoError" style="color: red; display: none;">请输入快递单号</span>
				       	</div> --%>
				       <!-- 	<h5>快递单号:</h5> -->
				       <!-- 	<input style="width:600px;" class="selectPointOfInterest form-control" type="text" name="expressNo" id="expressNo" value="" onblur="validateInputInfo(this.value, 'expressNoError', 50)" maxLength="50" required/> -->
				       	<%-- <span id="expressNoError" style="color: red; display: none;">请输入快递单号</span> --%>
						<br>
				 		<h5>寄出时间:</h5>
					    <input style="width:400px;pisplay:inline;"  class="selectPointOfInterest form-control" type="text" class="form-control" id="startAppDateId" 
							name="sendTime" placeholder="寄出时间选择" readonly="readonly" onclick="javascript:$('#start_date_img').click()" required> 
						<img style="display:none;" onclick="WdatePicker({el:'startAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="25" height="30" align="absmiddle" id="start_date_img">
						<span id="startAppDateIdError" style="color: red; display: none;">寄出时间不能为空</span>
				        <br>
					    
						<h5>快递内容:</h5>
						<textarea rows="8" cols="8" style="width:600px;" class="selectPointOfInterest form-control" type="text" name="expressRemark" id="expressRemark" value="" maxLength="500" onblur="validateInputInfo(this.value, 'expressRemarkError', 500)"></textarea>
						<!-- <input style="width:600px;" class="selectPointOfInterest form-control" type="text" name="expressRemark" id="expressRemark" value="" maxLength="500" onblur="validateInputInfo(this.value, 'expressRemarkError', 200)"/> -->
						<span id="expressRemarkError" style="color: red; display: none;">请输入的快递内容在500字以内</span>
						<br/>
						<input type="hidden" name="expressStatus.expressStatusId" id="expressStatus" />
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

<button id="hiddenUpdateContactModal" style="display:none;" type="button" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#updateContactModal">
</button>
<div class = "modal fade" id = "updateContactModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:750px">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="updateContactModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	选择快递地址
            </h4>
         </div>
	         <div class = "modal-body">
				<div class="lt-box" style="padding:20px;">
						
					<a href="javascript:return void" onclick="addContact()" >
					<button style="display: inline-block;width:100px;" class="button button-primary  button-rounded" data-toggle="tooltip" data-placement="bottom">确认选择</button>
					</a>
					<table id="simple-table" class="table table-striped table-bordered table-hover">
						  <thead>
							<tr class="simple_bag">
							  <th class="center">
								选择
							  </th>
							  <th>序号</th>
							  <th>联系人</th>
							  <th>所在地区</th>
							  <th>地址</th>
							  <th>联系电话</th>
							  <!-- <th>操作</th> -->
							</tr>
						  </thead>
						  <tbody id="contactTabModal">
						</tbody>
					</table>
				</div>
	      </div>
	   </div>
	</div>
</div>


<button id="hiddenFriendModal" style="display:none;" type="button" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#friendModal">
</button>
<div class = "modal fade" id = "friendModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="height:600px;width:750px">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="friendModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	选择好友
            </h4>
         </div>
	         <div class = "modal-body">
				<div class="lt-box" style="padding:20px;">
					<div style="float:left;margin-bottom: 10px;">
					<a href="javascript:return void" onclick="addFriend()" >
					<button style="display: inline-block;width:100px;" class="button button-primary  button-rounded" data-toggle="tooltip" data-placement="bottom">确认选择</button>
					</a>
					</div>	
					<div style="float:left;margin-left:50px;">
					<input type="text" class="selectPointOfInterest form-control" style="width:370px;" placeholder="用户名/姓名" id="keyword" onkeydown="if(event.keyCode==13){$('button[id=searchBtn]').click()}"/>
					</div>
					<div style="float:left;margin-left:10px;">
					<button style="display: inline-block;width:60px;" class="button button-primary  button-rounded" onclick="searchFriend($('input[id=keyword]').val())" id="searchBtn">搜索</button>
					</div>
					<table id="simple-table" class="table table-striped table-bordered table-hover" >
						  <thead>
							<tr class="simple_bag">
							  <th class="center">
								选择
							  </th>
							  <th>序号</th>
							  <th>用户名</th>
							  <th>姓名</th>
							  <th>邮箱</th>
							  <th>电话</th>
							</tr>
						  </thead>
						  <tbody id="friendModalTab">
						  
						  	<%-- <c:forEach items="${userFriends}" var="friend" varStatus="status">
						        <tr>
						          <td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">
									  <input type="radio" name="friend-check-item" value="${friend.user.userId }" friendName="${friend.user.username}"/></span>
									  <span class="lbl"></span></label>
								  </td>
						          <td style="text-align:center">${status.count}</td>
						          <td style="text-align:center"><c:out value="${friend.user.username}"/></td>
						          <td style="text-align:center"><c:out value="${friend.user.name}"/></td>
						          <td style="text-align:center"><c:out value="${friend.user.email}"/></td>
						          <td style="text-align:center"><c:out value="${friend.user.phone}"/></td>
						        </tr>
					      	</c:forEach> --%>
						  
						</tbody>
					</table>
				</div>
	      </div>
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
	
function saveExpress(expressStatus){
	$("#expressStatus").val(expressStatus);
	var phone=$("#phone").val();
	var receiverName=$("#receiverName").val();
	var province=$("#province").val();
	var city=$("#city").val();
	var district=$("#district").val();
	var detailAddress=$("#detailAddress").val();
	var contactPerson=$("#contactPerson").val();
	var expressCompany=$("#expressCompany").val();
	//var expressNo=$("#expressNo").val();
	//var startAppDateId=$("#startAppDateId").val();
	var expressRemark=$("#expressRemark").val();
	//validateInputInfo(receiverName, "receiverError", 30);
	if (validatePhoneNumber(phone)
		&validateInputInfo(receiverName, "receiverError", 30)
		&validateInputInfo(province, "provinceError", 50)
		&validateInputInfo(city, "provinceError", 50)
		&validateInputInfo(district, "provinceError", 50)
		&validateInputInfo(detailAddress, "detailAddressError", 100)
		&validateInputInfo(contactPerson, "contactPersonError", 200)
		&validateInputInfo(expressCompany, "expressCompanyError", 100)
		//&validateInputInfo(expressNo, "expressNoError", 50)
		//&validateInputInfo(startAppDateId, "startAppDateIdError", 200)
		&validateInputInfo(expressRemark, "expressRemarkError", 500)
	) {
		$("#addExpressForm").submit();
	}else{
		
	}
}


function validateInputInfo(value,errorId,maxStringLength){
	$("#"+errorId).css("display","none");
	if (value==""||value.length>maxStringLength||value==null) {
		$("#"+errorId).css("display","block");
		return false;
	} else {
		return true;
	}
}

function addContactAddressOptions(selectObj, options) {
	$.each(options, function(index, val){
	selectObj.append("<option value='" + val.id + "'>" + val.receiver + "</option>");
	});	
	}
function loadContactAddress(){
	var userId = $("#userId").val();
	if (userId != "") {
		$.ajax({
			url: "<s:url value='/express/getContactAddress.html'/>?userId=" + userId,
			type: 'get',
			dataType: 'json',
			success: function(result) {
				$("#contactTabModal").empty();
				$.each(result,function(i,item){
					$("#contactTabModal").append(
						"+<tr>"+
							  "<td class='center' style='text-align:center'><label class='pos-rel'> <span class='batch-share-item'>"+
							  "<input type='radio' name='contact-check-item' value='"+item.id+"'/></span>"+
							  "<span class='lbl'></span></label>"+
							  "</td>"+
							  "<td class='center' style='text-align:center;'>"+(i+1)+"</td>"+
							  "<td style='text-align:center;'>"+item.receiver+"</td>"+
							  "<td style='text-align:center;'>"+item.provinceName+item.cityName+item.districtName+
							  "</td>"+
							  "<td style='text-align:center;'>"+item.detailAddress+"</td>"+
							  "<td style='text-align:center;'>"+item.phone+"</td>"+
						  "+</tr>"
					)
				})
				
			}
		});
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


function loadReceiver(receiverId){
	 var receiverName=$("#receiver").find("option:selected").text();
	 $("#receiverName").val(receiverName);
}

function loadFriendAddress(){
	loadContactAddress();
	$('button[id=hiddenUpdateContactModal]').click();
}
function loadFriend(){
	$.ajax({
		type:"POST",
		url :"<s:url value='/express/loadMyFriend.html'/>",
		dataType:"json",
		async:false,
		success :function(myFriend){
			$("#friendModalTab").empty();
			$.each(myFriend,function(i,item){
				$("#friendModalTab").append(
					"<tr>"+
			          "<td class='center' style='text-align:center'><label class='pos-rel'> <span class='batch-share-item'>"+
						  "<input type='radio' name='friend-check-item' value='"+item.user.userId+"' friendName='"+item.user.username+"'/></span>"+
						  "<span class='lbl'></span></label>"+
					  "</td>"+
			          "<td style='text-align:center'>"+(i+1)+"</td>"+
			          "<td style='text-align:center'>"+item.user.username+"</td>"+
			          "<td style='text-align:center'>"+item.user.name+"</td>"+
			          "<td style='text-align:center'>"+item.user.email+"</td>"+
			          "<td style='text-align:center'>"+item.user.phone+"</td>"+
			        "</tr>"
				)
			})
		}
	});
	$('button[id=hiddenFriendModal]').click();
}

function searchFriend(keyword){
	$.ajax({
		type:"POST",
		url :"<s:url value='/express/searchMyFriend.html'/>",
		data:{"keyword":keyword},
		dataType:"json",
		async:false,
		success :function(myFriend){
			$("#friendModalTab").empty();
			$.each(myFriend,function(i,item){
				$("#friendModalTab").append(
					"<tr>"+
			          "<td class='center' style='text-align:center'><label class='pos-rel'> <span class='batch-share-item'>"+
						  "<input type='radio' name='friend-check-item' value='"+item.user.userId+"' friendName='"+item.user.username+"'/></span>"+
						  "<span class='lbl'></span></label>"+
					  "</td>"+
			          "<td style='text-align:center'>"+(i+1)+"</td>"+
			          "<td style='text-align:center'>"+item.user.username+"</td>"+
			          "<td style='text-align:center'>"+item.user.name+"</td>"+
			          "<td style='text-align:center'>"+item.user.email+"</td>"+
			          "<td style='text-align:center'>"+item.user.phone+"</td>"+
			        "</tr>"
				)
			})
		}
	});
}


function addContact(){
	var contactId= $('input:radio[name="contact-check-item"]:checked').val();
    if(contactId==null){
        alert("请选择联系人!");
    }else{
    	loadContact(contactId);
    	$("#updateContactModalCloseBtn").trigger("click");
    }
}
function addFriend(){
	var friendId= $('input:radio[name="friend-check-item"]:checked').val();
	var friendName= $('input:radio[name="friend-check-item"]:checked').attr("friendName");
     if(friendId==null){
        alert("请选择好友!");
    }else{
    	$("#userId").val(friendId);
    	$("#receiverName").val(friendName);
    	$("#friendModalCloseBtn").trigger("click");
    	if($("#userId").val()==null||$("#userId").val()==""){
    		$("#choiceFriendAddress").css("display","none");
    	}else{
    		$("#choiceFriendAddress").css("display","block");
    	}
    	
    }

}
function validatePhoneNumber(phoneNumber) {
	var reg = new RegExp("^[0-9]{3,4}(-)?[0-9]+$");
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
</script>
</body>
</html>