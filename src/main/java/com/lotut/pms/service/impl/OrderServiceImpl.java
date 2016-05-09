package com.lotut.pms.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.dao.FeeDao;
import com.lotut.pms.dao.OrderDao;
import com.lotut.pms.domain.AdminOrderSearchCondition;
import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.OrderItem;
import com.lotut.pms.domain.OrderSearchCondition;
import com.lotut.pms.domain.OrderStatus;
import com.lotut.pms.domain.Page;
import com.lotut.pms.service.OrderService;

public class OrderServiceImpl implements OrderService {
	private OrderDao orderDao;
	private FeeDao feeDao;
	
	public OrderServiceImpl(OrderDao orderDao, FeeDao feeDao) {
		this.orderDao = orderDao;
		this.feeDao = feeDao;
	}

	@Override
	@Transactional
	public int createOrder(Order order, List<Fee> fees) {
		int totalAmount = 0;
		
		for (Fee fee: fees) {
			totalAmount += fee.getAmount();
		}
		
		order.setAmount(totalAmount);
		
		orderDao.insertOrder(order);
		
		List<OrderItem> orderItems = new ArrayList<>(fees.size());
		
		for (int i = 0; i < fees.size(); i++) {
			OrderItem orderItem = new OrderItem();
			
			orderItem.setOrderId(order.getId());
			orderItem.setFeeId(fees.get(i).getFeeId());
			orderItems.add(orderItem);
		}
		
		orderDao.insertOrderItems(orderItems);
		orderDao.updateOrderFeesStatus(orderItems);
		return 0;
	}

	@Override
	public List<Order> getUserOrders(int userId) {
		return orderDao.selectUserOrders(userId);
	}

	@Override
	public Order getOrderById(long orderId) {
		return orderDao.getOrderById(orderId);
	}

	@Override
	public List<Order> getUserOrders(Page page) {
		return orderDao.selectUserOrders(page);
	}

	@Override
	public long getUserOrdersCount(int userId) {
		return orderDao.getUserOrdersCount(userId);
	}

	@Override
	public void deleteUserOrder(long orderId, int userId) {
		orderDao.deleteUserOrder(orderId, userId);
	}
	
	@Override
	@Transactional
	public void processOrderPaidSuccess(long orderId) {
		final int ORDER_STATUS_PAID = 2;
		final int FEE_STAUTS_PAID = 2;
		Order order = orderDao.getOrderById(orderId);
		int orderUpdateCount = orderDao.updateOrderStatus(orderId, ORDER_STATUS_PAID);
		
		List<Fee> fees = order.getFeeList();
		List<Long> feeIdList = new ArrayList<>(fees.size());
		for (Fee fee: fees) {
			feeIdList.add(fee.getFeeId());
		}
		
		int feeUpdateCount = feeDao.updateFeesStatus(feeIdList, FEE_STAUTS_PAID);
	}

	@Override
	public int updateOrderStatus(long orderId, int status) {
		return orderDao.updateOrderStatus(orderId, status);
	}

	@Override
	public int getAllNeedProcessOrderCount() {
		return orderDao.getAllNeedProcessOrderCount();
	}

	@Override
	public List<Order> getAllNeedProcessOrders(Page page) {
		return orderDao.getAllNeedProcessOrders(page);
	}

	@Override
	public List<OrderStatus> getAllOrderStatus() {
		return orderDao.getAllOrderStatus();
	}

	@Override
	public List<Order> getUserOrdersByStatus(int userId, int orderStatus) {
		return orderDao.getUserOrdersByStatus(userId, orderStatus);
	}

	@Override
	public List<Order> searchUserOrdersByPage(OrderSearchCondition searchCondition) {
		return orderDao.searchUserOrdersByPage(searchCondition);
	}

	@Override
	public long searchUserOrdersCount(OrderSearchCondition searchCondition) {
		return orderDao.searchUserOrdersCount(searchCondition);
	}

	@Override
	public int updateUserOrderStatus(long orderId) {
		return orderDao.updateUserOrderStatus(orderId);
	}

	@Override
	public int updateUserOrderExpress(Map<String, String> expressInfo) {
		return orderDao.updateUserOrderExpress(expressInfo);
	}

	@Override
	public List<Order> getAllNeedProcessOrdersBySearch(AdminOrderSearchCondition searchCondition) {
		return orderDao.getAllNeedProcessOrdersBySearch(searchCondition);
	}

	@Override
	public long getAllNeedProcessOrdersBySearchCount(AdminOrderSearchCondition searchCondition) {
		return orderDao.getAllNeedProcessOrdersBySearchCount(searchCondition);
	}

	@Override
	public Map<String, Map<String, String>> searchUserOrdersByOrderStatus(int userId) {
		return orderDao.searchUserOrdersByOrderStatus(userId);
	}

	@Override
	public void changeMonitorStatus(List<Long> feeIds, int monitorStatus) {
		feeDao.updateMonitorStatus(feeIds, monitorStatus);
		
	}
}
