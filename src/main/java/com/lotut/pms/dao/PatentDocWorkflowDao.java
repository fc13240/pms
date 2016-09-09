package com.lotut.pms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.PatentDocOrder;
import com.lotut.pms.domain.PatentDocOrderItem;

public interface PatentDocWorkflowDao {
	
	int insertOrder(PatentDocOrder order);
	int insertOrderItems(List<PatentDocOrderItem> orderItems);
	
	PatentDocOrder getOrderById(long orderId);
	
	
	int updateOrderStatus(long orderId, int status);
	
	int updatePatentDocStatus(List<Long> patentDocIds, int status);
	
	
	int updatePatentDocProxyStatus(List<Long> patentDocIds, int status);
	
}
