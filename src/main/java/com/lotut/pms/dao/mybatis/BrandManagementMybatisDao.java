package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.BrandManagementDao;
import com.lotut.pms.dao.mapper.BrandManagementMapper;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandLegalStatus;
import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.Page;

public class BrandManagementMybatisDao extends SqlSessionDaoSupport implements BrandManagementDao{
	private BrandManagementMapper brandManagementMapper;
	
	public void setBrandManagementMapper(BrandManagementMapper brandManagementMapper) {
		this.brandManagementMapper = brandManagementMapper;
	}

	@Override
	public int getUserBrandManagementCount(int userId) {
		return brandManagementMapper.getUserBrandManagementCount(userId);
	}

	@Override
	public List<BrandManagement> getUserBrandManagementByPage(Page page) {
		return brandManagementMapper.getUserBrandManagementByPage(page);
	}

	@Override
	public List<BrandCategory> getAllBrandCategory() {
		return brandManagementMapper.getAllBrandCategory();
	}

	@Override
	public List<BrandLegalStatus> getAllBrandLegalStatus() {
		return brandManagementMapper.getAllBrandLegalStatus();
	}
	
	
}
