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
	
}

//点击设为模板，开始使用，把内容显示到编辑框
function modelbuttonclick(list_no) {
	var list_name="model_list"+list_no;
    var modelid = $("."+list_name+" .big").html();
	alert(modelid);
	//还差一步，把内容写进编辑框中。

	
	
	
	
	
	
	
}