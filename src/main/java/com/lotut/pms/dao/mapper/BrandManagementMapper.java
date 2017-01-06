package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.Page;

public interface BrandManagementMapper {

	int getUserBrandManagementCount(int userId);

	List<BrandManagement> getUserBrandManagementByPage(Page page);

	void insertUserBrandManagements(List<Map<String, Integer>> userBrandManagementRecords);
	
}