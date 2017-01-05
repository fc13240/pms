package com.lotut.pms.service.impl;

import com.lotut.pms.dao.BrandManagementDao;
import com.lotut.pms.service.BrandManagementService;

public class BrandManagementServiceImpl implements BrandManagementService{
	private BrandManagementDao brandManagementDao;

	public BrandManagementServiceImpl(BrandManagementDao brandManagementDao) {
		this.brandManagementDao = brandManagementDao;
	}

}
