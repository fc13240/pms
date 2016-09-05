package com.lotut.pms.service;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.PatentDocWorkflowHistory;
import com.lotut.pms.domain.PatentDocWorkflowTarget;

public interface PatentDocWorkflowHistoryService {
	void addHistory(PatentDocWorkflowHistory patentDocWorkFlowHistory);
	
	void addWorkFlowTarget(PatentDocWorkflowTarget patentDocWorkflowTarget);
	
	int insertHistory(List<Map<String,Long>> patentDocWorkflowHistoryRecords);
}
