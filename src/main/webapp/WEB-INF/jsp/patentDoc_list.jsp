<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<title>专利文档列表！</title>
	
</head>

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