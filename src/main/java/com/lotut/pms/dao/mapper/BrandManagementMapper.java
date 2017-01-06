package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandLegalStatus;
import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.BrandSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.WeChatOrder;

public interface BrandManagementMapper {

	int getUserBrandManagementCount(int userId);

	List<BrandManagement> getUserBrandManagementByPage(Page page);
	
	List<BrandCategory> getAllBrandCategory();
	
	List<BrandLegalStatus> getAllBrandLegalStatus();
	
}