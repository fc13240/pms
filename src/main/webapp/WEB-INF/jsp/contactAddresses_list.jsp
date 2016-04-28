<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>联系地址</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav_user.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">联系地址</span>
	</div>
	<div class="lt-box">
	  <form>
		<button type="button" style="width: 100px;margin-bottom:20px;" class="t-btn3" onclick="javascript:addAddress()">增加地址</button>
		<table id="simple-table" class="table table-striped table-bordered table-hover">
		  <thead>
			<tr class="simple_bag">
			  <th>序号</th>
			  <th>联系人</th>
			  <th>所在地区</th>
			  <th>地址</th>
			  <th>联系电话</th>
			  <th>操作功能</th>
			</tr>
		  </thead>
		  <c:forEach items="${contactAddresses}" var="address" varStatus="status">
			<tr>
			  <td class="center">${status.count}</td>
			  <td>${address.receiver}</td>
			  <td>${address.provinceName} ${address.cityName} ${address.districtName}
				${address.streetName}</td>
			  <td>${address.detailAddress}</td>
			  <td>${address.phone}</td>
			  <td><a href="<s:url value='/user/updateUserContactAddressesFrom.html'/>?id=<c:out value='${address.id}'/>"> 编辑 </a> <a href="<s:url value='/user/deleteUserContactAddresses.html'/>?id=<c:out value='${address.id}'/>">
				<!-- 		           						<button class="t-btn4">删除</button> -->
				删除 </a>
				<c:if test="${!address.defaultAddress}"> <a style="margin-left:30px;" href="<s:url value='/user/defaultUserContactAddresses.html'/>?id=<c:out value='${address.id}'/>"> 设为默认 </a> </c:if>
				<c:if test="${address.defaultAddress}"> <span style="margin-left:30px;">默认地址</span> </c:if>
			  </td>
			</tr>
		  </c:forEach>
		</table>
	  </form>
	</div>

</div>


<script type="text/javascript">
	function addAddress(){
		var url = "<s:url value='/user/contactAddressAddForm.html'/>";
		location.href = url
	}
</script>
<script>
	$(document).ready(function(){
	
		$("img[class=cgh]").click(function(){
			var ol = $('ol[class="hashTabber-nav hashTabber-sandstone"]')[0];
			var ols =$('.con-list')[0];
			if(ol.style.display=="inline-block"||ol.style.display==""){
					this.style.marginLeft="0px";
					this.src='<s:url value='/temp/images/tabs.png'/>';
					ol.style.display="none";
					ols.style.width="97%";
				}else{
					ol.style.display="inline-block";
					this.style.marginLeft="108px";
					this.src='<s:url value='/temp/images/tab.png'/>';
					ols.style.width="88%";
				}
		});
	});
</script>
</body>
</html>