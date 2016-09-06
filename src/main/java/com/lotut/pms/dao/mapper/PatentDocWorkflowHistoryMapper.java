package com.lotut.pms.dao.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.PatentDocWorkflowHistory;
import com.lotut.pms.domain.PatentDocWorkflowTarget;

public interface PatentDocWorkflowHistoryMapper {
	
	void addWorkflowTarget(PatentDocWorkflowTarget patentDocWorkflowTarget);
	
	long insertHistories(List<Map<String,Long>> patentDocWorkflowHistoryRecords);
	
	List<PatentDocWorkflowHistory> getPatentDocWorkflowHistoryByUserAndAction(@Param("userId") int userId,@Param("ACTION") int action);
	
	void insertWorkflowTargets(List<Map<String,Long>> patentDocWorkflowTargetRecords);
}
