package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.OrderDao;
import com.lotut.pms.dao.PatentDocWorkflowDao;
import com.lotut.pms.dao.mapper.OrderMapper;
import com.lotut.pms.dao.mapper.PatentDocWorkflowMapper;
import com.lotut.pms.domain.PatentDocOrder;
import com.lotut.pms.domain.PatentDocOrderItem;

public class PatentDocWorkflowMybatisDao extends SqlSessionDaoSupport implements PatentDocWorkflowDao{
	private PatentDocWorkflowMapper patentDocWorkflowMapper;



	public void setPatentDocWorkflowMapper(PatentDocWorkflowMapper patentDocWorkflowMapper) {
		this.patentDocWorkflowMapper = patentDocWorkflowMapper;
	}



	@Override
	public int insertOrder(PatentDocOrder order) {
		return patentDocWorkflowMapper.insertOrder(order);
	}



	@Override
	public int insertOrderItems(List<PatentDocOrderItem> orderItems) {
		return patentDocWorkflowMapper.insertOrderItems(orderItems);
	}



	@Override
	public PatentDocOrder getOrderById(long orderId) {
		return patentDocWorkflowMapper.getOrderById(orderId);
	}



	@Override
	public int updateOrderStatus(long orderId, int status) {
		return patentDocWorkflowMapper.updateOrderStatus(orderId, status);
	}



	@Override
	public int updatePatentDocStatus(List<Long> patentDocIds, int status) {
		return patentDocWorkflowMapper.updatePatentDocStatus(patentDocIds, status);
	}
	
	
	
}
