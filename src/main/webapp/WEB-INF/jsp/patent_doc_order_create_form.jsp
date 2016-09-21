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
<title>龙图腾专利管家——订单</title>
<%@ include file="_css.jsp" %>
<script type="text/javascript" src="<s:url value='/temp/js/jquery_from.js'/>"></script>
</head>
<body>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

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
				<div class="lt-box">
					<form action="<s:url value='/patentDocWorkflow/createPatentDocOrder.html'/>" method="post">
					  <c:forEach items="${PatentDocs}" var="patentDoc" varStatus="status">
						<input type="hidden" name="patentDocIds" value="${patentDoc.patentDocId}">
					  </c:forEach>
					  		<input id='invoicePicPath' name='invoicePic' type='hidden' value=''/>
					  <table id="simple-table" class="table table-striped table-bordered table-hover">
						<tr>
						  <td>支付方式:</td>
						</tr>
						<tr>
						  <td><input type="radio" name="paymentMethod.paymentMethodId" value="1" checked="checked" required="required" >
							支付宝支付
							<input type="radio" name="paymentMethod.paymentMethodId" value="3" required="required"   data-toggle = "modal" data-target = "#commonInventorModal">
							发票支付
								 <div id="InvoicePic" style="display:none">
									
								</div>
						 </td>
						</tr>
						<tr>
						  <td>专利文档详情</td>
						</tr>
						<tr>
						  <td><table id="simple-table" class="table table-striped table-bordered table-hover">
							  <thead>
								<tr class="simple_bag">
								  <th>序号</th>
								  <th>文档类型</th>
								  <th>专利名称</th>
								  <th>申请费</th>
								  <th>印刷费</th>
								  <th>申请审查费</th>
								  <th>服务费</th>
								  <th>总计</th>
								  <th>费用状态</th>
								</tr>
							  </thead>
							  <tbody>
								<c:forEach items="${PatentDocs}" var="patentDoc" varStatus="status">
								  <tr>
									<td class="center" style="text-align:center">${status.count}</td>
									<c:if test="${patentDoc.patentType==1}">
										<td style="text-align:center"><c:out value="发明专利"/></td>
									</c:if>
									<c:if test="${patentDoc.patentType==2}">
										<td style="text-align:center"><c:out value="实用新型"/></td>
									</c:if>
									<c:if test="${patentDoc.patentType==3}">
										<td style="text-align:center"><c:out value="外观设计"/></td>
									</c:if>
									<td style="text-align:center">${patentDoc.name}</td>
									<td style="text-align:center">
										${patentDoc.applyFee}
									</td>
									<td style="text-align:center">
										<c:if test="${patentDoc.printFee<=0}">/</c:if>
										<c:if test="${patentDoc.printFee>0}">${patentDoc.printFee}</c:if>
									</td>
									<td style="text-align:center">
										<c:if test="${patentDoc.checkFee<=0}">/</c:if>
										<c:if test="${patentDoc.checkFee>0}">${patentDoc.checkFee}</c:if>
									</td>
									<td style="text-align:center">
										${patentDoc.serviceFee}
									</td>
									<td style="text-align:center">
										${patentDoc.totalFee}
									</td>
									<c:if test="${patentDoc.feeStatus==0}">
										<td style="text-align:center"><c:out value="未缴费"/></td>
									</c:if>
									<c:if test="${patentDoc.feeStatus==1}">
										<td style="text-align:center"><c:out value="已缴费"/></td>
									</c:if>
								  </tr>
								</c:forEach>
							  </tbody>
							</table>
								<tr>
									<td colspan="10">总价: ￥<span id="totalAmount">${totalAmount}</span>
									</td>
								</tr>
					  </table>
					  <span style="margin-left:10px;margin-bottom:10px;">
					  <input type="submit" class="button button-caution button-rounded" value="提交订单">
					  </span>
					</form>				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>	

<div class = "modal fade" id = "commonInventorModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:1000px;">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="inventorModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	请上传缴费发票凭证
            </h4>
         </div>
	         <div class = "modal-body" style="margin-left: 80px;">
	           
				<div class="lt-box" style="height:80px;padding:20px;">
					<form id="patentDocAttachment" action="<s:url value='/editor/uploadInvoicePic.html'/>"  method="post" enctype="multipart/form-data" class="form-horizontal">  
					<input style="display:none;"  id="patentAttachmentFile" name="file" type="file" />
					<input class="selectPointOfInterest form-control"  style="width:300px;display:inline;" type="text" id="filename" name="filename" placeholder="请选择文件" readonly="readonly">
					<button type="button" onclick="$('input[id=patentAttachmentFile]').click();" class="t-btn3 button button-primary  button-rounded">浏览</button>
					<button style="margin-left:5px;" type="button" class="t-btn2 button button-caution button-rounded" onclick="uploadAttachmentFile()">上传</button>
					</form> 

					<div style="height:10px;">&nbsp;</div> 
					<span style="color:#666;">友情提示：请提供缴费发票凭证用于管理员审核(jpg、png格式)，不建议上传其他格式的文件!
					</span>
				</div>
	           
	         </div>
      </div>
   </div>
</div>
<script type="text/javascript">
 	
 	function hideUploadInvoice(){
 		$("#InvoicePic").hide();
 		$("#invoicePicPath").val("")
 	}
 	
 	
	$('input[id="patentAttachmentFile"]').change(function() {
		$('#filename').val($(this).val());  
	});
	
	function uploadAttachmentFile(){
		
		var hideForm = $('#patentDocAttachment'); 
		var options = {
			dataType : "json", 
			data: {'file': $("#patentAttachmentFile").val()},
			beforeSubmit : function() {
				var name=$("#filename").val();
				var mime = name.toLowerCase().substr(name.lastIndexOf("."));
				if(mime ==".jpg" || mime ==".png"){
					return true;
				}else{
					alert("请上传图片！");
					return false;
				}
			}, 
			success : function(result) {
				$("#invoicePicPath").val(result);
				alert("上传成功!");
			}, 
			error : function() {
				alert("上传失败"); 
			} 
		}; 
		hideForm.ajaxSubmit(options); 
	}

</script>
</body>
</html>