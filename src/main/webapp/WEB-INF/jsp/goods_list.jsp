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
<script src="<s:url value='/static/js/sweetalert.min.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<s:url value='/static/css/sweetalert.css'/>">
<title>龙图腾专利管家－商品列表</title>
<%@ include file="_css.jsp" %>
<body>
<%@ include file="_top.jsp" %>



<div class="lt-con" style="min-width:1100px;">



	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">

		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav3.jsp" %>
		  </div>
		  <!--left end-->
		  <div class="col-xs-offset-1 col-xs-11">
		  
			<div class="lt-right">
			
			
				<div style="height:10px;"></div>
				
				<!-- menu begin -->
				<div class="lt-box">

					<div id="menu">
					  <div style="height:33px;">
						<ul id="nav">
						  <p>快捷处理：</p>
						  <li><a href="#" class="selected">专利类型</a></li>
						  <li><a href="#" class="">交易状态</a></li>
						</ul>
					  </div>
						
					  <div id="menu_con">
					  						
						<div class="tag" style="display:block; margin-left:-20px;"> 

						  <ul class="qxjk-ul"><li>
							<a href="<s:url value='/patent/searchTransactionPatents.html?page.currentPage=1&patentType=1'/>">
							发明专利 (<c:out value='${patentTypeCount[(1).intValue()]["patentCount"]}' default="0"/>)</a>
							</li>
							<li>
							 <a href="<s:url value='/patent/searchTransactionPatents.html?page.currentPage=1&patentType=2'/>">
							实用新型 (<c:out value='${patentTypeCount[(2).intValue()]["patentCount"]}' default="0"/>)
							</a> 
							</li>
							
							<li>
							<a href="<s:url value='/patent/searchTransactionPatents.html?page.currentPage=1&patentType=3'/>">
							外观设计(<c:out value='${patentTypeCount[(3).intValue()]["patentCount"]}' default="0"/>)
							</a> 							
							</li>

						  </ul>	    
						 
						
						</div>
						<div class="tag"  style="display:none">
						  <ul class="qxjk-ul">
						  	<li>	      
								<a href="<s:url value='/patent/searchTransactionPatents.html?page.currentPage=1&status=1'/>">
								待交易 (<c:out value='${transactionStatusCount[(1).intValue()]["patentCount"]}' default="0"/>)
								</a>
							</li> 
							
							<li>
							   	<a href="<s:url value='/patent/searchTransactionPatents.html?page.currentPage=1&status=2'/>">
								已预订 (<c:out value='${transactionStatusCount[(2).intValue()]["patentCount"]}' default="0"/>)
								</a> 
							</li>
							
							<li>
								<a href="<s:url value='/patent/searchTransactionPatents.html?page.currentPage=1&status=3'/>">
								已付款待变更 (<c:out value='${transactionStatusCount[(3).intValue()]["patentCount"]}' default="0"/>)
								</a>
							</li>
							<li>
								<a href="<s:url value='/patent/searchTransactionPatents.html?page.currentPage=1&status=3'/>">
								已变更待合格 (<c:out value='${transactionStatusCount[(4).intValue()]["patentCount"]}' default="0"/>)
								</a>
							</li>
							<li>
								<a href="<s:url value='/patent/searchTransactionPatents.html?page.currentPage=1&status=3'/>">
								交易成功 (<c:out value='${transactionStatusCount[(5).intValue()]["patentCount"]}' default="0"/>)
								</a>
							</li>
							
						  </ul>
						</div>
					  </div>
					</div>				
				
				
				</div>
				<!-- menu end -->
				
				<div class="lt-box">
					<div class="search-box">
					
					
					
						<form class="form-inline" action="<s:url value='/patent/searchTransactionPatents.html'/>" method="get">
						  <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
						  <div class="t-third">

						  <table class="search-table">
							  <tr>
							  <td>专利类型</td>
							  <td>专利状态</td>
							  <td>交易状态</td>
							  <td>交易方式</td>
							  <td style="text-align: center;">所属分类</td>
							  <td>添加日开始</td>
							  <td></td>
							  <td>添加日结束</td>
							  <td>关键字</td>
							  </tr>
							  <tr>
							   <td>
								<select  style="width:100px;" class="selectPointOfInterest form-control" name="patentType">
								  <option value="">全部</option>
								  <option value="1">发明</option>
								  <option value="2">实用新型</option>
								  <option value="3">外观设计</option>
								</select>
							  </td>
							  <td>
								<select style="width:121px;" class="form-control" name="patentStatus">
								  <option value="">全部</option>
								  <c:forEach items="${allPatentStatus}" var="patentStatus">
									<option value="<c:out value='${patentStatus.patentStatusId}'/>">
									<c:out value="${patentStatus.statusDescription}"/>
									</option>
								  </c:forEach>
								</select>
							  </td>
							  <td>
								<select  style="width:120px;" class="selectPointOfInterest form-control" name="status">
								  <option value="" >全部</option>
								<option value="1" >待交易</option>
								<option value="2" >已预订</option>
								<option value="3" >已付款待变更</option>
								<option value="4" >已变更待合格</option>
								<option value="5" >交易成功</option>
								</select>
							  </td>
							  <td>
								<select style="width:121px;" class="form-control" name="transactionType">
								  <option value="">全部</option>
								  <option value="1">转让</option>
								  <option value="2">许可</option>
								</select>
							  </td>
							  <td>
								  <select style="width:100px;" class="selectPointOfInterest form-control" name="firstColumnId" onchange="getSecondColumn(this.value)">
								  	<option value="">全部</option>
								  	<c:forEach items="${FirstColumns }" var="firstColumn">
								  		<option value="${firstColumn.id }">${firstColumn.name }</option>
								  	</c:forEach>
								  </select>
								  <select style="width:100px;" class="selectPointOfInterest form-control" name="secondColumnId" id="secondColumnSelect">
								  	<option value="">全部</option>
								  </select>
							  </td>
							  
							  <td>
								
								<input class="form-control" style="width:108px;height:34px;"  type="text" onclick="WdatePicker({el:'startAddDateId'})" id="startAddDateId" name="startAddDate" placeholder="添加日开始" value="" readonly="readonly" >							  
							  </td>
							  <td>-</td>
							  <td>
								<input class="lt-input form-control" style="width:108px;height:34px;" type="text" onclick="WdatePicker({el:'endAddDateId'})"  id="endAddDateId" name="endAddDate" placeholder="添加日结束" value="" readonly="readonly" >

							  </td>
							  <td>
								<input style="width:300px;height:34px;" name="keyword" id="keywordId" value="" placeholder="申请号/名称/说明" class="t-input form-control"/>							  
							  </td>
							  <td>
							  <button class="button button-caution button-rounded" type="submit" style="width:80px;">查询</button>
							  </td>
							  </tr>							  
						  </table>
						  </div>
						</form>
					</div>
				</div>
				<!--search form end-->
					  <div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> 
							<span class="input-group-btn" >
							  	<div class="ta-top" style="margin-left:8px;"> 
							  	<table class="search-table">
						  			<tr>
						  				<td>
			                                <a href="javascript:return void" onclick="batchChangePrice()" >
												<button class="button button-primary  button-rounded" style="width:110px;">批量修改价格</button>
											</a>
											<a href="javascript:return void" onclick="batchChangeTransferor()" >
												<button class="button button-primary  button-rounded" style="width:150px;margin-left:10px;">批量修改转让方</button>
											</a>
											<a href="javascript:return void" onclick="batchChangeDescription()" >
												<button class="button button-primary  button-rounded" style="width:150px;margin-left:10px;">批量修改说明</button>
											</a>
											<a href="javascript:return void" onclick="batchChangeField()" >
												<button class="button button-primary  button-rounded" style="width:150px;margin-left:10px;">批量修改领域</button>
											</a>
						  				</td>	
										<td>
											<button style="margin-left:10px;" class="button button-rounded button-highlight" onclick="exportPatents()">表格导出</button>
										</td>
										<td>
											<a href="javascript:return void" onclick="batchShare()" >
											<button style="margin-left:10px;" class="button button-primary  button-rounded" data-toggle="tooltip" data-placement="bottom" title="可以把专利批量分享给好友哦！">批量分享</button>
											</a> 
										</td>					  				  										  									  				
						  			</tr>
						  		</table>		
							  </div>
						  </span> 
						  </div>	
						  
					<table id="simple-table" class="table table-striped table-bordered table-hover">
					  <thead>
						<tr class="simple_bag">
						   <th class="center" width="15"> <label class="pos-rel">
							<input type="checkbox" class="patent-check-item" id="checkall"  name="checkall" />
							<span class="lbl"></span> </label>
						  </th>
						  <th class="center" width="35">序号</th>
						  <th width="90">专利类型 </th>
						  <th width="110">申请号/专利号</th>
						  <th width="170">专利名称</th>
						  <th width="90">第一申请人/转让方</th>
						  <th width="90">案件状态/所属领域</th>
						  <th width="90">交易类型/价格/状态</th>
						  <th width="90">添加日/交易日</th>
						  <th width="90">说明</th>
						  <th width="90">操作</th>
						</tr>
					  </thead>
					  <tbody>
						<c:forEach items="${patents}" var="patent" varStatus="status">
						  <tr >
						  <td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">
							  <input type="checkbox" class="patent-check-item" patent="<c:out value='${patent.patentId}'/>">
							  <span class="lbl"></span></label></td>
							<td class="center" style="text-align:center"> ${status.count + (page.currentPage-1)*page.pageSize} </td>
							<td style="text-align:center">
								<c:out value="${patent.patent.patentType.typeDescription}"/>
							</td>
							<td style="text-align:center">
								<c:out value="${patent.appNo}"/>
							</td>
							<td class="hidden-480" style="text-align:center">
								<c:out value="${patent.patentName}"/>
							</td>
							<td style="text-align:center">
								<c:out value="${patent.patent.appPerson}"/><br/>
								<c:out value="${patent.transferor}"/>
							</td>
							<td style="text-align:center">
								<c:out value="${patent.patent.patentStatusText}"/><br/>
								<div class="form-column" style="width:320px;margin: auto" >
									<select style="display:inline;width:150px" name="FirstColumn" id="firstColumn${status.count}"    onBlur="changSecondColume('<c:out value='${patent.patentId}'/>', '${status.count}')" class="form-control first_column" required>
								  	<c:forEach items="${FirstColumns}" var="FirstColumn">
									<option value="${FirstColumn.id}" 
										<c:if test="${FirstColumn.id==patent.firstColumn}">selected="selected"</c:if>>${FirstColumn.name}</option>
								  	</c:forEach>
									</select>
									<select style="display:inline;width:150px" name="SecondColumn"  indexColumn="${status.count}"  patentColumn="${patent.patentId}" subColumn="${patent.secondColumn}"  id="secondColumn${status.count}" class="form-control second_column" onchange="changSecondColume('<c:out value='${patent.patentId}'/>', '${status.count}')" required>
									</select>
						  		</div>
							</td>
							<td style="text-align:center" >
								<c:if test="${patent.transactionType==1}">
								转让价
								</c:if>
								<c:if test="${patent.transactionType==2}">
								许可价
								</c:if>
								<span style="text-align:center">${patent.price}元</span>
								
								<%-- <input type="text" name="price" class="form-control" value="${patent.price}" onChange="changePrice('<c:out value='${patent.patentId}'/>', this.value)"> --%>
								
								<select style="display:inline;width:130px" onChange="changeStatus('<c:out value='${patent.patentId}'/>', this.value)" class="form-control first_column">
								<c:if test="${patent.status==1}">
								<option value="${patent.status}" selected="selected">
									待交易
								</option>
								<option value="2"><font color="red">已预订</font> </option>
								<option value="3"><font color="red">交易成功</font></option>
								</c:if>	
								
								<c:if test="${patent.status==2}">
								<option value="${patent.status}" selected="selected">
									已预订
								</option>
								<option value="1">待交易</option>
								<option value="3">交易成功</option>
								</c:if>
								
								<c:if test="${patent.status==3}">
								<option value="${patent.status}" selected="selected">
									交易成功
								</option>
								<option value="1">待交易</option>
								<option value="2">已预订</option>
								</c:if>
								</select>
								
								
								
								<%-- <c:if test="${patent.status==2}">
								<font color="red">已预订</font>
								</c:if>
								<c:if test="${patent.status==3}">
								<font color="red">交易成功</font>
								</c:if>	 --%>
							</td>
							
							<td class="hidden-480" style="text-align:center">
								<fmt:formatDate value="${patent.addDate}" pattern="yyyy-MM-dd"/><br/>
								<fmt:formatDate value="${patent.transactionDate}" pattern="yyyy-MM-dd"/>
							</td>
							<td width="90">
								<input style="width:180px;" type="text" value="<c:out value='${patent.description}'/>" size="90" onChange="changedescription('<c:out value='${patent.patentId}'/>', this.value)"/>
							</td>
							<td >
							&nbsp;
							<%-- <c:if test="${patent.status==2}">
							  <a href="javascript:return void;"  onclick="upTransactionPatent(${patent.patentId})">	 
							  上架
							  </a>
							</c:if> --%>
							  <%-- <c:if test="${patent.status==1}">
							  <a href="javascript:return void;"  onclick="downTransactionPatent(${patent.patentId})">
							  下架
							  </a> 
							  &nbsp;&nbsp;&nbsp;
			             	  </c:if> --%>
			             	  
							  <a href="javascript:return void;"  onclick="deleteTransactionPatent(${patent.patentId})">
							  删除
							  </a>
							  &nbsp;
							  <se:authorize access="hasAnyRole('ROLE_TRADER')">
							  <c:if test="${patent.status==1}">
								  <c:if test="${patent.recommendStatus==0}">
								  <a href="javascript:return void;"  onclick="recommendPatent(${patent.patentId})">	 
								        推荐
								  </a>
								  </c:if>
								  <c:if test="${patent.recommendStatus==1}">
								  <a href="javascript:return void;"  onclick="cancelRecommendPatent(${patent.patentId})">
								       取消推荐
								  </a> 
				             	  </c:if>  
			             	   </c:if>
			             	    </se:authorize>    	  
							  </td>
						  </tr>
						</c:forEach>
						
						</div>
					  </tbody>
					</table>
					<!-- 分页功能 start -->
			        <div style="height:30px;background:#fff;">	
			          <c:if test="${searchCondition == null}">
			            <div class="col-lg-12"> 共 ${page.totalPages}页${page.totalRecords}条记录    第${page.currentPage} 页 <a href="?currentPage=1">首页</a>
			              <c:choose>
			                <c:when test="${page.currentPage - 1 > 0}"> <a href="?currentPage=${page.currentPage - 1}">上一页</a> </c:when>
			                <c:when test="${page.currentPage - 1 <= 0}"> <a href="?currentPage=1">上一页</a> </c:when>
			              </c:choose>
			              <c:choose>
			                <c:when test="${page.totalPages==0}"> <a href="?currentPage=${page.currentPage}">下一页</a> </c:when>
			                <c:when test="${page.currentPage + 1 < page.totalPages}"> <a href="?currentPage=${page.currentPage+1}">下一页</a> </c:when>
			                <c:when test="${page.currentPage + 1 >= page.totalPages}"> <a href="?currentPage=${page.totalPages}">下一页</a> </c:when>
			              </c:choose>
			              <c:choose>
			                <c:when test="${page.totalPages==0}"> <a href="?currentPage=${page.currentPage}">尾页</a> </c:when>
			                <c:otherwise> <a href="?currentPage=${page.totalPages}">尾页</a> </c:otherwise>
			              </c:choose>
			              <!-- 分页功能 End -->
			              <input type="text" id="page.pageNo" style="width:50px;height:25px" name="currentPage" onKeyDown="gotoPageForEnter(event)"/>
			              <a href="javascript:void;" onClick="javascript:gotoPage()">跳转</a> <span> 每页
			              <select onChange="setPageSize()" style="height:25px;" id="pageSizeSelect">
			                <option value="10">10</option>
			                <option value="20">20</option>
			                <option value="50">50</option>
			                <option value="100">100</option>
			              </select>
			              条记录 </span> </div>
			          </c:if>
			           <c:if test="${searchCondition != null}">
			          <div class="col-lg-12"> 共 ${page.totalPages}页${page.totalRecords}条记录    第${page.currentPage} 页 <a href="?page.currentPage=1&${searchCondition}">首页</a>
			            <c:choose>
			              <c:when test="${page.currentPage - 1 > 0}"> <a href="?page.currentPage=${page.currentPage - 1}&${searchCondition}">上一页</a> </c:when>
			              <c:when test="${page.currentPage - 1 <= 0}"> <a href="?page.currentPage=1&${searchCondition}">上一页</a> </c:when>
			            </c:choose>
			            <c:choose>
			              <c:when test="${page.totalPages==0}"> <a href="?page.currentPage=${page.currentPage}&${searchCondition}">下一页</a> </c:when>
			              <c:when test="${page.currentPage + 1 < page.totalPages}"> <a href="?page.currentPage=${page.currentPage+1}&${searchCondition}">下一页</a> </c:when>
			              <c:when test="${page.currentPage + 1 >= page.totalPages}"> <a href="?page.currentPage=${page.totalPages}&${searchCondition}">下一页</a> </c:when>
			            </c:choose>
			            <c:choose>
			              <c:when test="${page.totalPages==0}"> <a href="?page.currentPage=${page.currentPage}&${searchCondition}">尾页</a> </c:when>
			              <c:otherwise> <a href="?page.currentPage=${page.totalPages}&${searchCondition}">尾页</a> </c:otherwise>
			            </c:choose>
			            <!-- 分页功能 End -->
			            <input type="text" id="page.pageNo" style="width:50px;height:25px" name="page.currentPage" onKeyDown="gotoPageForEnter(event)"/>
			            <a href="javascript:void;" onClick="javascript:gotoPage()">跳转</a> <span> 每页
			            <select onChange="setPageSize()" style="height:25px;" id="pageSizeSelect">
			              <option value="10">10</option>
			              <option value="20">20</option>
			              <option value="50">50</option>
			              <option value="100">100</option>
			            </select>
			            条记录 </span> </div>
			        </c:if>
			        </div>					
				
				
				</div>
			
			
			</div> 
			
		  </div>
		  
			<!--right end-->
		</div>
	</div>	
