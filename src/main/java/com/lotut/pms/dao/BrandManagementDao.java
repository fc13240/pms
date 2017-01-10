package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandCategoryCount;
import com.lotut.pms.domain.BrandLegalStatus;
import com.lotut.pms.domain.BrandLegalStatusCount;
import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.BrandRemark;
import com.lotut.pms.domain.BrandManagementSearchCondition;
import com.lotut.pms.domain.BrandNoticeType;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.PatentSearchCondition;

public interface BrandManagementDao {

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

	List<BrandLegalStatusCount>  getLegalStatusCount(int userId);
	
	List<BrandCategoryCount>  getBrandCategoryCount(int userId);


	void brandsTrash(List<Integer> brandManagementIds, int userId);

	
	int insertOrUpdateBrand(BrandManagement brandManagement);
	
	void insertUserBrand(int userId,int brandId);
	
	BrandManagement showBrandManagementDetail(int brandId);

	List<BrandNoticeType> getAllBrandNoticeTypes();
	
	void deleteShareUser(int brandId,int shareUserId);

	int getBrandsRecycledCount(int userId);

	List<Brand> getBrandsRecycled(Page page);
	
	int SearchBrandsRecycledCount(BrandManagementSearchCondition  searchCondition);

	List<Brand> SearchBrandsRecycled(BrandManagementSearchCondition searchCondition);

	void recoverBrands(List<Integer> brandManagementIds, int userId);

	void deleteForeverBrands(List<Integer> brandManagementIds, int userId);

	
}
