<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<!DOCTYPE html >
<html>
<head>
	<link rel="stylesheet" href="<s:url value='/temp/css/buttons.css'/>" class="ace-main-stylesheet" id="main-ace-style" />
	<link rel="stylesheet" href="<s:url value='/temp/css/editor.css'/>" class="ace-main-stylesheet" id="main-ace-style" />
<c:import url="common/kindEditor3.jsp"></c:import>

</head>
<body>
<div style="width:100%;min-width:1200px; margin:0 auto;"> 
	<div class="editor-left">
		<div class="left_top">
			<div class="cl" id="div_ipctype">
			<div class="bt" style="margin-left:65px;">发明</div>
			</div>
		</div>
		<!--申请文件九部分标签切换 -->
		<div class="tab" id="tabWrap"> 
			<div style="display:block;" class="tab1" value="0" name="tabs" onclick="tabChange(0);">请求书</div>
			<div class="tab1h" value="1" name="tabs" onclick="tabChange(1);">说明书</div>
			<div class="tab1h" value="2" name="tabs" onclick="tabChange(2);">说明书附图</div>
			<div class="tab1h" value="3" name="tabs" onclick="tabChange(3,true,false);">权利要求书</div>
			<div class="tab1h" value="4" name="tabs" onclick="tabChange(4);">说明书摘要</div>
			<div class="tab1h" value="5" name="tabs" onclick="tabChange(5);">摘要附图</div>
			<div class="tab1h" value="6" name="tabs" onclick="tabChange(6);">上传附件</div>
		</div>	
	</div>
<!-- right beg -->
	<div class="editor-right">
		
		<div class="data_title">
			<span>撰写指南和模板</span>
			
		</div>
	    <div id="modelbutton" class="modelbutton" onclick="modelbuttonclick();" style="position: fixed; top: 230px; left: 1294.5px; display: none;">
	        +设为模板</div>
	    <div class="right_right_bot" tab_name="content0" style="overflow-x: hidden; overflow-y: auto;">
	        <div class="data_menu">
	            <div class="menud" id="modelS" onclick="searGuide(this)">
	            	 撰写指南
	            </div>	
	            <div class="menud" id="modelS" onclick="searModel(this)">
	               	 模板库
	            </div>
	        </div>
			<!-- 指南 -->
			<div class="guide-list"><!--load 指南 然后控制 display -->
				<div class="guide_2" style="background:#ffffff;padding:5px;">
				
					<a href="javascript:;">
						<div onclick="changeGuide('guide_2_1')" style="font-size:14px;font-weight:700;color:blue;">
							1．专利名称
						</div>
					</a>	
					<div class="guide_2_1" style="display:none;">
						<p>
						（1）专利名称应当清楚、简要，写在说明书首页正文部分的上方居中位置。<br>
						（2）专利名称应当按照以下各项要求撰写：<br>
						(2.1)专利名称一般不得超过25个字，特殊情况下，例如，化学领域的某些申请，可以允许最多到40个字；<br>
						(2.2)采用所属技术领域通用的技术术语，最好采用国际专利分类表中的技术术语，不得采用非技术术语；<br>
						(2.3)清楚、简要、全面地反映要求保护的主题和类型(产品或者方法)，以利于专利申请的分类，例如一件包含拉链产品和该拉链制造方法两项发明的申请，其名称应当写成“拉链及其制造方法”；<br>
						(2.4)不得使用人名、地名、商标、型号或者商品名称等。<br>
						(2.5)不得使用商业性宣传用语（专利申请的任何地方都不允许，其他地方不再强调）。
						</p>

					</div>
					<a href="javascript:;">
					<div onclick="changeGuide('guide_2_2')" style="font-size:14px;font-weight:700;margin-top:8px;color:blue;">2．技术领域</div>
					</a>
					<div class="guide_2_2" style="">
						<p>				
						（1）技术领域应当是要求保护的技术方案所属或者直接应用的具体技术领域。<br>
						（2）例如：一项关于挖掘机悬臂的发明，其改进之处是将背景技术中的长方形悬臂截面改为椭圆形截面。其所属技术领域可以写成“本发明涉及一种挖掘机（挖掘机悬臂的上位领域），特别是涉及一种挖掘机悬臂（具体的技术领域或者专利名称）”。
						</p>
					</div>
					<a href="javascript:;">
					<div onclick="changeGuide('guide_2_3')" style="font-size:14px;font-weight:700;color:blue;margin-top:8px;">3．背景技术</div>
					</a>
					<div class="guide_2_3" style="display:none;">
						<p>				
							（1）背景技术要写明对发明或者实用新型的理解、检索、审查有用的背景技术，并且尽可能引证反映这些背景技术的文件。还要客观地指出背景技术中存在的问题和缺点，但是，仅限于涉及由技术方案所解决的问题和缺点。在可能的情况下，说明存在这种问题和缺点的原因以及解决这些问题时曾经遇到的困难。<br>
							（2）引证的文件可以是专利文件，也可以是非专利文件，例如期刊、杂志、手册和书籍等。引证专利文件的，至少要写明专利文件的国别、公开号，最好包括公开日期；引证非专利文件的，要写明这些文件的标题和详细出处。<br>
							（3）例如：发明专利 “一种便携式牙刷”，如果在背景技术描述到现有技术的牙刷存在多种缺陷，如刷毛过硬、刷毛排列形状不利于牙齿保健，易损伤牙齿等，则这些缺陷与本发明要解决的“便携问题”无关，因而不宜将这些问题写入背景技术，而应在背景技术着重描述现有技术的牙刷“携带不方的问题”，如牙刷和牙膏袋是分开的，且这正是本发明可以解决的问题。
						</p>
					</div>
					
					<div style="font-size:14px;font-weight:700;margin-top:8px;">4．发明内容</div>
					<a href="javascript:;">
					<div onclick="changeGuide('guide_2_4_A')" style="font-size:14px;color:blue;font-weight:700;margin-top:8px;">A.发明目的</div>
					</a>
					<div class="guide_2_4_A" style="display:none;">
						<p>				
							（1）发明目的也即所要解决的技术问题，是指要解决的现有技术中存在的技术问题，且专利申请记载的技术方案应当能够解决这些技术问题。该部分的内容相对于前面的“背景技术”和后面的“技术方案”，起到一个承上启下的作用。<br>
							（2）发明目的应针对现有技术中存在的缺陷或不足；用正面的、尽可能简洁的语言客观而有根据地反映要解决的技术问题，也可以进一步说明其技术效果。<br>
							（3）例如：本发明要解决的技术问题是提供一种使用、携带更方便的便携式牙刷。该牙刷在使用时不必从盒体中来回取放牙膏软袋即可刷牙，使用更方便；在携带时牙刷与牙膏袋合成一体，携带更方便。
						</p>
					</div>
					<a href="javascript:;">
					<div onclick="changeGuide('guide_2_4_B')" style="font-size:14px;color:blue;font-weight:700;margin-top:8px;">B.技术方案</div>
					</a>
					<div class="guide_2_4_B" style="display:none;">
						<p>				
							 技术方案是一件专利申请的核心；应当与权利要求所限定的相应技术方案的表述相一致。因此请先撰写权利要求书，然后直接将权利要求书全文复制粘贴到技术方案部分，并按照下述方法修改格式：<br>
							（1）删除权利要求编号和“其特征是”，如果有附图标记，将附图标记和括号一并删除。<br>
							（2）将“根据权利要求X所述的主题名称，其特征是”修改为“作为进一步的优选方案”。
						
						</p>
					</div>
					<a href="javascript:;">				
					<div onclick="changeGuide('guide_2_4_C')" style="font-size:14px;color:blue;font-weight:700;margin-top:8px;">C.有益效果</div>
					</a>
					<div class="guide_2_4_C" style="display:none;">
						<p>				
							（1）有益效果是指由技术特征直接带来的，或者是由所述的技术特征必然产生的技术效果。<br>
							（2）无论用下述哪种方式说明有益效果，都应当与现有技术进行比较，指出发明或者实用新型与现有技术的区别。<br>
							（2.1）通常，有益效果可以由产率、质量、精度和效率的提高，能耗、原材料、工序的节省，加工、操作、控制、使用的简便，环境污染的治理或者根治，以及有用性能的出现等方面反映出来。<br>
							（2.2）有益效果也可以通过对发明或者实用新型结构特点的分析和理论说明相结合，或者通过列出实验数据的方式予以说明，不得只断言发明或者实用新型具有有益的效果。<br>
							（2.3）机械、电气领域的有益效果，可以结合结构特征和作用方式进行说明。但是，化学领域中的发明，在大多数情况下，不适于用这种方式说明发明的有益效果，而是借助于实验数据来说明；在引用实验数据说明有益效果时，应当给出必要的实验条件和方法。<br>
							（2.4）对于目前尚无可取的测量方法而不得不依赖于人的感官判断的，例如味道、气味等，可以采用统计方法表示的实验结果来说明有益效果。
						</p>
					</div>	
					<a href="javascript:;">					
					<div onclick="changeGuide('guide_2_5')" style="font-size:14px;color:blue;font-weight:700;margin-top:8px;">5．附图说明</div>
					</a>
					<div class="guide_2_5" style="display:none;">
						<p>				
				
							（1）对于部分发明专利，在没有附图已经能清楚表达发明技术特征的情况下，可以没有附图说明以及说明书附图和摘要附图。<br>
							（2）附图不止一幅的，应当对所有附图作出图面说明。例如，一件发明名称为“燃煤锅炉节能装置” 的专利申请，其说明书包括四幅附图，这些附图的图面说明如下：<br>
							图1是燃煤锅炉节能装置的主视图；<br>
							图2是图1所示节能装置的侧视图；<br>
							图3是图2中的Ａ向视图；<br>
							图4是沿图1中Ｂ－Ｂ线的剖视图。<br>
							图中：1-锅炉支架、2-水箱……。
						</p>
					</div>
					<a href="javascript:;">
					<div onclick="changeGuide('guide_2_6')" style="font-size:14px;color:blue;font-weight:700;margin-top:8px;">6．具体实施方式</div>
					</a>
					<div class="guide_2_6" style="display:none;">
						<p>				
				
（1）对于产品的发明或者实用新型，实施方式或者实施例应当描述产品的机械构成、电路构成或者化学成分，说明组成产品的各部分之间的相互关系（包含关系、并列关系、连接关系、位置关系、作用关系等）以及各部分的具体特征（如形状、材料、尺寸等）。对于可动作的产品，只描述其构成不能使所属技术领域的技术人员理解和实现发明或者实用新型时，还应当说明其动作过程或者操作步骤。<br>
（2）对于方法的发明，应当写明其步骤，包括可以用不同的参数或者参数范围表示的工艺条件，以及方法机理、实验数据等。<br>
（3）具体实施方式是说明书的重要组成部分，它对于充分公开、理解和实现发明或者实用新型，支持和解释权利要求都是极为重要的。有附图的，应当对照附图进行说明。<br>
（4）对照附图描述发明或者实用新型的优选的具体实施方式时，使用的附图标记或者符号应当与附图中所示的一致，并放在相应的技术名称的后面，不加括号。例如，对涉及电路连接的说明，可以写成“电阻3通过三极管4的集电极与电容5相连接”，不得写成“3通过4与5连接”。

						</p>
					</div>																					
					<a href="javascript:;">
					<div onclick="changeGuide('guide_2_7')" style="font-size:14px;color:blue;font-weight:700;margin-top:8px;">7．其他要求</div>
					</a>
					<div class="guide_2_7" style="display:none;">
						<p>				
