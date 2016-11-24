package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.dao.BrandDao;
import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.service.BrandService;

public class BrandServiceImpl implements BrandService{
	private BrandDao brandDao;

	public BrandServiceImpl(BrandDao brandDao) {
		this.brandDao = brandDao;
	}

	@Override
	public List<Brand> getUserBrandsByPage(Page page) {
		return brandDao.getUserBrandsByPage(page);
	}

	@Override
	public void updateCheckStatus(int status, int id) {
		brandDao.updateCheckStatus(status, id);
	}

	@Override
	public void updateRecommend(int status, int id) {
		brandDao.updateRecommend(status, id);
	}
	
	@Override
	public List<Brand> searchUserBrandsByPage(BrandSearchCondition brandSearchCondition) {
		return brandDao.searchUserBrandsByPage(brandSearchCondition);
	}
	
	@Override
	public List<BrandCategory> getAllCategorys() {
		return brandDao.getAllCategorys();
	}
	
	@Override
	public int getsearchUserBrandsCount(BrandSearchCondition brandSearchCondition) {
		return brandDao.getsearchUserBrandsCount(brandSearchCondition);
	} 
	
	@Override
	public int getUserBrandsCount(int userId) {
		return brandDao.getUserBrandsCount(userId);
	} 

}
