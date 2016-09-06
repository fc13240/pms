package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.PatentDocWorkflowHistory;

public interface PatentDocWorkflowHistoryService {
	
	long insertHistories(List<Integer> ids);

	List<PatentDocWorkflowHistory> getPatentDocWorkflowHistoryByUserAndAction( int userId, int action);
	
	void insertWorkflowTargets(List<Integer> ids);
}
