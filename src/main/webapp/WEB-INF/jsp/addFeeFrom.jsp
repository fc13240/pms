<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加专利</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav_fee.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">添加费用信息</span>
	</div>
	
	<form action="<s:url value='/patent/addFee.html'/>" method="post">
	  <div class="t-third">
	    <ul>
	      <li>
	        <p>申请号/专利号:</p>
	        <select name="patentId" id="patentId" onchange="loadPatent()" required>
			  <option value=''>请选择专利号</option>
			  <c:forEach items="${patents}" var="patent">
				<option value="${patent.patentId}">${patent.patentId}</option>
			  </c:forEach>
			</select>
	      </li>
	      <li>
	        <p>专利名称:</p>
	        <input type="text" name="name" id="name" value=""/>
	      </li>
	      <li>
	        <p>第一申请人:</p>
	        <input type="text" name="appPerson" id="appPerson" value=""/>
	      </li>
	      <li>
	        <p>案件状态:</p>
	        <input type="text" name="patentStatus" id="patentStatus" value=""/>
	      </li>
	      <li>
	        <p>缴费截止日:</p>
	        <div style="margin-top:10px;">
					<div class="input-group">
					  <div style="float:left;margin-left: 16px;" class="form-group" style="margin-left:15px;">
					  <div style="float:left;">
						<input  type="text" class="form-control" id="startAppDateId" 
						name="startDispatchDate" placeholder="缴费截止日期选择" value="<fmt:formatDate value="${patent.appDate}" pattern="yyyy-MM-dd"/>"  
						readonly="readonly" onclick="javascript:$('#start_date_img').click()" style="width: 150px;height: 25px"> </div>
					  <div style="float:left;margin: 8px;"><img onclick="WdatePicker({el:'startAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="25" height="30" align="absmiddle" id="start_date_img"></div>
					</div>
				  </div>
				  </div>
	      </li>
	      <li>
	        <p>缴费种类:</p>
	        <select name="feeType" id="feeType"  required>
			  <option value=''>请选择</option>
			  <c:forEach items="${fee}" var="fee">
				<option value="${fee.feeType}">${fee.feeType}</option>
			  </c:forEach>
			</select>
	      </li>
	      <li>
	        <p>缴费金额:</p>
	        <input style="height:16px;" type="text" name="name" id="name"  required/>
	      </li>
	      <li>
	        <p>发票抬头:</p>
	        <input style="height:16px;" type="text" name="name" id="name"  required/>
	      </li>
	      <li>
	        <p>&nbsp;</p>
	        <button type="submit">保存</button>
	      </li>
	    </ul>
	  </div>
	</form>


</div>
 

<script type="text/javascript">

function loadPatent() {
	var patentId = $("#patentId").val();
	if (patentId != "") {
		$.ajax({
			url: "<s:url value='/fee/getPatentByPatentId.html'/>?patentId=" + patentId,
			type: 'get',
			dataType: 'json',
			success: function(patent) {
				document.getElmentById("name").value=${param.patent.name};
				document.getElementById('appPerson').value=${patent.appPerson};
				document.getElementById('patentStatus').value=${patent.patentStatus.statusDescription};
			}
		})
	} 
}
</script>
</body>
</html>