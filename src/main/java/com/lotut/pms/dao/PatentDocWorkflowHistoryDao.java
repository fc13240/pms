package com.lotut.pms.dao;

import com.lotut.pms.domain.PatentDocWorkflowHistory;
import com.lotut.pms.domain.PatentDocWorkflowTarget;

public interface PatentDocWorkflowHistoryDao {
	void addHistory(PatentDocWorkflowHistory patentDocWorkFlowHistory);
	
	void addWorkFlowTarget(PatentDocWorkflowTarget patentDocWorkflowTarget);
}
