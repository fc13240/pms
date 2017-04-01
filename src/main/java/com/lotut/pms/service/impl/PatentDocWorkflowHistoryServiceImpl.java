package com.lotut.pms.service.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

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
	public void insertHistory(int id, int action) {
		List<Integer> ids=new ArrayList<>();
		ids.add(id);
		insertHistories(ids,action);
	}
	
	@Override
	@Transactional
	public void insertHistoriesAndWorkflowTargets(List<Integer> ids,List<Integer> users, int action) {
		 insertHistories(ids,action);
		 insertWorkflowTargets(users,action);
		 
	}

	@Override
	public void insertActionHistories(List<Integer> ids, int action) {
		insertHistories(ids,action);
	}
	
	private void insertHistories(List<Integer> ids,int action){
		int userId=PrincipalUtils.getCurrentUserId();
		List<Map<String, Integer>> patentDocWorkflowHistoryRecords = new ArrayList<>();
		for (int patentDocId: ids) {
				Map<String, Integer> patentDocWorkflowHistoryRecord =  new HashMap<String, Integer>();
				patentDocWorkflowHistoryRecord.put("userId", userId);
				patentDocWorkflowHistoryRecord.put("patentDocId", patentDocId);
				patentDocWorkflowHistoryRecord.put("action",action);
				patentDocWorkflowHistoryRecords.add(patentDocWorkflowHistoryRecord);
		}
		 patentDocWorkflowHistoryDao.insertHistories(patentDocWorkflowHistoryRecords);
		
	}
	
	private void insertWorkflowTargets(List<Integer> ids,int action){
		int userId=PrincipalUtils.getCurrentUserId();
		List<PatentDocWorkflowHistory> patentDocWorkflowHistories=patentDocWorkflowHistoryDao.getPatentDocWorkflowHistoryByUserAndAction(userId, action);
		List<Long> patentDocWorkflowHistoryIdList = new ArrayList<>(patentDocWorkflowHistories.size());
		List<Long> patentDocWorkflowHistoryPatentDocIdList = new ArrayList<>(patentDocWorkflowHistories.size());
		for(PatentDocWorkflowHistory patentDocWorkflowHistory:patentDocWorkflowHistories){
			patentDocWorkflowHistoryIdList.add(patentDocWorkflowHistory.getHistoryId());
//			System.out.println(patentDocWorkflowHistory.getHistoryId());
			patentDocWorkflowHistoryPatentDocIdList.add(patentDocWorkflowHistory.getPatentDocId());
		}
		List<Map<String, Long>> patentDocWorkflowTargetRecords=new ArrayList<>();
		for (Long patentDocWorkflowHistoryId:patentDocWorkflowHistoryIdList) {
			for(int id: ids){
				for(long patentDocWorkflowHistoryPatentDocId:patentDocWorkflowHistoryPatentDocIdList){
					Map<String, Long> patentDocWorkflowTargetRecord =  new HashMap<String, Long>();
					patentDocWorkflowTargetRecord.put("history", patentDocWorkflowHistoryId);
					patentDocWorkflowTargetRecord.put("target", (long) id);
					patentDocWorkflowTargetRecord.put("patentDoc", patentDocWorkflowHistoryPatentDocId);
					patentDocWorkflowTargetRecords.add(patentDocWorkflowTargetRecord);
				}
			}
		}
		patentDocWorkflowHistoryDao.insertWorkflowTargets(patentDocWorkflowTargetRecords);
		
//		List<Map<String, Integer>> sharePatentDocRecords = new ArrayList<>();
//		for(int id: ids){
//			for(long patentDocWorkflowHistoryPatentDocId:patentDocWorkflowHistoryPatentDocIdList){
//				Map<String, Integer> sharePatentDocRecord =  new HashMap<String, Integer>();
//				sharePatentDocRecord.put("patentDoc", (int) patentDocWorkflowHistoryPatentDocId);
//				sharePatentDocRecord.put("shareBy", userId);
//				sharePatentDocRecord.put("shareTo", id);
//				sharePatentDocRecords.add(sharePatentDocRecord);
//			}
//		}
	
//		patentDocWorkflowHistoryDao.insertSharePatentDocs(sharePatentDocRecords);

	}

	@Override
	public List<PatentDocWorkflowHistory> getHistoryByPatentDocId(int id) {
		return patentDocWorkflowHistoryDao.getHistoryByPatentDocId(id);
	}
	
	
}
