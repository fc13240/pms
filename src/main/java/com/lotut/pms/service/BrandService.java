package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandSearchCondition;
import com.lotut.pms.domain.Page;

public interface BrandService {
	
	List<Brand> getUserBrandsByPage(Page page);
	
	void updateCheckStatus(int status,int id);
	
	void updateRecommend(int status,int id);
	
	List<Brand> searchUserBrandsByPage(BrandSearchCondition brandSearchCondition);
	
	List<BrandCategory> getAllCategorys();
	
	int getsearchUserBrandsCount(BrandSearchCondition brandSearchCondition);
	
	int getUserBrandsCount(int userId);
}
