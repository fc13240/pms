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
<title>龙图腾专利管家－我的专利！</title>
<%@ include file="_css.jsp" %>
<style type="text/css">
.qxjk-ul li {
    width:300px;
    height: 40px;
    border-bottom: 1px dashed #ccc;
	margin:10px 0 0 0;
	padding: 0 5px;
};

	a:link{color:black;} 
	a:visited{color:blue;}
	a:hover{color:red;}
	a:active{color:green;} 
</style>
</head>
<body>
<%@ include file="_top.jsp" %>



<div class="lt-con" style="min-width:1100px;">



	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">

		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav2.jsp" %>
		  </div>
		  <!--left end-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<!-- menu begin -->
				<div class="lt-box">

					<div id="menu" >
					  <div style="height:33px;">
						<ul id="nav">
						  <p>快捷处理：</p>
						  <li><a href="#" class="selected">申请人分类</a></li>
						</ul>
					  </div>
						
					  <div id="menu_con" style="height:0;border-bottom:0 ;border-top:1px solid #03752F;">
					  						
						<div class="tag" style="display:block; margin-left:70px;"> 

						  <ul class="qxjk-ul">
						  <c:forEach items="${appPersonCount}" var="appPersonCount" varStatus="status">
						  	<li>
						  		${status.count}.&nbsp;&nbsp;
						  		 <a  href="<s:url value='/patent/search.html?page.currentPage=1&keyword=${appPersonCount["appPerson"]}'/>">
									${appPersonCount["appPerson"]}(<c:out value='${appPersonCount["patentCount"]}' default="0"/>)
								</a>
							</li>
						  </c:forEach>
						  </ul>	    
						</div>
					  </div>
					</div>				
				</div>
				<!-- menu end -->
			
			
			</div> 
			
		  </div>
			<!--right end-->
		</div>
	</div>	
</div>
<iframe id="patentExcelFileFrame" style="display:none"></iframe>	

<script src="<s:url value='/static/datepicker/WdatePicker.js'/>"></script>
<script type="text/javascript">
$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	});
	$(function(){
		formutil.clickAllCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
		formutil.clickItemCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
	});

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