package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.OrderDao;
import com.lotut.pms.dao.mapper.OrderMapper;
import com.lotut.pms.domain.AdminOrderSearchCondition;
import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.OrderItem;
import com.lotut.pms.domain.OrderSearchCondition;
import com.lotut.pms.domain.OrderStatus;
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
	public int updateOrderStatus(long orderId,int status) {
		return orderMapper.updateOrderStatus(orderId, status);
	}	

	@Override
	public void deleteUserOrder(long orderId, int userId) {
		orderMapper.deleteUserOrder(orderId, userId);
	}

	@Override
	public int getAllNeedProcessOrderCount() {
		return orderMapper.getAllNeedProcessOrderCount();
	}

	@Override
	public List<Order> getAllNeedProcessOrders(Page page) {
		return orderMapper.getAllNeedProcessOrders(page);
	}

	@Override
	public List<OrderStatus> getAllOrderStatus() {
		return orderMapper.getAllOrderStatus();
	}

	@Override
	public List<Order> getUserOrdersByStatus(int userId, int orderStatus) {
		return orderMapper.getUserOrdersByStatus(userId, orderStatus);
	}

	@Override
	public List<Order> searchUserOrdersByPage(OrderSearchCondition searchCondition) {
		return orderMapper.searchUserOrdersByPage(searchCondition);
	}

	@Override
	public int searchUserOrdersCount(OrderSearchCondition searchCondition) {
		return orderMapper.searchUserOrdersCount(searchCondition);
	}

	@Override
	public int updateUserOrderStatus(long orderId) {
		orderMapper.updateUserOrderStatus(orderId);
		return 1;
	}

	@Override
	public int updateUserOrderExpress(Map<String, String> expressInfo) {
		orderMapper.updateUserOrderExpress(expressInfo);
		return 1;
	}

	@Override
	public List<Order> getAllNeedProcessOrdersBySearch(AdminOrderSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return orderMapper.getAllNeedProcessOrdersBySearch(searchCondition);
	}

	@Override
	public int getAllNeedProcessOrdersBySearchCount(AdminOrderSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return orderMapper.getAllNeedProcessOrdersBySearchCount(searchCondition);
	}

	@Override
	public void updateOrderFeesStatus(List<OrderItem> orderItems) {
		orderMapper.updateOrderFeesStatus(orderItems);
		
	}

	@Override
	public Map<String, Map<String, String>> searchUserOrdersByOrderStatus(int userId) {
		return orderMapper.searchUserOrdersByOrderStatus(userId);
	}
}
