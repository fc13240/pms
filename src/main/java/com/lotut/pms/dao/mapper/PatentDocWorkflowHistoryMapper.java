package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.PatentDocWorkflowHistory;
import com.lotut.pms.domain.PatentDocWorkflowTarget;

public interface PatentDocWorkflowHistoryMapper {
	void addHistory(PatentDocWorkflowHistory patentDocWorkFlowHistory);
	
	void addWorkFlowTarget(PatentDocWorkflowTarget patentDocWorkflowTarget);
	
	void insertHistory(List<Map<String,Long>> patentDocWorkflowHistoryRecords);
}