（1）说明书应当用词规范，语句清楚。即说明书的内容应当明确，无含糊不清或者前后矛盾之处，使所属技术领域的技术人员容易理解。<br>
（2）说明书应当使用发明或者实用新型所属技术领域的技术术语。对于自然科学名词， 国家有规定的， 应当采用统一的术语，国家没有规定的，可以采用所属技术领域约定俗成的术语，也可以采用鲜为人知或者最新出现的科技术语，或者直接使用外来语(中文音译或意译词)，但是其含义对所属技术领域的技术人员来说必须是清楚的，不会造成理解错误；必要时可以采用自定义词，在这种情况下，应当给出明确的定义或者说明。一般来说，不应当使用在所属技术领域中具有基本含义的词汇来表示其本意之外的其他含义，以免造成误解和语义混乱。说明书中使用的技术术语与符号应当前后一致。<br>
（3）说明书应当使用中文，但是在不产生歧义的前提下，个别词语可以使用中文以外的其他文字。在说明书中第一次使用非中文技术名词时，应当用中文译文加以注释或者使用中文给予说明。<br>
例如，在下述情况下可以使用非中文表述形式：<br>
(a)本领域技术人员熟知的技术名词可以使用非中文形式表述，例如用“ＣＰＵ” 表示中央处理器；但在同一语句中连续使用非中文技术名词可能造成该语句难以理解的，则不允许。<br>
(b)计量单位、数学符号、数学公式、各种编程语言、计算机程序、特定意义的表示符号(例如中国国家标准缩写ＧＢ)等可以使用非中文形式。<br>
（4）所引用的外国专利文献、专利申请、非专利文献的出处和名称应当使用原文，必要时给出中文译文，并将译文放置在括号内。<br>
（5）说明书中的计量单位应当使用国家法定计量单位，包括国际单位制计量单位和国家选定的其他计量单位。必要时可以在括号内同时标注本领域公知的其他计量单位。<br>
（6）说明书中应当避免使用注册商标来确定物质或者产品，说明书中无法避免使用商品名称时，其后应当注明其型号、规格、性能及制造单位，如电子部件，微生物等。
						</p>
					</div>	
				
				</div>
				<div class="guide_3" style="display:none;background:#ffffff;padding:5px;">
				<div style="font-size:14px;font-weight:700;">一、撰写说明：</div>

							1.对发明专利申请，用文字足以清楚、完整地描述其技术方案的，可以没有附图。实用新型专利申请的说明书必须有附图。<br>
							2.一件专利申请有多幅附图时，在用于表示同一实施方式的各幅图中，同一附图标记与同一组成部分一一对应，具体为：（1）表示同一组成部分(同一技术特征或者同一对象)的附图标记应当一致。（2）说明书中与附图中使用的相同的附图标记应当表示同一组成部分。（3）说明书文字部分中未提及的附图标记不得在附图中出现，附图中未出现的附图标记也不得在说明书文字部分中提及。<br>
							3.附图中除了必需的词语外，不应当含有其他的注释；但对于流程图、结构框图、逻辑框图一类的附图，应当在其框内给出必要的文字或符号。<br>
							4.附图不得使用工程蓝图、照片；附图应当使用包括计算机在内的制图工具和黑色墨水绘制，线条应当均匀清晰，并不得着色和涂改；附图的周围不得有与图无关的框线；附图应可清晰地分辨出图中的各个细节。<br>
							5.同一幅附图中应当采用相同比例绘制，为清楚显示其中某一组成部分时可增加一幅局部放大图。<br>
								错误1：管道为非必要注释，注释只能为非部件，如水；<br>
								错误2：附图应为黑色线条，白色背景；<br>
								错误3：附图不能有阴影，也不能为实体效果图；<br>
								错误4：附图线条应清晰可见；<br>
								错误5：主图及其局部放大图为两幅图，应分开。							
				</div>
				<div class="guide_4" style="display:none;background:#ffffff;padding:5px;">
					<a href="javascript:;">
					<div onclick="changeGuide('guide_4_1')" style="font-size:14px;color:blue;font-weight:700;">一、撰写格式：</div>
					</a>
					<div class="guide_4_1" style="display:none;">
						<p>
							1.一种主题名称，与现有技术共有的必要技术特征，其特征是，区别于现有技术的必要技术特征。<br>
							2.根据权利要求1所述的主题名称，其特征是，进一步限定或改进的非必要技术特征。<br>
							3.根据权利要求1或2所述的主题名称，其特征是，进一步限定或改进的非必要技术特征。<br>
							4.根据权利要求3所述的主题名称，其特征是，进一步限定或改进的非必要技术特征。
						</p>

					</div>
					<a href="javascript:;">
					<div onclick="changeGuide('guide_4_2')" style="font-size:14px;color:blue;font-weight:700;margin-top:8px;">二、格式说明：</div>
					</a>
					<div class="guide_4_2" style="display:none;">
						<p>				
							1.主题名称：应当能够清楚地表明该权利要求的类型是产品还是方法，例如：XXX装置；XXX方法。不允许采用模糊不清的主题名称，例如：XXX技术（此名称也不能作为专利名称），或者在一项权利要求的主题名称中既包含有产品又包含有方法，例如：XXX产品及其制造方法（但此名称可以作为专利名称）。其他要求与专利名称的要求相同。<br>
							2.权利要求书必须有权利要求1（独立权利要求），可以没有权利要求2等（从属权利要求）。<br>
							3.“其特征是”可以替换为“其特征在于”或者类似的用语，但不允许省略。<br>
							4. “与现有技术共有的必要技术特征”与“区别于现有技术的必要技术特征”无法区分的，可以一起写到其特征是之后，如配方和工艺类专利申请。<br>
							5.技术特征：对于产品，是指产品的机械构成、电路构成或者化学成分，即组成产品的各部分之间的相互关系（包含关系、并列关系、连接关系、位置关系、作用关系等）以及各部分的具体特征（如形状、材料、尺寸、含量等）。对于方法，是指用不同的参数或者参数范围表示的工艺步骤。<br>
							6.必要技术特征：是指发明或者实用新型为解决其技术问题所不可缺少的技术特征，其总和足以构成发明或者实用新型的技术方案，使之区别于背景技术中所述的其他技术方案。<br>
							7.非必要技术特征：是指发明或者实用新型为进一步限定或改进的技术特征，该技术特征不是解决其技术问题所不可缺少的技术特征，但采用该特征，可以给发明或者实用新型带来一定的技术效果或者进一步明确专利申请的保护范围。<br>
							8.从属权利要求只能以择一方式引用在前的权利要求（例：3.根据权利要求1-2之一所述的……√；2.根据权利要求1和2所述的……×）；多项从属权利要求不得引用在前的多项权利要求（3.根据权利要求1-2之一所述的……。4.根据权利要求2-3之一所述的……。× ）
													
						</p>
					</div>
					<a href="javascript:;">
					<div onclick="changeGuide('guide_4_3')" style="font-size:14px;color:blue;font-weight:700;margin-top:8px;">三、撰写要求：</div>
					</a>
					<div class="guide_4_3" style="display:none;">
						<p>				
							1.权利要求书应当以说明书为依据，清楚、简要地限定要求专利保护的范围。<br>
							2.不得使用含义不确定的用语，如：厚、薄、强、弱、高温、高压、很宽范围等程度副词，除非这种用词在特定领域中具有公认的确切含义，或者进一步限定具体程度数值为多少。<br>
							3.不得在一项权利要求中出现可以限定出不同的保护范围的用语，如：最好、例如、特别是、必要时…。<br>
							4.尽量避免使用通常会使权利要求的保护范围不清楚的用语，如：约、接近、等、或类似物…。<br>
							5.除附图标记或者化学及数学式中使用的括号之外，权利要求中应尽量避免使用括号。<br>
							6.如果并列选择的技术特征存在直接上下位关系，则导致一项权利要求限定出保护范围重叠的多重保护范围，由此导致权利要求的保护范围不清楚。<br>
							7.采用正面肯定式的用语清楚表述要求保护的范围，不得采用否定式描述。<br>
							8.权利要求的表述应当简要，除记载技术特征外，不得对原因或者理由作不必要的描述，也不得使用商业性宣传用语；不得用同一技术特征对权利要求进行重复限定。<br>
							9.权利要求书有一项以上权利要求的，应当用阿拉伯数字顺序编号。<br>
							10.权利要求中使用的科技术语应当与说明书中使用的科技术语一致。<br>
							11.权利要求中可以有化学式或者数学式，但是不得有插图；权利要求中通常不允许使用表格，除非使用表格能够更清楚地说明发明或者实用新型要求保护的主题。<br>
							12.除绝对必要外，权利要求中不得使用“如说明书……部分所述”或者“如图……所示”等类似用语。<br>
							13.权利要求中的技术特征可以引用说明书附图中相应的标记，这些标记应当用括号括起来，放在相应的技术特征后面，附图标记不得解释为对权利要求保护范围的限制。<br>
							14.一项（注：不是一件）发明或者实用新型应当只有一个独立权利要求，并写在同一发明或者实用新型的从属权利要求之前；一项权利要求应限定一项发明，两项以上不同类型的发明不能出现在同一项权利要求中。<br>
							每一项权利要求只允许（有且仅能）在其结尾处使用句号；通常一项权利要求用一个自然段表述，也可以用分行或者分小段的方式描述，各段之间可以用分号分开。 						
													
						</p>
					</div>					
				
				
				</div>
				<div class="guide_5" style="display:none;background:#ffffff;padding:5px;">
				
				
					<div style="font-size:14px;font-weight:700;margin-top:8px;">一、撰写格式：</div>
					
					<span>本发明（实用新型）公开了一种专利名称，属于（涉及）XXX领域。权利要求1的核心技术特征。说明书中的核心有益效果。</span>
					<div style="font-size:14px;font-weight:700;margin-top:8px;">二、格式说明：</div>
					<p>
					1.专利名称：必须与说明书的专利名称保持完全一致。<br>
					2.XXX领域：可与说明书中的技术领域保持一致（该部分可省略）。<br>
					3.核心技术特征：可与权利要求书中的权利要求1记载的技术特征保持一致。<br>
					4.核心有益效果：可与说明书中的有效益效果保持一致。
					</p>
					<div style="font-size:14px;font-weight:700;margin-top:8px;">三、撰写要求</div>
					<p>
					1.摘要应当写明发明或者实用新型的名称和所属技术领域，并清楚地反映所要解决的技术问题、解决该问题的技术方案的要点以及主要用途，其中以技术方案为主；摘要可以包含最能说明发明的化学式。<br>
					2.摘要文字部分(包括标点符号)不得超过300个字，并且不得使用商业性宣传用语。<br>
					3.摘要文字部分出现的附图标记应当加括号。
					</p>
				</div>
				<div class="guide_6" style="display:none;background:#ffffff;padding:5px;">
				<p style="color:red;">从说明书附图中选一副最能反映专利核心技术的附图</p>
				</div>
				<div class="guide_7" style="display:none;background:#ffffff;padding:5px;">
				上传附件
				</div>

			</div>
        <!-- 模板 -->
			<div class="model-list" style="display: none;">
				<div style="float: right; padding-right: 15px; display: block;" id="kbpage">
					<span id="templateSectionId" style="display:none;">1</span>
					<a style="color:#ccc" href="javascript:upPage();" id="topUpPage">上一页</a>
					&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:downPage();" id="topDownPage">下一页</a>
				</div>
			<div class="model" style="overflow-x: hidden; overflow-y: auto;">
				<div id="modelWrap" style="display: block;"></div>
				<div id="hiddenmodel" style="display: none;"></div>
			</div>
			<div style="float: right; padding-right: 15px; padding-top: 5px; display: block;" id="kbpage2">
				<a style="color:#ccc" href="javascript:upPage();" id="bottomUpPage">上一页</a>
				&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:downPage();" id="bottomDownPage">下一页</a>
			</div>
			<div id="scBs" class="shousou" onclick="bigSmall(this);">
			 </div>
			 <input type="hidden" name="name" value="small" id="hidBorS">
			</div>
	    </div>
	</div>
<!-- right end -->
<!-- center beg -->
	<div class="editor-center" style="min-width:700px;">
	   
		<div class="center_top">
			<div class="backedit">
				<a href="javascript:return void" onclick="returnSavePatentDoc(100);">返回撰写列表</a>
				<a href="javascript:return void" onclick="savePatentDoc(100);">
				<button class="button button-primary  button-rounded" data-placement="bottom">保存</button>
				</a>
			</div>
			<div class="top_right">
				<div style="float:left" class="review" onclick="preview_selfwrite('100','1');">
				<i class="icon"></i>预览
				</div>
				<input type="hidden" id="patentType" value="1">
			</div>
		</div>	


			
