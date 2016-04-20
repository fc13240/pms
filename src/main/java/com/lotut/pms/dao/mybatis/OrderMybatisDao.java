package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.OrderDao;
import com.lotut.pms.dao.mapper.OrderMapper;
import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.OrderItem;
import com.lotut.pms.domain.Page;

public class OrderMybatisDao extends SqlSessionDaoSupport implements OrderDao {
	private OrderMapper orderMapper;

	@Override
	public int insertOrder(Order order) {
		return orderMapper.insertOrder(order);
	}

	@Override
	public int insertOrderItems(List<OrderItem> orderItems) {
		return orderMapper.insertOrderItems(orderItems);
	}

	public void setOrderMapper(OrderMapper orderMapper) {
		this.orderMapper = orderMapper;
	}

	@Override
	public List<Order> selectUserOrders(int userId) {
		return orderMapper.selectUserOrders(userId);
	}

	@Override
	public Order getOrderById(long orderId) {
		return orderMapper.getOrderById(orderId);
	}

	@Override
	public List<Order> selectUserOrders(Page page) {
		return orderMapper.selectUserOrders(page);
	}

	@Override
	public int getUserOrdersCount(int userId) {
		return orderMapper.getUserOrdersCount(userId);
	}

	@Override
	public void deleteUserOrders(long orderId) {
		orderMapper.deleteUserOrders(orderId);
		
	}
}
