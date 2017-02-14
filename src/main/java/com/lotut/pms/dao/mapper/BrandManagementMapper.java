package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

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

	int getBrandsRecycledCount(int userId);

	List<Brand> getBrandsRecycled(Page page);
	
	int SearchBrandsRecycledCount(BrandManagementSearchCondition searchCondition);

	List<Brand> SearchBrandsRecycled(BrandManagementSearchCondition searchCondition);

	void recoverBrands(@Param("brands") List<Integer> brandManagementIds,@Param("userId") int userId);

	void deleteForeverBrands(@Param("brands") List<Integer> brandManagementIds,@Param("userId") int userId);
	
	List<BrandManagement> getUserMonitorBrand(Page page);
	
	int getUserMonitorBrandCount(int userId);
	
	void changeBrandMonitorStatus(@Param("userId")int userId, @Param("brandIds") List<Long> brandIds);
	
	void cancelBrandMonitorStatus(@Param("userId")int userId, @Param("brandIds") List<Long> brandIds);
	
	List<BrandManagement> searchUserMonitorBrand(BrandManagementSearchCondition searchCondition);
	
	int searchUserMonitorBrandCount(BrandManagementSearchCondition searchCondition);
	
	void changeBrandTransactionStatus(int brandId);

	void changeBrandTransactionStatusTo0(@Param("id")int id);

	void changeBrandTransactionStatusByBrandNo(BrandManagement brandManagement);
}