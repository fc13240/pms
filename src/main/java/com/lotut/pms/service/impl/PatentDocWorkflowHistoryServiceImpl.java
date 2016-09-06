package com.lotut.pms.service.impl;


import java.util.List;
import java.util.Map;

import com.lotut.pms.dao.PatentDocWorkflowHistoryDao;
import com.lotut.pms.domain.PatentDocWorkflowHistory;
import com.lotut.pms.domain.PatentDocWorkflowTarget;
import com.lotut.pms.service.PatentDocWorkflowHistoryService;

public class PatentDocWorkflowHistoryServiceImpl implements PatentDocWorkflowHistoryService{
	private PatentDocWorkflowHistoryDao patentDocWorkFlowHistoryDao;
	
	
	
	public PatentDocWorkflowHistoryServiceImpl(PatentDocWorkflowHistoryDao patentDocWorkFlowHistoryDao) {
		this.patentDocWorkFlowHistoryDao = patentDocWorkFlowHistoryDao;
	}

	
	@Override
	public long insertHistories(List<Map<String, Long>> patentDocWorkflowHistoryRecords) {
		return patentDocWorkFlowHistoryDao.insertHistories(patentDocWorkflowHistoryRecords);
	}


	@Override
	public void addWorkflowTarget(PatentDocWorkflowTarget patentDocWorkflowTarget) {
		patentDocWorkFlowHistoryDao.addWorkflowTarget(patentDocWorkflowTarget);
	}


	@Override
	public List<PatentDocWorkflowHistory> getPatentDocWorkflowHistoryByUserAndAction(int userId, int action) {
		return patentDocWorkFlowHistoryDao.getPatentDocWorkflowHistoryByUserAndAction(userId, action);
	}



	
}
