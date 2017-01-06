package com.lotut.pms.service;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandCategoryCount;
import com.lotut.pms.domain.BrandLegalStatus;
import com.lotut.pms.domain.BrandLegalStatusCount;
import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.BrandManagementSearchCondition;
import com.lotut.pms.domain.Page;

public interface BrandManagementService {

	List<BrandManagement> getUserBrandManagementByPage(Page page);

	int getUserBrandManagementCount(int userId);

	void insertUserBrandManagements(List<Map<String, Integer>> userBrandManagementRecords);
	
	List<BrandCategory> getAllBrandCategory();
	
	List<BrandLegalStatus> getAllBrandLegalStatus();
	
	List<BrandManagement> searchUserBrandManagementByPage(BrandManagementSearchCondition searchCondition);
	
	int searchUserBrandManagementByCount(BrandManagementSearchCondition searchCondition);
	
	List<BrandLegalStatusCount>  getLegalStatusCount(int userId);
	
	List<BrandCategoryCount>  getBrandCategoryCount(int userId);
}
