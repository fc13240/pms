package com.lotut.pms.service;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.BrandRemark;
import com.lotut.pms.domain.Page;

public interface BrandManagementService {

	List<BrandManagement> getUserBrandManagementByPage(Page page);

	int getUserBrandManagementCount(int userId);

	void insertUserBrandManagements(List<Map<String, Integer>> userBrandManagementRecords);
	
	void saveBrandRemark(BrandRemark brandRemark);
	
	List<BrandRemark> getBrandRemark(int brandId);
	
}
