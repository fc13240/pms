package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.PatentDocOrder;
import com.lotut.pms.domain.PatentDocOrderItem;

public interface PatentDocWorkflowMapper {
	int insertOrder(PatentDocOrder order);
	
	int insertOrderItems(@Param("orderItems")List<PatentDocOrderItem> orderItems);
	
	PatentDocOrder getOrderById(long orderId);
	
	int updateOrderStatus(@Param("orderId")long orderId, @Param("status")int status);
	
	int updatePatentDocStatus(@Param("patentDocIdList")List<Long> patentDocIds, @Param("status")int status);
	
	int updatePatentDocProxyStatus(@Param("patentDocIdList")List<Long> patentDocIds, @Param("status")int status);
	
	int getLastHistoryIdByWorkflowHistory(@Param("patentDocId")long patentDocId,@Param("userId")int userId,@Param("ACTION") int action);
	
	int getTargetByHistoryId(int id);
	
	void redistributePatentDoc(@Param("userId")int userId,@Param("patentDoc")long patentDoc,@Param("target") int target);
}
