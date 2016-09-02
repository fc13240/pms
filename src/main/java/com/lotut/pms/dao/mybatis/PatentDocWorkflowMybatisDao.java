package com.lotut.pms.dao.mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.OrderDao;
import com.lotut.pms.dao.PatentDocWorkflowDao;
import com.lotut.pms.dao.mapper.OrderMapper;
import com.lotut.pms.dao.mapper.PatentDocWorkflowMapper;

public class PatentDocWorkflowMybatisDao extends SqlSessionDaoSupport implements PatentDocWorkflowDao{
	private PatentDocWorkflowMapper patentDocWorkflowMapper;



	public void setPatentDocWorkflowMapper(PatentDocWorkflowMapper patentDocWorkflowMapper) {
		this.patentDocWorkflowMapper = patentDocWorkflowMapper;
	}
	
	
	
}
