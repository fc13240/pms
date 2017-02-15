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
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<title>龙图腾专利管家-修改商标</title>
<%@ include file="_css.jsp" %>

</head>
<body>
<script src="<s:url value='/temp/js/jquery_from.js'/>"></script>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >
		<div class="row" style="margin-left:-30px;min-width:1100px;">
			  <div class="col-xs-1 sidebar" style="min-width:100px;">
				<%@ include file="_left_nav_brand_management.jsp" %>
			  </div>
			  <!--left end-->
			  <!--right begin-->
			  <div class="col-xs-offset-1 col-xs-11">
				<div class="lt-right">
					<div style="height:10px;"></div>
<style type="text/css">
.wrap {
    padding: 20px 20px 20px;
}
.nav-tabs1 {
height:37px;
    border-bottom: 1px solid #ddd;
}
.nav1 {
    margin-bottom: 20px;
    margin-left: 0;
    list-style: none;
}
.nav-tabs1>li {
    margin-bottom: -1px;
}


.nav-tabs1>li>a, .nav-pills>li>a {
    padding-right: 12px;
    padding-left: 12px;
    margin-right: 2px;
    line-height: 14px;
}
.nav-tabs1>li>a {
    padding-top: 8px;
    padding-bottom: 8px;
    line-height: 20px;
    border: 1px solid transparent;
    -webkit-border-radius: 4px 4px 0 0;
    -moz-border-radius: 4px 4px 0 0;
    border-radius: 4px 4px 0 0;
}
.nav1>li>a {
    display: block;
}
.nav-tabs1>li, .nav-pills>li {
    float: left;
}
.nav-tabs1>.active>a, .nav-tabs1>.active>a:hover, .nav-tabs1>.active>a:focus {
    color: #95a5a6;
    cursor: default;
    background-color: #fff;
    border: 1px solid #ddd;
    border-bottom-color: transparent;
}
.table_con{
    width: 100%;
    margin-bottom: 20px;
    border: 1px solid #ddd;
    border-collapse: separate;
    border-left: 0;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}
