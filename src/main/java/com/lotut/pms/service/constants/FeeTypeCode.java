package com.lotut.pms.service.constants;

import java.util.HashMap;
import java.util.Map;

public abstract class FeeTypeCode {
	private static final Map<String, String> FEE_TYPE_CODE_MAP = new HashMap<String, String>();
	
	static {
		FEE_TYPE_CODE_MAP.put("发明专利第1年年费", "40872083405340");
		FEE_TYPE_CODE_MAP.put("权利要求附加费", "40872083325332");
		FEE_TYPE_CODE_MAP.put("发明专利年费滞纳金", "40872083525381");
		FEE_TYPE_CODE_MAP.put("说明书附加费", "40872083335333");
		FEE_TYPE_CODE_MAP.put("发明专利权无效宣告请求费", "40872082905290");
		FEE_TYPE_CODE_MAP.put("发明专利第20年年费", "40872083405359");
		FEE_TYPE_CODE_MAP.put("发明专利第17年年费", "40872083405356");
		FEE_TYPE_CODE_MAP.put("发明专利第18年年费", "40872083405357");
		FEE_TYPE_CODE_MAP.put("发明专利第6年年费", "40872083405345");
		FEE_TYPE_CODE_MAP.put("发明专利登记印刷费", "40872083205320");
		FEE_TYPE_CODE_MAP.put("发明专利第16年年费", "40872083405355");
		FEE_TYPE_CODE_MAP.put("发明专利文印费", "40872082115211");
		FEE_TYPE_CODE_MAP.put("发明专利第13年年费", "40872083405352");
		FEE_TYPE_CODE_MAP.put("发明专利第11年年费", "40872083405350");
		FEE_TYPE_CODE_MAP.put("印花税", "20761581515151");
		FEE_TYPE_CODE_MAP.put("发明专利第8年年费", "40872083405347");
		FEE_TYPE_CODE_MAP.put("发明专利第12年年费", "40872083405351");
		FEE_TYPE_CODE_MAP.put("发明专利第7年年费", "40872083405346");
		FEE_TYPE_CODE_MAP.put("发明专利第9年年费", "40872083405348");
		FEE_TYPE_CODE_MAP.put("恢复权利请求费", "40872082705270");
		FEE_TYPE_CODE_MAP.put("发明专利第19年年费", "40872083405358");
		FEE_TYPE_CODE_MAP.put("发明专利申请费", "40872082105210");
		FEE_TYPE_CODE_MAP.put("优先权要求费", "40872082605260");
		FEE_TYPE_CODE_MAP.put("发明专利第2年年费", "40872083405341");
		FEE_TYPE_CODE_MAP.put("发明专利第14年年费", "40872083405353");
		FEE_TYPE_CODE_MAP.put("发明专利第3年年费", "40872083405342");
		FEE_TYPE_CODE_MAP.put("发明专利第15年年费", "40872083405354");
		FEE_TYPE_CODE_MAP.put("发明专利第4年年费", "40872083405343");
		FEE_TYPE_CODE_MAP.put("发明专利第5年年费", "40872083405344");
		FEE_TYPE_CODE_MAP.put("年费费减", "40872083400001");
		FEE_TYPE_CODE_MAP.put("发明专利复审费", "40872082405240");
		FEE_TYPE_CODE_MAP.put("发明专利申请审查费", "40872082305230");
		FEE_TYPE_CODE_MAP.put("延长费", "40872083315331");
		FEE_TYPE_CODE_MAP.put("发明专利第10年年费", "40872083405349");
		FEE_TYPE_CODE_MAP.put("变更费", "40872082505250");
		
		FEE_TYPE_CODE_MAP.put("权利要求附加费", "40872083325332");
		FEE_TYPE_CODE_MAP.put("实用新型检索费", "40872082315231");
		FEE_TYPE_CODE_MAP.put("说明书附加费", "40872083335333");
		FEE_TYPE_CODE_MAP.put("实用新型专利年费滞纳金", "40872083535382");
		FEE_TYPE_CODE_MAP.put("实用新型专利第8年年费", "40872083415367");
		FEE_TYPE_CODE_MAP.put("实用新型专利第10年年费", "40872083415369");
		FEE_TYPE_CODE_MAP.put("实用新型专利权评价报告请求费", "40872082325232");
		FEE_TYPE_CODE_MAP.put("实用新型专利第4年年费", "40872083415363");
		FEE_TYPE_CODE_MAP.put("延长费", "40872083315331");
		FEE_TYPE_CODE_MAP.put("实用新型专利第1年年费", "40872083415360");
		FEE_TYPE_CODE_MAP.put("实用新型专利权无效宣告请求费", "40872082915291");
		FEE_TYPE_CODE_MAP.put("实用新型专利第5年年费", "40872083415364");
		FEE_TYPE_CODE_MAP.put("恢复权利请求费", "40872082705270");
		FEE_TYPE_CODE_MAP.put("实用新型专利第7年年费", "40872083415366");
		FEE_TYPE_CODE_MAP.put("优先权要求费", "40872082605260");
		FEE_TYPE_CODE_MAP.put("实用新型专利复审费", "40872082415241");
		FEE_TYPE_CODE_MAP.put("实用新型专利第6年年费", "40872083415365");
		FEE_TYPE_CODE_MAP.put("实用新型专利申请费", "40872082135213");
		FEE_TYPE_CODE_MAP.put("实用新型专利登记印刷费", "40872083225322");
		FEE_TYPE_CODE_MAP.put("实用新型专利第3年年费", "40872083415362");
		FEE_TYPE_CODE_MAP.put("年费费减", "40872083400001");
		FEE_TYPE_CODE_MAP.put("实用新型专利第9年年费", "40872083415368");
		FEE_TYPE_CODE_MAP.put("实用新型专利第2年年费", "40872083415361");
		FEE_TYPE_CODE_MAP.put("印花税", "20761581515151");
		FEE_TYPE_CODE_MAP.put("变更费", "40872082505250");
		
		FEE_TYPE_CODE_MAP.put("权利要求附加费", "40872083325332");
		FEE_TYPE_CODE_MAP.put("说明书附加费", "40872083335333");
		FEE_TYPE_CODE_MAP.put("外观设计专利年费滞纳金", "40872083545383");
		FEE_TYPE_CODE_MAP.put("外观设计专利第3年年费", "40872083425372");
		FEE_TYPE_CODE_MAP.put("外观设计专利第4年年费", "40872083425373");
		FEE_TYPE_CODE_MAP.put("外观设计专利第1年年费", "40872083425370");
		FEE_TYPE_CODE_MAP.put("外观设计专利登记印刷费", "40872083235323");
		FEE_TYPE_CODE_MAP.put("外观设计专利复审费", "40872082425242");
		FEE_TYPE_CODE_MAP.put("外观设计专利第8年年费", "40872083425377");
		FEE_TYPE_CODE_MAP.put("延长费", "40872083315331");
		FEE_TYPE_CODE_MAP.put("外观设计专利第5年年费", "40872083425374");
		FEE_TYPE_CODE_MAP.put("恢复权利请求费", "40872082705270");
		FEE_TYPE_CODE_MAP.put("外观设计专利第2年年费", "40872083425371");
		FEE_TYPE_CODE_MAP.put("优先权要求费", "40872082605260");
		FEE_TYPE_CODE_MAP.put("外观设计专利第7年年费", "40872083425376");
		FEE_TYPE_CODE_MAP.put("外观设计专利权无效宣告请求费", "40872082925292");
		FEE_TYPE_CODE_MAP.put("外观设计专利第6年年费", "40872083425375");
		FEE_TYPE_CODE_MAP.put("外观设计专利第10年年费", "40872083425379");
		FEE_TYPE_CODE_MAP.put("外观设计专利第9年年费", "40872083425378");
		FEE_TYPE_CODE_MAP.put("年费费减", "40872083400001");
		FEE_TYPE_CODE_MAP.put("外观设计专利申请费", "40872082145214");
		FEE_TYPE_CODE_MAP.put("印花税", "20761581515151");
		FEE_TYPE_CODE_MAP.put("外观设计专利权评价报告请求费", "40872082325233");
		FEE_TYPE_CODE_MAP.put("变更费", "40872082505250");
	}
	
	public static String getFeeCodeByType(String feeType) {
		return FEE_TYPE_CODE_MAP.get(feeType);
	}
	
	private FeeTypeCode() {}
}
