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
<title>龙图腾专利管家-商标列表</title>
<%@ include file="_css.jsp" %>

</head>
<body>
<script src="<s:url value='/temp/js/jquery_from.js'/>"></script>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >
		<div class="row" style="margin-left:-30px;min-width:1100px;">
			  <div class="col-xs-1 sidebar" style="min-width:100px;">
				<%@ include file="_left_nav_brand.jsp" %>
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
							<form method="post" action="<s:url value='/brand/brandAdd.html'/>">
								<table class="table_con">
									<tbody>
									
									<tr>
										<th width="110">商标分类</th>
										<td>
											<%-- <input name="id" value="${articleId }" type="hidden"/> --%>
											<select name="brandCategory.categoryId" class="form-control" style="width:120px;" required>
												<option value="">--请选择--</option>
												  <c:forEach items="${categorys }" var="category">
												  	<option value="${category.categoryId }">${category.categoryName }</option>
												  </c:forEach>					
											</select> 	
										</td>
									</tr>
									<tr>
										<th>标题</th>
										<td>
											<input class="form-control" style="width:600px;" placeholder="请输入标题" name="name" required maxlength="50"/>
										</td>
									</tr>
									<tr>
										<th>申请号</th>
										<td>
										<input class="form-control" style="width:600px;" placeholder="请输入申请号" name="brandNo" required maxlength="30"/>
										</td>
									</tr>						
									<tr>
										<th>类似群号</th>
										<td>
											<input class="form-control" style="width:600px;" placeholder="" name="similarNo" maxlength="100"/>
										</td>
									</tr>								
									<tr>
										<th>价格</th>
										<td>
											<input class="form-control" type="number" style="width:600px;" placeholder="" name="price" maxlength="120" required/>
										</td>
									</tr>
									<tr>
										<th>交易类型</th>
										<td>
											<select name="transactionMode" class="form-control" style="width:120px;" required>
												<option value="">--请选择--</option>
												  	<option value="1" selected="selected">转让</option>
												  	<option value="2">授权</option>
											</select> 	
										</td>
									</tr>		
									<tr>
										<th>专有权人</th>
										<td>
											<input class="form-control" style="width:600px;" placeholder="" name="appPerson" maxlength="120"/>
										</td>
									</tr>									
									<tr>
										<th>核定使用商品</th>
										<td>
											<input class="form-control" style="width:600px;" placeholder="" name="scope" maxlength="100"/>
										</td>
									</tr>
									<tr>
										<th>申请日</th>
										<td>
											<input style="width:200px;" type="text" class="form-control" 
												name="appDate"  readonly="readonly" onclick="javascript:$('#app_date_img').click()" id="appDateId" required> 
											<img style="display:none;" onclick="WdatePicker({el:'appDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="25" height="30" id="app_date_img">
											
										</td>
									</tr>
									<tr>
										<th>公告日</th>
										<td>
											<input style="width:200px;" type="text" class="form-control" 
												name="publishDate"  readonly="readonly" onclick="javascript:$('#publish_date_img').click()" id="publishAppDateId" required> 
											<img style="display:none;" onclick="WdatePicker({el:'publishAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="25" height="30" id="publish_date_img">
											
										
										</td>
									</tr>								
									<tr>
										<th>专用权截止日</th>
										<td>
											<input style="width:200px;" type="text" class="form-control" 
												name="endDate"  readonly="readonly" onclick="javascript:$('#end_date_img').click()" id="endAppDateId" required> 
											<img style="display:none;" onclick="WdatePicker({el:'endAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="25" height="30" id="end_date_img">
											
										
										</td>
									</tr>							
	
									<tr>
										<th>商标创意</th>
										<td>
											<input class="form-control" style="width:600px;" placeholder="" name="originality" maxlength="100"/>
										</td>
									</tr>
									
									<tr>
										<th>上传图片</th>
										<td>
											<input type="hidden" class="form-control" style="width:600px;" maxlength="100" id="brandEntrustFileHidden" name="imageUrl" />
											<input style="width:200px;display:inline;" type="text" id="brandEntrustFilename"  class="selectPointOfInterest form-control" placeholder="请选择图片" readonly="readonly" onclick="$('input[id=brandEntrustFile]').click();" required="required"/>
											<button type="button" onclick="uploadEntrustClick()" class="t-btn3 button button-primary  button-rounded">上传</button>
										</td>
									</tr>		
									</tbody>
								</table>	
							<div class="form-actions">
								<button type="submit" style="display:inline;margin-left:500px;" class="t-btn3 button button-primary  button-rounded">提交</button>
								
							</div>		
							</form>
							<form action="<s:url value='/brand/uploadbrandEntrustFile.html'/>" id="uploadEntrustFileForm" method="post" enctype="multipart/form-data" class="form-horizontal">
								<input style="display:none" type="file" id="brandEntrustFile" name="file"/>
								<button type="button" id="uploadEntrustBtn" style="display:none;" onclick="uploadBrandEntrustFile()" class="t-btn3 button button-primary  button-rounded">上传</button>
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
				var filename = $("#brandEntrustFilename").val();
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
				$("#brandEntrustFilename").val("");
				alert("上传成功");
				}
			}
	}
	uploadForm.ajaxSubmit(option);
}

$('input[id=brandEntrustFile]').change(function(){
	$("#brandEntrustFilename").val($(this).val());
})

function uploadEntrustClick(){
	$("#uploadEntrustBtn").trigger("click");
}
</script>

</body>
</html>