</div>


<button type="button" style="display: none;" data-toggle = "modal" data-target = "#myModal" id="hiddenBtn">打开</button>
<div class = "modal fade" id = "myModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:500px;">
      <div class = "modal-content">
         
         <div class = "modal-header" style="display: none;">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="modalColseBtn">
               ×
            </button>
         </div>
	         <div class = "modal-body" >
		         <div id="modalBody">
		         	<table class="search-table" width="100%">
					  <tr>
						  <td style="text-align: center;" >第一分类</td>
						  <td style="text-align: center;" >第二分类</td>
					  </tr>
					  <tr>
						  <td  align="center">
							  <select style="width:160px;" class="selectPointOfInterest form-control" name="firstColumnId" onchange="getModalSecondColumn(this.value)" id="modalFirstColumnSelect">
							  	<option value="">全部</option>
							  	<%-- <c:forEach items="${FirstColumns }" var="firstColumn">
							  		<option value="${firstColumn.id }">${firstColumn.name }</option>
							  	</c:forEach> --%>
							  </select>
							</td>
							<td  align="center">
							 <select style="width:160px;" class="selectPointOfInterest form-control" name="secondColumnId" id="modalSecondColumnSelect">
							  	<option value="">全部</option>
							  </select>
						  </td>
					  </tr>							  
				  </table>
				 </div>
				 <div style="margin-top: 60px;">
				  <table class="search-table" width="100%">
					  <tr>
						  <td style="text-align: right;padding-right: 40px;" >
						  	<button type = "button" class = "btn btn-default" data-dismiss = "modal" style="width:60px;height:40px;">
						  	  	取消
			            	</button>
						  </td>
						  <td style="text-align: left;padding-left: 40px;">
						  	<button type = "button" class = "btn btn-info" style="width:60px;height:40px;" onclick="submitChangeField()">
				               	确认
				            </button>
						  </td>
					  </tr>
			       </table>
		         </div>
	         
	         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
   
