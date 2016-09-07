package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;


import com.lotut.pms.domain.PatentDocWorkflowHistory;

public interface PatentDocWorkflowHistoryDao {
	
	long insertHistories(List<Map<String,Integer>> patentDocWorkflowHistoryRecords);
	
	List<PatentDocWorkflowHistory> getPatentDocWorkflowHistoryByUserAndAction( int userId, int action);
	
	void insertWorkflowTargets(List<Map<String,Long>> patentDocWorkflowTargetRecords);
}
