package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.PatentDocWorkflowHistory;

public interface PatentDocWorkflowHistoryService {
	
	List<PatentDocWorkflowHistory> getPatentDocWorkflowHistoryByUserAndAction( int userId, int action);
	void insertHistory(List<Integer> ids,int action);
	void insertHistoriesAndWorkflowTargets(List<Integer> ids,List<Integer> users,int action);
}
