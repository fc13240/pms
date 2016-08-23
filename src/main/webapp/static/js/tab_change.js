function tabChange(whichTab, flag, isclaim) {//whichTab:0-8代表第1-第9个选项卡,增加一个flag用于切换时候看是否需要判断专利类型 
    //标签操作要做的几个重点：提示是否选择了专利类型；保存上一个标签编辑区；标签切换到当前标签；切换撰写小贴士；获取当前标签编辑区；获取当前标签的模版库内容；
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
//	$(.right_right_bot).attr("tab_name",new_name);
	/*if(whichTab<=3){
	    $("#templateSectionId").html(whichTab+1);
	    loadingGuideBYTab(whichTab+1);
		loadingTemplateBYTab(whichTab+1);

		p=1;
	}else if(whichTab==4){
		$("#templateSectionId").html(whichTab);
		p=1;
		loadingTemplateBYTab(7);
	}else if(whichTab==6){
		$("#templateSectionId").html(whichTab);
		p=1;
		loadingTemplateBYTab(8);
	}else if(whichTab==7){
		$("#templateSectionId").html(whichTab);
		loadingTemplateBYTab(9);
		p=1;
	}*/
	
	loadingGuideBYTab(whichTab+1);
	if(whichTab==0){
	    $("#templateSectionId").html(1);
		loadingTemplateBYTab(1);

		p=1;
	}else if(whichTab==2){
		$("#templateSectionId").html(2);
		p=1;
		loadingTemplateBYTab(2);
	}else if(whichTab==3){
		$("#templateSectionId").html(3);
		p=1;
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
	$(".guide-list").empty();
	if(sectionId==1){
		$(".guide-list").append("专利名称就是根据要申请专利的技术内容给专利起个名字，模板库中已经涵盖了所有的专利名称模板，都是经过专家审核过的，直接选择一个套用就可以了哦。");	
	}
	if(sectionId==2){
		$(".guide-list").append("这里指专利要求保护的技术所属或者直接应用的具体技术领域，这部分文字并不多^_^，选个模板填写你的内容吧。");	
	}
	if(sectionId==3){
		$(".guide-list").append("不能光顾着写要申请的专利技术，总要告诉审查员们，你为什么要申请这件专利吧？这里只要讲一下目前的现有技术即可，如果能引用一篇或几篇相关专利或文献，结合分析，就能让大审们对你更有好感了。当然了，撰写仍有模板辅助，这件事瞬间就简单了，快去看看专业人员怎么写的吧。");	
	}
	if(sectionId==4){
		$(".guide-list").append("<p>"+
									"1)要解决的技术问题</p>"+
								"<p>"+
									"针对现有技术存在的问题，结合您的技术所能取得的效果，说说您的技术要解决的技术问题，简单说一下要解决的问题就可以了，不用说效果。一般别人都是写一小段，写多了审查人员也不介意，不过还是先看看模板吧，毕竟专利的表述是采用法律文书的形式，套路都比较固定了。"+
								"</p>"+
								"<p>"+
									"2)技术方案</p>"+
								"<p>"+
									"这部分内容看似不少，其实就是权利要求部分的内容，建议先看看模板吧，看完之后就会发现原来是对权利要求的进一步描述。写好权利要求这部分就解决了，还没写的还不快去写，一部分可是当两部分用啊。</p>"+
								"<p>"+
									"3)有益效果</p>"+
								"<p>"+
									"即由您申请专利的技术特征直接带来的，或者是由这些技术特征必然产生的效果。通常可以通过对申请专利的技术的结构特点与理论分析的结合而得出，或通过列出实验数据的方式予以说明。无论哪种方式都应通过与现有技术的比较而得出。</p>"+
								"<p>"+
									"4)发明内容部分所述的技术方案与权利要求所限定的相应技术方案的表述一致。 <i class='cancelhh' onclick='doShort('farming');'>"+
										"收起</i></p>");	
	}
	if(sectionId==5){
		$(".guide-list").append("1)要解决的技术问题"+
"针对现有技术存在的问题，结合您的技术所能取得的效果，说说您的技术要解决的技术问题，简单说一下要解决的问题就可以了，不用说效果。一般别人都是写一小段，写多了审查人员也不介意，不过还是先看看模板吧，毕竟专利的表述是采用法律文书的形式，套路都比较固定了。"+
"2)技术方案"+
"这部分内容看似不少，其实就是权利要求部分的内容，建议先看看模板吧，看完之后就会发现原来是对权利要求的进一步描述。写好权利要求这部分就解决了，还没写的还不快去写，一部分可是当两部分用啊。"+
"3)有益效果"+
"即由您申请专利的技术特征直接带来的，或者是由这些技术特征必然产生的效果。通常可以通过对申请专利的技术的结构特点与理论分析的结合而得出，或通过列出实验数据的方式予以说明。无论哪种方式都应通过与现有技术的比较而得出。"+
"4)发明内容部分所述的技术方案与权利要求所限定的相应技术方案的表述一致。");	
	}
	if(sectionId==6){
		$(".guide-list").append("此部分应当详细、具体地描述实现发明或实用新型的优选方式，在适当情况下举例说明，有需要的话可以结合附图说明。每一条独立权利要求需要给出一个最佳实施方式或具体实施方式。此外从属权利要求的优先方案也应当在这一部分的具体实施方式中体现。 具体实施方式部分所述的技术方案用于清楚、完整地说明权利要求所限定的相应技术方案。");	
	}
		
		
	
}

function loadingTemplateBYTab(sectionId){
	 $.ajax({
		 type : "POST",
		 url : "../editor/getTemplateList.html?sectionId="+sectionId,
		 success : function (data){
			 var obj= $.parseJSON(data);
			 $("#modelWrap").empty();
			 $("#hiddenmodel").empty();
			 $.each(obj,function(i,item){
				 $("#modelWrap").append("<div class='model1 model_list"+i+"' style='overflow-x: hidden; overflow-y: hidden;height:158px;'>"+
					 "<div class='title'>模板"+(i+1)+":"+item.templateTitle+"</div>"+
					 	 "<div class='content'>"+
			 				"<p class='small'>"+
								"<span>"+item.patentDocSectionType.patentDocSectionDesc+"：</span><span>"+item.content+"</span>"+
							"</p>"+
						"</p>"+
					    "<div class='button' style='z-index:500000;' onclick='templatebuttonclick("+i+","+item.patentDocSectionType.patentDocSectionId+")'>+使用模板</div>"+
					  "</div>"+
				   "</div>");
				 $("#modelWrap span").css("color","black");
			 	 $("#hiddenmodel").append("<p id='templateContent"+i+"'>"+item.content+"</p>");
			 });
		 },error : function (){
			 
		 }
	 })
}

	
	
	