package com.lotut.pms.service;

import java.io.IOException;
import java.io.InputStream;
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
	
	boolean uploadBrands(InputStream is,int userId) throws IOException;
	
	boolean addOrUpdateBrands(List<Brand> brands, int userId);
	
	int getsearchUserBrandsCount(BrandSearchCondition brandSearchCondition);
	
	int getUserBrandsCount(int userId);
	
	void deleteBrand(int brandId);
}
