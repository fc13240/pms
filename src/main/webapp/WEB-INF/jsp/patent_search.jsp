<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>龙图腾专利管理系统——查询添加</title>
<%@ include file="_css.jsp" %>
<body>
<%@ include file="_top.jsp" %>


<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">

		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav2.jsp" %>
		  </div>
		  <!--left end-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>

				<!-- search begin -->
				<div class="lt-box">
					<div class="search-box">
						<form action="<s:url value='/patent/searchPatent.html'/>" method="get">
						  <div class="t-third" style="clear:both;">
						  <input type="text" style="width:400px;height:35px;display:inline;" placeholder="申请号/名称/申请人/代理机构" name="q"	 class="text" id="keywordId" />
							<input type="submit" value="搜索"  id="mc-embedded-subscribe" class="button" />
						  </div>
						</form>
					</div>
				</div>
				<!--search form end-->
				<div class="lt-box">
					<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
					  <div class="ta-top" style="margin:8px;"> 
						<a href="javascript:batchShare()">
						<button class="button button-caution button-rounded">一键加入</button> 
						</a>	          
					  </div>
					  </span> </div>
					<table id="simple-table" class="table table-striped table-bordered table-hover">
					  <thead>
						<tr class="simple_bag">
						  <th class="center" width="15"> <label class="pos-rel">
							<input type="checkbox" class="patent-check-item" id="checkall"  name="checkall" />
							<span class="lbl"></span> </label>
						  </th>
						  <th class="center" width="35">序号</th>
						  <th width="110">申请号/专利号</th>
						  <th width="110">公布号</th>
						  <th width="170">专利名称</th>
						  <th width="110">申请日</th>
						  <th width="110">公布日</th>
						  <th width="60">专利类型</th>
						  <th width="110">代理机构</th>
						</tr>
					  </thead>
					  <tbody>
						<c:forEach items="${patent}" var="patent" varStatus="status">
						  <tr>
							<td class="center">
								<label class="pos-rel"> <span class="batch-share-item">
									  <input type="checkbox" class="patent-check-item" patent="<c:out value='${patent.objectId}'/>">
									  <span class="lbl"></span>
								</label>
							</td>
							<td class="center"> ${status.count} </td>
							<td>
								<c:out value="${patent.appNo}"/>
							</td>
							<td>
								<c:out value="${patent.publishNo}"/>
							</td>
							<td>
								<c:out value="${patent.name}"/>
							</td>
							
							<td class="hidden-480">
								<fmt:formatDate value="${patent.appDate}" pattern="yyyy-MM-dd"/>
							</td>
							<td>
								<fmt:formatDate value="${patent.publishDate}" pattern="yyyy-MM-dd"/>
							</td>
							<td>
								<c:out value="${patent.patentType.typeDescription}"/>
							</td>
							<td>
								<c:out value="${patent.proxyOrg}"/>
							</td>
							
						  </tr>
						</c:forEach>
					  </tbody>
					</table>				
				</div>
			
			
			</div> 
			
		  </div>
		  
			<!--right end-->
		</div>
	</div>	
</div>

<script type="text/javascript">
	$(function(){
		formutil.clickAllCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
		formutil.clickItemCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
	});
	
	function batchShare() {
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
		var patents = uniquePatentNos.join(",");		
		location.href = "<s:url value='/patent/addPatents.html'/>?patents=" + patents;
	}
</script>

</body>