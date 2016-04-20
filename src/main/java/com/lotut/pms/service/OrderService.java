package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.Page;

public interface OrderService {
	int createOrder(Order order, List<Fee> fees);
	List<Order> getUserOrders(int userId);
	Order getOrderById(long orderId);
	
	List<Order> getUserOrders(Page page);
	
	long getUserOrdersCount(int userId);
	
	int deleteUserOrders(long orderId);
	
	void processOrderPaidSuccess(long orderId);
	
	int updateOrderStatus(long orderId, int status);
}
