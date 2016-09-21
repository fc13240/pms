package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.domain.PatentDocOrder;

public interface PatentDocWorkflowService {
	long createOrder(PatentDocOrder order, List<PatentDoc> PatentDocs);
	
	PatentDocOrder getOrderById(long orderId);
	
	int updateOrderStatus(long orderId, int status);
	
	void processOrderPaidSuccess(long orderId);
	
	int updatePatentDocStatus(List<Long> patentDocIds, int status);
	
	int updatePatentDocProxyStatus(List<Long> patentDocIds, int status);
	
	int getCountByWorkflowHistory(long patentDocId,int userId,int action);
	
	void redistributeProxyOrgPatentDoc(int ownerId,long patentDocId,int action);
	
	void redistributeCustomerSupportPatentDoc(int ownerId,long patentDocId,int action);
	
	void redistributeTechPersonPatentDoc(int ownerId,long patentDocId,int action);
	
	void redistributeProcessPersonPatentDoc(int ownerId,long patentDocId,int action);
	
	void saveInvoicePath(String invoicePic , Long[] patentDocIds);
}
