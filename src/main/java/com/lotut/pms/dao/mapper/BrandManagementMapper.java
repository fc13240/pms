package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandLegalStatus;
import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.BrandManagementSearchCondition;
import com.lotut.pms.domain.BrandRemark;
import com.lotut.pms.domain.Page;

public interface BrandManagementMapper {

	int getUserBrandManagementCount(int userId);

	List<BrandManagement> getUserBrandManagementByPage(Page page);

	void insertUserBrandManagements(List<Map<String, Integer>> userBrandManagementRecords);
	
	void saveBrandRemark(BrandRemark brandRemark);
	
	List<BrandRemark> getBrandRemark(int brandId);

	List<BrandCategory> getAllBrandCategory();
	
	List<BrandLegalStatus> getAllBrandLegalStatus();
	
	List<BrandManagement> searchUserBrandManagementByPage(BrandManagementSearchCondition searchCondition);
	
	int searchUserBrandManagementByCount(BrandManagementSearchCondition searchCondition);
	
	List<BrandManagement> getUserExcelDate(List<Integer> brandIds);
	
}