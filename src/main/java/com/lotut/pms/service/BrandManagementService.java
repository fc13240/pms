package com.lotut.pms.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandCategoryCount;
import com.lotut.pms.domain.BrandLegalStatus;
import com.lotut.pms.domain.BrandLegalStatusCount;
import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.BrandManagementSearchCondition;
import com.lotut.pms.domain.BrandNoticeType;
import com.lotut.pms.domain.BrandRemark;
import com.lotut.pms.domain.Page;

public interface BrandManagementService {

	List<BrandManagement> getUserBrandManagementByPage(Page page);

	int getUserBrandManagementCount(int userId);

	void insertUserBrandManagements(List<Map<String, Integer>> userBrandManagementRecords);
	
	void saveBrandRemark(BrandRemark brandRemark);
	
	List<BrandRemark> getBrandRemark(int brandId);
	
	List<BrandCategory> getAllBrandCategory();
	
	List<BrandLegalStatus> getAllBrandLegalStatus();
	
	List<BrandManagement> searchUserBrandManagementByPage(BrandManagementSearchCondition searchCondition);
	
	int searchUserBrandManagementByCount(BrandManagementSearchCondition searchCondition);
	
	String exportExcelUserBrand(List<Integer> brandIds,String excelName);

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
	
	int SearchBrandsRecycledCount(BrandManagementSearchCondition searchCondition);

	List<Brand> SearchBrandsRecycled(BrandManagementSearchCondition searchCondition);

	void recoverBrands(List<Integer> brandManagementIds, int userId);

	void deleteForeverBrands(List<Integer> brandManagementIds, int userId);
	
	List<BrandManagement> getUserMonitorBrand(Page page);
	
	int getUserMonitorBrandCount(int userId);
	
	void changeBrandMonitorStatus(int userId, List<Long> brandIds);
	
	void cancelBrandMonitorStatus(int userId, List<Long> brandIds);
	
	List<BrandManagement> searchUserMonitorBrand(BrandManagementSearchCondition searchCondition);
	
	int searchUserMonitorBrandCount(BrandManagementSearchCondition searchCondition);
	
	void changeBrandTransactionStatus(int brandId);

	void changeBrandTransactionStatusTo0(int id);

	void changeBrandTransactionStatusByBrandNo(BrandManagement brandManagement);
	
	List<File> packZip(int brandId);
	
}