.table_con th, .table_con td {
    border-left: 1px solid #ddd;
}
.table_con th, .table_con td {
    vertical-align: middle;
}
.table_con th, .table_con td {
    padding: 8px;
    line-height: 20px;
    text-align: left;
    vertical-align: top;
    border-top: 1px solid #ddd;
}
</style>					
					
					<div class="hy_zx_r02">
						<div class="lou-content" style="padding:10px;">
							<form method="post" action="<s:url value='/brand/brandManagementUpdate.html'/>">
								<table class="table_con">
									<tbody> 
									
									<tr>
										<th width="110">商标分类</th>
										<td>
											<input name="id" type="hidden" value="${brand.id}"/>
											<c:forEach items="${categorys}" var="category" varStatus="status">
											<input <c:if test="${brand.brandCategory.categoryId==category.categoryId}">checked</c:if> type="radio" name="brandCategory.categoryId" value="${category.categoryId}"/>${category.categoryName}
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th>商标名称</th>
										<td>
											<input class="form-control" style="width:600px;" value="${brand.name}" placeholder="请输入商标名称" name="name" required maxlength="50"/>
										</td>
									</tr>
									<tr>
										<th>申请号</th>
										<td>
										<input class="form-control" style="width:600px;" value="${brand.appNo}" name="appNo"  maxlength="30"/>
										</td>
									</tr>
									<tr>
										<th>注册号</th>
										<td>
										<input class="form-control" style="width:600px;"  value="${brand.brandNo}" name="brandNo"  maxlength="30"/>
										</td>
									</tr>		
									<tr>
										<th>类似群号</th>
										<td>
											<input class="form-control" style="width:600px;" value="${brand.similarNo}" placeholder="请输入类似群号" name="similarNo" required maxlength="100"/>
										</td>
									</tr>								
									<tr>
										<th>价格</th>
										<td>
											<input class="form-control" type="number" style="width:600px;" value="${brand.price}" placeholder="" name="price" maxlength="120" required/>
										</td>
									</tr>
									<tr>
										<th>交易类型</th>
										<td>
											<select name="transactionMode" class="form-control" style="width:120px;" required>
												<option value="">--请选择--</option>
												  	<option <c:if test="${brand.transactionMode==1}">selected="selected"</c:if> value="1" >转让</option>
												  	<option <c:if test="${brand.transactionMode==2}">selected="selected"</c:if> value="2">授权</option>
											</select> 	
										</td>
									</tr>		
									<tr>
										<th>专有权人</th>
										<td>
											<input class="form-control" style="width:600px;" value="${brand.appPerson}" placeholder="请输入专有权人" name="appPerson" required maxlength="120"/>
										</td>
									</tr>									
									<tr>
										<th>指定商品</th>
										<td>
											<input class="form-control" style="width:600px;" value="${brand.scope}" placeholder="请输入指定商品" name="scope" required maxlength="100"/>
										</td>
									</tr>
									<tr>
										<th>申请日</th>
										<td>
											<input style="width:200px;" type="text"  value="<fmt:formatDate value="${brand.appDate}" pattern='yyyy-MM-dd'/>" class="form-control" 
												name="appDate"  readonly="readonly" onclick="javascript:$('#app_date_img').click()" id="appDateId" required> 
											<img style="display:none;" onclick="WdatePicker({el:'appDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="25" height="30" id="app_date_img">
											
										</td>
									</tr>
									<tr>
										<th>注册日</th>
										<td>
											<input style="width:200px;" type="text"  value="<fmt:formatDate value="${brand.publishDate}" pattern='yyyy-MM-dd'/>" class="form-control" 
												name="publishDate"  value="" readonly="readonly" onclick="javascript:$('#publish_date_img').click()" id="publishAppDateId" required> 
											<img style="display:none;" onclick="WdatePicker({el:'publishAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="25" height="30" id="publish_date_img">
											
										
										</td>
									</tr>								
									<tr>
										<th>法律状态</th>
										<td>
											<c:forEach items="${legalStatuss}" var="legalStatus" varStatus="status">
											<input <c:if test="${brand.brandLegalStatus.legalStatusId==legalStatus.legalStatusId}">checked</c:if> type="radio" name="brandLegalStatus.legalStatusId" value="${legalStatus.legalStatusId}"/>${legalStatus.legalStatusName}
											</c:forEach>
										</td>
									</tr>			
									<tr>
										<th>商标图样</th>
										<td>
											<input type="hidden" class="form-control" style="width:600px;" maxlength="100" value="${brand.imageUrl}" id="brandEntrustFileHidden" name="imageUrl" />
											<input style="width:200px;display:inline;" type="text" id="brandEntrustFileName"  class="selectPointOfInterest form-control" placeholder="请选择图片" readonly="readonly" onclick="$('input[id=brandEntrustFile]').click();" required="required"/>
											<button type="button" onclick="uploadEntrustClick()" class="t-btn3 button button-primary  button-rounded">上传</button>
										</td>
									</tr>

									<tr>
										<th>委托书</th>
										<td>
											<input type="hidden" class="form-control" style="width:600px;" maxlength="100" value="${brand.proxyFile}" id="brandProxyFileHidden" name="proxyFile" />
											<input style="width:200px;display:inline;" type="text" id="brandProxyFileName"  class="selectPointOfInterest form-control" placeholder="请选择pdf或图片" readonly="readonly" onclick="$('input[id=brandProxyFile]').click();" required="required"/>
											<button type="button" onclick="uploadProxyClick()" class="t-btn3 button button-primary  button-rounded">上传</button>
										</td>
									</tr>		
									
									<tr>
										<th>企业营业执照</th>
										<td>
											<input type="hidden" class="form-control" style="width:600px;" maxlength="100" value="${brand.businessLicense}" id="brandBusinessLicenseHidden" name="businessLicense" />
											<input style="width:200px;display:inline;" type="text" id="brandBusinessLicenseFileName"  class="selectPointOfInterest form-control" placeholder="请选择pdf或图片" readonly="readonly" onclick="$('input[id=brandBusinessLicenseFile]').click();" required="required"/>
											<button type="button" onclick="uploadBusinessLicenseClick()" class="t-btn3 button button-primary  button-rounded">上传</button>
										</td>
									</tr>		
									
									<tr>
										<th>事业单位执照</th>
										<td>
											<input type="hidden" class="form-control" style="width:600px;" maxlength="100" value="${brand.entityLicense}" id="brandEntityLicenseHidden" name="entityLicense" />
											<input style="width:200px;display:inline;" type="text" id="brandEntityLicenseFileName"  class="selectPointOfInterest form-control" placeholder="请选择pdf或图片" readonly="readonly" onclick="$('input[id=brandEntityLicenseFile]').click();" required="required"/>
											<button type="button" onclick="uploadEntityLicenseClick()" class="t-btn3 button button-primary  button-rounded">上传</button>
										</td>
									</tr>		
								
									<tr>
										<th>个体工商执照</th>
										<td>
											<input type="hidden" class="form-control" style="width:600px;" maxlength="100" value="${brand.individualLicense}" id="brandIndividualLicenseHidden" name="individualLicense" />
											<input style="width:200px;display:inline;" type="text" id="brandIndividualLicenseFileName"  class="selectPointOfInterest form-control" placeholder="请选择pdf或图片" readonly="readonly" onclick="$('input[id=brandIndividualLicenseFile]').click();" required="required"/>
											<button type="button" onclick="uploadIndividualLicenseClick()" class="t-btn3 button button-primary  button-rounded">上传</button>
										</td>
									</tr>
									
									<tr>
										<th>身份证正反面</th>
										<td>
											<input type="hidden" class="form-control" style="width:600px;" maxlength="100" value="${brand.identityCard}" id="brandIdentityCardHidden" name="identityCard" />
											<input style="width:200px;display:inline;" type="text" id="brandIdentityCardFileName"  class="selectPointOfInterest form-control" placeholder="请选择pdf或图片" readonly="readonly" onclick="$('input[id=brandIdentityCardFile]').click();" required="required"/>
											<button type="button" onclick="uploadIdentityCardClick()" class="t-btn3 button button-primary  button-rounded">上传</button>
										</td>
									</tr>			
									
									<tr>
										<th>申请书</th>
										<td>
											<input type="hidden" class="form-control" style="width:600px;" maxlength="100" value="${brand.application}" id="brandApplicationHidden" name="application" />
											<input style="width:200px;display:inline;" type="text" id="brandApplicationFileName"  class="selectPointOfInterest form-control" placeholder="请选择pdf或图片" readonly="readonly" onclick="$('input[id=brandApplicationFile]').click();" required="required"/>
											<button type="button" onclick="uploadApplicationClick()" class="t-btn3 button button-primary  button-rounded">上传</button>
										</td>
									</tr>
									
									<tr>
										<th>共享人</th>
										<td>
										<c:forEach items="${brand.shareUsers}" var="shareBrand" varStatus="status">	
											<span class='ss-item' id="shareUser${status.index}">${shareBrand.username}
												<se:authorize access="hasRole('ROLE_PLATFORM')">
												<a class='icon-btn-x' href="javascript: return void;"
													onclick="deleteShareUser(${brand.id},${shareBrand.userId},${status.index})" >								
													<img src="<s:url value='/temp/images/remove.png'/>" style="" />
												</a>
												 </se:authorize>	
											</span>		
								        </c:forEach>
										<br>
										</td>
									</tr>
									  									
									</tbody>
								</table>	
							<div class="form-actions">
								<button type="submit" style="display:inline;margin-left:500px;" class="t-btn3 button button-primary  button-rounded">提交</button>
								
							</div>		
							</form>
							<form action="<s:url value='/brand/uploadBrandManagementImageFile.html'/>" id="uploadEntrustFileForm" method="post" enctype="multipart/form-data" class="form-horizontal">
								<input style="display:none" type="file" id="brandEntrustFile" name="file"/>
								<button type="button" id="uploadEntrustBtn" style="display:none;" onclick="uploadBrandEntrustFile()" class="t-btn3 button button-primary  button-rounded">上传</button>
							</form>
							<form action="<s:url value='/brand/uploadBrandProxyFile.html'/>" id="uploadProxyFileForm" method="post" enctype="multipart/form-data" class="form-horizontal">
								<input style="display:none" type="file" id="brandProxyFile" name="file"/>
								<button type="button" id="uploadProxyFileBtn" style="display:none;" onclick="uploadProxyFile()" class="t-btn3 button button-primary  button-rounded">上传</button>
							</form>		
							<form action="<s:url value='/brand/uploadBrandBusinessLicenseFile.html'/>" id="uploadBusinessLicenseFileForm" method="post" enctype="multipart/form-data" class="form-horizontal">
								<input style="display:none" type="file" id="brandBusinessLicenseFile" name="file"/>
								<button type="button" id="uploadBusinessLicenseFileBtn" style="display:none;" onclick="uploadBusinessLicenseFile()" class="t-btn3 button button-primary  button-rounded">上传</button>
							</form>		
							<form action="<s:url value='/brand/uploadBrandEntityLicenseFile.html'/>" id="uploadEntityLicenseFileForm" method="post" enctype="multipart/form-data" class="form-horizontal">
								<input style="display:none" type="file" id="brandEntityLicenseFile" name="file"/>
								<button type="button" id="uploadEntityLicenseFileBtn" style="display:none;" onclick="uploadEntityLicenseFile()" class="t-btn3 button button-primary  button-rounded">上传</button>
							</form>		
							<form action="<s:url value='/brand/uploadBrandIndividualLicenseFile.html'/>" id="uploadIndividualLicenseFileForm" method="post" enctype="multipart/form-data" class="form-horizontal">
								<input style="display:none" type="file" id="brandIndividualLicenseFile" name="file"/>
								<button type="button" id="uploadIndividualLicenseFileBtn" style="display:none;" onclick="uploadIndividualLicenseFile()" class="t-btn3 button button-primary  button-rounded">上传</button>
							</form>
							<form action="<s:url value='/brand/uploadBrandIdentityCardFile.html'/>" id="uploadIdentityCardFileForm" method="post" enctype="multipart/form-data" class="form-horizontal">
								<input style="display:none" type="file" id="brandIdentityCardFile" name="file"/>
								<button type="button" id="uploadIdentityCardFileBtn" style="display:none;" onclick="uploadIdentityCardFile()" class="t-btn3 button button-primary  button-rounded">上传</button>
							</form>			
							<form action="<s:url value='/brand/uploadBrandApplicationFile.html'/>" id="uploadApplicationFileForm" method="post" enctype="multipart/form-data" class="form-horizontal">
								<input style="display:none" type="file" id="brandApplicationFile" name="file"/>
								<button type="button" id="uploadApplicationFileBtn" style="display:none;" onclick="uploadApplicationFile()" class="t-btn3 button button-primary  button-rounded">上传</button>
							</form>					
						</div>
						
					</div>					
					
					
					
			  </div>		
			  <!--right end-->	
			  
			</div>

	    </div>
	</div>
