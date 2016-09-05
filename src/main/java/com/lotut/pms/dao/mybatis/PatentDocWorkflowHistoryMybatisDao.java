package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.PatentDocWorkflowHistoryDao;
import com.lotut.pms.dao.mapper.PatentDocWorkflowHistoryMapper;
import com.lotut.pms.domain.PatentDocWorkflowHistory;
import com.lotut.pms.domain.PatentDocWorkflowTarget;

public class PatentDocWorkflowHistoryMybatisDao extends SqlSessionDaoSupport implements PatentDocWorkflowHistoryDao{
	private PatentDocWorkflowHistoryMapper patentDocWorkflowHistoryMapper;
	
	public void setPatentDocWorkflowHistoryMapper(PatentDocWorkflowHistoryMapper patentDocWorkflowHistoryMapper) {
		this.patentDocWorkflowHistoryMapper = patentDocWorkflowHistoryMapper;
	}

	@Override
	public void addHistory(PatentDocWorkflowHistory patentDocWorkFlowHistory) {
		patentDocWorkflowHistoryMapper.addHistory(patentDocWorkFlowHistory);
	}

	@Override
	public void addWorkFlowTarget(PatentDocWorkflowTarget patentDocWorkflowTarget) {
		patentDocWorkflowHistoryMapper.addWorkFlowTarget(patentDocWorkflowTarget);
	}

	@Override
	public int insertHistory(List<Map<String, Long>> patentDocWorkflowHistoryRecords) {
		
		return patentDocWorkflowHistoryMapper.insertHistory(patentDocWorkflowHistoryRecords);
	}
	
}
