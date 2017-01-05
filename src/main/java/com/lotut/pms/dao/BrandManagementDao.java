package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.Page;

public interface BrandManagementDao {

	int getUserBrandManagementCount(int userId);

	List<BrandManagement> getUserBrandManagementByPage(Page page);
	
}
