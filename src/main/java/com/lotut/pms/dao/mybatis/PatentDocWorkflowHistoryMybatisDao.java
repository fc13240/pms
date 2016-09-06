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
	public void addWorkflowTarget(PatentDocWorkflowTarget patentDocWorkflowTarget) {
		patentDocWorkflowHistoryMapper.addWorkflowTarget(patentDocWorkflowTarget);
	}

	@Override
	public long insertHistories(List<Map<String, Long>> patentDocWorkflowHistoryRecords) {
		return patentDocWorkflowHistoryMapper.insertHistories(patentDocWorkflowHistoryRecords);
	}

	@Override
	public List<PatentDocWorkflowHistory> getPatentDocWorkflowHistoryByUserAndAction(int userId, int action) {
		return patentDocWorkflowHistoryMapper.getPatentDocWorkflowHistoryByUserAndAction(userId, action);
	}

	@Override
	public void insertWorkflowTargets(List<Map<String, Long>> patentDocWorkflowTargetRecords) {
		patentDocWorkflowHistoryMapper.insertHistories(patentDocWorkflowTargetRecords);
	}

	

	
	


	

}