</div>
<script type="text/javascript">
function uploadBrandEntrustFile(){
	var uploadForm=$("#uploadEntrustFileForm");
	var option={
			dataType : "json",
			data : {"file":$("#brandEntrustFile").val()},
			beforeSubmit : function (){
				var filename = $("#brandEntrustFileName").val();
				var suffix = filename.toLowerCase().substr(filename.lastIndexOf(".")+1);
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
				$("#brandEntrustFileHidden").val(result);
				$("#brandEntrustFileName").val("");
				alert("上传成功");
				}
			}
	}
	uploadForm.ajaxSubmit(option);
}

$('input[id=brandEntrustFile]').change(function(){
	$("#brandEntrustFileName").val($(this).val());
})

function uploadEntrustClick(){
	$("#uploadEntrustBtn").trigger("click");
}

///上传委托书
function uploadBusinessLicenseFile(){
	var uploadForm=$("#uploadBusinessLicenseFileForm");
	var option={
			dataType : "json",
			data : {"file":$("#brandBusinessLicenseFile").val()},
			beforeSubmit : function (){
				var filename = $("#brandBusinessLicenseFileName").val();
				var suffix = filename.toLowerCase().substr(filename.lastIndexOf(".")+1);
				if(suffix=="pdf"||suffix=="jpg"||suffix=="png"||suffix=="jpeg"){
					return true;
				}else{
					alert("请上传pdf或格式如jpg、png、jpeg的图片！");
					return false;
				}
			},
			success : function (result){
				$("#brandBusinessLicenseHidden").val(result);
				$("#brandBusinessLicenseFileName").val("");
				alert("上传成功");
			}
	}
	uploadForm.ajaxSubmit(option);
}

