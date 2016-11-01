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
<c:import url="common/article_kindEditor.jsp"></c:import>
<title>添加新闻-龙图腾专利管家</title>
</head>
<body>
<script src="<s:url value='/temp/js/jquery_from.js'/>"></script>
<%@ include file="_top.jsp"%>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >
		<div class="row" style="margin-left:-30px;min-width:1100px;">
			  <div class="col-xs-1 sidebar" style="min-width:100px;">
				<%@ include file="_left_nav_article.jsp" %>
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
							<form method="post" action="<s:url value='/article/saveArticle.html'/>">
								<table class="table_con">
									<tbody>
									
									<tr>
										<th width="80">文章分类</th>
										<td>
											<input name="id" value="${articleId }" type="hidden"/>
											<select name="articleType.typeId" class="form-control" style="width:120px;" required>
												<option value="">--请选择--</option>
												<c:forEach items="${articleTypes }" var="articleType">
													<option value="${articleType.typeId }">${articleType.typeName }</option>
												</c:forEach>						
											</select> 
										</td>
									</tr>
									<tr>
										<th>标题</th>
										<td>
											<input class="form-control" style="width:600px;" placeholder="请输入标题" name="title" required maxlength="100"/>
										</td>
									</tr>
									<tr>
										<th>作者</th>
										<td>
										<input class="form-control" style="width:600px;" placeholder="请输入作者" name="author" required maxlength="100"/>
										</td>
									</tr>						
									<tr>
										<th>来源</th>
										<td>
											<input class="form-control" style="width:600px;" placeholder="" name="source" maxlength="100"/>
										</td>
									</tr>								
									<tr>
										<th>关键字</th>
										<td>
											<input class="form-control" style="width:600px;" placeholder="请输入关键字，多个关键字以“，”分隔" name="keywords" maxlength="100" required/>
										</td>
									</tr>
							<!-- 	<tr>
										<th>缩略图</th>
										<td>
											<input style="width:300px;display:inline;" type="text" id="articleThumbnailname"  class="selectPointOfInterest form-control" placeholder="请选择文件" readonly="readonly" onclick="$('input[id=articleThumbnail]').click();" />
											<button type="button" onclick="uploadImg()" class="t-btn3 button button-primary  button-rounded">上传</button>
										</td>
									</tr>
							 -->		
									<tr>
										<th>摘要</th>
										<td>
											<input class="form-control" style="width:600px;" placeholder="请输入摘要" name="articleAbstract" maxlength="100"/>
										</td>
									</tr>
									<tr>
										<th>内容</th>
										<td>
											<textarea rows="3" cols="10" id="articleContent" name="content" class="articleContent" style="width:520px;height:200px;visibility:hidden;" required></textarea>
										</td>
									</tr>
	
									</tbody>
								</table>	
							<div class="form-actions">
								<button type="submit" style="display:inline;margin-left:500px;" class="t-btn3 button button-primary  button-rounded">提交</button>
								
							</div>		
							</form>
							
							<form action="<s:url value='/article/uploadArticleThumbnail.html'/>" id="uploadarticleThumbnailForm" method="post" enctype="multipart/form-data" class="form-horizontal">
								<input style="display:none" type="file" id="articleThumbnail" name="file"/>
								<button type="button" style="display: none;" onclick="$('input[id=articleThumbnail]').click();" class="t-btn3 button button-primary  button-rounded">浏览</button>
								<button type="button" id="uploadThumbnailBtn" style="display:none;" onclick="uploadarticleThumbnail()" class="t-btn3 button button-primary  button-rounded">上传</button>
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
	$("#articleThumbnail").change(function(){
		$("#articleThumbnailname").val($(this).val());
	})
	
	function uploadarticleThumbnail(){
		var form=$("#uploadarticleThumbnailForm");
		var articleId=${articleId};
		var ajaxBody={
				type:"POST",
				data:{"file":$("#articleThumbnail").val(),"articleId":articleId},
				beforeSubmit:function (){
					var fileName=$("#articleThumbnail").val();
					var suffix=fileName.substr(fileName.lastIndexOf(".")+1);
					if(suffix=="jpg"||suffix=="jpeg"||suffix=="png"){
						return true;
					}else{
						alert("请上传图片格式为jpg、jpeg、png");
						return false;
					}
				},
				success:function(result){
					alert("上传成功!");
				}
		};
		form.ajaxSubmit(ajaxBody);
		
	}
	
	function uploadImg(){
		$("#uploadThumbnailBtn").trigger("click");
	}
</script>
</body>
</html>