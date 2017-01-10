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
<title>龙图腾专利管家－商标管理</title>
<%@ include file="_css.jsp" %>
<body>
<%@ include file="_top.jsp" %>



<div class="lt-con" style="min-width:1100px;">



	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">

		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_brand_management.jsp" %>
		  </div>
		  <!--left end-->
		  <div class="col-xs-offset-1 col-xs-11">
		  
			<div class="lt-right">
			
			
				<div style="height:10px;"></div>
				<!-- search begin -->
				<div class="lt-box">
					<div class="search-box">
						<form class="form-inline" action="<s:url value='/brand/searchBrandRecycled.html'/>" method="get">
						  <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
						  <div class="t-third">

						  <table class="search-table">
							  <tr>
							  <td></td>
							  </tr>
							  <tr>
							  <td>
								<input style="width:300px;height:34px;" name="keyword" id="keywordId" value="" placeholder="商标类别/申请号/注册号/商标名称/专有权人/法律状态" class="t-input form-control"/>							  
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
				<div class="lt-box">
					<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
					  <div class="ta-top" style="margin-left:8px;">
					  	<table class="search-table">
					  	<tr>
					  	<td>
						  	<a href="javascript:return void"  onclick="recoverBrand()">
							<button class="button button-caution button-rounded">还原</button> 
							</a>
						</td>
					  	<td>
							<a href="javascript:return void" onclick="deleteBrandForever()">
							<button style="margin-left:10px;" class="button button-primary  button-rounded">永久删除</button>
							</a> 
						</td>			
					  	</tr>
					  	</table>
					  </div>
					  </span> </div>
					<table id="simple-table" class="table table-striped table-bordered table-hover">
					  <thead>
						<tr class="simple_bag">
						  <th class="center" width="15"> <label class="pos-rel">
							<input type="checkbox" class="patent-check-item" id="checkall"  name="checkall" />
							<span class="lbl"></span> </label>
						  </th>
						  <th class="center" width="40">序号</th>
						  <th width="65">商标类别</th>
						  <th width="100">申请号/注册号</th>
						  <th width="130">商标名称/图样</th>
						  <th width="90">专有权人/共享人</th>
						  <th width="110" class="hidden-480"><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>申请日/注册日</th>
						  <th width="110">法律状态</th>
						  <th width="130">交易价格/状态</th>
						</tr>
					  </thead>
					  <tbody>
						<c:forEach items="${brands}" var="brand" varStatus="status">
						  <tr >
							<td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">
							  <input type="checkbox" class="patent-check-item" brand="<c:out value='${brand.id}'/>"></span>
							  <span class="lbl"></span></label></td>
							<td class="center" style="text-align:center"> 
							${status.count + (page.currentPage-1)*page.pageSize}
							</td>
							<td style="text-align:center"><c:out value="${brand.brandCategory.categoryId }"/>
							<br/><c:out value="${brand.brandCategory.categoryName }"/></td>
							<td style="text-align:center">
								<a href="<s:url value='/patent/getOverviewPatent.html'/>?appNo=${brand.appNo}" target="_blank">
									<c:out value="${brand.appNo}"/>
								</a>
								<br/>
								<a href="<s:url value='/patent/getOverviewPatent.html'/>?appNo=${brand.brandNo}" target="_blank">
									<c:out value="${brand.brandNo}"/>
								</a>
							</td>
							<td class="hidden-480" style="text-align:center"><c:out value="${brand.name}"/>
							<br/><a href="<s:url value='/patent/getOverviewPatent.html'/>?appNo=${brand.imageUrl}" target="_blank">
									下载图样
								</a>
							</td>
							<td style="text-align:center">
								<c:out value='${brand.appPerson}'/>
								<br/>
								<c:forEach items="${brand.shareUsers}" var="shareUser" varStatus="s">								
									<a href="javascript:return void" onclick="searchShareUserDetail(${shareUser.userId})" >
						        		<c:out value="${shareUser.username}"/>
						        		<c:if test="${!s.last}">;</c:if>
						        	</a>					        	
						        </c:forEach>
							</td>
							<td class="hidden-480" style="text-align:center">
								<fmt:formatDate value="${brand.appDate}" pattern="yyyy-MM-dd"/>
								<br/>
								<fmt:formatDate value="${brand.publishDate}" pattern="yyyy-MM-dd"/>
							
							</td>
							<td class="hidden-480" style="text-align:center">
								<c:out value="${brand.brandLegalStatus.legalStatusName}"/>
							</td>
							
							<td style="text-align:center" width="120px">
								<c:if test="${brand.transactionMode==1 }">出售价</c:if>
								<c:if test="${brand.transactionMode==2 }">转让价</c:if>
								${brand.price }元<br/>
								<c:if test="${brand.transactionStatus==1}">
									待交易
			 	                </c:if>
			 	                 <c:if test="${brand.transactionStatus==2}">
				                  	<font color="red">已预订</font>
			 	                  </c:if>
			 	                 <c:if test="${brand.transactionStatus==3}">
				                  	<font color="red">已付款待变更</font>
			 	                  </c:if>
			 	                  <c:if test="${brand.transactionStatus==4}">
				                  	<font color="red">已变更待合格</font>
			 	                  </c:if>
			 	                 <c:if test="${brand.transactionStatus==5}">
				                  	<font color="red">交易成功</font>
			 	                  </c:if>
								
								
							</td>
							</c:forEach>
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

<script type="text/javascript">
	$(function(){
		formutil.clickAllCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
		formutil.clickItemCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
	});
	
	function recoverBrand() {
		var brandSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		var uniqueBrandNos = []
		if (!brandSelected) {
			formutil.alertMessage('请选择商标');
			
			return;
		}
		var brands_checked=formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'brand');
		for (var i = 0; i < brands_checked.length; i++) {
			if ($.inArray(brands_checked[i], uniqueBrandNos) == -1) {
				uniqueBrandNos.push(brands_checked[i]);
			}
		}		
		var brands = uniqueBrandNos.join(",");
		$.ajax({
			url:"<s:url value='/brand/recoverBrands.html'/>?brands=" + brands,
			
			type:"get",
				success: function(data) {
					formutil.alertMessage('还原操作成功',true);	
				},
				error: function() {
					formutil.alertMessage('还原操作失败',true);
				}
		});
	}
	
	function deleteBrandForever() {
		var brandSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		var uniqueBrandNos = []
		if (!brandSelected) {
			formutil.alertMessage('请选择商标');
			
			return;
		}
		var brands_checked=formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'brand');
		for (var i = 0; i < brands_checked.length; i++) {
			if ($.inArray(brands_checked[i], uniqueBrandNos) == -1) {
				uniqueBrandNos.push(brands_checked[i]);
			}
		}		
		var brands = uniqueBrandNos.join(",");
		$.ajax({
			url:"<s:url value='/brand/deleteForeverBrands.html'/>?brands=" + brands,
			type:"get",
				success: function(data) {
					formutil.alertMessage('删除成功',true);	
				},
				error: function() {
					formutil.alertMessage('删除失败',true);
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
		
		var url = "<s:url value='/brand/brandRecycled.html'/>?currentPage=" + pageNo;
		
		<c:if test="${searchCondition != null}">
			url = "<s:url value='/brand/searchBrandRecycled.html'/>?page.currentPage=" + pageNo +"&"+"${searchCondition}";
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
			location.href = "<s:url value='/brand/searchBrandRecycled.html'/>?page.currentPage=" + pageInput.value +"&"+"${searchCondition}";
			$(pageInput).unbind('keydown');
		}
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

</body>