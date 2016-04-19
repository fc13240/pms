package com.lotut.pms.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.dao.OrderDao;
import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.OrderItem;
import com.lotut.pms.service.OrderService;

public class OrderServiceImpl implements OrderService {
	private OrderDao orderDao;
	
	public OrderServiceImpl(OrderDao orderDao) {
		this.orderDao = orderDao;
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
		
		return 0;
	}
}
