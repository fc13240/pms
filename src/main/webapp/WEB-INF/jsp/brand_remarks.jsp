<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s"%>
<%@ taglib uri="security" prefix="se"%>
<%@ taglib uri="c" prefix="c"%>
<%@ taglib uri="fmt" prefix="fmt"%>
<%@ taglib uri="spring-form" prefix="form"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<script src="<s:url value='/static/js/sweetalert.min.js'/>"></script>
<link rel="stylesheet" type="text/css"
	href="<s:url value='/static/css/sweetalert.css'/>">
<title>龙图腾专利管家——商标备注</title>
<%@ include file="_css.jsp"%>
<style type="text/css">
	.textarea {
		height: 150px;
		width: 800px;
	}
	
	.tdstyle {
		padding:5px;
		
	}
}
</style>
</head>
<body>
	<%@ include file="_top.jsp"%>
	<div class="lt-con" style="min-width: 900px;">
		<div class="container-fluid">

			<div class="row" style="margin-left: -30px; min-width: 900px;">

				<!--left begin-->
				<div class="col-xs-1 sidebar" style="min-width: 100px;">
					<%@ include file="_left_nav_brand_management.jsp"%>
				</div>
				<!--left end-->
				<!--right begin-->
				<div class="col-xs-offset-1 col-xs-11">
					<div class="lt-right">
						<div style="height: 10px;"></div>
						<div class="lt-box" style="padding: 20px; height: 400px;">
							<div style="height: 20px"></div>
							<div class="lt-box" style="width: 800px;">
								<table id="simple-table"
									class="table table-striped table-bordered table-hover"
									style="word-break: break-all;width:800px;" >
									<c:forEach items="${brandRemarks}" var="remark">
										<tr class="simple_bag">
											<td class="tdstyle">用户：${remark.user.username}</td>
											<td class="tdstyle">备注时间：<fmt:formatDate value="${remark.remarkTime}"
													pattern="yyyy-MM-dd HH:mm:ss" />
											</td>
										</tr>
										<tr>
											<td colspan="2" class="tdstyle">内容：${remark.content}</td>
										</tr>
									</c:forEach>
								</table>
								<div>
								<textarea rows="5" cols="100" id="content_area" class="textarea"
									style="resize: none;" placeholder="在这里添加备注："></textarea>
								<br/><br/>	
								 <button class="button button-caution button-rounded" onclick="addBrandRemark()">添加</button> 
							</div>
							</div>
						</div>
					</div>
				</div>
				<!--right end-->

			</div>
		</div>
	</div>
	<script type="text/javascript">
		function addBrandRemark() {
			var brandId = ${brandId};
			var content = document.getElementById('content_area').value;
			if (content != null && content != "") {
				$.ajax({
					url : "<s:url value='/brand/saveBrandRemark.html'/>?content="+ content + "&brandId=" + brandId,
					type : "post",
					success : function(date) {
						alert('添加备注成功');
						location.reload();
					},
					error : function() {
						alert("添加备注失败，请重新操作一次!");
					}
				})
			}
		}
	</script>

</body>
</html>