<!--con beg-->
		<div class="editor-center-con" style="padding:10px;">
			<input id="whichTip" type="hidden" name="name" value="2">
			
				<!--请求协议书div  -->
			<div class="content" id="content0">
				<div>
					<span style="font-weight: bold;font-size:14px;">
							内部编码 <span>${patentDoc.internalCode }</span>
					</span>
					<span style="font-weight: bold;font-size:14px;margin-left:24px;">
							创建时间 <span><fmt:formatDate value="${patentDoc.createTime }" pattern="yyyy年M月dd日"/></span>
					</span>
					<span style="font-weight: bold;font-size:14px;margin-left:24px;">
							更新时间  <span><fmt:formatDate value="${patentDoc.lastUpdateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</span>
				</div>

				<div class="title" style="margin-top:10px;">
					<span style="font-weight: bold;font-size:14px;">专利名称</span>
					<div style="height:10px;">&nbsp;</div>
					<div id="editor1" thistempid="1">
						<div id="divtitle" style="clear:both;display:block;float:left;width:80%;"></div>
						<input type="hidden" value="" id="divtitletips"> 
						<div class="textarea" name="tooltip">
								<div class="wraper">
									<table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
										<tr>
											<td>
												<textarea rows="3" cols="10" id="editorContent1" name="name" class="editorContent" style="width:520px;height:200px;visibility:hidden;">
												${patentDoc.name }
												</textarea>
											</td>
										</tr>
									</table>
							   </div>
						</div>
					</div>
				</div>
				<div class="patent_person" style="margin-top:10px;">
					<div class="patent_person_title">
						<button type="button" style="width:120px" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#commonAppersonModal">
							选择常用申请人
						</button>
						<button type="button"  style="width:90px;margin-left:20px;" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#addAppPersonModal">
								新增申请人
						</button>
					</div>
					<div class="patent_person_table" id="appersonDiv" style="margin-top:10px;">
						<table id="simple-table"  class="table table-striped table-bordered table-hover">
						 	<thead>
							<tr class="simple_bag">
							  <!-- <th><input type="checkbox"/></th>
							  <th>序号</th> -->
							  <th>姓名或名称</th>
							  <th>证件号码</th>
							  <th>邮编地址</th>
							  <th>费减备案状态</th>
							  <th>操作</th>
							</tr>
						 	</thead>
						  <tbody id="appersonTab">
								<c:if test="${not empty patentDocAppPersons }">
									<c:forEach items="${patentDocAppPersons }" var="patentDocAppPerson">
										<tr>
											<td style="text-align:center">${patentDocAppPerson.name }</td>
											<td style="text-align:center">${patentDocAppPerson.idNumber }</td>
											<td style="text-align:center">${patentDocAppPerson.postcodeAddress }</td>
											<td style="text-align:center">${patentDocAppPerson.feeReduceTransactionStatus }</td>
											<%-- <td style="text-align:center">${patentDocAppPerson.transactionIdentity }</td>
											<td style="text-align:center">${patentDocAppPerson.transactionYear }</td>
											<td style="text-align:center">${patentDocAppPerson.otherInformation }</td> --%>
											<td style="text-align:center"><a href="javascript:deletePatentDocApperson(${patentDocAppPerson.personId })">删除</a><a style='margin-left:20px;' href="javascript:updatePatentDocApperson(${patentDocAppPerson.personId })">修改</a></td>
										</tr>
									
									</c:forEach>
								</c:if>
						  
						  </tbody>
						</table>

					</div>
				
				</div>
				
				<div class="patent_inventor" style="margin-top:10px;">
					<div class="patent_inventor_title">
								<button style="width:120px;" type="button" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#commonInventorModal">
									选择常用发明人
								</button>
								<button style="margin-left:20px;width:90px" type="button" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#addInventorModal">
									新增发明人
								</button>
					</div>
					<div class="patent_inventor_table" id="inventorDiv" style="margin-top:10px;">
						<table id="simple-table"   class="table table-striped table-bordered table-hover">
						  <thead>
							<tr class="simple_bag">
							  <th>姓名</th>
							  <th>证件号码</th>
							  <th>国籍</th>
							  <th>操作</th>
							</tr>
						  </thead>
						  <tbody id="inventorTab">
							  <c:if test="${not empty patentDocInventors }">
									<c:forEach items="${patentDocInventors }" var="patentDocInventor">
										<tr>
											<td style='text-align:center'>${patentDocInventor.inventorName}</td>
											<td style='text-align:center'>${patentDocInventor.inventorNumber}</td>
											<td style='text-align:center'>${patentDocInventor.inventorNationality}</td>
											<%-- <td style='text-align:center'>${patentDocInventor.inventorMobile}</td>
											<td style='text-align:center'>${patentDocInventor.inventorEmail}</td>
											<td style='text-align:center'>${patentDocInventor.inventorOtherInformation}</td> --%>
											<td style='text-align:center'><a href='javascript:deletePatentDocInventor(${patentDocInventor.inventorId})'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocInventor(${patentDocInventor.inventorId})'>修改</a></td>
										</tr>
									</c:forEach>	
							  </c:if>
						  </tbody>
						</table>

					</div>
				
				
				
				</div>
				<div class="patent_contact" style="margin-top:10px;">
					<div class="patent_contact_title">
						<button style="width:120px;" type="button" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#commonContactModal">选择常用联系人</button>
					</div>
					<div class="patent_contact_table" style="margin-top:10px;" id="contactDiv">
						<table id="simple-table" class="table table-striped table-bordered table-hover">
						  <thead>
							<tr class="simple_bag">
							 <th>联系人</th>
							 <th>所在地区</th>
							 <th>地址</th>
							 <th>联系电话</th>
							 <th>操作</th>
							</tr>
						  </thead>
						  <tbody id="contactTab">
							<c:if test="${not empty contactAddress }">
									<tr>
										<td style="text-align:center">${contactAddress.receiver}</td>
										<td style="text-align:center">${contactAddress.provinceName} ${contactAddress.cityName} ${contactAddress.districtName}</td>
										<td style="text-align:center">${contactAddress.detailAddress}</td>
										<td style="text-align:center">${contactAddress.phone}</td>
										<td style="text-align:center"><a href='javascript:updateContact(${contactAddress.id})'>修改</a></td>
									</tr>
							 </c:if>
						  </tbody>
						</table>
					</div>
				</div>
				<div class="patent_other">
					<span style="font-weight: bold;font-size:14px;">其他信息</span>
					<div style="height:10px;">&nbsp;</div>
					<textarea id="otherInformation" style="width:700px;" class="t-input form-control" rows="10" cols="60" placeholder="请填写，若没有则可以不填写。">${patentDoc.otherInformation }</textarea>
				
				
				</div>

			</div>			
				
			<!-- 编辑区 ：发明名称/技术领域/背景技术/发明内容/具体实施方式-->
			<div class="content" id="content1" style="display:none">
				<div class="title">
			
				</div>
				<div class="cl">
					<div id="editor0" thistempid="1">
						<div id="divtitle" style="clear:both;display:block;float:left;width:80%;"></div>
						<input type="hidden" value="" id="divtitletips"> 
						<div class="textarea" name="tooltip">
								<div class="wraper">
									<table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
										<tr>
											<td>
												<textarea rows="3" cols="10" id="editorContent" name="name" class="editorContent" style="width:520px;height:200px;visibility:hidden;">
												${patentDoc.manual }
												</textarea>
											</td>
										</tr>
									</table>
							   </div>
						</div>
					</div>
				</div>
			</div>
				
				
				<!--上传附件div  -->
				<div class="content" id="content6" thisid="2514" style="display: none;">
					<div class="title">
						上传附件
					</div>
					
					<div class="cl">
						<div class="lt-box" style="height:300px;padding:20px;">

							<form id="patentDocAttachment" action="<s:url value='/editor/uploadFile.html'/>"  method="post" enctype="multipart/form-data" class="form-horizontal">  
							<input style="display:none;"  id="patentAttachmentFile" name="file" type="file" />
							<input class="selectPointOfInterest form-control"  style="width:300px;display:inline;" type="text" id="filename" name="filename" placeholder="请选择文件" readonly="readonly">
							<button type="button" onclick="$('input[id=patentAttachmentFile]').click();" class="t-btn3 button button-primary  button-rounded">浏览</button>
							<button style="margin-left:5px;" type="button" class="t-btn2 button button-caution button-rounded" onclick="uploadAttachmentFile()">上传</button>
							<c:if test="${not empty patentDoc.patentDocAttachmentFile }">
								<button style="margin-left:5px;" type="button" class="t-btn2 button button-caution button-rounded" onclick="downloadAttachmentFile(${patentDoc.patentDocId})">下载附件</button>
							</c:if>
							</form> 

							<div style="height:10px;">&nbsp;</div> 
							<span style="color:#666;">友情提示：将所需的附件一次性打包成压缩文件格式上传(zip,rar等)，不建议上传其他格式的文件!
							</span>
						</div>
					</div>
				</div>
				

				<input id="hideditor3id" type="hidden" autocomplete="off">
				<input id="hidtempid" type="hidden">
				<input id="hidtooltip" type="hidden">
									
				<!-- 摘要 -->
				<div class="content" id="content4" thisid="" style="display: none;">
					
					<div class="title">
						摘要
					</div>
					<div class="cl">
						<div id="editor7" thisid="" thistempid="" photo_fid="">
							<div class="textarea" name="tooltip"> 
								<div class="wraper">
									<table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
										<tr>
											<td style="width:520px;">
												<textarea rows="3" cols="10" id="editorContent7" name="abstractDescription" class="editorContent" style="width:520px;height:200px;visibility:hidden;" >${patentDoc.abstractDescription }</textarea>
											</td>
										</tr>
									</table>
								   </div>
							</div>
						</div>
					</div>
					<div id="error_content7" style="margin-left: -50px; float: left; color: Red; text-align: right;" class="textarea">
					</div>
				</div>

	
	                    
						<!-- 权利要求及要素表 -->
						<div class="content" id="content3" style="display: none; overflow: hidden;">
							<div name="claims" style="float: left; width: 98%">
								<div class="title">
									权利要求书
								</div>
								<div class="cl">
									<div id="editor6" thistempid="" thisid="">
										<div id="divclaim" style="clear:both;display:block;float:left;width:80%;"></div>
										<input type="hidden" value="" id="divclaimtips">
										<div class="textarea" name="tooltip">
											<div class="wraper">
									            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
									            	<tr>
									                    <td style="width:520px;">
									                    	<textarea rows="3" cols="10" id="editorContent8" name="rightClaim" class="editorContent"style="width:520px;height:200px;visibility:hidden;" >${patentDoc.rightClaim }</textarea>
									                    </td>
									            	</tr>
									            </table>
										   </div>
										</div>
									</div>
								</div>
							</div>
							<div name="claims_ele" class="power_right" style="float: right; margin-top: 10px; width: 98%; display: none;">
							</div>

						</div>

	              
						<!-- 附图及说明 -->
						
						<!-- content start-->
						<input type="hidden" id="ft_hidSrc" value="">
						<input type="hidden" id="ft_hidFid" value="">
						<div class="content" id="content2" style="display: none;">
							
							<div class="box" id="content5-1">
								<div style="margin:10px" class="upimg1" onclick="addPic();">
									新增附图</div>
									<div style="margin:10px" class="upimg1" onclick='javascript:window.open("<s:url value='/editor/downloadPic.html'/>?patentDocId=${ patentDoc.patentDocId}")' >
									下载附图</div>
								<div class="picBox">
									<ul class="picL9" id="picLsy2" >
										
									</ul>
								</div>
							</div>
						<!-- content start-->
						<div class="content" id="content5_build" style="display: none;">
							
							<div style="height: 20px">
							</div>
							<div id="piclist" class="title1" onclick="piclistShow();loadImgs()" style="padding-left: 40px; color:#444; font-size:14px; font-weight:bold;
								display: none; cursor: pointer">
								返回附图列表
							</div>
							 
							
							<div class="img_edit" id="origin">
								<div class="imgfl" id="picBianHao">
								</div>
								<div class="imgfr">
								 <form id="patentUrlForm" name="patentUrlForm"  method="post" enctype="multipart/form-data" class="form-horizontal">
								 	<input id="patentDocId" type="hidden" name="patentDocId" value="${patentDoc.patentDocId}">
								 	<input id="patentDocAttachmentFile" type="hidden" name="patentDocAttachmentFile" value="${patentDoc.patentDocAttachmentFile}">
									<div id=patentImgUrl style="display:none"><!-- 自动插入ImgUrl --></div>
									
								  </form>
									<div id="zyupload" class="zyupload" ></div>
								 	
								</div>
							</div>
						</div>
	
	                    
						<!-- 摘要附图 -->							
						</div>
						<!-- content end-->

						<style type="text/css">
							.borderRed
							{
								border: #d7e4ea 1px solid;
								padding: 9px;
								float: left;
								width: 100px;
								cursor: pointer;
								margin: 4px 18px 0;
							}
						</style>
						<!-- content start-->
						<div class="content" id="content5" style="display: none;">
							<div style="height: 80px">
							</div>
								<div class="upimg1" onclick="findAttachmentImg();" id="choseAbs" style="
									left: 280px; margin-top: 0;float:left;">
									从附图中选择</div>
							<div class="picBox">
								<ul class="picL" id="picLsy" >
									
								</ul>
							</div>
							<div>
							<h3 style="margin-left: 30px;font-family:微软雅黑;margin-top: 50px;">摘要附图：</h3>
							</div>
							<div class="picBox" id="picLsy3">
								<c:if test="${patentDoc.abstractImg != null}">
										<img src='${base}${patentDoc.abstractImg}' alt='' width='400' height='300'/>
								</c:if>
							</div>
						</div>
						<!-- content end-->
	
						<div id="div_float_show" style="position: absolute; display: none; width: 1000px">
					</div>
	
	                </div>
