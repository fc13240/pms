package com.lotut.pms.service;

import java.util.List;
import java.util.Map;

public interface ShareAppPersonService {
	void shareAppPersons(List<Map<String, Integer>> shareAppPersonRecords,
			List<Map<String, Integer>> userAppPersonRecords);
	
	void insertUserAppPersons(List<Map<String, Integer>> userAppPersonRecords);

}
