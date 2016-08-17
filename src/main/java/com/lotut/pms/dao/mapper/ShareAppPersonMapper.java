package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

public interface ShareAppPersonMapper {
	void insertShareAppPersons(List<Map<String, Integer>> shareAppPersonRecords);
	
	void insertUserAppPersons(List<Map<String, Integer>> userAppPersonRecords);
}
