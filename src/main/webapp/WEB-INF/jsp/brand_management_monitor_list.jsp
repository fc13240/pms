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
<link rel="stylesheet" href="<s:url value='/temp/css/bootstrap.min.css'/>" />
<script src="<s:url value='/static/js/bootstrap.min.js'/>" type="text/javascript"></script>
<script src="<s:url value='/static/js/jquery.validate.min.js'/>"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>"></script>


<title>龙图腾专利管家－续展监控</title>
<%@ include file="_css.jsp" %>

<style type="text/css">
 .qxjk-ul1 li {
    width:300px;
    height: 40px;
    border-bottom: 1px dashed #ccc;
	margin:10px 0 0 0;
	padding: 0 8px;
	overflow: hidden;
};
</style>
</head>
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
				<!-- menu begin -->
				<div class="lt-box">

					
				
				
				</div>
				<!-- menu end -->
				<!-- search begin -->
				
			
				
				<div class="lt-box">
					<div class="search-box">
					</div>
				</div>
				<!--search form end-->
				<div class="lt-box">
					<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
					  <div class="ta-top" style="margin-left:8px;margin-top:10px;">
					  	<table class="search-table">
					  	<tr>
					  	<td>
							<a href="javascript:return void" onclick="batchCancelMonitor()" >
							<button style="width:140px;margin-left:10px;" class="button button-primary  button-rounded" data-toggle="tooltip" data-placement="bottom" title="">批量取消续展监控</button>
							</a> 
						</td>
							<form action="<s:url value='/brand/searchMonitorBrand.html'/>" >
						<td>
								<input value="1" name="page.currentPage" type="hidden" />
								<input name="keyword" class="t-input form-control" style="width:300px;" placeholder="申请号/注册号/商标名称"/>
						</td>			
						<td>
								<button style="width:80px;margin-left:10px;" class="button button-primary  button-rounded" type="submit">查询</button>
						</td>			
							</form>
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
						  <th width="80">操作</th>
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
								<%-- <a href="<s:url value='/patent/getOverviewPatent.html'/>?appNo=${brand.appNo}" target="_blank"> --%>
									<c:out value="${brand.appNo}"/>
								<!-- </a> -->
								<br/>
								<%-- <a href="<s:url value='/patent/getOverviewPatent.html'/>?appNo=${brand.brandNo}" target="_blank"> --%>
									<c:out value="${brand.brandNo}"/>
								<!-- </a> -->
							</td>
							<td class="hidden-480" style="text-align:center"><c:out value="${brand.name}"/>
							<br/>
							<c:if test="${not empty brand.imageUrl}">
								<a href="<s:url value='/brand/downloadImage.html'/>?name=${brand.name }&downloadPath=${brand.imageUrl}" target="_blank">
									下载图样
								</a>
							</c:if>
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
							<td style="text-align:center"><a  href="<s:url value='/brand/showFriends.html'/>?brands=<c:out value='${brand.id}'/>">
							  分享
							  </a>&nbsp;
							  <a target="_blank" href="<s:url value='/brand/getBrandRemark.html'/>?brandId=<c:out value='${brand.id}'/>">
							  备注
							  </a>&nbsp;
							   <a target="_blank" href="<s:url value='/brand/brandManagementUpdateForm.html'/>?brandId=${brand.id}">
							  修改
							  </a>
							  <br>
							   <a style="cursor:pointer;" data-toggle = "modal" data-target = "#uploadNoticeModal">
							 上传通知书
							  </a>
							 
							
							  <br>
							  </td>
						  </tr>
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
<iframe id="brandExcelFileFrame" style="display:none"></iframe>	

