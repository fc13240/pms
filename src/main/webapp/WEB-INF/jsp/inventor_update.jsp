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
<title>龙图腾专利管家——添加地址</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>

<script src="<s:url value='/static/js/jquery.validate.min.js'/>"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>"></script>

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
					<form action="<s:url value='/inventor/updContactInfo.html'/>" method="post" onsubmit="return check()">
					  <se:csrfInput/>
			       	<h5>姓名:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="numberRece" type="text" value="${inventor.inventorName }" name="inventorName" required onblur="validateInfoNumber(this.value)"/>
					<span style="color: red; display: none;" id=numberError>该处应输入不大于20字段</span>
					<br>	   
					<h5>证件号码:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="phoneRece" type="text" value="${inventor.inventorNumber }" name="inventorNumber" required onblur="validatePhoneNumber(this.value)"/>
					<span style="color: red; display: none;" id=phoneError>请输入正确的证件号码</span>
					<br>		  
			       	<h5>国籍:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="numberRece1" type="text" value="${inventor.inventorNationality }" name="inventorNationality" value="中国" required onblur="validateInfoNumber1(this.value)"/>
					<span style="color: red; display: none;" id=numberError1>该处应输入不大于20字段</span>
					<br>		  
			       	<h5>电话:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="numberRece2" type="text" value="${inventor.inventorMobile }" name="inventorMobile" required onblur="validateInfoNumber2(this.value)"/>
					<span style="color: red; display: none;" id=numberError2>请输入正确的电话号码</span>
					<br>		  
			       	<h5>邮箱:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="numberRece3" type="text" value="${inventor.inventorEmail }" name="inventorEmail" required onblur="validateInfoNumber3(this.value)"/>
					<span style="color: red; display: none;" id=numberError3>请输入正确的邮箱</span>
					<br>
					<h5>其他信息:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="commentRece" type="text" value="${inventor.inventorComment }" name="inventorComment"  onblur="validateCommentNumber(this.value)"/>
					<span style="color: red; display: none;" id=commentError>该处应输入不大于50字段</span>
					<br>      
					<input type="hidden" value="${inventor.inventorId}" name="inventorId">
					<div style="height:20px;"></div> 
					<button type="submit" style="width:90px;" class="button button-primary  button-rounded">保存</button>
					</form>				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>	
<script type="text/javascript">
function validatePhoneNumber(phoneNumber) {
	var reg = new RegExp("^[0-9]*$");
	document.getElementById("phoneError").style.display = "none";

		if ( phoneNumber.length>20) {
			document.getElementById("phoneError").style.display = "";
			return false;
		} else {
			return true;
		}
	} 



function validateInfoNumber1(phoneNumber) {
	var reg = new RegExp("^[0-9]*$");
	document.getElementById("numberError1").style.display = "none";
		if (phoneNumber.length>20) {
			document.getElementById("numberError1").style.display = "";
			return false;
		} else {
			return true;
		}
}

function validateInfoNumber2(phoneNumber) {
	var reg = new RegExp("^[0-9]*$");
	document.getElementById("numberError2").style.display = "none";
	if (reg.test(phoneNumber)) {
		if (phoneNumber.length>20) {
			document.getElementById("numberError2").style.display = "";
			return false;
		} else {
			return true;
		}
	} else {
		document.getElementById("numberError2").style.display = "";
		return false;
	}
}

function validateInfoNumber3(phoneNumber) {
	var reg = new RegExp("^[0-9]*$");
	document.getElementById("numberError3").style.display = "none";
	if (reg.test(phoneNumber)) {
		if (phoneNumber.length>20) {
			document.getElementById("numberError3").style.display = "";
			return false;
		} else {
			return true;
		}
	}
}

function validateInfoNumber(phoneNumber) {
	var reg = new RegExp("^[0-9]*$");
	document.getElementById("numberError").style.display = "none";

		if (phoneNumber.length>20) {
			document.getElementById("numberError").style.display = "";
			return false;
		} else {
			return true;
		}
	} 
	


function validateCommentNumber(phoneNumber) {
	var reg = new RegExp("^[0-9]*$");
	document.getElementById("phoneError").style.display = "none";
		if (phoneNumber.length>50) {
			document.getElementById("commentError").style.display = "";
			return false;
		} else {
			return true;
		}
}

function check() {
	 var phone = document.getElementById("phoneRece").value;  
	 var number=document.getElementById("numberRece").value;
	 var number1=document.getElementById("numberRece1").value;
	 var number2=document.getElementById("numberRece2").value;
	 var number3=document.getElementById("numberRece3").value;
	 var comment=document.getElementById("commentRece").value;
	if(validatePhoneNumber(phone)&validateInfoNumber(number)
			&validateInfoNumber1(number1)
			&validateInfoNumber2(number2)
			&validateInfoNumber3(number3)
			&validateCommentNumber(comment)){
		return true;
	}else {
		return false;
	}	
}
</script>

</body>
</html>