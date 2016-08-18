package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

public interface ShareInventorMapper {
	void insertUserInventors(List<Map<String, Integer>> userInventorRecords);
}
