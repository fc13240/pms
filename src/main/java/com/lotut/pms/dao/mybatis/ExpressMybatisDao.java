package com.lotut.pms.dao.mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.ExpressDao;
import com.lotut.pms.dao.mapper.ExpressMapper;

public class ExpressMybatisDao extends SqlSessionDaoSupport implements ExpressDao{
	private ExpressMapper expressMapper;
	
	public ExpressMapper getExpressMapper() {
		return expressMapper;
	}

	public void setExpressMapper(ExpressMapper expressMapper) {
		this.expressMapper = expressMapper;
	}
}
