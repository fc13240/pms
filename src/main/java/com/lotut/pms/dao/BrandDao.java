package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.WeChatOrder;

public interface BrandDao {
	
	List<Brand> getUserBrandsByPage(Page page);
	
	void updateCheckStatus(int status,int id);
	
	void updateRecommend(int status,int id);
	
	List<Brand> searchUserBrandsByPage(BrandSearchCondition brandSearchCondition);
	
	List<BrandCategory> getAllCategorys();
	
	int getsearchUserBrandsCount(BrandSearchCondition brandSearchCondition);
	
	int getUserBrandsCount(int userId);
	
	void deleteBrand(int brandId);

	int insertOrUpdateBrand(Brand brand);
	
	List<WeChatOrder> getWeChatUserOrderRecords(Page page);
	
	int getWeChatOrderCount();
}
