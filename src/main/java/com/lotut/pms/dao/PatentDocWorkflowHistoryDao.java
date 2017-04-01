package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.PatentDocWorkflowHistory;

public interface PatentDocWorkflowHistoryDao {
	
	void insertHistories(List<Map<String,Integer>> patentDocWorkflowHistoryRecords);
	
	List<PatentDocWorkflowHistory> getPatentDocWorkflowHistoryByUserAndAction( int userId, int action);
	
	void insertWorkflowTargets(List<Map<String,Long>> patentDocWorkflowTargetRecords);
	
	void insertSharePatentDocs(List<Map<String, Integer>> sharePatentDocRecords);
	
	List<PatentDocWorkflowHistory> getHistoryByPatentDocId(int id);
}
