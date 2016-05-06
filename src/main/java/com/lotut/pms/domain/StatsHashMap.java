package com.lotut.pms.domain;

import java.util.HashMap;

public class StatsHashMap extends HashMap<Integer, Integer> {
	private static final long serialVersionUID = 1231689243454527327L;

	@Override
	public Integer get(Object key) {
		if (super.get(key) != null) {
			return super.get(key);
		}
		
		return 0;
	}
	
	public static void main(String[] args) {
		StatsHashMap statsMap = new StatsHashMap();
		System.out.println(statsMap.get(1233));
	}
	
}