<!-- center end -->
</div>




<!-- commonAppersonModal -->
<div class = "modal fade" id = "commonAppersonModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:1000px;">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="appersonModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	从常用申请人中选择
            </h4>
         </div>

	         <div class = "modal-body" >
		  				
				<a href="javascript:return void" onclick="batchAddAppPerson()" >
				<button style="display: inline-block;" class="button button-primary  button-rounded" data-toggle="tooltip" data-placement="bottom" title="可以添加多个申请人哦！">添加申请人</button>
				</a>
			    <input style="display: inline-block;width:400px;margin-left:200px;" type="text" class="t-input form-control" id="searchAppersonName" placeholder="请输入申请人姓名" onkeydown="if(event.keyCode==13){searchAppPerson(this.value);}"/>
			     <button style="display: inline-block;" class="button button-caution button-rounded" type="button" style="width:80px;" onclick="searchAppPerson($('input[id=searchAppersonName]').val())">搜索</button>
				<table id="simple-table" class="table table-striped table-bordered table-hover">
				  <thead>
					<tr class="simple_bag">
					  <th class="center"> <label class="pos-rel">
						<input style="width:15px;" type="checkbox" class="apperson-check-item">
						<span class="lbl"></span> </label>
					  </th>
					  <th class="center" width="50">序号</th>
					  <th width="90px">姓名或名称</th>
					  <th>证件号码 </th>
					  <th>邮编及地址</th>
					  <th width="120px">费减备案状态</th>
					</tr>
				  </thead>
				  <tbody id="commonAppPersonTab">
					<c:forEach items="${appPersons}" var="appPerson" varStatus="status">
					  <tr>
						<td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">
						<input type="checkbox" class="apperson-check-item" appPerson="<c:out value='${appPerson.appPersonId}'/>"></span>
						<span class="lbl"></span></label>
						</td>
						<td class="center" style="text-align:center"> ${status.count} </td>
						<td style="text-align:center"><c:out value="${appPerson.name}"/></td>
						<td style="text-align:center"><c:out value="${appPerson.idNumber}"/></td>
						<td>${appPerson.postcodeAddress}</td>
						<td>${appPerson.feeReduceTransactionStatus}</td>
						 
						<%--<td style="text-align:center"><c:out value="${appPerson.otherInfo}"/></td> --%>
					  </tr>
					</c:forEach>
				  </tbody>
				</table>
			
	      </div>
	       
      </div>
    </div>
</div>

<!--addAppPersonModal  -->
<div class = "modal fade" id = "addAppPersonModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" >
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="addAppPersonModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	添加新的申请人
            </h4>
         </div>
	         <div class = "modal-body" id="modal-body">
					 <h5>姓名或名称:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalAppPersonName"/>
					<span style="color: red; display: none;" id=appPersonNameError>该处应输入不大于20字段</span>
					<br>
					<h5>证件号码:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="modalPhoneRece" type="text"/>
					<span style="color: red; display: none;" id=appPersonPhoneError>请输入正确的证件号码</span>
					<br>		  
					<h5>邮编及地址:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="modalPostcodeAddress" type="text"/>
					<span style="color: red; display: none;" id="appPersonPostcodeAddress">请输入正确的邮编及地址</span>
					<br>
					<h5>费减备案状态:</h5>
					<select id="modalFeeReduceTransactionStatus" class="form-control" style="width:136px;display:inline;">	
					  <option value="未备案">未备案</option>
					  <option value="委托中">委托中</option>
					  <option value="备案成功">备案成功</option>
					  <option value="备案失败">备案失败</option>
					</select>
					<br>
					<h5>备案证件号:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalTransactionIdentityId"/>
					<br>
					<h5>备案年度:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalTransactionYear"/>
					<br>
					<h5>其他信息:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalOtherInfo"/>
					<input type="hidden" name="patentDocId" value="${patentDoc.patentDocId}">
					<br/>
					<button type="button" style="width:90px;" class="button button-primary  button-rounded" onclick="submitAppPersonForm()">保存</button>
					<button type="button" style="width:90px;margin-left:280px" class="button button-primary  button-rounded" onclick="resetAppPersonForm()">取消</button>
	         </div>
      </div>
   </div>
</div>

<!--updateAppPersonModal  -->
<button id="hiddenUpdateAppPersonModal" style="display:none;" type="button" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#updateAppPersonModal">
</button>
<div class = "modal fade" id = "updateAppPersonModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" >
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="updateAppPersonModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	修改申请人信息
            </h4>
         </div>
	         <div class = "modal-body" id="modal-body">
	         
					<input type="hidden" id="updateModalPersonId"  required/>
					 <h5>姓名或名称:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalAppPersonName" required/>
					<span style="color: red; display: none;" id=updateAppPersonName>请输入长度不超过20字符</span>
					<br>
					<h5>证件号码:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="updateModalPhoneRece" type="text" required onblur="validatePhoneNumber(this.value)"/>
					<span style="color: red; display: none;" id=updatePhoneReceError>请输入正确的证件号码</span>
					<br>		  
					<h5>邮编及地址:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="updateModalPostcodeAddress" type="text" required/>
					<br>
					<h5>费减备案状态:</h5>
					<select id="updateModalFeeReduceTransactionStatus" class="form-control" style="width:136px;display:inline;"  required>	
					  <option value="未备案">未备案</option>
					  <option value="委托中">委托中</option>
					  <option value="备案成功">备案成功</option>
					  <option value="备案失败">备案失败</option>
					</select>
					<br>
					<h5>备案证件号:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalTransactionIdentityId"/>
					<br>
					<h5>备案年度:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalTransactionYear"/>
					<br>
					<h5>其他信息:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalOtherInfo"/>
					<br/>
					<button type="button" style="width:90px;" class="button button-primary  button-rounded" onclick="submitUpdateAppPersonForm()">保存</button>
					<button type="button" style="width:90px;margin-left:280px" class="button button-primary  button-rounded" onclick="reseAppPersontUpdateForm()">取消</button>
	         </div>
      </div>
   </div>
</div>



<!--commonInventorModal  -->
<div class = "modal fade" id = "commonInventorModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:1000px;">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="inventorModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	从常用发明人中选择
            </h4>
         </div>
	         <div class = "modal-body">
	           
	           
	           <a href="javascript:return void" onclick="batchAddInventor()" >
				<button style="display: inline-block;" class="button button-primary  button-rounded" data-toggle="tooltip" data-placement="bottom" title="可以添加多个发明人批量哦！">添加发明人</button>
				</a>
				<input style="display: inline-block;width:400px;margin-left:200px;" type="text" class="t-input form-control" id="searchInventorName" placeholder="请输入发明人姓名" onkeydown="if(event.keyCode==13){searchInventor(this.value);}"/>
			     <button style="display: inline-block;" class="button button-caution button-rounded" type="button" style="width:80px;" onclick="searchInventor($('input[id=searchInventorName]').val())">搜索</button> 
				<table id="simple-table" class="table table-striped table-bordered table-hover">
				<thead>
				<tr class="simple_bag">
					  <th class="center"> <label class="pos-rel">
						<input type="checkbox" class="inventor-check-item" name="checkall" />
						<span class="lbl"></span> </label>
					  </th>
					  <th class="center">序号</th>
					  <th>姓名</th>
					  <th>证件号码</th>
					  <th>国籍</th>
					</tr>
				  </thead>
				  <tbody id="commonInventorTab">
					<c:forEach items="${inventors}" var="inventor" varStatus="status">
					  <tr>
					  	<td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">
						<input type="checkbox" class="inventor-check-item" inventor="<c:out value='${inventor.inventorId}'/>"/></span>
						<span class="lbl"></span></label>
						</td>
						<td class="center" style="text-align:center"> ${status.count} </td>
						<td style="text-align:center"><c:out value="${inventor.inventorName}"/></td>
						<td style="text-align:center"><c:out value="${inventor.inventorNumber}"/></td>
						<td style="text-align:center"><c:out value="${inventor.inventorNationality}"/></td>
						<%-- <td>${inventor.inventorMobile}</td> --%>
						<%-- <td style="text-align:center"><c:out value="${inventor.inventorEmail}"/></td>
						<td style="text-align:center"><c:out value="${inventor.inventorComment}"/></td> --%>
						
					  </tr>
					</c:forEach>
				  </tbody>
				</table>
	           
	         </div>
      </div>
   </div>
</div>


<!--addInventorModal  -->
<div class = "modal fade" id = "addInventorModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:540px">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="addInventorModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	添加新的发明人
            </h4>
         </div>
	         <div class = "modal-body">

	           <div class="lt-box" style="padding:20px;">
			       	<h5>姓名:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalInventorName" />
					<span style="color: red; display: none;" id=inventorNameError>该处应输入不大于20字段</span>
					<br>	   
					<h5>证件号码:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalInventorNumber"/>
					<span style="color: red; display: none;" id=inventorNumberError>请输入正确的证件号码</span>
					<br>		  
			       	<h5>国籍:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;"  type="text" id="modalInventorNationality" value="中国" />
					<span style="color: red; display: none;" id="inventorNationalityError">该处应输入不大于20字段</span>
					<br>		  
			       	<h5>电话:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalInventorMobile"/>
					<span style="color: red; display: none;" id="inventorMobileError">请输入正确的电话号码</span>
					<br>		  
			       	<h5>邮箱:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalInventorEmail"/>
					<span style="color: red; display: none;" id="inventorEmailError">请输入正确的邮箱</span>
					<br>
					<h5>其他信息:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalInventorComment"/>
					<span style="color: red; display: none;" id="commentError">该处应输入不大于50字段</span>
					<br>      
					<div style="height:20px;"></div> 
					<button type="button" style="width:90px;" class="button button-primary  button-rounded" onclick="submitInventorForm()">保存</button>		
					<button type="button" style="width:90px;margin-left:275px;" class="button button-primary  button-rounded" onclick="resetAddInventorModal()">取消</button>		
				</div>
	      </div>
	   </div>
	</div>
</div>


<!--updateInventorModal  -->
<button id="hiddenUpdateInventorModal" style="display:none;" type="button" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#updateInventorModal">
</button>
<div class = "modal fade" id = "updateInventorModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:540px">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="updateInventorModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	修改发明人信息
            </h4>
         </div>
	         <div class = "modal-body">

	           <div class="lt-box" style="padding:20px;">
					<input type="hidden" id="updateModalInventorId"/>
			       	<h5>姓名:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalInventorName"/>
					<span style="color: red; display: none;" id="updateInventorName">该处应输入不大于20字段</span>
					<br>	   
					<h5>证件号码:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalInventorNumber"/>
					<span style="color: red; display: none;" id="updateInventorNumber">请输入正确的证件号码</span>
					<br>		  
			       	<h5>国籍:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;"  type="text" id="updateModalInventorNationality" value="中国"/>
					<span style="color: red; display: none;" id="updateInventorNationality">该处应输入不大于20字段</span>
					<br>		  
			       	<h5>电话:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalInventorMobile"/>
					<span style="color: red; display: none;" id="updateInventorMobile">请输入正确的电话号码</span>
					<br>		  
			       	<h5>邮箱:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalInventorEmail"/>
					<span style="color: red; display: none;" id="updateInventorEmail">请输入正确的邮箱</span>
					<br>
					<h5>其他信息:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalInventorOtherInformation"/>
					<br>      
					<div style="height:20px;"></div> 
					<button type="button" style="width:90px;" class="button button-primary  button-rounded" onclick="submitUpdateInventorForm()">保存</button>		
					<button type="button" style="width:90px;margin-left:275px;" class="button button-primary  button-rounded" onclick="resetUpdateInventorForm()">取消</button>		
				</div>
	      </div>
	   </div>
	</div>
</div>

