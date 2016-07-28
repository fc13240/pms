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
<title>龙图腾专利管家——专利文档列表</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

<<<<<<< HEAD
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
					<!-- list beg -->
					<div class="t-third">
					<table width="100%" border="1" cellpadding="2" cellspacing="0">
						<thead>
							<tr class="simple_bag">
							  <th class="center" width="15"> <label class="pos-rel">
								<input type="checkbox" class="patent-check-item" id="checkall"  name="checkall" />
								<span class="lbl"></span> </label>
							  </th>
							  <th width="35">序号</th>
							  <th width="100">标题</th>
							  <th width="100">创建时间</th>
							  <th width="100">更新时间</th>
							  <th width="100">操作 </th>
							</tr>
						</thead>
				        <tbody>
				        	<c:forEach items="${patentDocs}" var="patentDoc" varStatus="status">
					        	<tr>
					        		<td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">
											  <input type="checkbox" class="patent-check-item" patent="<c:out value='${patentDoc.patentDocsId}'/>">
											  <span class="lbl"></span></label></td>
											<td class="center" style="text-align:center"> ${status.count} </td>
											<td style="text-align:center"><c:out value="${patentDoc.name}"/></td>
											<td style="text-align:center">
												<fmt:formatDate value="${patentDoc.createTime}" pattern="yyyy-MM-dd"/>
											</td>
											<td style="text-align:center">
												<fmt:formatDate value="${patentDoc.lastUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</td>
											<td style="text-align:center">
												<a target="_blank" href="<s:url value='/editor/findPatentDoc.html'/>?patentDocsId=<c:out value='${patentDoc.patentDocsId}'/>">
												 编辑
												  </a>
												  <a target="_blank" href="<s:url value=''/>">
												 预览
												  </a>
												  
												<a href="<s:url value='/editor/deletePatentDoc.html'/>?patentDocsId=<c:out value='${patentDoc.patentDocsId}'/>">
												 删除
												  </a>
												  <a target="_blank" href="<s:url value=''/>">
												 提出申请
												  </a>
											</td>
					        	</tr>
				        	</c:forEach>
				        </tbody>
				    </table>

					</div>				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>
=======
<body style="background-color: #FFF" id="dlstCircleArticle">
	<table width="100%" border="1" cellpadding="2" cellspacing="0">
		<thead>
			<tr class="simple_bag">
			  <th class="center" width="15"> <label class="pos-rel">
				<input type="checkbox" class="patent-check-item" id="checkall"  name="checkall" />
				<span class="lbl"></span> </label>
			  </th>
			  <th width="35">序号</th>
			  <th width="100">标题</th>
			  <th width="100">创建时间</th>
			  <th width="100">更新时间</th>
			  <th width="100">操作 </th>
			</tr>
		</thead>
        <tbody>
        	<c:forEach items="${patentDocs}" var="patentDoc" varStatus="status">
	        	<tr>
	        		<td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">
							  <input type="checkbox" class="patent-check-item" patent="<c:out value='${patentDoc.patentDocsId}'/>">
							  <span class="lbl"></span></label></td>
							<td class="center" style="text-align:center"> ${status.count} </td>
							<td style="text-align:center"><c:out value="${patentDoc.name}"/></td>
							<td style="text-align:center">
								<fmt:formatDate value="${patentDoc.createTime}" pattern="yyyy-MM-dd"/>
							</td>
							<td style="text-align:center">
								<fmt:formatDate value="${patentDoc.lastUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td style="text-align:center">
								<a target="_blank" href="<s:url value='/editor/findPatentDoc.html'/>?patentDocsId=<c:out value='${patentDoc.patentDocsId}'/>">
								 编辑
								  </a>
								  <a target="_blank" href="<s:url value='/editor/previewPatentDoc.html'/>?patentDocsId=<c:out value='${patentDoc.patentDocsId}'/>">
								 预览
								  </a>
								  
								<a href="<s:url value='/editor/deletePatentDoc.html'/>?patentDocsId=<c:out value='${patentDoc.patentDocsId}'/>">
								 删除
								  </a>
								  <a target="_blank" href="<s:url value=''/>">
								 提出申请
								  </a>
							</td>
	        	</tr>
        	</c:forEach>
        </tbody>
    </table>
>>>>>>> 889a1c2fd0b759df9dd27825bde024605dc32c0b
    <script type="text/javascript">
    $(function () {
  	  $('[data-toggle="tooltip"]').tooltip()
  	});
  	$(function(){
  		formutil.clickAllCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
  		formutil.clickItemCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
  	});
  	
  	
   	function batchAddGoods() {
  		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
  		var uniquePatentNos = []
  		if (!patentSelected) {
  			formutil.alertMessage('请选择专利');
  			
  			return;
  		}
  		var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
  		for (var i = 0; i < patents_checked.length; i++) {
  			if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
  				uniquePatentNos.push(patents_checked[i]);
  				
  			}
  			
  		}
   	}
    </script>
</body>
</html>