<!--上传通知书start-->
<div class = "modal fade" id = "uploadNoticeModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" >
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="uploadNoticeModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel" style="font-size:18px;">
            	上传通知书(带<span style="color:red;font-size:18px;">*</span>为必填项)
            </h4>
         </div>
         <div class = "modal-body" id="modal-body">
         	<form action="<s:url value='/brandNotice/saveBrandNotice.html'/>" method="post">
			<h5><span style="color:red;font-size:18px;">* </span>发文日:</h5>
			<input class="form-control" style="width:360px;height:34px;"  type="text" onclick="WdatePicker({el:'dispatchDateId'})" id="dispatchDateId" name="dispatchDate" placeholder="发文日" value="" readonly="readonly" required>							  
			<br/>
			<h5><span style="color:red;font-size:18px;">* </span>通知类型:</h5>
			<select style="width:360px;" class="selectPointOfInterest form-control" name="noticeType" required>
	          <option value="">全部</option>
	          <c:forEach items="${noticeTypes}" var="noticeType">
	            <option value="<c:out value='${noticeType.noticeTypeId}'/>">
	            <c:out value="${noticeType.noticeTypeDescription}"/>
	            </option>
	          </c:forEach>
	        </select>	
			<br/>		  
			<h5><span style="color:red;font-size:18px;">* </span>pdf上传:</h5>
			<form id="notice" action="<s:url value='/brandNotice/uploadNoticePdfFile.html'/>" method="post" enctype="multipart/form-data" class="form-horizontal">  
				<input style="display:none;" id="id_notice_file" name="noticeFile" type="file" />
				<input style="width:300px;height:33px;display:inline;" type="text" class="lt-input form-control" id="filename" name="filename" placeholder="请选择文件" readonly="readonly" required>
				<button type="button" onclick="$('input[id=id_notice_file]').click();" class="button button-primary  button-rounded">浏览</button>
				<button style="margin-left:5px;" type="submit" class="button button-caution button-rounded">上传</button>
			</form> 
			<br/>
				<button style="margin-left:5px;" type="submit" class="button button-caution button-rounded">提交</button>
			<br/>
			</form>
			
				
         </div>
      </div>
   </div>
</div>
<!--上传通知书end-->

<script src="<s:url value='/static/datepicker/WdatePicker.js'/>"></script>
<script type="text/javascript">
$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	});
	$(function(){
		formutil.clickAllCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
		formutil.clickItemCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
	});
	
	function searchShareUserDetail(shareUserId){
		var url = "<s:url value='/user/searchShareUserDetail.html'/>?shareUserId=" + shareUserId;
		window.open(url);
	}
	//改变日期显示颜色
	$(function() {
	   $(".fee_date").each(function (){
		 var fee_date=$(this).html();
		 var value = fee_date.replace(/[^0-9]/ig,"|");
		 var array_fee_date = value.split("|");
		 var fee_month=array_fee_date[0];
		 var fee_day=array_fee_date[1];
		 var fee_days=Number(fee_month)*30+Number(fee_day);

		 oDate = new Date();
		 var month=oDate.getMonth()+1;
		 var day=oDate.getDate();
		 var current_days=month*30+day;
		 var Differ=current_days-fee_days;
		 
	     if(Differ<31&&Differ>-31){
	 		$(this).addClass("red");

	 	 }	

		   
	   });	

	});	

	function batchCancelMonitor() {
		var brandSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		var uniqueBrandNos = []
		if (!brandSelected) {
			formutil.alertMessage('请选择需要取消监控的商标');
			
			return;
		}
		var brands_checked=formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'brand');
		for (var i = 0; i < brands_checked.length; i++) {
			if ($.inArray(brands_checked[i], uniqueBrandNos) == -1) {
				uniqueBrandNos.push(brands_checked[i]);
			}
		}		
		var brandIds = uniqueBrandNos.join(",");	
		$.ajax({
			type : "POST",
			url : "<s:url value='/brand/cancelBrandMonitor.html'/>",
			data : {"brandIds":brandIds},
			success : function (data){
				alert("操作成功");
				window.location.reload();
			},
			error : function (){
				formutil.alertMessage('出现异常错误，请稍后再试');
			}
		})
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
		
		var url = "<s:url value='/brand/getUsermonitorBrands.html'/>?currentPage=" + pageNo;
		
		<c:if test="${searchCondition != null}">
			url = "<s:url value='/brand/searchMonitorBrand.html'/>?page.currentPage=" + pageNo +"&"+"${searchCondition}";
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

	
	jQuery(function($) {
		$("#notice").validate({
			rules: {
				filename: 'required'
			},
			messages: {
				filename: '请选择要上传的通知书PDF文件'
			},
			submitHandler: function(form){ 
				form.submit();     
			}
		});
	});

	$('input[id=id_notice_file]').change(function() {  
		$('#filename').val($(this).val());  
	});
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