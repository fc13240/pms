package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.BrandManagementDao;
import com.lotut.pms.dao.mapper.BrandManagementMapper;
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
	public void insertUserBrandManagements(List<Map<String, Integer>> userBrandManagementRecords) {
		brandManagementMapper.insertUserBrandManagements(userBrandManagementRecords);
	}
	
	
}
