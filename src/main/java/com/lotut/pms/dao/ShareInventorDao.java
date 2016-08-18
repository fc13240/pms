package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

public interface ShareInventorDao {
	void insertUserInventors(List<Map<String, Integer>> userInventorRecords);
}
