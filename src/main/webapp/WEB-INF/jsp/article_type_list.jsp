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
<script type="text/javascript" src="<s:url value='/temp/js/jquery_from.js'/>"></script>
<script src="<s:url value='/static/js/jquery.validate.min.js'/>"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>"></script>

<title>龙图腾专利管家-文章分类</title>
<%@ include file="_css.jsp" %>

</head>
<body>
<%@ include file="_top.jsp" %>
<div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_article.jsp" %>
		  </div>
	<div class="tit_top">
        <div class="title2">
          文章分类</div>
               
    </div>
		<div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right" style="padding:10px 0 0 3px;" >
				    <div class="cl top1" style="height:10px;">
				    
					  <form class="form-inline" action="<s:url value='/article/addArticleType.html'/>" method="get">
						  <div class="t-third">
						  <table class="search-table">
							  <tr>
							  <td>
								<input style="width:450px;height:34px;" name="keyword" id="keywordId" value="" placeholder="输入新的分类名称" class="t-input form-control"/>							  
							  </td>
							  <td>
							  <button class="button button-caution button-rounded" type="submit" style="width:80px;">添加</button>
							  </td>
							  </tr>							  
						  </table>
						  </div>
						</form>

    			</div>
				<div style="height:10px;"></div>
					<div class="lt-box" style="padding:30px 0 0 0;">
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="width:1100px;">
						  <thead>
							<tr class="simple_bag">
							  <th class="center" width="40px">序号</th>
							  <th width="100px">分类名称</th>
							  <th width="110px">操作</th>
							</tr>
						  </thead>
						  <tbody>
							<c:forEach items="${allArticleTypes}" var="articleType" varStatus="status">
							  <tr>
								<td class="center" style="text-align:center"> ${status.count}</td>
								<td style="text-align:center;vertical-align:middle;">
								  <input type="text" class="form-control" value="${articleType.typeName}" onChange="updateArticleType('${articleType.typeId}', this.value)" style="width:300px;" required maxLength="50">
								</td>
								
								<td style="text-align:center">
								<a onclick="return confirm('确定删除吗？')" href="javascript:deleteArticleType(${articleType.typeId})">删除分类</a>
								
								</td>
							  </tr>
							</c:forEach>
						  </tbody>
						</table>
						</div>
						
					</div>
				</div>
				

<script type="text/javascript">

	$('tr th input.check-item').click(function() {
		var checked = $(this).prop("checked");
		
		if (checked) {
			$('tr td input.check-item').each(function() {
				$(this).prop("checked", true);
			});
		} else {
			$('tr td input.check-item').each(function() {
				$(this).prop("checked", false);
			});
		}
	});
	
	$('tr td input.check-item').click(function() {
		var allChecked = true;
		var friendCheckboxes = $('tr td input.check-item');
		
		if ($(this).checked) {
			for (var i = 0; i < friendCheckboxes.length; i++) {
				if (!friendCheckboxes[i].checked) {
					allChecked = false;
					break;
				}
			}			
		} else {
			allChecked = false;
		}
		
		if (allChecked) {
			$('tr th input.check-item').prop("checked", true);
		} else {
			$('tr th input.check-item').prop("checked", false);
		}
	});
	
</script>

<script type="text/javascript">
	function deleteArticleType(typeId){
		$.ajax({
			url:"<s:url value='/article/deleteArticleType.html'/>",
			data:{"typeId":typeId},
			async:false,
			success:function (result){
				alert(result);
			}
		});
		
		location.reload();
	}
	
	function updateArticleType(typeId,typeName){
		$.ajax({
			url : "<s:url value='/article/updateArticleType.html'/>?typeId="+ typeId + "&typeName=" + typeName,
			type : "get",
			success : function(date) {
				location.reload();
			}
		})
		
	}
</script>
</body>
</html>