$('input[id=brandBusinessLicenseFile]').change(function(){
	$("#brandBusinessLicenseFileName").val($(this).val());
})

function uploadBusinessLicenseClick(){
	$("#uploadBusinessLicenseFileBtn").trigger("click");
}

///上传事业单位营业执照

function uploadEntityLicenseFile(){
	var uploadForm=$("#uploadEntityLicenseFileForm");
	var option={
			dataType : "json",
			data : {"file":$("#brandEntityLicenseFile").val()},
			beforeSubmit : function (){
				var filename = $("#brandEntityLicenseFileName").val();
				var suffix = filename.toLowerCase().substr(filename.lastIndexOf(".")+1);
				if(suffix=="pdf"||suffix=="jpg"||suffix=="png"||suffix=="jpeg"){
					return true;
				}else{
					alert("请上传pdf或格式如jpg、png、jpeg的图片！");
					return false;
				}
			},
			success : function (result){
				$("#brandEntityLicenseHidden").val(result);
				$("#brandEntityLicenseFileName").val("");
				alert("上传成功");
			}
	}
	uploadForm.ajaxSubmit(option);
}

$('input[id=brandEntityLicenseFile]').change(function(){
	$("#brandEntityLicenseFileName").val($(this).val());
})

function uploadEntityLicenseClick(){
	$("#uploadEntityLicenseFileBtn").trigger("click");
}

