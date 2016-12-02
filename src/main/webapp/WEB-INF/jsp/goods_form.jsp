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
<title>龙图腾专利管家——上架专利</title>
	<%@ include file="_css.jsp" %>
	<script src="<s:url value='/temp/js/jquery.js'/>" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="<s:url value='/static/js/jquery.autocomplete.css'/>"/>
    <script type="text/javascript" src="<s:url value='/static/js/jquery.autocomplete.js'/>"></script>
    <script src="<s:url value='/temp/js/jquery_from.js'/>" type="text/javascript"></script>
</head>
<body>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav2.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding:20px;">
					<form action="<s:url value='/patent/addGoods.html'/>" method="post">
					  <se:csrfInput/>
					  <div style="margin-top:15px;">专利名:
					  	<input style="width:400px;" class="selectPointOfInterest form-control" readonly type="text" style="height:25px;width:80px;" value="${patent.name}"/>
					  </div>
					  <input type="hidden"  name="id" value="${patentId}" id="patentId"/>
					  <div style="margin-top:15px;"> 商品类型：
						<select name="FirstColumn" id="first_column" style="width:400px;" class="form-control" onchange="loadSecoundColumns()" required>
						  <option value=''>请选择</option>
						  <c:forEach items="${FirstColumns}" var="FirstColumn">
							<option value="${FirstColumn.id}">${FirstColumn.name}</option>
						  </c:forEach>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="SecondColumn" id="second_column"  style="width:400px;" class="form-control" required>
						  <option value=''>请选择</option>
						</select>
					  </div>
					  <div style="margin-top:15px;"> 交易类型:
					    
					  	<input type="radio" name="transactionType" value="1" checked="checked">转让
					  	<input type="radio" name="transactionType" value="2" >许可
					  </div>
					  <div style="margin-top:15px;"> 价格：
						<input style="width:400px;" class="selectPointOfInterest form-control" type="text" style="height:25px;width:80px;" name="price" id="price" required/>
					  </div>
					  <div style="margin-top:15px;"> 转让方：
						<input style="width:400px;" class="selectPointOfInterest form-control" type="text" style="height:25px;width:80px;" name="transferor" id="transferor" value="${ownerName}" required/>
					  </div>
					  <div style="margin-top:15px;"> 专利图片:<br/>
					  	<input type="hidden"  id="patentImageUrlHidden" name="patentImageUrl" />
					  	<input type="text" style="display: inline;width:330px;" class="selectPointOfInterest form-control" id="patentImageUrl" readonly="readonly"  onclick="$('#patentImageBtn').click()"/>
					  	<button type="button" class="btn btn-default" onclick="uploadImageForm()" style="margin-left:5px;width:60px;">上传</button>
					  </div>
					  <div style="margin-top:15px;">
						<button style="margin:8px;" type="submit" class="btn btn-info btn-sm">发布交易</button>
					  </div>
					</form>
					<form action="<s:url value='/patent/uploadPatentImage.html'/>" method="post" enctype="multipart/form-data" class="form-horizontal" id="patentImageForm">
						<input type="file" style="display: none" id="patentImageBtn" name="file"/>
						<!-- <button type="button" id="uploadPatentImageBtn" style="display:none" onclick="uploadPatentImageFile()"></button> -->
					</form>
				</div>

				
				
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>



</div>
<script src="<s:url value='/static/js/jquery.validate.min.js'/>" type="text/javascript"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>" type="text/javascript"></script> 

<script type="text/javascript">
function loadSecoundColumns() {
	var first_column = $("#first_column").val();

	resetSelect($("#second_column"));
	
	if (first_column != "") {
		$.ajax({
			url: "<s:url value='/patent/getGoodsSecoundColumn.html'/>?first_column=" + first_column,
			type: 'get',
			dataType: 'json',
			success: function(SecondColumns) {
				var second_column = $("#second_column");
				
				resetSelect(second_column);
				addOptions(second_column, SecondColumns);
			}
		})
	}
}

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

</script>
<script type="text/javascript">
	$('#patentImageBtn').change(function(){
		$('#patentImageUrl').val($(this).val());
		
	})

	function uploadImageForm(){
		var form=$('#patentImageForm');
		var option={
				dataType : "text",
				type:"POST",
				data:{"file":$('#patentImageBtn').val(),"patentId":$("#patentId").val()},
				beforeSubmit:function(){
					var filename = $('#patentImageBtn').val();
					var suffix = filename.substr(filename.lastIndexOf(".")+1).toLowerCase();
					
					if(suffix=="jpg"||suffix=="jpeg"||suffix=="png"){
						return true;
					}else{
						alert("目前只支持jpg、jpeg、png图片格式上传哦,请确认格式后再上传！");
						return false;
					}
				},
				success:function(imageUrl){
					alert(imageUrl);
					$('#patentImageUrlHidden').val(imageUrl);
					alert("上传成功");
				},
				error:function(){
					alert("发生未知错误，请联系管理员！");
				}
		};
		
		form.ajaxSubmit(option);
	}
</script>
</body>
</html>