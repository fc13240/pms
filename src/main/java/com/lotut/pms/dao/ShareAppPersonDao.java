package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

public interface ShareAppPersonDao {
	void insertUserAppPersons(List<Map<String, Integer>> userAppPersonRecords);
	void shareAppPersons(List<Map<String, Integer>> shareAppPersonRecords,
			List<Map<String, Integer>> userAppPersonRecords);
}
