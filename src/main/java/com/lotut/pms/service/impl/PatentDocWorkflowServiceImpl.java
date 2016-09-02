package com.lotut.pms.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.dao.PatentDocDao;
import com.lotut.pms.dao.PatentDocWorkflowDao;
import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.OrderItem;
import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.domain.PatentDocOrder;
import com.lotut.pms.domain.PatentDocOrderItem;
import com.lotut.pms.service.PatentDocWorkflowService;

public class PatentDocWorkflowServiceImpl implements PatentDocWorkflowService{
	private PatentDocWorkflowDao patentDocWorkflowDao;
	private PatentDocDao patentDocDao;
	

	public PatentDocWorkflowServiceImpl(PatentDocWorkflowDao patentDocWorkflowDao,PatentDocDao patentDocDao) {
		this.patentDocWorkflowDao = patentDocWorkflowDao;
		this.patentDocDao=patentDocDao;
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
		order.setAmount(totalAmount);
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
		final int PATENT_DOC_STAUTS_PAID = 1;
		PatentDocOrder order = patentDocWorkflowDao.getOrderById(orderId);
		int orderUpdateCount = patentDocWorkflowDao.updateOrderStatus(orderId, ORDER_STATUS_PAID);
		
		List<PatentDoc> PatentDocs = order.getPatentDocList();
		List<Long> patentDocIdList = new ArrayList<>(PatentDocs.size());
		for (PatentDoc patentDoc: PatentDocs) {
			patentDocIdList.add(patentDoc.getPatentDocId());
		}
		
		int feeUpdateCount = patentDocWorkflowDao.updatePatentDocStatus(patentDocIdList, PATENT_DOC_STAUTS_PAID);
	}
	
}
