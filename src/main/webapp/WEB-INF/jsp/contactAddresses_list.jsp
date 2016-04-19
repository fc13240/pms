<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<title>控制台</title>
<%@ include file="_css.jsp" %>

</head>
<body class="no-skin">

<%@ include file="_nav.jsp"%>

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">

  <!-- sidebar -->
	<%@ include file="_main_menu.jsp"%>
  <!-- sidebar -->
  <div class="main-content">
    <div class="main-content-inner">
      <!-- #section:basics/content.breadcrumbs -->
      <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
          <li> <i class="ace-icon fa fa-home home-icon"></i> <a href="#">主页</a> </li>
          <li> <a href="#">订单</a> </li>
        </ul>
      </div>
      <div class="page-content">
 
        <div class="row">
          <div class="col-xs-12">
          	<form>
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
							<td>
                              	<a href="<s:url value='/user/updateUserContactAddressesFrom.html'/>?id=<c:out value='${address.id}'/>">
                              	<button type="button" class="btn btn-info btn-sm">编辑</button> 
                              	</a>
           						<a href="<s:url value='/user/deleteUserContactAddresses.html'/>?id=<c:out value='${address.id}'/>">
           						<button type="button" class="btn btn-purple btn-sm">删除</button>
           						</a>
           						<c:if test="${!address.defaultAddress}">
           						<a style="margin-left:30px;" href="<s:url value='/user/defaultUserContactAddresses.html'/>?id=<c:out value='${address.id}'/>">
           						设为默认
           						</a>
           						</c:if>
           						<c:if test="${address.defaultAddress}">
           							<span style="margin-left:30px;">默认地址</span>
           						</c:if>
	                        </td>
	                        
						</tr>       
          			</c:forEach>                			       			     			
          		</table>
          		<input type="button" onclick="javascript:addAddress()" value="增加地址">
          	</form>
          </div>
        </div>
		<%@ include file="_footer.jsp"%>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"> <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i> </a> </div>
    </div>
  </div>
</div>
<%@ include file="_js.jsp"%>
<script type="text/javascript">
	function addAddress(){
		var url = "<s:url value='/user/contactAddressAddForm.html'/>";
		location.href = url
	}
</script>
</body>
</html>
