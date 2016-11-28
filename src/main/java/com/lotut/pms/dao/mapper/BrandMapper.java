package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.WeChatOrder;

public interface BrandMapper {
	
	List<Brand> getUserBrandsByPage(Page page);
	
	void updateCheckStatus(@Param("status")int status,@Param("id")int id);
	
	void updateRecommend(@Param("status")int status,@Param("id")int id);
	
	List<Brand> searchUserBrandsByPage(BrandSearchCondition brandSearchCondition);
	
	List<BrandCategory> getAllCategorys();
	
	int getUserBrandsCount(int userId);

	int getsearchUserBrandsCount(BrandSearchCondition brandSearchCondition);
	
	void deleteBrand(int brandId);

	int insertOrUpdateBrand(Brand brand);
	
	List<WeChatOrder> getWeChatUserOrderRecords(Page page);
	
	int getWeChatOrderCount();
}
