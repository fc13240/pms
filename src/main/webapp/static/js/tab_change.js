function tabChange(whichTab, flag, isclaim) {//whichTab:0-8代表第1-第9个选项卡,增加一个flag用于切换时候看是否需要判断专利类型 
    //标签操作要做的几个重点：提示是否选择了专利类型；保存上一个标签编辑区；标签切换到当前标签；切换撰写小贴士；获取当前标签编辑区；获取当前标签的模版库内容；
	p=1;
	if (flag == undefined)
        flag = true;
    if (isclaim == undefined)
        isclaim = true;

	

    //2、保存上一个标签编辑区：如果选择的不是当前标签，将当前标签的内容保存
    if (flag)//切换标签时，flag=true，保存上一标签的内容再切换标签
    {
		var oldtab = $("#tabWrap").find(".tab1").attr("value");
        if (oldtab != whichTab) {      //如果前后tab不同，保存上一个tab内容

			//  保存之前的记录  结束

        } else{
			 return;
			
		}
               	
    }
    //3、标签切换到当前标签；
    $("div[name='tabs']:eq(" + whichTab + ")").attr('class', 'tab1').siblings().attr('class', 'tab1h');
  //切花到当前编辑框

	var old_name="content"+oldtab;
	var new_name="content"+whichTab;
	
	var old_tip_name="tip"+oldtab;
	var new_tip_name="tip"+whichTab;
	
	$('#'+old_name).hide();
	$('#'+new_name).show();
	$('.'+old_tip_name).hide();
	$('.'+new_tip_name).show();	

	loadingGuideBYTab(whichTab+1);
	if(whichTab==1){
	    $("#templateSectionId").html(1);
		loadingTemplateBYTab(1);
	}else if(whichTab==3){
		$("#templateSectionId").html(2);
		loadingTemplateBYTab(2);
	}else if(whichTab==4){
		$("#templateSectionId").html(3);
		loadingTemplateBYTab(3);
	}else{
		loadingTemplateBYTab(-1);
	}
}

//点击设为模板，开始使用，把内容显示到编辑框
function modelbuttonclick(list_no) {
	var list_name="model_list"+list_no;
    var modelid = $("."+list_name+" .big").html();
	alert(modelid);
	//还差一步，把内容写进编辑框中。
	
}
function loadingGuideBYTab(sectionId){
	//$(".guide-list").empty();
	
	var guide="guide_"+sectionId;

	$("."+guide).show().siblings().hide();		
}
function changeGuide(guide_type){
	//$(".guide-list").empty();
	//var guide_type=$(this).attr("data");
	//alert("我来过");
	//alert(guide_type);
	//alert(guide_type);
	$("."+guide_type).toggle();		
}



function loadingTemplateBYTab(sectionId){
	var patentType=$("#patentType").val();
	$("#topUpPage").css("color","#ccc");
	$("#bottonUpPage").css("color","#ccc");
	var totalPage = getTabTotalPageBySectionId(sectionId);
	if(totalPage==1){
		$("#topDownPage").css("color","#ccc");
		$("#bottomDownPage").css("color","#ccc");
	}else{
		$("#topDownPage").css("color","#0085d0");
		$("#bottomDownPage").css("color","#0085d0");
	}
	 $.ajax({
		 type : "POST",
		 url : "../editor/getTemplateList.html",
		 data : {"sectionId":sectionId,"patentType":patentType},
		 success : function (data){
			 var obj= $.parseJSON(data);
			 $("#modelWrap").empty();
			 $("#hiddenmodel").empty();
			 $.each(obj,function(i,item){
				 $("#modelWrap").append("<div class='model1 model_list"+i+"' style='overflow-x: hidden; overflow-y: hidden;height:158px;'>"+
					 "<div class='title'>模板"+(i+1)+":"+item.templateTitle+"</div>"+
					 	 "<div class='content'>"+
			 				"<p class='small'>"+
								"<span>"+item.content+"</span>"+
							"</p>"+
						"</p>"+
					    "<div class='button' style='z-index:500000;width:100px;' onclick='templatebuttonclick("+i+","+item.patentDocSectionType.patentDocSectionId+")'>+使用模板</div>"+
					  "</div>"+
				   "</div>");
				 $("#modelWrap span").css("color","black");
			 	 $("#hiddenmodel").append("<div id='templateContent"+i+"'>"+item.content+"</div>");
			 });
		 },error : function (){
			 
		 }
	 })
	 
 function getTabTotalPageBySectionId(sectionId){
		var totalPageForSectionId=0;
		var patentType=$("#patentType").val();
		 $.ajax({
			 type : "POST",
			 url : "../editor/getTotalPage.html",
			 data : {"sectionId":sectionId,"patentType":patentType},
			 async: false,
			 success : function (data){
				 totalPageForSectionId=data;
			 },error : function (){
			 }
		 });
		 return totalPageForSectionId;
	 }
}

	
	
	