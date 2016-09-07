package com.lotut.pms.service;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.PatentDocWorkflowHistory;

public interface PatentDocWorkflowHistoryService {
	
	List<PatentDocWorkflowHistory> getPatentDocWorkflowHistoryByUserAndAction( int userId, int action);
	
	void insertHistory(int id,int action);
	
	void insertHistoriesAndWorkflowTargets(List<Integer> ids,List<Integer> users,int action);
	
	void insertActionHistories(List<Integer> ids, int action);
	
}
