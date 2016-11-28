package com.lotut.pms.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.WeChatOrder;

public interface BrandService {
	
	List<Brand> getUserBrandsByPage(Page page);
	
	void updateCheckStatus(int status,int id);
	
	void updateRecommend(int status,int id);
	
	List<Brand> searchUserBrandsByPage(BrandSearchCondition brandSearchCondition);
	
	List<BrandCategory> getAllCategorys();
	
	List<Brand> uploadBrands(InputStream is,int userId) throws IOException;
	
	boolean addOrUpdateBrands(List<Brand> brands, int userId);
	
	int getsearchUserBrandsCount(BrandSearchCondition brandSearchCondition);
	
	int getUserBrandsCount(int userId);
	
	void deleteBrand(int brandId);
	
	List<WeChatOrder> getWeChatUserOrderRecords(Page page);
	
	int getWeChatOrderCount();

	void addOrEditBrand(Brand brand);

	Brand getUserBrandsById(int brandId);
}