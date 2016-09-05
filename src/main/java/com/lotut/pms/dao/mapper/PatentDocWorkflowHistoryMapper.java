package com.lotut.pms.dao.mapper;

import com.lotut.pms.domain.PatentDocWorkflowHistory;
import com.lotut.pms.domain.PatentDocWorkflowTarget;

public interface PatentDocWorkflowHistoryMapper {
	void addHistory(PatentDocWorkflowHistory patentDocWorkFlowHistory);
	
	void addWorkFlowTarget(PatentDocWorkflowTarget patentDocWorkflowTarget);
}