///上传个体工商执照

function uploadIndividualLicenseFile(){
	var uploadForm=$("#uploadIndividualLicenseFileForm");
	var option={
			dataType : "json",
			data : {"file":$("#brandIndividualLicenseFile").val()},
			beforeSubmit : function (){
				var filename = $("#brandIndividualLicenseFileName").val();
				var suffix = filename.toLowerCase().substr(filename.lastIndexOf(".")+1);
				if(suffix=="pdf"||suffix=="jpg"||suffix=="png"||suffix=="jpeg"){
					return true;
				}else{
					alert("请上传pdf或格式如jpg、png、jpeg的图片！");
					return false;
				}
			},
			success : function (result){
				$("#brandIndividualLicenseHidden").val(result);
				$("#brandIndividualLicenseFileName").val("");
				alert("上传成功");
			}
	}
	uploadForm.ajaxSubmit(option);
}

$('input[id=brandIndividualLicenseFile]').change(function(){
	$("#brandIndividualLicenseFileName").val($(this).val());
})

function uploadIndividualLicenseClick(){
	$("#uploadIndividualLicenseFileBtn").trigger("click");
}

///上传身份证正反面

function uploadIdentityCardFile(){
	var uploadForm=$("#uploadIdentityCardFileForm");
	var option={
			dataType : "json",
			data : {"file":$("#brandIdentityCardFile").val()},
			beforeSubmit : function (){
				var filename = $("#brandIdentityCardFileName").val();
				var suffix = filename.toLowerCase().substr(filename.lastIndexOf(".")+1);
				if(suffix=="pdf"||suffix=="jpg"||suffix=="png"||suffix=="jpeg"){
					return true;
				}else{
					alert("请上传pdf或格式如jpg、png、jpeg的图片！");
					return false;
				}
			},
			success : function (result){
				$("#brandIdentityCardHidden").val(result);
				$("#brandIdentityCardFileName").val("");
				alert("上传成功");
			}
	}
	uploadForm.ajaxSubmit(option);
}

$('input[id=brandIdentityCardFile]').change(function(){
	$("#brandIdentityCardFileName").val($(this).val());
})

function uploadIdentityCardClick(){
	$("#uploadIdentityCardFileBtn").trigger("click");
}

///上传申请书
function uploadApplicationFile(){
	var uploadForm=$("#uploadApplicationFileForm");
	var option={
			dataType : "json",
			data : {"file":$("#brandApplicationFile").val()},
			beforeSubmit : function (){
				var filename = $("#brandApplicationFileName").val();
				var suffix = filename.toLowerCase().substr(filename.lastIndexOf(".")+1);
				if(suffix=="pdf"||suffix=="jpg"||suffix=="png"||suffix=="jpeg"){
					return true;
				}else{
					alert("请上传pdf或格式如jpg、png、jpeg的图片！");
					return false;
				}
			},
			success : function (result){
				$("#brandApplicationHidden").val(result);
				$("#brandApplicationFileName").val("");
				alert("上传成功");
			}
	}
	uploadForm.ajaxSubmit(option);
}

$('input[id=brandApplicationFile]').change(function(){
	$("#brandApplicationFileName").val($(this).val());
})

function uploadApplicationClick(){
	$("#uploadApplicationFileBtn").trigger("click");
}

</script>
<script type="text/javascript">
var mydateInput = document.getElementById("appDateId");
var date = new Date();
var dateString = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
mydateInput.value=dateString;
</script>

</body>
</html>