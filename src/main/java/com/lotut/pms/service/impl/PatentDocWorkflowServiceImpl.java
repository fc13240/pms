package com.lotut.pms.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.constants.PatentDocWorkflowAction;
import com.lotut.pms.dao.PatentDocDao;
import com.lotut.pms.dao.PatentDocWorkflowDao;
import com.lotut.pms.dao.PatentDocWorkflowHistoryDao;
import com.lotut.pms.dao.UserDao;
import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.OrderItem;
import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.domain.PatentDocOrder;
import com.lotut.pms.domain.PatentDocOrderItem;
import com.lotut.pms.domain.PatentDocWorkflowHistory;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.PatentDocWorkflowHistoryService;
import com.lotut.pms.service.PatentDocWorkflowService;
import com.lotut.pms.util.PrincipalUtils;
import com.mchange.v2.sql.filter.SynchronizedFilterDataSource;

public class PatentDocWorkflowServiceImpl implements PatentDocWorkflowService{
	private PatentDocWorkflowDao patentDocWorkflowDao;
	private PatentDocDao patentDocDao;
	private UserDao userDao;
	private PatentDocWorkflowHistoryDao patentDocWorkflowHistoryDao;
	

	public PatentDocWorkflowServiceImpl(PatentDocWorkflowDao patentDocWorkflowDao,PatentDocDao patentDocDao,UserDao userDao,PatentDocWorkflowHistoryDao patentDocWorkflowHistoryDao) {
		this.patentDocWorkflowDao = patentDocWorkflowDao;
		this.patentDocDao=patentDocDao;
		this.userDao=userDao;
		this.patentDocWorkflowHistoryDao=patentDocWorkflowHistoryDao;
	}


	@Override
	@Transactional
	public int createOrder(PatentDocOrder order, List<PatentDoc> PatentDocs) {

	 	Map<Integer,Integer> priceTab=new HashMap<Integer,Integer>();
	 	priceTab.put(1, 100);
	 	priceTab.put(2, 200);
	 	priceTab.put(3, 300);
		int totalAmount=0;
		for(PatentDoc patentDoc:PatentDocs){
			 int patentType=patentDoc.getPatentType();
			totalAmount+=priceTab.get(patentType);
		}
		order.setAmount(0.01);
		patentDocWorkflowDao.insertOrder(order);
		List<PatentDocOrderItem> orderItems = new ArrayList<>(PatentDocs.size());
		
		for (int i = 0; i < PatentDocs.size(); i++) {
			PatentDocOrderItem orderItem = new PatentDocOrderItem();
			
			orderItem.setOrderId(order.getId());
			orderItem.setPatentDocId(PatentDocs.get(i).getPatentDocId());
			orderItems.add(orderItem);
		}
		patentDocWorkflowDao.insertOrderItems(orderItems);
		
		return 0;
	}


	@Override
	public PatentDocOrder getOrderById(long orderId) {
		return patentDocWorkflowDao.getOrderById(orderId);
	}


	@Override
	public int updateOrderStatus(long orderId, int status) {
		return patentDocWorkflowDao.updateOrderStatus(orderId, status);
	}
	
	@Override
	@Transactional
	public void processOrderPaidSuccess(long orderId) {
		final int ORDER_STATUS_PAID = 1;
		final int PATENT_DOC_STAUTS_PAID = 2;
		PatentDocOrder order = patentDocWorkflowDao.getOrderById(orderId);
		int orderUpdateCount = patentDocWorkflowDao.updateOrderStatus(orderId, ORDER_STATUS_PAID);
		
		List<PatentDoc> PatentDocs = order.getPatentDocList();
		List<Long> patentDocIdList = new ArrayList<>(PatentDocs.size());
		for (PatentDoc patentDoc: PatentDocs) {
			patentDocIdList.add(patentDoc.getPatentDocId());
		}
		
		int patentDocUpdateCount = patentDocWorkflowDao.updatePatentDocStatus(patentDocIdList, PATENT_DOC_STAUTS_PAID);
		List<Map<String, Long>> userPatentDocRecords = new ArrayList<>();
		List<User> platform=userDao.getPlatformUser();
		for (Long patentDocId: patentDocIdList) {
			for(User user:platform){
				Map<String, Long> userPatentRecord =  new HashMap<String, Long>();
				userPatentRecord.put("userId", (long) user.getUserId());
				userPatentRecord.put("patentDocId", patentDocId);
				userPatentDocRecords.add(userPatentRecord);
			}
		}
		patentDocDao.insertProxyOrgPatentDoc(userPatentDocRecords);
		
		
		
		long userId=PrincipalUtils.getCurrentUserId();
		List<Map<String, Long>> patentDocWorkflowHistoryRecords = new ArrayList<>();
		for (Long patentDocId: patentDocIdList) {
			Map<String, Long> patentDocWorkflowHistoryRecord =  new HashMap<String, Long>();
			patentDocWorkflowHistoryRecord.put("userId",userId);
			patentDocWorkflowHistoryRecord.put("patentDocId", patentDocId);
			patentDocWorkflowHistoryRecord.put("action",(long)PatentDocWorkflowAction.ActionType.get("委托给平台账户"));
			patentDocWorkflowHistoryRecords.add(patentDocWorkflowHistoryRecord);
		
		}
		patentDocWorkflowHistoryDao.insertHistory(patentDocWorkflowHistoryRecords);
		
		
		
	}
	

	
}
