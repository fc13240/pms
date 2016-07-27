package com.lotut.pms.constants;

import java.util.HashMap;
import java.util.Map;

public class patentDocSectionTyeps {
	public static final Map<String, Integer> SectionTyepMap =new HashMap<>();
	static {
		SectionTyepMap.put("inventName", 1);
		SectionTyepMap.put("techDomain", 2);
		SectionTyepMap.put("backTech", 3);
		SectionTyepMap.put("contentProblem", 4);
		SectionTyepMap.put("contentClaim", 5);
		SectionTyepMap.put("contentEffect", 6);
		SectionTyepMap.put("implementWay", 7);
		SectionTyepMap.put("rightClaim", 8);
		SectionTyepMap.put("abstract", 9);
		SectionTyepMap.put("practicalName", 10);
	}
	
	public static void main(String[] args) {
		System.out.println(SectionTyepMap.get("inventName"));
	}
}
