package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandCategoryCount;
import com.lotut.pms.domain.BrandLegalStatus;
import com.lotut.pms.domain.BrandLegalStatusCount;
import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.BrandManagementSearchCondition;
import com.lotut.pms.domain.BrandRemark;
import com.lotut.pms.domain.BrandNoticeType;
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
	
	List<BrandManagement> getUserExcelDate(@Param("brandIds") List<Integer> brandIds);

	List<BrandLegalStatusCount>  getLegalStatusCount(int userId);
	
	List<BrandCategoryCount>  getBrandCategoryCount(int userId);


	void brandsTrash(@Param("brands") List<Integer> brandManagementIds,@Param("userId") int userId);

	List<BrandNoticeType> getAllBrandNoticeTypes();
	
	int insertOrUpdateBrand(BrandManagement brandManagement);
	
	void insertUserBrand(@Param("userId")int userId,@Param("brandId")int brandId);
	
	BrandManagement showBrandManagementDetail(int brandId);
	
	void deleteShareUser(@Param("brandId")int brandId,@Param("shareUserId")int shareUserId);

	
}