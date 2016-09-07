package com.lotut.pms.service.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lotut.pms.constants.PatentDocWorkflowAction;
import com.lotut.pms.dao.PatentDocWorkflowHistoryDao;
import com.lotut.pms.domain.PatentDocWorkflowHistory;
import com.lotut.pms.service.PatentDocWorkflowHistoryService;
import com.lotut.pms.util.PrincipalUtils;

public class PatentDocWorkflowHistoryServiceImpl implements PatentDocWorkflowHistoryService{
	private PatentDocWorkflowHistoryDao patentDocWorkflowHistoryDao;
	
	public PatentDocWorkflowHistoryServiceImpl(PatentDocWorkflowHistoryDao patentDocWorkflowHistoryDao) {
		this.patentDocWorkflowHistoryDao = patentDocWorkflowHistoryDao;
	}

	@Override
	public List<PatentDocWorkflowHistory> getPatentDocWorkflowHistoryByUserAndAction(int userId, int action) {
		return patentDocWorkflowHistoryDao.getPatentDocWorkflowHistoryByUserAndAction(userId, action);
	}
	
	@Override
	public long insertProxyOrgsHistories(List<Integer> ids) {
		int action=PatentDocWorkflowAction.ActionType.get("分配给代理机构");
		return insertHistories(ids,action);
	}

	@Override
	public void insertProxyOrgsWorkflowTargets(List<Integer> proxyOrgs) {
		int action=PatentDocWorkflowAction.ActionType.get("分配给代理机构");
		insertWorkflowTargets(proxyOrgs,action);
	}
	
	@Override
	public long insertCustomerSupportHistories(List<Integer> ids) {
		int action=PatentDocWorkflowAction.ActionType.get("分配给客服人员");
		return insertHistories( ids, action);
	}

	@Override
	public void insertCustomerSupportWorkflowTargets(List<Integer> ids) {
		int action=PatentDocWorkflowAction.ActionType.get("分配给客服人员");
		insertWorkflowTargets(ids,action);
	}
	@Override
	public long insertTechPersonHistories(List<Integer> ids) {
		int action=PatentDocWorkflowAction.ActionType.get("审查");
		return insertHistories( ids, action);
	}

	@Override
	public void insertTechPersonWorkflowTargets(List<Integer> ids) {
		int action=PatentDocWorkflowAction.ActionType.get("审查");
		insertWorkflowTargets(ids,action);
	}
	
	@Override
	public long insertProcessPersonHistories(List<Integer> ids) {
		int action=PatentDocWorkflowAction.ActionType.get("交局");
		return insertHistories( ids, action);
	}

	@Override
	public void insertProcessPersonWorkflowTargets(List<Integer> ids) {
		int action=PatentDocWorkflowAction.ActionType.get("交局");
		insertWorkflowTargets(ids,action);
	}
	private long insertHistories(List<Integer> ids,int action){
		int userId=PrincipalUtils.getCurrentUserId();
		List<Map<String, Integer>> patentDocWorkflowHistoryRecords = new ArrayList<>();
		for (int patentDocId: ids) {
				Map<String, Integer> patentDocWorkflowHistoryRecord =  new HashMap<String, Integer>();
				patentDocWorkflowHistoryRecord.put("userId", userId);
				patentDocWorkflowHistoryRecord.put("patentDocId", patentDocId);
				patentDocWorkflowHistoryRecord.put("action",action);
				patentDocWorkflowHistoryRecords.add(patentDocWorkflowHistoryRecord);
		}
		return patentDocWorkflowHistoryDao.insertHistories(patentDocWorkflowHistoryRecords);
		
	}
	
	private void insertWorkflowTargets(List<Integer> ids,int action){
		int userId=PrincipalUtils.getCurrentUserId();
		List<PatentDocWorkflowHistory> PatentDocWorkflowHistories=patentDocWorkflowHistoryDao.getPatentDocWorkflowHistoryByUserAndAction(userId, action);
		List<Long> patentDocWorkflowHistoryIdList = new ArrayList<>(PatentDocWorkflowHistories.size());
		List<Long> patentDocWorkflowHistoryPatentDocIdList = new ArrayList<>(PatentDocWorkflowHistories.size());
		for(PatentDocWorkflowHistory patentDocWorkflowHistory:PatentDocWorkflowHistories){
			patentDocWorkflowHistoryIdList.add(patentDocWorkflowHistory.getHistoryId());
			patentDocWorkflowHistoryPatentDocIdList.add(patentDocWorkflowHistory.getPatentDocId());
		}
		List<Map<String, Long>> patentDocWorkflowTargetRecords=new ArrayList<>();
		for (Long patentDocWorkflowHistoryId:patentDocWorkflowHistoryIdList) {
			for(int proxyOrg: ids){
				for(long patentDocWorkflowHistoryPatentDocId:patentDocWorkflowHistoryPatentDocIdList){
					Map<String, Long> patentDocWorkflowTargetRecord =  new HashMap<String, Long>();
					patentDocWorkflowTargetRecord.put("history", patentDocWorkflowHistoryId);
					patentDocWorkflowTargetRecord.put("target", (long) proxyOrg);
					patentDocWorkflowTargetRecord.put("patentDoc", patentDocWorkflowHistoryPatentDocId);
					patentDocWorkflowTargetRecords.add(patentDocWorkflowTargetRecord);
				}
			}
		}
		patentDocWorkflowHistoryDao.insertWorkflowTargets(patentDocWorkflowTargetRecords);
		
		
	}


	
}
