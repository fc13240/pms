package com.lotut.pms.service;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.PatentDocWorkflowHistory;
import com.lotut.pms.domain.PatentDocWorkflowTarget;

public interface PatentDocWorkflowHistoryService {

	void addWorkflowTarget(PatentDocWorkflowTarget patentDocWorkflowTarget);
	
	long insertHistories(List<Map<String,Integer>> patentDocWorkflowHistoryRecords);

	List<PatentDocWorkflowHistory> getPatentDocWorkflowHistoryByUserAndAction( int userId, int action);
}
