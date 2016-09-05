package com.lotut.pms.constants;

import java.util.HashMap;
import java.util.Map;

public class PatentDocWorkflowAction {
	public static  final Map<String,Integer> ActionType =new HashMap<>();
	static{
		ActionType.put("委托给平台账户",1);
		ActionType.put("分配给代理机构",2 );
		ActionType.put("分配给客服人员",3);
		ActionType.put("分配给技术员",4);
		ActionType.put("审查",5 );
		ActionType.put("修改",6 );
		ActionType.put("定稿",7 );
		ActionType.put("制作标准文件",8 );
		ActionType.put("确认",9 );
		ActionType.put("交局",10 );
	}
}
