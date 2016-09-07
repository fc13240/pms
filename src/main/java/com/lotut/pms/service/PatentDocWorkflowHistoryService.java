package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.PatentDocWorkflowHistory;

public interface PatentDocWorkflowHistoryService {
	
	List<PatentDocWorkflowHistory> getPatentDocWorkflowHistoryByUserAndAction( int userId, int action);
	
	long insertProxyOrgsHistories(List<Integer> ids);
	
	void insertProxyOrgsWorkflowTargets(List<Integer> ids);
	
	long insertCustomerSupportHistories(List<Integer> ids);
	
	void insertCustomerSupportWorkflowTargets(List<Integer> ids);
	
	long insertTechPersonHistories(List<Integer> ids);
	
	void insertTechPersonWorkflowTargets(List<Integer> ids);
	
	long insertProcessPersonHistories(List<Integer> ids);
	
	void insertProcessPersonWorkflowTargets(List<Integer> ids);
}