</div>
<iframe id="patentExcelFileFrame" style="display:none"></iframe>	

<script type="text/javascript">
var patentIdsOfChangeField = null;
	$(function(){
		formutil.clickAllCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
		formutil.clickItemCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
	});
	
	function recommendPatent(patentId) {
		$.ajax({
			url: "<s:url value='/patent/recommendPatent.html'/>?patentId=" + patentId,
			type: 'get', 
			success: function(data) {
				formutil.alertMessage('推荐成功',true);
				location.reload();
			}
		});	
	}
	
	function cancelRecommendPatent(patentId) {
		$.ajax({
			url: "<s:url value='/patent/cancelRecommendPatent.html'/>?patentId=" + patentId,
			type: 'get', 
			success: function(data) {
				formutil.alertMessage('已取消推荐',true);
				location.reload();
			}
		});	
	}
	
	function downTransactionPatent(patentId) {
		$.ajax({
			url: "<s:url value='/patent/downTransactionPatent.html'/>?patentId=" + patentId,
			type: 'get', 
			success: function(data) {
				formutil.alertMessage('下架成功',true);
			}
		});	
	}	

	function deleteTransactionPatent(patentId) {
		$.ajax({
			url: "<s:url value='/patent/deleteTransactionPatent.html'/>?patentId=" + patentId, 
			success: function(data) {
				formutil.alertMessage('删除成功',true);
				
			}

		});	
	}	
		
	
	function upTransactionPatent(patentId) {
		$.ajax({
			url: "<s:url value='/patent/upTransactionPatent.html'/>?patentId=" + patentId, 
			success: function(data) {
				formutil.alertMessage('上架成功',true);
			}
		});	
	}		
	function gotoPage() {
		var pageNo = document.getElementById("page.pageNo").value;
		
		if (isNaN(pageNo)) {
			alert("请输入数值");
			return;
		}
		
		if(pageNo==""){
			alert("请输入数值")
			return;
		}
		
		pageNo = parseInt(pageNo);
		
		if (pageNo < 1 || pageNo > parseInt("${page.totalPages}")) {
			alert("只能输入1-${page.totalPages}之间的数值");
			return;
		}
		
		var url = "<s:url value='/patent/getUserTransactionPatents.html'/>?currentPage=" + pageNo;
		
		<c:if test="${searchCondition != null}">
			url = "<s:url value='/patent/searchTransactionPatents.html'/>?page.currentPage=" + pageNo +"&"+"${searchCondition}";
		</c:if>
		
		
		location.href = url
		
	}
	
	function gotoPageForEnter(event) {
		var e = event ? event : window.event;
				
		if(event.keyCode == 13) {
			gotoPage();
		}
	}
	
	
	function processPageEnter(event, pageInput) {
		var keyCode = event.keyCode ? event.keyCode 
                : event.which ? event.which 
                        : event.charCode;
		var isEnterKey = keyCode == 13;
		if (isEnterKey) {
			location.href = "<s:url value='/patent/search.html'/>?page.currentPage=" + pageInput.value +"&"+"${searchCondition}";
			$(pageInput).unbind('keydown');
		}
	}
	
	function exportFees(){
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		
		if (!patentSelected) {
			formutil.alertMessage('请选择要导出的专利');
			return;
		}
		var patents = formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
		var iframe = document.getElementById('patentExcelFileFrame');
		iframe.src = "<s:url value='/patent/exportPatents.html'/>?patentIds=" + patents;
		
	}
