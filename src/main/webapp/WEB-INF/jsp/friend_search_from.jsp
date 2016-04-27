<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加好友</title>
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
					<span style="font-size: 16px;font-weight: 300;line-height: 24px;">添加好友</span>
				</div>
                <div style="height:30px;"></div>

				<div class="t-third">
					    <form action="<s:url value='/friend/search.html'/>" method="GET"  role="search">
					      <div class="form-group">
					        <input type="text" id="form-field-1" style="height:25px;width:450px;" name="keyword" id="keywordId" placeholder="用户名/姓名" value="<c:out value='${param.keyword}'/>" />
					        <button  type="submit" class="t-btn4">查询</button>
					      </div>
					    </form>

					    <table class="table table-bordered table-striped">
					      <tr>
					        <th>序号</th>
					        <th>用户名</th>
					        <th>姓名</th>
					        <th>操作</th>
					      </tr>
					      <c:forEach items="${friends}" var="friend" varStatus="status">
					        <tr>
					          <td>${status.count + page.startIndex}</td>
					          <td><c:out value="${friend.username}"/></td>
					          <td><c:out value="${friend.name}"/></td>
					          <td><a  href='javascript:sendFriendRequest("<c:out value='${friend.userId}'/>");'>请求加为好友</a></td>
					        </tr>
					      </c:forEach>
					    </table>
					    <c:if test="${param.keyword == null}">
					      <div class="col-lg-12" id="page.page" style="display:block;"> 共 ${page.totalPages}页${page.totalRecords}条记录    第${page.currentPage} 页 <a href="?currentPage=1">首页</a>
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
					        <input type="text" id="page.pageNo" style="width:50px;height:25px" name="currentPage" onkeydown="gotoPageForEnter(event)"/>
					        <a href="javascript:void;" onclick="javascript:gotoPage()">跳转</a> </div>
					    </c:if>
		
 
                            	
                </div>                
                <!--  -->
			</div>
         
        </div>
		<!--container end-->
    </div>
</div>

<script type="text/javascript">
function sendFriendRequest(toUser) {
	$.ajax({
		url: "<s:url value='/friend/request.html'/>?toUser=" + toUser,
		success: function() {
	   		$("<div>请求已发送</div>").dialog({
	   			modal: true,
	   			buttons: {
	   				Ok: function() {
	   					$(this).dialog("close");
	   				}
	   			}
	   		});
		}
	});
}
</script>
<script type="text/javascript">
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
			
			var url = "<s:url value='/friend/searchForm.html'/>?currentPage=" + pageNo;
			
			location.href = url
			
		}
		
		function gotoPageForEnter(event) {
			var e = event ? event : window.event;
					
			if(event.keyCode == 13) {
				gotoPage();
			}
		}
		
		
</script>
	<script type="text/javascript">
			function pageHide() {
				document.getElementById("page.page").style.display="none";
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