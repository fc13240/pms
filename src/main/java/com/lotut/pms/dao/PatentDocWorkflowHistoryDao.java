package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.PatentDocWorkflowHistory;
import com.lotut.pms.domain.PatentDocWorkflowTarget;

public interface PatentDocWorkflowHistoryDao {
	void addWorkflowTarget(PatentDocWorkflowTarget patentDocWorkflowTarget);
	
	long insertHistories(List<Map<String,Long>> patentDocWorkflowHistoryRecords);
	
	List<PatentDocWorkflowHistory> getPatentDocWorkflowHistoryByUserAndAction( int userId, int action);
	
	void insertWorkflowTargets(List<Map<String,Long>> patentDocWorkflowTargetRecords);
}
