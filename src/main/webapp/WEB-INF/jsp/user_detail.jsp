<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s"%>
<%@ taglib uri="security" prefix="se"%>
<%@ taglib uri="c" prefix="c"%>
<%@ taglib uri="fmt" prefix="fmt"%>
<%@ taglib uri="spring-form" prefix="form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<c:set var="base" value="<%=basePath%>" scope="application"></c:set>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<title>龙图腾专利管家——基本信息</title>
<%@ include file="_css.jsp"%>
</head>
<body>
<script src="<s:url value='/temp/js/jquery_from.js'/>"></script>
<%@ include file="_top.jsp"%>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_user.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding:20px;float: left">
					<form action="<s:url value='/user/updateUserDetail.html'/>"
						method="POST" onsubmit="return check()">
						<h5>真实姓名/名称：</h5>
						<input class="ipt form-control" type="text" name="name" id="name"
							style="height: 40px; width: 300px;" value="${user.name}"
							maxlength="30">
		
						<h5>电子邮件：</h5>
						<input class="email form-control" name="email" id="email" type="email"
							style="height: 40px; width: 300px;" value="${user.email}"
							maxlength="25" onblur="validateEmail(this.value)"> <span
							style="color: red; display: none;" id=emailError>请输入正确的邮件地址</span>
						<br>
						<h5>手机或电话号：</h5>
						<input style="width:300px;" class="phone form-control" name="phone" id="phone" type="text"
							minlength="6" maxlength="15" value="${user.phone}"
							onblur="validatePhoneNumber(this.value)"> <span
							style="color: red; display: none;" id=phoneError>请输入正确的手机或者电话号</span>
						<br>
						<h5>QQ号码：</h5>
						<input style="width:300px;" class="phone form-control" name="qq" id="QQNumber" type="text"
							value="${user.qq}"
							onblur="validateQQNumber(this.value)"> 
							<span style="color: red; display: none;" id="QQNumberError">请输入正确的QQ号码</span>
						<br>
						<h5>微信号：</h5>
						<input style="width:300px;" class="phone form-control" name="weChat" id="WeChatNumber" type="text"
							value="${user.weChat}"> 
							<span style="color: red; display: none;" id="WeChatNumberError">请输入正确的微信号</span>
						<br>
						<h5>个人头像(<span style="color:red">图片大小不能超过300KB)</span>：</h5>
						<input type="hidden" id="userPhotoFileHidden" name="avatarUrl" value="${user.avatarUrl}" />
						<input style="display:inline;width:217px;" type="text" id="userPhotoFilename"  class="selectPointOfInterest form-control" placeholder="请选择文件" readonly="readonly" onclick="$('input[id=userPhotoFile]').click();"/>
						<button type="button" onclick="uploadUserPhotoFile();" class="t-btn3 button button-primary  button-rounded">上传</button>
						<div style="height: 20px;"></div>
		
						<button type="submit" style="width: 90px;" class="button button-primary  button-rounded">保存</button>
					</form>
					<form action="<s:url value='/user/uploadUserPhoto.html'/>" id="uploadUserPhotoForm" method="post" enctype="multipart/form-data" class="form-horizontal">
						<input style="display:none" type="file" id="userPhotoFile" name="file"/>
						<button type="button" style="display: none;" onclick="$('input[id=userPhotoFile]').click();" class="t-btn3 button button-primary  button-rounded">浏览</button>
					</form>		
				</div>
				<div style="float: left;margin-top:20px;margin-left:50px;">
					<div id="userAvatarTitle">
						<c:if test="${not empty user.avatarUrl }">
						<h4>头像预览</h4>
						</c:if>
					</div>
					<div id="userAvatarDiv">
					<c:if test="${not empty user.avatarUrl }">
						<img alt="" src="${base}${user.avatarUrl}" width="160px" height="200px">
					</c:if>
					</div>
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>




	<script type="text/javascript">
		function updateDetail() {
			var username = $("#username").val();
			var name = $("#name").val();
			var email = $("#email").val();
			var phone = $("#phone").val();
			var url = "<s:url value='/user/updateUserDetail.html'/>?username="
					+ username + "&name=" + name + "&email=" + email
					+ "&phone=" + phone;
			location.href = url
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
		
		function validateQQNumber(QQNumber) {
			var reg = new RegExp("^[0-9]*$");
			document.getElementById("QQNumberError").style.display = "none";
			if (reg.test(QQNumber)) {
					return true;
			} else {
				document.getElementById("QQNumberError").style.display = "";
				return false;
			}
		}

		function validateEmail(email) {
			var CheckMail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
			var reg = new RegExp(CheckMail);
			document.getElementById("emailError").style.display = "none";
			if (!reg.test(email)) {
				document.getElementById("emailError").style.display = "";
				return false;
			} else {
				return true;
			}
		}

		function check() {
			var email = document.getElementById("email").value;
			var phone = document.getElementById("phone").value;
			var QQNumber = document.getElementById("QQNumber").value;
			if (validatePhoneNumber(phone) && validateEmail(email)&&validateQQNumber(QQNumber)) {
				return true;
			} else {
				return false;
			}
		}
		
	$('input[id=userPhotoFile]').change(function(){
		$("#userPhotoFilename").val($(this).val());
	})

	
	var isIE = /msie/i.test(navigator.userAgent) && !window.opera;	
	
	function uploadUserPhotoFile(){
		var uploadPhotoForm=$("#uploadUserPhotoForm");
		var option={
				dataType:"json",
				data:{"file":$("#userPhotoFile").val()},
				beforeSubmit:function(){
					var fileName=$("#userPhotoFilename").val();
					var suffix=fileName.toLowerCase().substr(fileName.lastIndexOf(".")+1);
					//fileChange($())
					if(suffix=="jpg"||suffix=="png"||suffix=="jpeg"){
						return true;
					}else{
						alert("请选择常用的图片格式，如jpg、png、jpeg格式，再进行上传！");
						return false;
					}
				},
				success : function (result){
					if(result=="overLimit"){
						alert("上传的图片超过300KB,请选择较小的图片进行上传");
					}else{
						$("#userPhotoFileHidden").val(result);
						var base = "${base}";
						$("#userAvatarDiv").empty();
						$("#userAvatarTitle").html("<h4>头像预览</h4>");
						$("#userAvatarDiv").html("<img alt='' src="+base+result+" width='160px' height='200px'>");
					}
				}
				
		};
		uploadPhotoForm.ajaxSubmit(option);
	}
	
   /*  function fileChange(target){
	        var fileSize = 0;
	        if (isIE && !target.files) {
	        	var filePath = target.value; 
	        	var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
	        	var file = fileSystem.GetFile(filePath);
	            fileSize = file.Size;    // 文件大小，单位：b
	        } else {    // 非IE浏览器
	            fileSize = target.files[0].size;
	        }
	        var size = fileSize / 1024 / 1024;
	        if (size > 1) {
	            alert("附件不能大于1M");
	        }
	    } */
	</script>
</body>
</html>