<!--commonContactModal  -->
<div class = "modal fade" id = "commonContactModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:750px">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="commonContactModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	从常用联系人中选择
            </h4>
         </div>
	         <div class = "modal-body">
				<div class="lt-box" style="padding:20px;">
					<table id="simple-table" class="table table-striped table-bordered table-hover">
					  <thead>
						<tr class="simple_bag">
						  <%-- <th class="center"> <label class="pos-rel">
							<input type="checkbox" class="contact-check-item" name="checkall" />
							<span class="lbl"></span> </label>
						  </th> --%>
						  <th>序号</th>
						  <th>联系人</th>
						  <th>所在地区</th>
						  <th>地址</th>
						  <th>联系电话</th>
						  <th>操作</th>
						</tr>
					  </thead>
					  <c:forEach items="${contactAddresses}" var="address" varStatus="status">
						<tr>
						  <%-- <td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">
							<input type="checkbox" class="contact-check-item" contact="<c:out value='${address.id}'/>"/></span>
							<span class="lbl"></span></label>
						  </td> --%>
						  <td class="center" style="text-align:center;">${status.count}</td>
						  <td style="text-align:center;">${address.receiver}</td>
						  <td style="text-align:center;">${address.provinceName} ${address.cityName} ${address.districtName}
						  </td>
						  <td style="text-align:center;">${address.detailAddress}</td>
						  <td style="text-align:center;">${address.phone}</td>
						  <td style="text-align:center;width:110px;"><a href="javascript:void(0);" onclick="settingContact(${address.id})">设为联系人</a></td>
						</tr>
					  </c:forEach>
					</table>
				</div>
	           
	      </div>
	   </div>
	</div>
</div>


<!--updateContactModal  -->

<button id="hiddenUpdateContactModal" style="display:none;" type="button" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#updateContactModal">
</button>
<div class = "modal fade" id = "updateContactModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:750px">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="updateContactModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	修改联系人信息
            </h4>
         </div>
	         <div class = "modal-body">
				<div class="lt-box" style="padding:20px;">
						<h5>联系人名称:</h5>
	  
					  	<input type="text" class="form-control" style="height: 40px; width: 300px;" name="receiver" id="receiver"/>
					  
						<h5>通讯地址:</h5>
	  
					  <select name="province" style="width:136px;display:inline;" class="form-control" id="province" onchange="loadCities()" required>
						<option value='${contactAddress.province}' id="waitForProvinceName">value='${contactAddress.provinceName}'</option>
						<c:forEach items="${provinces}" var="province">
						  <option value="${province.id}">${province.name}</option>
						</c:forEach>
					  </select>
					  <select name="city" class="form-control"  style="width:226px;display:inline;" id="city" onchange="loadDistricts()" required>
						<option value='${contactAddress.city}' id="waitForCity">value='${contactAddress.cityName}'</option>
					  </select>
					  <select name="district" class="form-control"  style="width:226px;display:inline;" id="district">
						<option value='${contactAddress.district}' id="waitForDistrict">${contactAddress.districtName}</option>
					  </select>
					  <h5>详细地址:</h5>
					  <input type="text" class="form-control" style="width:300px;" name="detailAddress" id="detailAddress"/>
					  	 <%--  value="${contactAddress.detailAddress}" required --%>
					  <h5>手机或固话</h5>
					  <input type="text" class="form-control" style="width:300px;" name="phone" id="phone" 
					  		minlength="6" maxlength="15" onblur="validatePhoneNumber(this.value)" value="${contactAddress.phone}" required/>
					  	<!--value="${contactAddress.phone}"   -->
					  <span	style="color: red; display: none;" id=phoneError>请输入正确的手机或者电话号</span>
					 <input type="hidden" class="form-control" name="id" id="contactId" value="${contactAddress.id}"/>
					  <div style="height: 20px;"></div>
					  <button type="button" class="button button-primary  button-rounded" onclick="submitUpdateContactForm()">保存</button>
					  <button type="button" style="width:90px;margin-left:500px;" class="button button-primary  button-rounded" onclick="resetUpdateContactForm()">取消</button>
				</div>
	      </div>
	   </div>
	</div>
</div>



