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
<script src="<s:url value='/temp/js/jquery_from.js'/>"></script>

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
					<form action="<s:url value='/inventor/addInventorInfo.html'/>" method="post" onsubmit="return check()">
					  <se:csrfInput/>
			       	<h5>姓名:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="numberRece" type="text" placeholder="*必填" name="inventorName" required onblur="validateInfoNumber(this.value)"/>
					<span style="color: red; display: none;" id=numberError>该处应输入不大于200字段</span>
					<br>	   
					<h5>证件号码:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="phoneRece" type="text" placeholder="*必填" name="inventorNumber"  onblur="validatePhoneNumber(this.value)"/>
					<span style="color: red; display: none;" id=phoneError>请输入正确的证件号码</span>
					<br>		  
			       	<h5>国籍:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="numberRece1" type="text"  name="inventorNationality" value="中国"  onblur="validateInfoNumber1(this.value)"/>
					<span style="color: red; display: none;" id=numberError1>该处应输入不大于20字段</span>
					<br>		  
			       	<h5>电话:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="numberRece2" type="text" name="inventorMobile"  onblur="validateInfoNumber2(this.value)"/>
					<span style="color: red; display: none;" id=numberError2>请输入正确的电话号码</span>
					<br>		  
			       	<h5>邮箱:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="numberRece3" type="text" name="inventorEmail"  onblur="validateInfoNumber3(this.value)"/>
					<span style="color: red; display: none;" id=numberError3>请输入正确的邮箱</span>
					<br>
					<h5>其他信息:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="commentRece" type="text" name="inventorComment" value="公布发明人" onblur="validateCommentNumber(this.value)"/>
					<span style="color: red; display: none;" id=commentError>该处应输入不大于50字段</span>
					<br>
					<h5>附件:</h5>
					<input type="hidden" id="patentDocInventorFileHidden" name="inventorUrl" />
					<input style="width:300px;display:inline;" type="text" id="patentDocInventorFilename"  class="selectPointOfInterest form-control" placeholder="请选择文件" readonly="readonly" onclick="$('input[id=patentDocInventorFile]').click();" required/>
					<button type="button" onclick="uploadInventorClick()" class="t-btn3 button button-primary  button-rounded">上传</button>      
					<div style="height:20px;"></div> 
					<button type="submit" style="width:90px;" class="button button-primary  button-rounded">保存</button>
					</form>
					<form action="<s:url value='/petition/uploadPatentDocInventorFile.html'/>" id="uploadInventorFileForm" method="post" enctype="multipart/form-data" class="form-horizontal">
						<input style="display:none" type="file" id="patentDocInventorFile" name="file"/>
						<button type="button" style="display: none;" onclick="$('input[id=patentDocInventorFile]').click();" class="t-btn3 button button-primary  button-rounded">浏览</button>
						<button type="button" id="uploadInventorBtn" style="display:none;" onclick="uploadPatentDocInventorFile()" class="t-btn3 button button-primary  button-rounded">上传</button>
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
	
		if (phoneNumber.length>20) {
			document.getElementById("numberError2").style.display = "";
			return false;
		} else {
			return true;
		}
}

function validateInfoNumber3(phoneNumber) {
	var reg = new RegExp("^[0-9]*$");
	document.getElementById("numberError3").style.display = "none";
	
		if (phoneNumber.length>30) {
			document.getElementById("numberError3").style.display = "";
			return false;
		} else {
			return true;
		}
}

function validateInfoNumber(phoneNumber) {
	var reg = new RegExp("^[0-9]*$");
	document.getElementById("numberError").style.display = "none";

		if (phoneNumber.length>200) {
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

$('input[id=patentDocInventorFile]').change(function() {  
	$('#patentDocInventorFilename').val($(this).val());  
})

function uploadPatentDocInventorFile(){
	var uploadForm=$("#uploadInventorFileForm");
	var option={
			dataType : "json",
			data : {"file":$("#patentDocInventorFile").val()},
			beforeSubmit : function (){
				var filename = $("#patentDocInventorFilename").val();
				var suffix = filename.toLowerCase().substr(filename.lastIndexOf("."));
				if(suffix ==".zip"||suffix==".rar"){
					return true;
				}else{
					alert("请选择rar或zip文件类型后，再进行上传");
					return false;
				}
			},
			success : function (result){
				$("#patentDocInventorFileHidden").val(result);
				$("#patentDocInventorFilename").val("");
				alert("上传成功");
			}
	}
	uploadForm.ajaxSubmit(option);
}

function uploadInventorClick(){
	$("#uploadInventorBtn").trigger("click");
}
</script>

</body>
</html>