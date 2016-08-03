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
<title>龙图腾专利管家－我的专利！</title>
<%@ include file="_css.jsp" %>
<style type="text/css">
.main2 {
    clear: both;
    background: #fff;
    border: #e6e6e6 1px solid;
    margin: 0px auto -44px;
    width: 900px;
    border-radius: 8px;
    box-shadow: 0 0 4px #e6e6e6;
    padding: 0;
    overflow: auto;
}

.title1 a {
    line-height: 30px;
    color: #3d6dcc;
    cursor: pointer;
}

.tit_top {
    clear: both;
    margin: 0 40px;
    width: 810px;
    border-bottom: #f2f2f2 3px solid;
    overflow: auto;
}
.title2 {
    color: #3691d6;
    font-size: 24px;
    font-weight: bold;
    padding: 20px 20px 15px 4px;
}
.uppic2 {
    background: url(images/buttons.png) no-repeat scroll -96px -59px;
    color: #999;
    float: right;
    font-size: 14px;
    height: 32px;
    line-height: 32px;
    margin-top: 8px;
    text-align: center;
    text-shadow: 1px 1px 0 #e6e6e6;
    width: 97px;
    cursor: pointer;
    margin-left: 44px;
    margin-bottom: 14px;
    margin-top: -30px;
}
.top1 {
    padding-top: 20px;
}
table {
    clear: both;
    width: 90%;
    margin: 0 auto;
    border: 1px solid #e1e6eb;
}
* {
    margin: 0;
    padding: 0;
    font-size: 12px;
    font-family: "microsoft yahei" ,宋体;
    color: #000;
    line-height: 18px;
    text-decoration: none;
}
.pageh3 {
    clear: both;
    float: right;
    padding-bottom: 10px;
    padding-top: 5px;
    width: 540px;
}
.title1 {
    line-height: 24px;
    width: 300px;
    max-width: 300px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    cursor: pointer;
}
.odd {
    background: #f5f8fa;
}
table td {
    line-height: 30px;
    padding: 5px 0 5px 10px;
    color: #666;
}

table td a {
    line-height: 30px;
    color: #056dae;
    padding-right: 10px;
    cursor: pointer;
}
</style>
</head>
<body onload=>
<%@ include file="_top.jsp" %>

				
			
				
<div id="replaceHere" style="">
		<div class="main2">
    		<div class="tit_top">
        		<div class="title2">
          		  撰写列表</div>
        		<div class="uppic2" onclick="adduser();">
            	新建专利</div>
    		</div>
    <div class="cl top1">
        
    </div>
    <table cellspacing="0" cellpadding="0" border="0">
        <tbody>
            <tr id="tr0" style="background: #f7f7f7; border-bottom: 1px solid #e1e6eb;">
                <td width="47%" valign="middle" height="30" align="left" class="td1h">
                    标题
                </td>
                <td width="13%" height="30" align="left" valign="middle" class="td1h">
                    创建时间
                </td>
                <td width="13%" height="30" align="left" valign="middle" class="td1h">
                    更新时间
                </td>
                <td width="27%" valign="middle" height="30" align="left" class="td1h td2">
                    操作
                </td>
            </tr>
		<c:forEach items="${patentDocs}" var="patentDoc" varStatus="status">

						   
            <tr class="">
                <td width="47%" valign="middle" align="left">
                    <div class="title1">
                        
                        <a onclick="editOne('3197');">
                            <c:out value="${patentDoc.name}"/></a></div>
                    
                </td>
                <td width="13%" valign="middle" align="left">
                    <fmt:formatDate value="${patentDoc.createTime}" pattern="yyyy-MM-dd"/>
                </td>
                <td width="13%" valign="middle" align="left" class="td4">
                    <fmt:formatDate value="${patentDoc.lastUpdateTime}" pattern="yyyy-MM-dd"/>
                </td>
                <td width="27%" valign="middle" align="left">
                    <a target="_blank" href="<s:url value='/editor/findPatentDoc.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>">
								 编辑
					</a><a onclick="preView('3197');">预览</a>
                    <a onclick=" exportLayerShow('3197');">导出</a><a onclick="deleteOne('3197','1',7);">删除</a><a href="http://www.cponline.gov.cn/" target="_blank">提交申请</a>
                </td>
            </tr>
            
           
		</c:forEach>
		</tbody>
	</table>
			            
				
				
	
			
			
			</div> 
			
		  </div>
		  
			<!--right end-->
		</div>
	</div>	
</div>

<script type="text/javascript">
$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	});
	$(function(){
		formutil.clickAllCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
		formutil.clickItemCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
	});
	
	
 	function batchAddGoods() {
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		var uniquePatentNos = []
		if (!patentSelected) {
			formutil.alertMessage('请选择专利');
			
			return;
		}
		var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
		for (var i = 0; i < patents_checked.length; i++) {
			if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
				uniquePatentNos.push(patents_checked[i]);
				
			}
			
		}
		
		var patentIds = uniquePatentNos.join(",");
		$.ajax({
			url:"<s:url value='/patent/batchAddGoods.html'/>?patentIds=" + patentIds,
			type:"get",
				success: function(data) {
					formutil.alertMessage(data,true);	
				},
				error: function() {
					formutil.alertMessage('批量发布失败');
				}
		});
	}
	 
	
	
	
	
	
	function batchDelectPatents() {
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		var uniquePatentNos = []
		if (!patentSelected) {
			formutil.alertMessage('请选择专利');
			
			return;
		}
		var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
		for (var i = 0; i < patents_checked.length; i++) {
			if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
				uniquePatentNos.push(patents_checked[i]);
			}
		}		
		var patentIds = uniquePatentNos.join(",");
		$.ajax({
			url:"<s:url value='/patent/deletePatents.html'/>?patentIds=" + patentIds,
			type:"get",
				success: function(data) {
					formutil.alertMessage('删除操作成功',true);	
				},
				error: function() {
					formutil.alertMessage('删除操作失败',true);
				}
		});
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

	function batchShare() {
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		var uniquePatentNos = []
		if (!patentSelected) {
			formutil.alertMessage('请选择专利');
			
			return;
		}
		var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
		for (var i = 0; i < patents_checked.length; i++) {
			if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
				uniquePatentNos.push(patents_checked[i]);
			}
		}		
		var patents = uniquePatentNos.join(",");		
		location.href = "<s:url value='/patent/showFriends.html'/>?patents=" + patents;
	}
	function batchGrabFees(){
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		if (!patentSelected) {
			formutil.alertMessage('请选择专利');
			return;
		}
			
		var patentNos = formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
		
		 window.open("<s:url value='/fee/batchGrabFees.html'/>?patents=" + patentNos);		
		
	}	
	
	
	function getFeeInfo(patentId) {
		window.open("/fee/list?patentId=" + patentId);
	}
	
	
	function changeInternalCode(patentId, internalCode) {
		$.ajax({
			url: "<s:url value='/patent/changeInternalCode.html'/>?patentId=" + patentId + "&internalCode=" + internalCode, 
			type: 'get', 
			success: function() {
				formutil.alertMessage('内部编码修改成功');	
			},
			error: function() {
				formutil.alertMessage('内部编码修改失败');
			}
		});	
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
	
	function exportFees(){
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		
		if (!patentSelected) {
			formutil.alertMessage('请选择要导出的专利');
			return;
		}
		var patents = formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
		var iframe = document.getElementById('patentExcelFileFrame');
		iframe.src = "<s:url value='/patent/exportPatents.html'/>?patentIds=" + patents;
		
	}
</script>



</body>
<html/>