<script type="text/javascript">
	
	var p=1;
	$('input[id=patentFile]').change(function() {  
		$('#filename').val($(this).val());  
	});
	function savePatentImgUrl() {
		if ($("#patentUrl").length > 0) {
			var caption = $("#picName").val();
			var attachmentUrl = $("#patentUrl").val();
			var patentDocId=$("#patentDocId").val();
			var seqNo=$("#seqNo").val();
			$.ajax({
				type : "POST",
				url : "<s:url value='/editor/savePatentImgUrl.html'/>",
				data : {
					"caption" : caption,
					"attachmentUrl" : attachmentUrl,
					"seqNo":seqNo,
					"patentDocId":patentDocId
				},
					success: function(data){
				},
				error : function() {
					alert("上传失败！稍后再试！");
				}
			});
		}else{
			alert("请选择上传图片!");
		}
	}
	 function templatebuttonclick(i,patentDocSectionId){
		 if(patentDocSectionId==1){
			 editor.appendHtml($("#templateContent"+i).html());
		 }
		 else if(patentDocSectionId==2){
			editor8.appendHtml($("#templateContent"+i).html());
		 }
		 else if(patentDocSectionId==3){
			 editor7.appendHtml($("#templateContent"+i).html());
		 }
		 else{
			 
		 }
	}
	 
	 function downPage(){
		 var sectionId = $("#templateSectionId").html();
		 ++p;
		 var totoalPage=getTotalPageBySectionId(sectionId);
		 if(p>=totoalPage){
			p=totoalPage;
			$("#topDownPage").css("color","#ccc");
			$("#bottomDownPage").css("color","#ccc");
		 }
		 	loading(sectionId,p);
		 	$("#topUpPage").css("color","#0085d0");
		 	$("#bottomUpPage").css("color","#0085d0");
		
	 }
	 function upPage(){
		 var sectionId = $("#templateSectionId").html();
		 --p;
		 if(p<=1){
			 p=1;
			$("#topUpPage").css("color","#ccc");
			$("#bottomUpPage").css("color","#ccc");
		 }
		 loading(sectionId,p);
		 $("#topDownPage").css("color","#0085d0");
		 $("#bottomDownPage").css("color","#0085d0");
	 }
	function loadingTemplate(sectionId){
		 var patentType=${patentDoc.patentType };
		 $("#templateSectionId").html(sectionId);
		 var totoalPage=getTotalPageBySectionId(sectionId);
		 $.ajax({
			 type : "POST",
			 url : "<s:url value='/editor/getTemplateList.html'/>",
			 data : {"sectionId":sectionId,"patentType":patentType},
			 success : function (data){
				 var obj= $.parseJSON(data);
				 $("#modelWrap").empty();
				 $("#hiddenmodel").empty();
				 $.each(obj,function(i,item){
					 $("#modelWrap").append("<div class='model1 model_list"+i+"' style='overflow-x: hidden; overflow-y: hidden;height:158px;'>"+
						 "<div class='title'>模板"+(i+1)+":"+item.templateTitle+"</div>"+
						 	 "<div class='content' style='height:105px;overflow-y:hidden;'>"+
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
	 } 
 	function loading(sectionId,currentPage){
 		var patentType=${patentDoc.patentType };
		 $("#templateSectionId").html(sectionId);
		 $.ajax({
			 type : "POST",
			 url : "<s:url value='/editor/getTemplateListByPage.html'/>",
			 data : {"sectionId":sectionId,"currentPage":currentPage,"patentType":patentType},
			 success : function (data){
				 var obj= $.parseJSON(data);
				 $("#modelWrap").empty();
				 $("#hiddenmodel").empty();
				 $.each(obj,function(i,item){
					 $("#modelWrap").append("<div class='model1 model_list"+i+"' style='overflow-x: hidden; overflow-y: hidden;height:158px;'>"+
						 "<div class='title'>模板&nbsp;"+(i+1)+":"+item.templateTitle+"</div>"+
						 	 "<div class='content' style='height:105px;overflow-y:hidden;'>"+
				 				"<p class='small'>"+
									"<span>"+item.content+"</span>"+
								"</p>"+
							"</p>"+
						    "<div class='button' style='z-index:500000;' onclick='templatebuttonclick("+i+","+item.patentDocSectionType.patentDocSectionId+")'>+使用模板</div>"+
						  "</div>"+
					   "</div>");
					 $("#modelWrap span").css("color","black");
				 	 $("#hiddenmodel").append("<div id='templateContent"+i+"'>"+item.content+"</div>");
				 });
			 },error : function (){
				 
			 }
		 });
	 }
 	
	 function findAttachmentImg(){
		 var patentDocId=$("#patentDocId").val();
		 var base = "${base}";
		 $.ajax({
				type : "POST",
				url : "<s:url value='/editor/getAttachmentById.html'/>",
				data : {"patentDocId":patentDocId
				},
					success: function(data){
						$("#picLsy").empty();
						
					var obj= $.parseJSON(data);
					$.each(obj,function(i,item){
						var  httpImgUrl=base+item.attachmentUrl;
						 $("#picLsy").append(
								 "<li id="+item.attachmentId+">"+
									"<a href='#'>"+
										"<img src='"+httpImgUrl+"' alt='' width='200' height='150'/>"+
									"</a>"+
									"<div class='text'>"+
										"<b>"+item.caption+"</b>"+
										"<p>"+"<a href='javascript:settingAbstractImg("+"&apos;"+item.attachmentUrl+"&apos;"+")'>设为摘要附图</a>"+
										"</p>"+
									"</div>"
								+"</li>"
						);
						 
					 });
					hoverImg();
				},
				error : function() {
					alert("操作失败");
				}
		});
	 }
	 
	 
	 
	function getTotalPageBySectionId(sectionId){
		var totalPageForSectionId=0;
		var patentType=${patentDoc.patentType };
		 $.ajax({
			 type : "POST",
			 url : "<s:url value='/editor/getTotalPage.html'/>",
			 data : {"sectionId":sectionId,"patentType":patentType},
			 async: false,
			 success : function (data){
				 totalPageForSectionId=data;
			 },error : function (){
			 }
		 });
		 return totalPageForSectionId;
	 }
</script>
<script type="text/javascript">
function hoverImg(){

	$("#picLsy li").hover(function(){
		$(this).find('.text:not(:animated)').animate({top:"0px"}, {easing:"easeInOutExpo"}, 50, function(){});
	},function () {
		$(this).find('.text').animate({top:"149px"}, {easing:"easeInOutExpo"}, 50, function(){});
	});

};
function hoverImg2(){

	$("#picLsy2 li").hover(function(){
		$(this).find('.text:not(:animated)').animate({top:"0px"}, {easing:"easeInOutExpo"}, 50, function(){});
	},function () {
		$(this).find('.text').animate({top:"149px"}, {easing:"easeInOutExpo"}, 50, function(){});
	});

};

function delectImg(value){
	 $.ajax({
			type : "POST",
			url : "<s:url value='/editor/delectAttachmentById.html'/>",
			data : {"attachmentId":value},
				success: function(data){
					alert("删除成功！");
					$("#"+value).hide(); 
			},
			error : function() {
				alert("操作失败");
			}
	});
}

function settingAbstractImg(value){
	var patentDocId=$("#patentDocId").val();
	var base = "${base}";
	$.ajax({
		type : "POST",
		url : "<s:url value='/editor/savePatentAbstractImg.html'/>",
		data : {"abstractImg":value,"patentDocId":patentDocId},
			success: function(data){
				var httpImgUrl=base+value;
				 $("#picLsy3").html(
							"<a href='#'>"+
							"<img src='"+httpImgUrl+"' alt='' width='400' height='300'/>"+
							"</a>"
						);
		},
		error : function() {
			alert("操作失败");
		}
});
}
</script>
<script type="text/javascript">
function returnSavePatentDoc(value){
	var name=$("#editorContent1").val();
	var manual=$("#editorContent").val();
	var abstractDescription=$("#editorContent7").val();
	var rightClaim=$("#editorContent8").val();
	//var contactPerson = $("#contactPerson").val();
	var otherInformation = $("#otherInformation").val();
	$.ajax({
		type: "POST",
		url: "<s:url value='/editor/savePatentDoc.html'/>",
		data: {"name":name,"manual":manual,"abstractDescription":abstractDescription,"rightClaim":rightClaim,"patentDocId":value,"otherInformation":otherInformation},
		success: function(data){
			location.href="<s:url value='/editor/patentDocList.html'/>";
		},
		error: function(){
			location.href="<s:url value='/editor/patentDocList.html'/>";
		}
	});
};


function savePatentDoc(value){
	var name=$("#editorContent1").val();
	var manual=$("#editorContent").val();
	var abstractDescription=$("#editorContent7").val();
	var rightClaim=$("#editorContent8").val();
	var contactPerson = $("#contactPerson").val();
	var otherInformation = $("#otherInformation").val();
	$.ajax({
		type: "POST",
		url: "<s:url value='/editor/savePatentDoc.html'/>",
		data: {"name":name,"manual":manual,"abstractDescription":abstractDescription,"rightClaim":rightClaim,"patentDocId":value,"contactPerson":contactPerson,"otherInformation":otherInformation},
		success: function(data){
			alert("操作成功");
		},
		error: function(){
			alert("操作失败");
		}
	});
};

function loadImgs(){
	var patentDocId=$("#patentDocId").val();
	var base = "${base}";
	 $.ajax({
			type : "POST",
			url : "<s:url value='/editor/getAttachmentById.html'/>",
			data : {"patentDocId":patentDocId
			},
				success: function(data){
					$("#picLsy2").empty();
					var obj= $.parseJSON(data);
					$.each(obj,function(i,item){
						var  httpImgUrl=base+item.attachmentUrl;
						 $("#picLsy2").append(
 								 "<li id="+item.attachmentId+">"+
									"<img src='"+httpImgUrl+"' alt='' width='200' height='150'/><br/>"+
									"<div style='margin-left:60px'>"+
									"<a href='javascript:void(0);'" + "id=link" + item.seqNo  + " onclick='updateImgName("+"&apos;"+item.attachmentId+"&apos;"+","+item.seqNo+")'>"+item.caption+"</a>"+"|&nbsp"+
									"<a href='javascript:delectImg("+item.attachmentId+")'>删除图片</a>"+
									
								"</div>"
								
								+"</li>"
						);
						 
					 });
					 //hoverImg2(); 
			},
			error : function() {
				alert("操作失败");
			}
	});
}


function updateImgName(value,linkSeqNo){
	var caption = prompt("请输入新名称", "");
	if (caption != null && caption != "") {
		$.ajax({
			url: "<s:url value='/editor/updateAttachmentImgName.html'/>", 
			data:{"caption":caption,"attachmentId":value},
			type: 'post', 
			success: function(data) {
					$("#link" + linkSeqNo).html(caption);
			}
		});
	}
}
</script>

<script type="text/javascript">

	$('input[id="patentAttachmentFile"]').change(function() {
		$('#filename').val($(this).val());  
	});
	
	function uploadAttachmentFile(){
		
		var hideForm = $('#patentDocAttachment'); 
		var options = {
			dataType : "json", 
			data: {'file': $("#patentAttachmentFile").val()},
			beforeSubmit : function() {
				var name=$("#filename").val();
				var mime = name.toLowerCase().substr(name.lastIndexOf("."));
				if(mime ==".zip" || mime ==".rar"){
					return true;
				}else{
					alert("请上传压缩文件包！");
					return false;
				}
			}, 
			success : function(result) {
				uploadSuccess(result); 
			}, 
			error : function() {
				alert("上传失败"); 
			} 
		}; 
		hideForm.ajaxSubmit(options); 
	}
	function uploadSuccess(value){
		var patentDocId=$("#patentDocId").val();
		$.ajax({
			type: "POST",
			url: "<s:url value='/editor/savePatentDocAttachmentFile.html'/>",
			data: {"patentDocId":patentDocId,"patentDocAttachmentFile":value},
			success: function(data){
				alert("保存成功");
			},
			error: function(){
				alert("保存失败");
			}
		});
	}
	
	function downloadFile(){
		var patentDocId=$("#patentDocId").val();
		$.ajax({
			type :'GET',
			url : "<s:url value='/editor/getPatentDocAttachmentFile.html'/>?patentDocId="+patentDocId,
			success : function(){
				
			},
			error: function(){
				alert("下载失败");
			}
		})
	}
	
	$(function(){
		formutil.clickAllCheckbox('tr th input.apperson-check-item', 'tr td input.apperson-check-item');
		formutil.clickItemCheckbox('tr th input.apperson-check-item', 'tr td input.apperson-check-item');		
	
		formutil.clickAllCheckbox('tr th input.inventor-check-item', 'tr td input.inventor-check-item');
		formutil.clickItemCheckbox('tr th input.inventor-check-item', 'tr td input.inventor-check-item');		
	
		formutil.clickAllCheckbox('tr th input.contact-check-item', 'tr td input.contact-check-item');
		formutil.clickItemCheckbox('tr th input.contact-check-item', 'tr td input.contact-check-item');		
	});
	function batchAddAppPerson(){
		var appPersonSelected = formutil.anyCheckboxItemSelected('tr td input.apperson-check-item');
		var uniqueappPersonNos = []
		if (!appPersonSelected) {
			formutil.alertMessage('请选择申请人');
			
			return;
		}
		var appPerson_checked=formutil.getAllCheckedCheckboxValues('tr td input.apperson-check-item', 'appPerson');
		for (var i = 0; i < appPerson_checked.length; i++) {
			if ($.inArray(appPerson_checked[i], uniqueappPersonNos) == -1) {
				uniqueappPersonNos.push(appPerson_checked[i]);
			}
		}		
		var appPersonIds = uniqueappPersonNos.join(",");
		var patentDocId = ${patentDoc.patentDocId};
		$.ajax({
			type : "POST",
			//url : "<s:url value='/petition/findAppPersonNameById.html'/>?appPersonIds="+appPersonIds,
			url : "<s:url value='/petition/addPatentDocAppPerson.html'/>?appPersonIds="+appPersonIds+"&patentDocId="+patentDocId,
			async :false,
			success : function (data){
				var obj= $.parseJSON(data);
				$("#appersonTab").empty();
				$.each(obj,function(i,item){
					$("#appersonTab").append(
							"<tr>"+
							//"<td class='center' style='text-align:center'><label class='pos-rel'> <span class='batch-share-item'>"+
							//"<input type='checkbox' class='check-item' appPerson=<c:out value='"+item.personId+"'/>'>"+
							//"<span class='lbl'></span></label>"+
							//"</td>"+
							//"<td class='center' style='text-align:center'><input type='checkbox' class='check-item'/></td>"+
							//"<td class='center' style='text-align:center'>"+i+"</td>"+
							"<td style='text-align:center'>"+item.name+"</td>"+
							"<td style='text-align:center'>"+item.idNumber+"</td>"+
							"<td style='text-align:center'>"+item.postcodeAddress+"</td>"+
							"<td style='text-align:center'>"+item.feeReduceTransactionStatus+"</td>"+
/* 							"<td style='text-align:center'>"+item.transactionIdentity+"</td>"+
							"<td style='text-align:center'>"+item.transactionYear+"</td>"+
							"<td style='text-align:center'>"+item.otherInformation+"</td>"+ */
							"<td style='text-align:center'><a href='javascript:deletePatentDocApperson("+item.personId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocApperson("+item.personId+")'>修改</a></td>"+
							"</tr>"
					)
				})
			}
			
		});
		
		$("#appersonModalCloseBtn").trigger("click");
		$('input:checkbox').removeAttr('checked');
		
	}
	
	function deleteAppPerson(appPerson){
		$("#"+appPerson).remove();
	}
	
	
	
	function batchAddInventor(){
		var inventorSelected = formutil.anyCheckboxItemSelected('tr td input.inventor-check-item');
		var uniqueInventorNos = []
		if (!inventorSelected) {
			formutil.alertMessage('请选择发明人');
			
			return;
		}
		var inventor_checked=formutil.getAllCheckedCheckboxValues('tr td input.inventor-check-item', 'inventor');
		for (var i = 0; i < inventor_checked.length; i++) {
			if ($.inArray(inventor_checked[i], uniqueInventorNos) == -1) {
				uniqueInventorNos.push(inventor_checked[i]);
			}
		}		
		var inventorIds = uniqueInventorNos.join(",");
		var patentDocId = ${patentDoc.patentDocId};
		$.ajax({
			type : "POST",
			//url : "<s:url value='/petition/findInventorNameById.html'/>?inventorIds="+inventorIds,
			url : "<s:url value='/petition/addPatentDocInventor.html'/>?inventorIds="+inventorIds+"&patentDocId="+patentDocId,
			async :false,
			success : function (data){
				var obj= $.parseJSON(data);
				$("#inventorTab").empty();
				$.each(obj,function(i,item){
					$("#inventorTab").append(
							"<tr>"+
							"<td style='text-align:center'>"+item.inventorName+"</td>"+
							"<td style='text-align:center'>"+item.inventorNumber+"</td>"+
							"<td style='text-align:center'>"+item.inventorNationality+"</td>"+
							/* "<td style='text-align:center'>"+item.inventorMobile+"</td>"+
							"<td style='text-align:center'>"+item.inventorEmail+"</td>"+
							"<td style='text-align:center'>"+item.inventorOtherInformation+"</td>"+ */
							"<td style='text-align:center'><a href='javascript:deletePatentDocInventor("+item.inventorId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocInventor("+item.inventorId+")'>修改</a></td>"+
							"</tr>"	
					)
				})
			}
			
		});
		
		$("#inventorModalCloseBtn").trigger("click");
		$('input:checkbox').removeAttr('checked');
		
	}
	function deleteTag(tag){
		tag.parentNode.removeChild(tag); 
	}
	

	function preview_selfwrite(patentDocId,patentType){
		var patentDocId=patentDocId;
		var patentType=patentType;
		var name=$("#editorContent1").val();
		var manual=$("#editorContent").val();
		var abstractDescription=$("#editorContent7").val();
		var rightClaim=$("#editorContent8").val();
		$.ajax({
			type: "POST",
			url: "<s:url value='/editor/savePreviewPatentDoc.html'/>",
			data: {"name":name,"manual":manual,"abstractDescription":abstractDescription,"rightClaim":rightClaim,"patentDocId":patentDocId},
			success: function(data){
			},
			error: function(){
				alert("数据未保存");
			}
		});
		window.open("<s:url value='/editor/previewPatentDoc.html'/>?patentDocId="+patentDocId+"&patentType="+patentType)
		
	}

	function submitAppPersonForm(){
		var appPersonName =$("#modalAppPersonName").val();
		//var appPersonType =$("#modalAppPersonType").val();
		var phoneRece =$("#modalPhoneRece").val();
		var postcodeAddress =$("#modalPostcodeAddress").val();
		var feeReduceTransactionStatus =$("#modalFeeReduceTransactionStatus").val();
		var transactionIdentityId =$("#modalTransactionIdentityId").val();
		var transactionYear =$("#modalTransactionYear").val();
		var otherInfo =$("#modalOtherInfo").val();
		
		   //validateAppPersonFormWayTwo(postcodeAddress,"appPersonPostcodeAddress")
		var patentDocId =${patentDoc.patentDocId};
		if(validateAppPersonFormWayOne(phoneRece,"appPersonPhoneError")&
		   validateAppPersonFormWayTwo(appPersonName,"appPersonNameError")&
		   validateAppPersonFormWayTwo(postcodeAddress,"appPersonPostcodeAddress")
		   ){
			var formData ={"name":appPersonName,"idNumber":phoneRece,"postcodeAddress":postcodeAddress,"otherInfo":otherInfo,"feeReduceTransactionStatus":feeReduceTransactionStatus,
					       "transactionIdentityId":transactionIdentityId,"transactionYear":transactionYear,"patentDocId":patentDocId};
			
			$.ajax({
				type : "POST",
				url : "<s:url value='/petition/addCommonAppPerson.html'/>",
				data : formData,
				async : false,
				success : function(data){
					var obj= $.parseJSON(data);
					$("#appersonTab").empty();
					$.each(obj,function(i,item){
						$("#appersonTab").append(
								"<tr>"+
								"<td style='text-align:center'>"+item.name+"</td>"+
								"<td style='text-align:center'>"+item.idNumber+"</td>"+
								"<td style='text-align:center'>"+item.postcodeAddress+"</td>"+
								"<td style='text-align:center'>"+item.feeReduceTransactionStatus+"</td>"+
							/* 	"<td style='text-align:center'>"+item.transactionIdentity+"</td>"+
								"<td style='text-align:center'>"+item.transactionYear+"</td>"+
								"<td style='text-align:center'>"+item.otherInformation+"</td>"+ */
								"<td style='text-align:center'><a href='javascript:deletePatentDocApperson("+item.personId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocApperson("+item.personId+")'>修改</a></td>"+
								"</tr>"
						)
					})
					
				},error:function (){
					
				}
			});
			resetAppPersonForm();
		};
	}
	
	
	function resetDefaultValue(){
		//$("#addAppPersonModalCloseBtn").trigger("click");
		$("#modalAppPersonName").val("");
		$("#modalPhoneRece").val("");
		$("#modalPostcodeAddress").val("");
		$("#modalOtherInfo").val("");
		$("#modalFeeReduceTransactionStatus").val("未备案");
		$("#modalTransactionIdentityId").val("");
		$("#modalTransactionYear").val("");
	}
	function resetAppPersonForm(){
		$("#addAppPersonModalCloseBtn").trigger("click");
		resetDefaultValue();
	}
	function submitInventorForm(){
		var  modalInventorName= $("#modalInventorName").val();
		var  modalInventorNumber= $("#modalInventorNumber").val();
		var  modalInventorNationality = $("#modalInventorNationality").val();
		var  modalInventorMobile = $("#modalInventorMobile").val();
		var  modalInventorEmail= $("#modalInventorEmail").val();
		var  modalInventorComment= $("#modalInventorComment").val();
		var  patentDocId = ${patentDoc.patentDocId};
		if(validateAppPersonFormWayTwo(modalInventorName,"inventorNameError")&
		   validateAppPersonFormWayThree(modalInventorNumber,"inventorNumberError")&
		   validateAppPersonFormWayThree(modalInventorNationality,"inventorNationalityError")&
		   validateAppPersonFormWayThree(modalInventorMobile,"inventorMobileError")
		){
			var formData={"inventorName":modalInventorName,"inventorNumber":modalInventorNumber,"inventorNationality":modalInventorNationality,"inventorMobile":modalInventorMobile,"inventorEmail":modalInventorEmail,"inventorComment":modalInventorComment,"patentDocId":patentDocId};
			$.ajax({
				type : "POST",
				url : "<s:url value='/petition/addCommonInventor.html'/>",
				data : formData,
				async : false,
				success : function (data){
					var obj= $.parseJSON(data);
					$("#inventorTab").empty();
					$.each(obj,function(i,item){
						$("#inventorTab").append(
								"<tr>"+
								"<td style='text-align:center'>"+item.inventorName+"</td>"+
								"<td style='text-align:center'>"+item.inventorNumber+"</td>"+
								"<td style='text-align:center'>"+item.inventorNationality+"</td>"+
								/* "<td style='text-align:center'>"+item.inventorMobile+"</td>"+
								"<td style='text-align:center'>"+item.inventorEmail+"</td>"+
								"<td style='text-align:center'>"+item.inventorOtherInformation+"</td>"+ */
								"<td style='text-align:center'><a href='javascript:deletePatentDocInventor("+item.inventorId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocInventor("+item.inventorId+")'>修改</a></td>"+
								"</tr>"	
						)
					})
				}
			});
			resetAddInventorModal();
		}else{
		}
	}
	
	function resetAddInventorModal(){
		$("#addInventorModalCloseBtn").trigger("click");
		$("#modalInventorName").val("");
		$("#modalInventorNumber").val("");
		$("#modalInventorNationality").val("中国");
		$("#modalInventorMobile").val("");
		$("#modalInventorEmail").val("");
		$("#modalInventorComment").val("");
	}
	
	function batchAddAddress(){
		var contactSelected = formutil.anyCheckboxItemSelected('tr td input.contact-check-item');
		var uniqueContactNos = []
		if (!contactSelected) {
			formutil.alertMessage('请选择联系人');
			
			return;
		}
		var contact_checked=formutil.getAllCheckedCheckboxValues('tr td input.contact-check-item', 'contact');
		for (var i = 0; i < contact_checked.length; i++) {
			if ($.inArray(contact_checked[i], uniqueContactNos) == -1) {
				uniqueContactNos.push(contact_checked[i]);
			}
		}		
		var contactIds = uniqueContactNos.join(",");
		alert(contactIds);
		
		$.ajax({
			type : 'POST',
			url : "<s:url value='/petition/findContactNameById.html'/>?contactIds="+contactIds,
			success : function (data){
				var obj = $.parseJSON(data);
				$.each(obj,function(i,item){
					$("#contactTextarea").append(item.receiver+"&nbsp;"+item.provinceName+item.cityName+item.districtName+"&nbsp;"+item.phone+";"+"&nbsp;")
				})
			},error :function (){
				
			}
			
		})
	}
	function searModel(){
		
		$('.model-list').show();
		$('.guide-list').hide();
		
	}
	function searGuide(){
		
		$('.model-list').hide();
		$('.guide-list').show();
		
	}
	
	function deletePatentDocApperson(personId){
		var patentDocId=${patentDoc.patentDocId};
		$.ajax({
			type : "POST",
			url : "<s:url value='/petition/deletePatentDocApperson.html'/>",
			data:{"personId":personId,"patentDocId":patentDocId},
			success : function (data){
				var obj= $.parseJSON(data);
				$("#appersonTab").empty();
				$.each(obj,function(i,item){
					$("#appersonTab").append(
							"<tr>"+
							//"<td class='center' style='text-align:center'><label class='pos-rel'> <span class='batch-share-item'>"+
							//"<input type='checkbox' class='check-item' appPerson=<c:out value='"+item.personId+"'/>'>"+
							//"<span class='lbl'></span></label>"+
							//"</td>"+
							//"<td class='center' style='text-align:center'><input type='checkbox' class='check-item'/></td>"+
							//"<td class='center' style='text-align:center'>"+i+"</td>"+
							"<td style='text-align:center'>"+item.name+"</td>"+
							"<td style='text-align:center'>"+item.idNumber+"</td>"+
							"<td style='text-align:center'>"+item.postcodeAddress+"</td>"+
							"<td style='text-align:center'>"+item.feeReduceTransactionStatus+"</td>"+
							"<td style='text-align:center'>"+item.transactionIdentity+"</td>"+
							"<td style='text-align:center'>"+item.transactionYear+"</td>"+
							"<td style='text-align:center'>"+item.otherInformation+"</td>"+
							"<td style='text-align:center'><a href='javascript:deletePatentDocApperson("+item.personId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocApperson("+item.personId+")'>修改</a></td>"+
							"</tr>"
					)
				})
			}
		})
	}
	
	function updatePatentDocApperson(personId){
		$.ajax({
			type : "POST",
			url : "<s:url value='/petition/findAppPersonById.html'/>",
			data : {"personId":personId},
			success : function (data){
				var obj = $.parseJSON(data);
				$("#updateModalPersonId").val(obj["personId"]);
				$("#updateModalAppPersonName").val(obj["name"]);
				$("#updateModalPhoneRece").val(obj["idNumber"]);
				$("#updateModalPostcodeAddress").val(obj["postcodeAddress"]);
				$("#updateModalOtherInfo").val(obj["otherInformation"]);
				$("#updateModalFeeReduceTransactionStatus").val(obj["feeReduceTransactionStatus"]);
				$("#updateModalTransactionIdentityId").val(obj["transactionIdentity"]);
				$("#updateModalTransactionYear").val(obj["transactionYear"]);
				$("#hiddenUpdateAppPersonModal").trigger("click");
			},error : function (){
				
			}
		})
	}
	
	function submitUpdateAppPersonForm(){
		var personId = $("#updateModalPersonId").val();
		var name = $("#updateModalAppPersonName").val();
		var idNumber = $("#updateModalPhoneRece").val();
		var postcodeAddress = $("#updateModalPostcodeAddress").val();
		var otherInformation = $("#updateModalOtherInfo").val();
		var feeReduceTransactionStatus = $("#updateModalFeeReduceTransactionStatus").val();
		var transactionIdentity =  $("#updateModalTransactionIdentityId").val();
		var transactionYear = $("#updateModalTransactionYear").val();
		var patentDocId=${patentDoc.patentDocId};
		
		if(validateAppPersonFormWayTwo(name,"updateAppPersonName")&
		   validateAppPersonFormWayTwo(idNumber,"updatePhoneRece")){
			var formData ={"personId":personId,"name":name,"idNumber":idNumber,"postcodeAddress":postcodeAddress,
					       "otherInformation":otherInformation,"feeReduceTransactionStatus":feeReduceTransactionStatus,
					       "transactionIdentity":transactionIdentity,"transactionYear":transactionYear,"patentDocId":patentDocId};
			$.ajax({
				type : "POST",
				url : "<s:url value='/petition/updatePatentDocApperson.html'/>",
				data : formData,
				success : function (data){
					var obj= $.parseJSON(data);
					$("#appersonTab").empty();
					$.each(obj,function(i,item){
						$("#appersonTab").append(
								"<tr>"+
								"<td style='text-align:center'>"+item.name+"</td>"+
								"<td style='text-align:center'>"+item.idNumber+"</td>"+
								"<td style='text-align:center'>"+item.postcodeAddress+"</td>"+
								"<td style='text-align:center'>"+item.feeReduceTransactionStatus+"</td>"+
								/* "<td style='text-align:center'>"+item.transactionIdentity+"</td>"+
								"<td style='text-align:center'>"+item.transactionYear+"</td>"+
								"<td style='text-align:center'>"+item.otherInformation+"</td>"+ */
								"<td style='text-align:center'><a href='javascript:deletePatentDocApperson("+item.personId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocApperson("+item.personId+")'>修改</a></td>"+
								"</tr>"
						)
					})
					
				},error : function (){
					
				}
			});
			reseAppPersontUpdateForm();
		
		}
	}
	
	function reseAppPersontUpdateForm(){
		$("#updateAppPersonModalCloseBtn").trigger("click");
		$("#updateModalAppPersonName").val();
		$("#updateModalPhoneRece").val();
		$("#updateModalPostcodeAddress").val();
		$("#updateModalOtherInfo").val();
		$("#updateModalFeeReduceTransactionStatus").val("未备案");
		$("#updateModalTransactionIdentityId").val();
		$("#updateModalTransactionYear").val();
	}
	
	function deletePatentDocInventor(inventorId){
		var patentDocId=${patentDoc.patentDocId};
		$.ajax({
			type : "POST",
			url : "<s:url value='/petition/deletePatentDocInventor.html'/>",
			data:{"inventorId":inventorId,"patentDocId":patentDocId},
			success : function (data){
				var obj= $.parseJSON(data);
				$("#inventorTab").empty();
				$.each(obj,function(i,item){
					$("#inventorTab").append(
							"<tr>"+
							"<td style='text-align:center'>"+item.inventorName+"</td>"+
							"<td style='text-align:center'>"+item.inventorNumber+"</td>"+
							"<td style='text-align:center'>"+item.inventorNationality+"</td>"+
							"<td style='text-align:center'>"+item.inventorMobile+"</td>"+
							"<td style='text-align:center'>"+item.inventorEmail+"</td>"+
							"<td style='text-align:center'>"+item.inventorOtherInformation+"</td>"+
							"<td style='text-align:center'><a href='javascript:deletePatentDocInventor("+item.inventorId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocInventor("+item.inventorId+")'>修改</a></td>"+
							"</tr>"	
					)
				})
			}
		})
	}
	
	/* function updatePatentDocInventor(inventorId){
		$.ajax({
			type : "POST",
			url : "<s:url value='/petition/findInventorById.html'/>",
			data:{"inventorId":inventorId},
			success : function (data){
				var obj = $.parseJSON(data);
				$("#updateModalInventorId").val(obj["inventorId"]);
				$("#updateModalInventorName").val(obj["inventorName"]);
				$("#updateModalInventorNumber").val(obj["inventorNumber"]);
				$("#updateModalInventorNationality").val(obj["inventorNationality"]);
				$("#updateModalInventorMobile").val(obj["inventorMobile"]);
				$("#updateModalInventorEmail").val(obj["inventorEmail"]);
				$("#updateModalInventorOtherInformation").val(obj["inventorOtherInformation"]);
				$("#hiddenUpdateInventorModal").trigger("click");
			},error : function (){
				
			}
		})
	} */
	
	
	function updatePatentDocInventor(inventorId){
		$.ajax({
			type : "POST",
			url : "<s:url value='/petition/findInventorById.html'/>",
			data:{"inventorId":inventorId},
			success : function (data){
				var obj = $.parseJSON(data);
				$("#updateModalInventorId").val(obj["inventorId"]);
				$("#updateModalInventorName").val(obj["inventorName"]);
				$("#updateModalInventorNumber").val(obj["inventorNumber"]);
				$("#updateModalInventorNationality").val(obj["inventorNationality"]);
				$("#updateModalInventorMobile").val(obj["inventorMobile"]);
				$("#updateModalInventorEmail").val(obj["inventorEmail"]);
				$("#updateModalInventorOtherInformation").val(obj["inventorOtherInformation"]);
				$("#hiddenUpdateInventorModal").trigger("click");
			},error : function (){
				
			}
		})
	}
	
	function submitUpdateInventorForm(){
		var inventorId = $("#updateModalInventorId").val();
		var  inventorName= $("#updateModalInventorName").val();
		var  inventorNumber= $("#updateModalInventorNumber").val();
		var  inventorNationality = $("#updateModalInventorNationality").val();
		var  inventorMobile = $("#updateModalInventorMobile").val();
		var  inventorEmail= $("#updateModalInventorEmail").val();
		var  inventorOtherInformation= $("#updateModalInventorOtherInformation").val();
		var  patentDocId = ${patentDoc.patentDocId};
		if(validateAppPersonFormWayTwo(inventorName,"updateInventorName")&
		   validateAppPersonFormWayThree(inventorNumber,"updateInventorNumber")&
		   validateAppPersonFormWayThree(inventorNationality,"updateInventorNationality")&
		   validateAppPersonFormWayThree(inventorMobile,"updateInventorMobile")&
		   validateAppPersonFormWayThree(inventorOtherInformation,"updateInventorOtherInformation")
		   ){
		   
			var formData={"inventorId":inventorId,"inventorName":inventorName,"inventorNumber":inventorNumber,
					      "inventorNationality":inventorNationality,"inventorMobile":inventorMobile,
					      "inventorEmail":inventorEmail,"inventorOtherInformation":inventorOtherInformation,"patentDocId":patentDocId};
			$.ajax({
				type :"POST",
				url : "<s:url value='/petition/updatePatentDocInventor.html'/>",
				data : formData,
				success :function (data){
					var obj= $.parseJSON(data);
					$("#inventorTab").empty();
					$.each(obj,function(i,item){
						$("#inventorTab").append(
								"<tr>"+
								"<td style='text-align:center'>"+item.inventorName+"</td>"+
								"<td style='text-align:center'>"+item.inventorNumber+"</td>"+
								"<td style='text-align:center'>"+item.inventorNationality+"</td>"+
								/* "<td style='text-align:center'>"+item.inventorMobile+"</td>"+
								"<td style='text-align:center'>"+item.inventorEmail+"</td>"+
								"<td style='text-align:center'>"+item.inventorOtherInformation+"</td>"+ */
								"<td style='text-align:center'><a href='javascript:deletePatentDocInventor("+item.inventorId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocInventor("+item.inventorId+")'>修改</a></td>"+
								"</tr>"	
						)
					})
				},error : function (){
					
				}
			});
			resetUpdateInventorForm();
			
		}
	}
	
	function resetUpdateInventorForm(){
		$("#updateInventorModalCloseBtn").trigger("click");
		$("#updateModalInventorId").val("");
		$("#updateModalInventorName").val("");
		$("#updateModalInventorNumber").val("");
		$("#updateModalInventorNationality").val("中国");
		$("#updateModalInventorMobile").val("");
		$("#updateModalInventorEmail").val("");
		$("#updateModalInventorOtherInformation").val("");
	}
	function downloadPic(){
		var patentDocId=$("#patentDocId").val();
		$.ajax({
		
			type :'GET',
			url : "<s:url value='/editor/downloadPic.html'/>?patentDocId="+patentDocId,
			success : function(){
				
			},
			error: function(){
				alert("下载失败");
			}
		})
	}
	

	
	function downloadAttachmentFile(value){
		var iframe = document.getElementById('fileFrame');
		iframe.src = "<s:url value='/editor/getPatentDocAttachmentFile.html'/>?patentDocId="+value;
	}
	$('input[id=patentDocFile]').change(function() {  
		$('#patentDocFilename').val($(this).val());  
	});
	function uploadPatentDocFile(){
		var uploadForm=$("#uploadFileForm");
		var patentDocId = ${patentDoc.patentDocId};
		var option={
				dataType : "json",
				//contentType : false,
				data : {"file":$("#patentDocFile").val(),"patentDocId":patentDocId},
				beforeSubmit : function (){
					var filename = $("#patentDocFilename").val();
					var suffix = filename.toLowerCase().substr(filename.lastIndexOf("."));
					if(suffix ==".zip"||suffix==".rar"){
						return true;
					}else{
						alert("请选择指定类型的文件后，再进行上传");
						return false;
					}
				},
				success : function (result){
					alert(result);
				}
		}
		uploadForm.ajaxSubmit(option);
	}
	
	function downloadPatentDocFile(patentDocId){
		var iframe = document.getElementById('fileFrame');
		iframe.src="<s:url value='/petition/getPatentAttachmentFile.html'/>?patentDocId="+patentDocId;
	}
	
	function validateAppPersonFormWayOne(value,id) {
			if (value.length>50||value.length==0) {
				$("#"+id).css("display","block");
				return false;
			} else {
				$("#"+id).css("display","none");
				return true;
			}
	}
	
	function validateAppPersonFormWayTwo(value,id) {
			if (value.length>20||value.length==0) {
				$("#"+id).css("display","block");
				return false;
			} else {
				$("#"+id).css("display","none");
				return true;
			}
	}
	function validateAppPersonFormWayThree(value,id) {
			if (value.length>20) {
				$("#"+id).css("display","block");
				return false;
			} else {
				$("#"+id).css("display","none");
				return true;
			}
	}
	
	
	
	
	function settingContact(addressId){
		var patentDocId = ${patentDoc.patentDocId};
		$.ajax({
			type : "POST",
			url : "<s:url value='/petition/settingContact.html'/>",
			data : {"patentDocId":patentDocId,"addressId":addressId},
			async : false,
			success : function (reult){
				$("#contactTab").empty();
				var obj = $.parseJSON(reult);
				$.each(obj,function(i,item){
					$("#contactTab").append(
							"<tr>"+
							  "<td style='text-align:center'>"+item.receiver+"</td>"+
							  "<td style='text-align:center'>"+item.provinceName+item.cityName+item.districtName+"</td>"+
							  "<td style='text-align:center'>"+item.detailAddress+"</td>"+
							  "<td style='text-align:center'>"+item.phone+"</td>"+
							  "<td style='text-align:center;width:110px;'><a href='javascript:updateContact("+item.id+")'>修改</a></td>"+
							"</tr>"	
					)
				})
				
			}
		});
		
		$("#commonContactModalCloseBtn").trigger("click");
		
	}
	
	
	function updateContact(contactId){
		$.ajax({
			type : "POST",
			url : "<s:url value='/petition/findContactById.html'/>",
			data :{"id":contactId},
			async : false,
			success : function(result){
				var contact = $.parseJSON(result);
				$("#receiver").val(contact["receiver"]);
				$("#waitForProvinceName").val(contact["province"]);
				$("#waitForProvinceName").html(contact["provinceName"]);
				$("#waitForCity").val(contact["city"]);
				$("#waitForCity").html(contact["cityName"]);
				$("#waitForDistrict").val(contact["district"]);
				$("#waitForDistrict").html(contact["districtName"]);
				$("#detailAddress").val(contact["detailAddress"]);
				$("#contactId").val(contact["id"]);
				$("#phone").val(contact["phone"]);
			}
		});
		$("#hiddenUpdateContactModal").trigger("click");
	}
	
	/* function updateContact(contactId){
		$.ajax({
			type : "POST",
			url : "<s:url value='/petition/updateContact.html'/>",
			data :
		})
	} */
	
	
	
	
	
	
	
	
	function loadCities() {
		var province = $("#province").val();
		
		resetSelect($("#city"), $("#district"), $("#street"));
		
		if (province != "") {
			$.ajax({
				url: "<s:url value='/user/getCitiesByProvince.html'/>?province=" + province,
				type: 'get',
				dataType: 'json',
				success: function(cities) {
					var city = $("#city");
					
					resetSelect(city);
					addOptions(city, cities);
				}
			})
		} 
	}

	function loadDistricts() {
		var city = $("#city").val();

		resetSelect($("#district"), $("#street"));
		
		if (city != "") {
			$.ajax({
				url: "<s:url value='/user/getDistrictsByCity.html'/>?city=" + city,
				type: 'get',
				dataType: 'json',
				success: function(districts) {
					var district = $("#district");
					
					resetSelect(district);
					addOptions(district, districts);
				}
			})
		}
	}

	function loadStreets() {
		var district = $("#district").val();
		
		resetSelect($("#street"));
		
		if (district != "") {
			$.ajax({
				url: "<s:url value='/user/getStreetsByDistrict.html'/>?district=" + district,
				type: 'get',
				dataType: 'json',
				success: function(streets) {
					var street = $("#street");
					
					resetSelect(street);
					addOptions(street, streets);
				}
			})
		} 
	}
	function addDefaultOption(selectElem) {
		selectElem.append("<option value=''>请选择</option>");
	}

	function resetSelect() {
		for (var i = 0; i < arguments.length; i++) {
			var selectObj = arguments[i];
			selectObj.empty();
			addDefaultOption(selectObj);
		}
	}

	function addOptions(selectObj, options) {
		$.each(options, function(index, val){
			selectObj.append("<option value='" + val.id + "'>" + val.name + "</option>");
		});	
	}
	
	
	function submitUpdateContactForm(){
		var receiver = $("#receiver").val();
		var province = $("#province").val();
		//$("#waitForProvinceName").html(contact["provinceName"]);
		var city = $("#city").val();
		//$("#waitForCity").html(contact["cityName"]);
		var district = $("#district").val();
		//$("#waitForDistrict").html(contact["districtName"]);
		var detailAddress = $("#detailAddress").val();
		var id = $("#contactId").val();
		var phone = $("#phone").val();
		var patentDocId = ${patentDoc.patentDocId};
		var formData = {"id":id,"receiver":receiver,"province":province,"city":city,"district":district,
						"detailAddress":detailAddress,"phone":phone,"patentDocId":patentDocId};
		$.ajax({
			type : "POST",
			url : "<s:url value='/petition/updateContact.html'/>",
			data : formData,
			async : false,
			success : function (reult){
				$("#contactTab").empty();
				var obj = $.parseJSON(reult);
				$.each(obj,function(i,item){
					$("#contactTab").append(
							"<tr>"+
							  "<td style='text-align:center'>"+item.receiver+"</td>"+
							  "<td style='text-align:center'>"+item.provinceName+item.cityName+item.districtName+"</td>"+
							  "<td style='text-align:center'>"+item.detailAddress+"</td>"+
							  "<td style='text-align:center'>"+item.phone+"</td>"+
							  "<td style='text-align:center'><a href='javascript:updateContact("+item.id+")'>修改</a></td>"+
							"</tr>"	
					)
				})
			}
		});
		
		$("#updateContactModalCloseBtn").trigger("click");
	}
	
	
	function searchAppPerson(keyword){
		$.ajax({
			url : "<s:url value='/petition/searchAppPerson.html'/>",
			data :{"keyword":keyword},
			success : function (data){
				var obj = $.parseJSON(data);
				$("#commonAppPersonTab").empty();
				$.each(obj,function(i,item){
					$("#commonAppPersonTab").append(
							"<tr>"+
							"<td class='center' style='text-align:center'><label class='pos-rel'> <span class='batch-share-item'>"+
							"<input type='checkbox' class='apperson-check-item' appPerson="+item.appPersonId+"></span>"+
							"<span class='lbl'></span></label>"+
							"</td>"+
							"<td class='center' style='text-align:center'>"+i+" ${status.count} </td>"+
							"<td style='text-align:center'>"+item.name+"</td>"+
							"<td style='text-align:center'>"+item.idNumber+"</td>"+
							"<td style='text-align:center'>"+item.postcodeAddress+"</td>"+
							"<td style='text-align:center'>"+item.feeReduceTransactionStatus+"</td>"+
						  "</tr>"	
					)
				})
			}
		})
		
	}

	function searchInventor(keyword){
		$.ajax({
			url : "<s:url value='/petition/searchInventor.html'/>",
			data :{"keyword":keyword},
			success : function (data){
				var obj = $.parseJSON(data);
				$("#commonInventorTab").empty();
				$.each(obj,function(i,item){
					$("#commonInventorTab").append(
							"<tr>"+
								"<td class='center' style='text-align:center'><label class='pos-rel'> <span class='batch-share-item'>"+
								"<input type='checkbox' class='inventor-check-item' inventor="+item.inventorId+"></span>"+
								"<span class='lbl'></span></label>"+
								"</td>"+
								"<td class='center' style='text-align:center'> "+i+" </td>"+
								"<td style='text-align:center'>"+item.inventorName+"</td>"+
								"<td style='text-align:center'>"+item.inventorNumber+"</td>"+
								"<td style='text-align:center'>"+item.inventorNationality+"</td>"+
								/* "<td>"+item.inventorMobile+"</td>"+
								"<td style='text-align:center'>"+item.inventorEmail+"</td>"+
								"<td style='text-align:center'>"+item.inventorComment+"</td>"+ */
						"</tr>"
					)
				})
			}
		})
		
	}
	function resetUpdateContactForm(){
		 $("#updateContactModalCloseBtn").trigger("click");
	 }
</script>
<iframe id="fileFrame" style="display:none"></iframe>
</body>
</html>