</script>
<script type="text/javascript">
	$(function() {
		formutil.setElementValue("#pageSizeSelect", ${page.pageSize});
	});
	
	function setPageSize() {
		var pageSize = $("#pageSizeSelect").val();
		
		$.ajax({
			url: "<s:url value='/user/setPageSize.html'/>?pageSize=" + pageSize, 
			type: 'get', 
			success: function() {
				location.reload();
			}
		});		
	}	
</script>
<script>
var tabs=function(){
    function tag(name,elem){
        return (elem||document).getElementsByTagName(name);
    }
    //获得相应ID的元素
    function id(name){
        return document.getElementById(name);
    }
    function first(elem){
        elem=elem.firstChild;
        return elem&&elem.nodeType==1? elem:next(elem);
    }
    function next(elem){
        do{
            elem=elem.nextSibling;  
        }while(
            elem&&elem.nodeType!=1  
        )
        return elem;
    }
    return {
        set:function(elemId,tabId){
            var elem=tag("li",id(elemId));
            var tabs=tag("div",id(tabId));
            var listNum=elem.length;
            var tabNum=tabs.length;
            for(var i=0;i<listNum;i++){
                    elem[i].onclick=(function(i){
                        return function(){
                            for(var j=0;j<tabNum;j++){
                                if(i==j){
                                    tabs[j].style.display="block";
                                    //alert(elem[j].firstChild);
                                    elem[j].firstChild.className="selected";
                                }
                                else{
                                    tabs[j].style.display="none";
                                    elem[j].firstChild.className="";
                                }
                            }
                        }
                    })(i)
            }
        }
    }
}();
tabs.set("nav","menu_con");//执行      

