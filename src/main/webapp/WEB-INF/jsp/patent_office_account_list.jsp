<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>龙图腾专利</title>
<%@ include file="_css.jsp" %>
</head>
<body style="background:#F3F3F5;">
<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav2.jsp" %>
<div class="lt-con">
  <div class="t-ti">
    <hr class="t-hr">
    <span style="font-size: 16px;font-weight: 300;line-height: 24px;">我的专利</span> </div>
<!-- list beg -->


	
	

	<div class="lt-box">
	  <div class="main-container" id="main-container">
	    <!-- PAGE CONTENT BEGINS -->
	    <div class="row">
	      <div class="col-xs-12">
	        <div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
	          <div class="ta-top" style="margin:8px;"> <a href="javascript:batchShare()">
	            <button class="t-btn3">添加电子账户</button>
	            </a> 
	          </div>
	          </span> </div>
	        <table id="simple-table" class="table table-striped table-bordered table-hover">
	          <thead>
	            <tr class="simple_bag">
	              <th class="center" width="25"> <label class="pos-rel">
	                <input type="checkbox" class="patent-check-item" id="checkall"  name="checkall" />
	                <span class="lbl"></span> </label>
	              </th>
	              <th class="center" width="20">序号</th>
	              <th width="110">中国专利电子申请的用户名</th>
	              <th width="170">用户代码</th>
	              <th width="90">登陆密码 </th>
	              <th width="90" >更新时间</th>
	              <th width="60">操作</th>
	            </tr>
	          </thead>
	          <tbody>
	            <c:forEach items="${accounts}" var="account" varStatus="status">
	              <tr>
	                <td class="center"><label class="pos-rel"> <span class="batch-share-item">
	                  <input type="checkbox" class="patent-check-item" patent="<c:out value='${patent.patentId}'/>">
	                  <span class="lbl"></span></label></td>
	                <td class="center"> ${status.count + (page.currentPage-1)*page.pageSize} </td>
	                <td><c:out value="${account.name}"/>
	                </td>
	                <td><c:out value="${account.username}"/></td>
	                <td><c:out value="${account.password}"/></td>
	                <td><fmt:formatDate value="${account.patentUpdateTime}" pattern="yyyy-MM-dd"/></td>
	                
	                
	                <td>验证更新&nbsp; 
	                	<a href="javascript:void(0)" onclick="updateAccount('${account.accountId}')">
	                  		修改</a>&nbsp;
	                  	<a href="JavaScript:void(0)" onclick="deleteAccount('${account.accountId}')">
	                                                                  删除 </a>                                  
	                </td>
	                
	              </tr>
	            </c:forEach>
	          </tbody>
	        </table>
	 
	      </div>
	    </div>
	    </form>
	    <!--search box end-->
	  </div>
	</div>
  
  
 <!--list end --> 
</div>

<script src="<s:url value='/static/datepicker/WdatePicker.js'/>"></script>
<script type="text/javascript">
	$(function(){
		formutil.clickAllCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
		formutil.clickItemCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
	});
	
	function updateAccount(accountId) {
		window.open("<s:url value='/patentOfficeAccount/detail.html'/>?accountId=" + accountId);
	}
	
	function deleteAccount(accountId) {
		$.ajax({
			url: "<s:url value='/patentOfficeAccount/delete.html'/>?accountId="+ accountId,
			type: 'get', 
			success: function() {
				location.reload();
			}
		});		
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