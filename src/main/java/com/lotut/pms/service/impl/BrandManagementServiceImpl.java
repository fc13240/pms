package com.lotut.pms.service.impl;

import java.util.List;
import java.util.Map;

import com.lotut.pms.dao.BrandManagementDao;
import com.lotut.pms.domain.BrandManagement;
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
	public void insertUserBrandManagements(List<Map<String, Integer>> userBrandManagementRecords) {
		brandManagementDao.insertUserBrandManagements(userBrandManagementRecords);
	}

}