</script>
<script type="text/javascript">

function changSecondColume(patentId, SecondColumn) {
	var SecondColumn=$("#secondColumn"+SecondColumn).val();
	$.ajax({
		url: "<s:url value='/patent/changSecondColume.html'/>?SecondColumn=" + SecondColumn + "&patentId=" + patentId, 
		type: 'get', 
		success: function(data) {
			//formutil.alertMessage('修改成功');	
		},
		error: function() {
			formutil.alertMessage('修改失败');
		}
	});	
}

 $(function(){
	   $(".first_column").change(function () {
		  var first_column=$(this).val();
		 // alert(first_column);
		  var second_column=$(this).parent(".form-column").children(".second_column");
		 	resetSelect(second_column);
			if (first_column != "") {
				$.ajax({
					url: "<s:url value='/patent/getGoodsSecoundColumn.html'/>?first_column=" + first_column,
					type: 'get',
					dataType: 'json',
					success: function(SecondColumns){
						addOptions(second_column, SecondColumns);
						
					}
				})
			}
	   })
	   
	   $(".first_column").trigger("change");
	   setTimeout(function(){
		   $(".second_column").each(function(){
			   $(this).val($(this).attr("subColumn"));
			   
		   })
		}, 200);
}); 

/* function changSecondColume(patentId, SecondColumn) {
	$.ajax({
		url: "<s:url value='/patent/changSecondColume.html'/>?SecondColumn=" + SecondColumn + "&patentId=" + patentId, 
		type: 'get', 
		success: function(data) {
			//formutil.alertMessage('修改成功');	
		},
		error: function() {
			formutil.alertMessage('修改失败');
		}
	});	
} */

