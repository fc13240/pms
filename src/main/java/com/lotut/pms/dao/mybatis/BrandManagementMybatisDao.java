package com.lotut.pms.dao.mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.BrandManagementDao;
import com.lotut.pms.dao.mapper.BrandManagementMapper;

public class BrandManagementMybatisDao extends SqlSessionDaoSupport implements BrandManagementDao{
	private BrandManagementMapper brandManagementMapper;
	
	public void setBrandManagementMapper(BrandManagementMapper brandManagementMapper) {
		this.brandManagementMapper = brandManagementMapper;
	}
	
	
}
