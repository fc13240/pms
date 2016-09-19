package com.lotut.pms.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.constants.PatentDocWorkflowAction;
import com.lotut.pms.dao.PatentDocDao;
import com.lotut.pms.dao.PatentDocWorkflowDao;
import com.lotut.pms.dao.PatentDocWorkflowHistoryDao;
import com.lotut.pms.dao.UserDao;
import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.domain.PatentDocOrder;
import com.lotut.pms.domain.PatentDocOrderItem;
import com.lotut.pms.domain.PatentDocWorkflowHistory;
import com.lotut.pms.domain.PaymentMethod;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.PatentDocWorkflowService;
import com.lotut.pms.util.PrincipalUtils;

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
	public int createOrder(PatentDocOrder order, List<PatentDoc> patentDocs) {
		int totalAmount = 0;
		for(PatentDoc doc:patentDocs){
			totalAmount += doc.getTotalFee();
		}
		order.setAmount(totalAmount);
		PaymentMethod paymentMethod = new PaymentMethod();
		paymentMethod.setPaymentMethodId(1);
		order.setPaymentMethod(paymentMethod);
		patentDocWorkflowDao.insertOrder(order);
		List<PatentDocOrderItem> orderItems = new ArrayList<>(patentDocs.size());
		
		for (int i = 0; i < patentDocs.size(); i++) {
			PatentDoc doc = patentDocs.get(i);
			PatentDocOrderItem orderItem = new PatentDocOrderItem();
			
			orderItem.setOrderId(order.getId());
			orderItem.setPatentDocId(doc.getPatentDocId());
			orderItem.setApplyFee(doc.getApplyFee());
			orderItem.setPrintFee(doc.getPrintFee());
			orderItem.setCheckFee(doc.getCheckFee());
			orderItem.setServiceFee(doc.getServiceFee());
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
		final int PATENT_DOC_PROXY_STAUTS_PAID = 2;
		PatentDocOrder order = patentDocWorkflowDao.getOrderById(orderId);
		int orderUpdateCount = patentDocWorkflowDao.updateOrderStatus(orderId, ORDER_STATUS_PAID);
		
		List<PatentDoc> PatentDocs = order.getPatentDocList();
		List<Long> patentDocIdList = new ArrayList<>(PatentDocs.size());
		List<Integer> patentDocIdIntegerList = new ArrayList<>();
		
		for (PatentDoc patentDoc: PatentDocs) {
			patentDocIdList.add(patentDoc.getPatentDocId());
		}
		
		patentDocWorkflowDao.updatePatentDocProxyStatus(patentDocIdList, PATENT_DOC_PROXY_STAUTS_PAID);
		List<Map<String, Long>> userPatentDocRecords = new ArrayList<>();
		List<User> platform=userDao.getPlatformUser();
		for (Long patentDocId: patentDocIdList) {
			for(User user:platform){
				Map<String, Long> userPatentRecord =  new HashMap<String, Long>();
				userPatentRecord.put("userId", (long) user.getUserId());
				userPatentRecord.put("patentDocId", patentDocId);
				userPatentDocRecords.add(userPatentRecord);
			}
			patentDocIdIntegerList.add(patentDocId.intValue());
		}
		
		
		patentDocDao.insertProxyOrgPatentDoc(userPatentDocRecords);
		
		int userId=PrincipalUtils.getCurrentUserId();
		List<Map<String, Integer>> patentDocWorkflowHistoryRecords = new ArrayList<>();
		for (Integer patentDocId: patentDocIdIntegerList) {
			Map<String, Integer> patentDocWorkflowHistoryRecord =  new HashMap<String, Integer>();
			patentDocWorkflowHistoryRecord.put("userId",userId);
			patentDocWorkflowHistoryRecord.put("patentDocId", patentDocId);
			patentDocWorkflowHistoryRecord.put("action",PatentDocWorkflowAction.ActionType.get("委托给平台账户"));
			patentDocWorkflowHistoryRecords.add(patentDocWorkflowHistoryRecord);
		
		}
		patentDocWorkflowHistoryDao.insertHistories(patentDocWorkflowHistoryRecords);
		
		int action=PatentDocWorkflowAction.ActionType.get("委托给平台账户");
		List<PatentDocWorkflowHistory> PatentDocWorkflowHistories=patentDocWorkflowHistoryDao.getPatentDocWorkflowHistoryByUserAndAction(userId, action);
		List<Long> patentDocWorkflowHistoryIdList = new ArrayList<>(PatentDocWorkflowHistories.size());
		List<Long> patentDocWorkflowHistoryPatentDocIdList = new ArrayList<>(PatentDocWorkflowHistories.size());
		for(PatentDocWorkflowHistory patentDocWorkflowHistory:PatentDocWorkflowHistories){
			patentDocWorkflowHistoryIdList.add(patentDocWorkflowHistory.getHistoryId());
			patentDocWorkflowHistoryPatentDocIdList.add(patentDocWorkflowHistory.getPatentDocId());
		}
		List<Map<String, Long>> patentDocWorkflowTargetRecords = new ArrayList<>();
		for (Long patentDocWorkflowHistoryId:patentDocWorkflowHistoryIdList) {
			for(User user:platform){
				for(long patentDocWorkflowHistoryPatentDocId:patentDocWorkflowHistoryPatentDocIdList){
					Map<String, Long> patentDocWorkflowTargetRecord =  new HashMap<String, Long>();
					patentDocWorkflowTargetRecord.put("history", patentDocWorkflowHistoryId);
					patentDocWorkflowTargetRecord.put("target", (long) user.getUserId());
					patentDocWorkflowTargetRecord.put("patentDoc", patentDocWorkflowHistoryPatentDocId);
					patentDocWorkflowTargetRecords.add(patentDocWorkflowTargetRecord);
				}
			}
		}
		patentDocWorkflowHistoryDao.insertWorkflowTargets(patentDocWorkflowTargetRecords);
		
		
	}


	@Override
	public int updatePatentDocStatus(List<Long> patentDocIds, int status) {
		return patentDocWorkflowDao.updatePatentDocStatus(patentDocIds, status);
	}


	@Override
	public int updatePatentDocProxyStatus(List<Long> patentDocIds, int status) {
		return patentDocWorkflowDao.updatePatentDocProxyStatus(patentDocIds, status);
	}


	@Override
	public void redistributeProxyOrgPatentDoc(int ownerId,long patentDocId,int action) {
		int historyId=patentDocWorkflowDao.getLastHistoryIdByWorkflowHistory(patentDocId, ownerId, action);
		int target=patentDocWorkflowDao.getTargetByHistoryId(patentDocId,historyId);
		patentDocWorkflowDao.deleteByWorkflowHistory(patentDocId, target);
		int proxyOrgAction=PatentDocWorkflowAction.ActionType.get("分配给客服人员");
		int proxyOrgCount=patentDocWorkflowDao.getCountByWorkflowHistory(patentDocId, target, proxyOrgAction);
		int proxyOrgSupporsHistoryId=0;
		int proxyOrgTarget=0;
			if(proxyOrgCount>0){
				 proxyOrgSupporsHistoryId =patentDocWorkflowDao.getLastHistoryIdByWorkflowHistory(patentDocId, target, proxyOrgAction);
				 proxyOrgTarget=patentDocWorkflowDao.getTargetByHistoryId(patentDocId,proxyOrgSupporsHistoryId);
				 patentDocWorkflowDao.deleteByWorkflowHistory(patentDocId, proxyOrgTarget);
			}else{
				return;
			}
		int customerSupporAction=PatentDocWorkflowAction.ActionType.get("分配给技术员");
		int customerSupporCount=patentDocWorkflowDao.getCountByWorkflowHistory(patentDocId, proxyOrgTarget, customerSupporAction);
		int customerSupporHistoryId=0;
		int customerSupporTarget=0;
		if(customerSupporCount>0){
			customerSupporHistoryId=patentDocWorkflowDao.getLastHistoryIdByWorkflowHistory(patentDocId, proxyOrgTarget, customerSupporAction);
			customerSupporTarget=patentDocWorkflowDao.getTargetByHistoryId(patentDocId, customerSupporHistoryId);
			patentDocWorkflowDao.deleteByWorkflowHistory(patentDocId, customerSupporTarget);
		}else{
			return;
		}
		int techPersonAction=PatentDocWorkflowAction.ActionType.get("分配给流程人员");
		int techPersonCount=patentDocWorkflowDao.getCountByWorkflowHistory(patentDocId, customerSupporTarget, techPersonAction);
		int techPersonHistoryId=0;
		int techPersonTarget=0;
		if(techPersonCount>0){
			techPersonHistoryId=patentDocWorkflowDao.getLastHistoryIdByWorkflowHistory(patentDocId, customerSupporTarget, techPersonAction);
			techPersonTarget=patentDocWorkflowDao.getTargetByHistoryId(patentDocId, techPersonHistoryId);
			patentDocWorkflowDao.deleteByWorkflowHistory(patentDocId, techPersonTarget);
		}
	}


	@Override
	public int getCountByWorkflowHistory(long patentDocId, int userId, int action) {
		return patentDocWorkflowDao.getCountByWorkflowHistory(patentDocId, userId, action);
	}


	@Override
	public void redistributeCustomerSupportPatentDoc(int ownerId, long patentDocId, int action) {
		int historyId=patentDocWorkflowDao.getLastHistoryIdByWorkflowHistory(patentDocId, ownerId, action);
		int target=patentDocWorkflowDao.getTargetByHistoryId(patentDocId,historyId);
		patentDocWorkflowDao.deleteByWorkflowHistory(patentDocId, target);
		int customerSupporAction=PatentDocWorkflowAction.ActionType.get("分配给技术员");
		int customerSupporCount=patentDocWorkflowDao.getCountByWorkflowHistory(patentDocId, target, customerSupporAction);
		int customerSupporHistoryId=0;
		int customerSupporTarget=0;
		if(customerSupporCount>0){
			customerSupporHistoryId=patentDocWorkflowDao.getLastHistoryIdByWorkflowHistory(patentDocId, target, customerSupporAction);
			customerSupporTarget=patentDocWorkflowDao.getTargetByHistoryId(patentDocId, customerSupporHistoryId);
			patentDocWorkflowDao.deleteByWorkflowHistory(patentDocId, customerSupporTarget);
		}else{
			return;
		}
		int techPersonAction=PatentDocWorkflowAction.ActionType.get("分配给流程人员");
		int techPersonCount=patentDocWorkflowDao.getCountByWorkflowHistory(patentDocId, target, techPersonAction);
		int techPersonHistoryId=0;
		int techPersonTarget=0;
		if(techPersonCount>0){
			techPersonHistoryId=patentDocWorkflowDao.getLastHistoryIdByWorkflowHistory(patentDocId, target, techPersonAction);
			techPersonTarget=patentDocWorkflowDao.getTargetByHistoryId(patentDocId, techPersonHistoryId);
			patentDocWorkflowDao.deleteByWorkflowHistory(patentDocId, techPersonTarget);
		}
	}


	@Override
	public void redistributeTechPersonPatentDoc(int ownerId, long patentDocId, int action) {
		int historyId=patentDocWorkflowDao.getLastHistoryIdByWorkflowHistory(patentDocId, ownerId, action);
		int target=patentDocWorkflowDao.getTargetByHistoryId(patentDocId,historyId);
		patentDocWorkflowDao.deleteByWorkflowHistory(patentDocId, target);
		int techPersonAction=PatentDocWorkflowAction.ActionType.get("分配给流程人员");
		int techPersonCount=patentDocWorkflowDao.getCountByWorkflowHistory(patentDocId, target, techPersonAction);
		int techPersonHistoryId=0;
		int techPersonTarget=0;
		if(techPersonCount>0){
			techPersonHistoryId=patentDocWorkflowDao.getLastHistoryIdByWorkflowHistory(patentDocId, target, techPersonAction);
			techPersonTarget=patentDocWorkflowDao.getTargetByHistoryId(patentDocId, techPersonHistoryId);
			patentDocWorkflowDao.deleteByWorkflowHistory(patentDocId, techPersonTarget);
		}
	}


	@Override
	public void redistributeProcessPersonPatentDoc(int ownerId, long patentDocId, int action) {
		int historyId=patentDocWorkflowDao.getLastHistoryIdByWorkflowHistory(patentDocId, ownerId, action);
		int target=patentDocWorkflowDao.getTargetByHistoryId(patentDocId,historyId);
		patentDocWorkflowDao.deleteByWorkflowHistory(patentDocId, target);
	}
	
	

	
}
