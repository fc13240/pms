package com.lotut.pms.constants;

import java.util.HashMap;
import java.util.Map;

public class PatentDocWorkflowAction {
	public static  final Map<Integer,String> ActionType =new HashMap<>();
	static{
		ActionType.put(1,"委托给平台账户");
		ActionType.put(2,"分配给代理机构" );
		ActionType.put(3,"分配给客服人员" );
		ActionType.put(4,"分配给技术员");
		ActionType.put(5,"审查" );
		ActionType.put(6,"修改" );
		ActionType.put(7,"定稿" );
		ActionType.put(8,"制作标准文件" );
		ActionType.put(9,"确认" );
		ActionType.put(10,"交局" );
	}
}
