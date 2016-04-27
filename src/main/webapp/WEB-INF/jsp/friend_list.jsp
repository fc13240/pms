<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>好友列表</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
 
<div style="min-width:1300px;height:1500px; background:#F3F3F5;">
	<div style="float:left;width:5%;">
		<%@ include file="_left_nav.jsp" %>
	</div>
	<div style="float:left;width:95%;">

        <div class="center-cconcenct">
        	<!-- 代码 开始 -->
            <div id="change-t"><img src="<s:url value='/temp/images/tab.png'/>"  class="cgh"/></div>
			<div style="float:left;width:9%;">
				<%@ include file="_left_nav_friend.jsp" %>
			</div>
			<div class="con-list" style="float:left;width:91%;">
				<div class="t-ti">
					<hr class="t-hr">
					<span style="font-size: 16px;font-weight: 300;line-height: 24px;">好友列表</span>
				</div>
                <div style="height:30px;"></div>
                     
				<div class="t-third">
					    <form action="<s:url value='/friend/searchUserFriends.html'/>" method="GET"  role="search">
					      <div class="form-group">
					        <input type="text" id="form-field-1" style="height:25px;width:450px;" name="keyword" id="keywordId" placeholder="用户名/姓名" value="<c:out value='${param.keyword}'/>" />
					        <button  type="submit" class="t-btn4">查询</button>
					      </div>
					    </form>

				    <table id="simple-table" class="table table-striped table-bordered table-hover">
				      <thead>
				        <tr class="simple_bag">
				          <th>序号</th>
				          <th>用户名</th>
				          <th>姓名</th>
				          <th>邮箱</th>
						  <th>电话</th>
				          <th>操作</th>
				        </tr>
				      </thead>
				      <tbody>
				        <c:forEach items="${friends}" var="friend" varStatus="status">
				          <tr>
				            <td>${status.count}</td>
				            <td><c:out value="${friend.username}"/></td>
				            <td><c:out value="${friend.name}"/></td>
							<td><c:out value="${friend.email}"/></td>
							<td><c:out value="${friend.phone}"/></td>
				            <td><a  href="<s:url value='/friend/delete/'/><c:out value='${friend.userId}.html'/>">删除好友</a></td>
				          </tr>
				        </c:forEach>
				      </tbody>
				    </table>
		
 
                            	
                </div>          
                
                
                
                
                <!--  -->
			</div>
         
        </div>
		<!--container end-->
    </div>
</div>
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