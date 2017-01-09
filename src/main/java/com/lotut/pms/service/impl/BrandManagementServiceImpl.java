package com.lotut.pms.service.impl;

import java.util.List;
import java.util.Map;

import com.lotut.pms.dao.BrandManagementDao;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandCategoryCount;
import com.lotut.pms.domain.BrandLegalStatus;
import com.lotut.pms.domain.BrandLegalStatusCount;
import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.BrandRemark;
import com.lotut.pms.domain.BrandManagementSearchCondition;
import com.lotut.pms.domain.BrandNoticeType;
import com.lotut.pms.domain.Page;
import com.lotut.pms.service.BrandManagementService;

public class BrandManagementServiceImpl implements BrandManagementService{
	private BrandManagementDao brandManagementDao;

	public BrandManagementServiceImpl(BrandManagementDao brandManagementDao) {
		this.brandManagementDao = brandManagementDao;
	}

	@Override
	public List<BrandManagement> getUserBrandManagementByPage(Page page) {
		return brandManagementDao.getUserBrandManagementByPage(page);
	}

	@Override
	public int getUserBrandManagementCount(int userId) {
		return brandManagementDao.getUserBrandManagementCount(userId);
	}

	@Override
	public List<BrandCategory> getAllBrandCategory() {
		return brandManagementDao.getAllBrandCategory();
	}

	@Override
	public List<BrandLegalStatus> getAllBrandLegalStatus() {
		return brandManagementDao.getAllBrandLegalStatus();
	}
	@Override
	public void insertUserBrandManagements(List<Map<String, Integer>> userBrandManagementRecords) {
		brandManagementDao.insertUserBrandManagements(userBrandManagementRecords);
	}

	@Override
	public void saveBrandRemark(BrandRemark brandRemark) {
		brandManagementDao.saveBrandRemark(brandRemark);
	}

	@Override
	public List<BrandRemark> getBrandRemark(int brandId) {
		return brandManagementDao.getBrandRemark(brandId);
	}
	
	@Override
	public List<BrandManagement> searchUserBrandManagementByPage(BrandManagementSearchCondition searchCondition) {
		return brandManagementDao.searchUserBrandManagementByPage(searchCondition);
	}

	@Override
	public int searchUserBrandManagementByCount(BrandManagementSearchCondition searchCondition) {
		return brandManagementDao.searchUserBrandManagementByCount(searchCondition);
	}

	@Override
	public List<BrandLegalStatusCount> getLegalStatusCount(int userId) {
		return brandManagementDao.getLegalStatusCount(userId);
	}

	@Override
	public List<BrandCategoryCount> getBrandCategoryCount(int userId) {
		return brandManagementDao.getBrandCategoryCount(userId);
	}

	@Override
	public List<BrandNoticeType> getAllBrandNoticeTypes() {
		return brandManagementDao.getAllBrandNoticeTypes();
	}

	
}
