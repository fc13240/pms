package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.WeChatOrder;

public interface BrandMapper {
	
	List<Brand> getUserBrandsByPage(Page page);
	
	List<Brand> getBrandsByPage(Page page);
	
	int getBrandsCounts();
	
	void updateCheckStatus(@Param("status")int status,@Param("id")int id);
	
	void updateRecommend(@Param("status")int status,@Param("id")int id);
	
	List<Brand> searchUserBrandsByPage(BrandSearchCondition brandSearchCondition);
	
	List<BrandCategory> getAllCategorys();
	
	int getUserBrandsCount(int userId);

	int getsearchUserBrandsCount(BrandSearchCondition brandSearchCondition);
	
	void deleteBrand(int brandId);

	int insertOrUpdateBrand(Brand brand);
	
	int addOrEditBrand(Brand brand);
	
	List<WeChatOrder> getWeChatUserOrderRecords(Page page);
	
	int getWeChatOrderCount();

	Brand getUserBrandsById(int brandId);
	
	void insertUserBrands(List<Map<String, Integer>> userBrandRecords);
	
	void insertUserBrand(@Param("userId")int userId,@Param("brandId")int brandId);
	
	void addBrandCategory(List<BrandCategory> userBrandCategoryRecords);
	
	List<Brand> searchBrandsByPage(BrandSearchCondition brandSearchCondition);
	
	int getsearchBrandsCount(BrandSearchCondition brandSearchCondition);
}
