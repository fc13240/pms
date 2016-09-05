package com.lotut.pms.service.impl;


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
	public void addHistory(PatentDocWorkflowHistory patentDocWorkFlowHistory) {
		patentDocWorkFlowHistoryDao.addHistory(patentDocWorkFlowHistory);	
	}

	@Override
	public void addWorkFlowTarget(PatentDocWorkflowTarget patentDocWorkflowTarget) {
		patentDocWorkFlowHistoryDao.addWorkFlowTarget(patentDocWorkflowTarget);
	}
	
}
