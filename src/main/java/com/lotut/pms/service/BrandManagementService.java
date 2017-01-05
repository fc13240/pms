package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.Page;

public interface BrandManagementService {

	List<BrandManagement> getUserBrandManagementByPage(Page page);

	int getUserBrandManagementCount(int userId);
	
}