function addDefaultOption(selectElem) {
	selectElem.append("<option value=''>请选择</option>");
}

function resetSelect() {
	for (var i = 0; i < arguments.length; i++) {
		var selectObj = arguments[i];
		selectObj.empty();
		/* addDefaultOption(selectObj); */
	}
}

function addOptions(selectObj, options) {
	$.each(options, function(index, val){
		selectObj.append("<option value='" + val.id + "'>" + val.name + "</option>");
	});	
}


function changePrice(patentId, price) {
	$.ajax({
		url: "<s:url value='/patent/changePrice.html'/>?price=" + price + "&patentId=" + patentId, 
		type: 'get', 
		success: function(data) {
			//formutil.alertMessage('修改成功');	
		},
		error: function() {
			formutil.alertMessage('修改失败');
		}
	});	
}

function changeStatus(patentId,status){
	$.ajax({
		url: "<s:url value='/patent/changeStatus.html'/>?status=" + status + "&patentId=" + patentId, 
		type: 'get', 
		success: function(data) {
			//formutil.alertMessage('修改成功');	
		},
		error: function() {
			formutil.alertMessage('修改失败');
		}
	});
	
	
}

	function batchChangePrice() {
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
			
		};
		var price = 0;
		var patentIds = uniquePatentNos.join(",");
		//var price = prompt("请输入价格", "");
		swal({   
			title: "批量修改价格",   
			//text: "这里可以输入并确认:",   
			type: "input",   
			showCancelButton: true,   
			closeOnConfirm: false,   
			animation: "slide-from-top",   
			inputPlaceholder: "请输入价格:￥" 
		}, function(inputValue) {
			price = inputValue;
			$.ajax({
				url: "<s:url value='/patent/batchChangePrice.html'/>?price=" +price+"&patentIds="+ patentIds,
				type: "get"
			}).done(function(data) {
				swal("操作成功!", "已成功修改价格！", "success");
				location.reload();
			}).error(function(data) {
				swal("操作失败!", "修改价格失败！", "error"); 
			});
		});

		//var price = prompt("请输入价格", "");
		/* $.ajax({
			url:"<s:url value='/patent/batchChangePrice.html'/>?price=" +price+"&patentIds="+ patentIds,
			type:"get",
				success: function(data) {
					//formutil.alertMessage('批量修改成功',true);	
				},
				error: function() {
					formutil.alertMessage('批量修改失败',true);
				}
		}); */
	}
	
	
	
	function batchChangeTransferor() {
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
			
		};
		var transferor;
		var patentIds = uniquePatentNos.join(",");
		swal({   
			title: "批量修改转让方",   
			type: "input",   
			showCancelButton: true,   
			closeOnConfirm: false,   
			animation: "slide-from-top",   
			inputPlaceholder: "请输入转让方:"
		}, function(inputValue) {
			transferor = inputValue;
			$.ajax({
				url: "<s:url value='/patent/batchChangeTransferor.html'/>?transferor=" +transferor+"&patentIds="+ patentIds,
				type: "get"
			}).done(function(data) {
				swal("操作成功!", "已成功修改转让方！", "success");
				location.reload();
			}).error(function(data) {
				swal("操作失败!", "修改转让方失败！", "error"); 
			});
		});
	}
	function exportPatents(){
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		
		if (!patentSelected) {
			formutil.alertMessage('请选择要导出的专利');
			return;
		}
		var patents = formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
		var iframe = document.getElementById('patentExcelFileFrame');
		iframe.src = "<s:url value='/patent/exportTransactionPatents.html'/>?patentIds=" + patents;
		
	}
	
	
	function batchChangeDescription() {
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
			
		};
		var description;
		var patentIds = uniquePatentNos.join(",");
		swal({   
			title: "批量修改说明",   
			type: "input",   
			showCancelButton: true,   
			closeOnConfirm: false,   
			animation: "slide-from-top",   
			inputPlaceholder: "请输入说明:"
		}, function(inputValue) {
			description = inputValue;
			$.ajax({
				url: "<s:url value='/patent/batchChangeDescription.html'/>",
				type: "post",
				data:{"description":description,"patentIds": patentIds}
			}).done(function(data) {
				swal("操作成功!", "已成功修改说明！", "success");
				location.reload();
			}).error(function(data) {
				swal("操作失败!", "修改说明失败！", "error"); 
			});
		});
	}
	
	
	function batchChangeField() {
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
			
		};
		patentIdsOfChangeField = uniquePatentNos.join(",");
		
		 $.ajax({
			 type:"post",
			 url:"<s:url value='/patent/getFirstColumns.html'/>",
			 async:false,
			 dataType:"json",
			 success: function (data){
				var firstSelect = $("#modalFirstColumnSelect");
				resetSelect(firstSelect);
				firstSelect.append("<option value=''>全部</option>");
				addOptions(firstSelect, data);
			 }
			 
		 })
		$("#hiddenBtn").trigger("click");

	}
	
	
	
