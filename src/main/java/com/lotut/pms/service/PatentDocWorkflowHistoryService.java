package com.lotut.pms.service;

import com.lotut.pms.domain.PatentDocWorkflowHistory;
import com.lotut.pms.domain.PatentDocWorkflowTarget;

public interface PatentDocWorkflowHistoryService {
	void addHistory(PatentDocWorkflowHistory patentDocWorkFlowHistory);
	
	void addWorkFlowTarget(PatentDocWorkflowTarget patentDocWorkflowTarget);
}
