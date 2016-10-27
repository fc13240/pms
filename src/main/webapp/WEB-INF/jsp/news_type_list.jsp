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

<title>龙图腾专利管家-新闻分类</title>
<%@ include file="_css.jsp" %>

</head>
<body>
<%@ include file="_top.jsp" %>
<div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_article.jsp" %>
		  </div>
	<div class="tit_top">
        <div class="title2">
          新闻分类</div>
               
    </div>
		<div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right" style="padding:10px 0 0 3px;" >
				    <div class="cl top1" style="height:10px;">
				    
					  <form class="form-inline" action="<s:url value='/news/addNewsType.html'/>">
						  <div class="t-third">
						  <table class="search-table">
							  <tr>
							  <td>
								<input style="width:450px;height:34px;" name="typeName" placeholder="输入新的分类名称" class="t-input form-control"/>							  
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
							<c:forEach items="${newsTypes}" var="newsType" varStatus="status">
							  <tr>
								<td class="center" style="text-align:center"> ${status.count}</td>
								<td style="text-align:center;vertical-align:middle;">
								  <input type="text" class="form-control" value="${newsType.typeName}" onChange="updateNewsType('${newsType.typeId}', this.value)" style="width:300px;" required maxLength="50">
								</td>
								
								<td style="text-align:center">
								<a onclick="return confirm('确定删除吗？')" href="javascript:deleteNewsType(${newsType.typeId})">删除分类</a>
								
								</td>
							  </tr>
							</c:forEach>
						  </tbody>
						</table>
						</div>
						
					</div>
				</div>
<script type="text/javascript">
	function deleteNewsType(typeId){
		$.ajax({
			url:"<s:url value='/news/deleteNewsType.html'/>",
			data:{"typeId":typeId},
			async:false,
			success:function (result){
				alert(result);
			}
		});
		
		location.reload();
	}
	
	function updateNewsType(typeId,typeName){
		$.ajax({
			url : "<s:url value='/news/updateNewsType.html'/>",
			data:{"typeId":typeId,"typeName":typeName},
			success : function(date) {
				//location.reload();
			}
		})
		
	}
</script>
</body>
</html>