</script>

<script type="text/javascript">
	function changedescription(patentId,description){
		$.ajax({
			type:"POST",
			url :"<s:url value='/patent/saveSellPatentDescription.html'/>",
			data:{"patentId":patentId,"description":description},
			success:function(data){
				
			},
			error:function(){
				alert("发生未知错误，请稍后重试！");
			}
		})
	}
	
	function getSecondColumn(secondColumnId){
		var secondSelect = $("#secondColumnSelect");
		if(secondColumnId==""||secondColumnId==null){
			resetSelect(secondSelect);
			secondSelect.append("<option value=''>全部</option>");
		}else{
			$.ajax({
				type:"get",
				url :"<s:url value='/patent/getGoodsSecoundColumn.html'/>?first_column="+secondColumnId,
				dataType:"json",
				success:function(data){
					
					resetSelect(secondSelect);
					addOptions(secondSelect, data);
				},
				error:function(){
					alert("发生未知错误，请稍后重试！");
				}
			})
		}
	}
	
	function getModalSecondColumn(secondColumnId){
		var secondSelect = $("#modalSecondColumnSelect");
		if(secondColumnId==""||secondColumnId==null){
			resetSelect(secondSelect);
			secondSelect.append("<option value=''>全部</option>");
		}else{
			$.ajax({
				type:"get",
				url :"<s:url value='/patent/getGoodsSecoundColumn.html'/>?first_column="+secondColumnId,
				dataType:"json",
				success:function(data){
					
					resetSelect(secondSelect);
					addOptions(secondSelect, data);
				},
				error:function(){
					alert("发生未知错误，请稍后重试！");
				}
			})
		}
	}
	
	
	function submitChangeField(){
		var selectedValue = $("#modalSecondColumnSelect option:selected").val();
		if(patentIdsOfChangeField==""||patentIdsOfChangeField==null){
			alert("请返回重新选择!");
		}else{
			
			if(selectedValue==""||selectedValue==null){
				alert("请选择所需修改的领域!");
				return;
			}
			$.ajax({
				type:"post",
				url:"<s:url value='/patent/batchUpdateField.html'/>",
				data:{"patentIds":patentIdsOfChangeField,"fieldId":selectedValue},
				async:false,
				success:function (data){
					 $("#modalColseBtn").trigger("click");
					swal("修改成功啦!", "我的大刀早已饥渴难耐!谁能受我三刀", "success");
					window.location.reload();
				}
			})
		}
	}
	
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
		location.href = "<s:url value='/patent/showGoodFriends.html'/>?patents=" + patents;
	}
	
</script>
</body>