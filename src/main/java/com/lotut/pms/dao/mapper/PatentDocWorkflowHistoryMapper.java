package com.lotut.pms.dao.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.PatentDocWorkflowHistory;

public interface PatentDocWorkflowHistoryMapper {
	
	long insertHistories(List<Map<String,Integer>> patentDocWorkflowHistoryRecords);
	
	List<PatentDocWorkflowHistory> getPatentDocWorkflowHistoryByUserAndAction(@Param("userId") int userId,@Param("action") int action);
	
	void insertWorkflowTargets(List<Map<String,Long>> patentDocWorkflowTargetRecords);
	
	void insertSharePatentDocs(List<Map<String, Integer>> sharePatentDocRecords);
}
